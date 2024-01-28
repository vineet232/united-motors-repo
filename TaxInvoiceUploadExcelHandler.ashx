<%@ WebHandler Language="C#" Class="TaxInvoiceUploadExcelHandler" %>

using System;
using System.Web;
using DBLayerFunctions;
using System.Data.SqlClient;

public class TaxInvoiceUploadExcelHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            string billid = context.Request["billid"];
            string userid = Convert.ToString(context.Session["csusrid"]);
            //Fetch the Uploaded File.

            HttpPostedFile postedFile = context.Request.Files[0];
            string extension = System.IO.Path.GetExtension(postedFile.FileName);
            if (extension.ToLower().Trim() == ".xlsx")
            {
                //Set the Folder Path.
                string folderPath = context.Server.MapPath("~/CSVFiles/");

                //Set the File Name.
                string fileName = System.IO.Path.GetFileName(postedFile.FileName);
                string fileNamewithouext = System.IO.Path.GetFileNameWithoutExtension(postedFile.FileName);


                string uploadedFileName = fileNamewithouext.Trim() + "_" + billid + "_" + DateTime.Now.ToString("HH_mm_ss") + extension;


                //Save the File in Folder.
                postedFile.SaveAs(folderPath + uploadedFileName);

                if (billid != "" && billid != "0")
                {

                    System.Data.OleDb.OleDbConnection conString = new System.Data.OleDb.OleDbConnection();

                    string read = System.IO.Path.GetFullPath(folderPath + uploadedFileName);


                    if (extension == ".xlsx")
                    {
                        switch (extension)
                        {
                            case ".xls": //Excel 97-03
                                conString = new System.Data.OleDb.OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + read + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"");
                                break;
                            case ".xlsx": //Excel 07 or higher
                                conString = new System.Data.OleDb.OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + read + ";Extended Properties='Excel 12.0;HDR=YES;IMEX=1;';");
                                break;

                        }
                    }



                    conString.Open();
                    string sheet1 = conString.GetOleDbSchemaTable(System.Data.OleDb.OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                    System.Data.OleDb.OleDbCommand cmdOle = new System.Data.OleDb.OleDbCommand();
                    System.Data.OleDb.OleDbDataAdapter daOle = new System.Data.OleDb.OleDbDataAdapter();
                    System.Data.DataTable dtExcel = new System.Data.DataTable();
                    cmdOle.Connection = conString;
                    cmdOle.CommandType = System.Data.CommandType.Text;
                    cmdOle.CommandText = "SELECT * FROM [" + sheet1 + "]";
                    daOle = new System.Data.OleDb.OleDbDataAdapter(cmdOle);
                    daOle.Fill(dtExcel);

                    TaxInvoiceFunctionsClass obj = new TaxInvoiceFunctionsClass();
                    int result = 0;
                    using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString))
                    {

                        con.Open();
                        ////sqlBulkCopy.WriteToServer(dtExcel);
                        foreach (System.Data.DataRow dr in dtExcel.Rows)
                        {
                            obj.partno = dr["partno"].ToString();
                            System.Data.DataSet ds = new System.Data.DataSet();
                            //////obj.olocationid = Convert.ToString(HttpContext.Current.Session["userlocation"]);
                            ds = TaxInvoiceFunctionsClass.GetTaxInvoiceDetailsByPartNo(obj);

                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                string partDescription = "";
                                string hsnCode = "";
                                string taxSlab = "0";
                                string rate = "0";
                                string cgstrate = "0";
                                string sgstrate = "0";
                                partDescription = ds.Tables[0].Rows[0]["partdesc"].ToString();
                                hsnCode = ds.Tables[0].Rows[0]["hsncode"].ToString();
                                taxSlab = ds.Tables[0].Rows[0]["taxslab"].ToString();
                                rate = ds.Tables[0].Rows[0]["purchaseprice"].ToString();

                                if (taxSlab.Trim() != "")
                                {
                                    cgstrate = Convert.ToString(float.Parse(taxSlab) / 2);
                                    sgstrate = Convert.ToString(float.Parse(taxSlab) / 2);
                                }

                                obj.taxinvmasterid = billid;
                                if (obj.taxinvmasterid != "0" && obj.hsnsac != "" && obj.partjobcode != "" && obj.particulars != "" && obj.qty != "" && obj.rate != "" && obj.cgstrate != "" && obj.sgstrate != "")
                                {

                                    obj.id = 0;
                                    ///obj.taxinvmasterid = model.taxinvmasterid.Trim();
                                    obj.taxinvmasterid = Convert.ToString(billid);
                                    obj.srno = "1"; // HttpUtility.HtmlEncode(CultureInfo.CurrentCulture.TextInfo.ToTitleCase(model.custname.ToLower().Trim()));  ///model.Name.Trim();                        
                                    obj.hsnsac = hsnCode;             //HttpUtility.HtmlEncode(CultureInfo.CurrentCulture.TextInfo.ToTitleCase(model.particulars.ToLower().Trim()));
                                    obj.partjobcode = dr["partno"].ToString();
                                    obj.particulars = partDescription;
                                    obj.ttype = "Paid";
                                    obj.uomid = "1";

                                    obj.uom = "Each";
                                    obj.qty = dr["qty"].ToString();
                                    obj.rate = rate;
                                    obj.totalamtbaseprice = rate;
                                    obj.extrachg = "";
                                    obj.discamt = "";
                                    obj.campagindisc = "";
                                    obj.discper = "";
                                    obj.insuranceliability = "";
                                    float taxableamt = float.Parse(obj.qty) * float.Parse(obj.rate);

                                    obj.taxableamt = taxableamt.ToString();
                                    obj.cgstrate = cgstrate;
                                    float cgstamt = float.Parse(Convert.ToString(Math.Round(decimal.Parse(Convert.ToString((taxableamt * float.Parse(obj.cgstrate) / 100))), 0)));
                                    obj.cgstamt = cgstamt.ToString();
                                    obj.sgstrate = sgstrate;
                                    float sgstamt = float.Parse(Convert.ToString(Math.Round(decimal.Parse(Convert.ToString((taxableamt * float.Parse(obj.sgstrate) / 100))), 0)));
                                    obj.sgstamt = sgstamt.ToString();
                                    obj.totalamtinctax = Convert.ToString(taxableamt + cgstamt + sgstamt);

                                    obj.remarks = "";


                                    ////float totalAmount = float.Parse(model.qty.Trim()) * float.Parse(model.rate.Trim());

                                    ////model.totalamount = totalAmount.ToString();

                                    obj.locationid = HttpUtility.HtmlEncode(Convert.ToString(HttpContext.Current.Session["userlocation"]));
                                    obj.locationname = HttpUtility.HtmlEncode(Convert.ToString(HttpContext.Current.Session["userlocation"]));
                                    obj.createdby = Convert.ToString(HttpContext.Current.Session["loggedUser"]);
                                    obj.updatedby = Convert.ToString(HttpContext.Current.Session["loggedUser"]);

                                    obj.createdbyid = Convert.ToString(HttpContext.Current.Session["csusrid"]);
                                    obj.updatedbyid = Convert.ToString(HttpContext.Current.Session["csusrid"]);

                                    result = TaxInvoiceFunctionsClass.SaveTaxInvoiceDetails(obj);

                                }
                            }

                        }
                        if (result == 0)
                        {
                            string json2 = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(
                          new
                          {
                              name = "error while uploading file. please check file name!!"
                          });
                            context.Response.StatusCode = (int)System.Net.HttpStatusCode.Ambiguous;
                            context.Response.ContentType = "text/json";
                            context.Response.Write(json2);
                            context.Response.End();
                            return;
                        }


                    }
                    //Send File details in a JSON Response.
                    string json = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(
                        new
                        {
                            name = uploadedFileName
                        });
                    context.Response.StatusCode = (int)System.Net.HttpStatusCode.OK;
                    context.Response.ContentType = "text/json";
                    context.Response.Write(json);
                    context.Response.End();
                }
                else
                {
                    string json = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(
                        new
                        {
                            name = ".pdf file only"
                        });
                    context.Response.StatusCode = (int)System.Net.HttpStatusCode.OK;
                    context.Response.ContentType = "text/json";
                    context.Response.Write(json);
                    context.Response.End();
                }
                //}
                //else
                //{
                //    string json = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(
                //        new
                //        {
                //            name = "select customer"
                //        });
                //    context.Response.StatusCode = (int)System.Net.HttpStatusCode.OK;
                //    context.Response.ContentType = "text/json";
                //    context.Response.Write(json);
                //    context.Response.End();
                //}

            }
            else
            {
                string json = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(
                          new
                          {
                              name = ".no file selected"
                          });
                context.Response.StatusCode = (int)System.Net.HttpStatusCode.OK;
                context.Response.ContentType = "text/json";
                context.Response.Write(json);
                context.Response.End();
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}