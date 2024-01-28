<%@ WebHandler Language="C#" Class="MasterVendorsHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;


public class MasterVendorsHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<VendorMasterFunctions> listData = new List<VendorMasterFunctions>();
        int filteredCount = 0;

        ////string locationidval = "0";
        ////try
        ////{
        ////    locationidval = Convert.ToString(context.Session["userlocation"]);
        ////}
        ////catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataVendorMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;

            ////SqlParameter locationid = new SqlParameter()
            ////{
            ////    ParameterName = "@locationid",
            ////    Value = locationidval
            ////};
            ////cmd.Parameters.Add(locationid);

            SqlParameter paramDisplayLength = new SqlParameter()
            {
                ParameterName = "@DisplayLength",
                Value = displayLength
            };
            cmd.Parameters.Add(paramDisplayLength);

            SqlParameter paramDisplayStart = new SqlParameter()
            {
                ParameterName = "@DisplayStart",
                Value = displayStart
            };
            cmd.Parameters.Add(paramDisplayStart);

            SqlParameter paramSortCol = new SqlParameter()
            {
                ParameterName = "@SortCol",
                Value = sortCol
            };
            cmd.Parameters.Add(paramSortCol);

            SqlParameter paramSortDir = new SqlParameter()
            {
                ParameterName = "@SortDir",
                Value = sortDir
            };
            cmd.Parameters.Add(paramSortDir);

            SqlParameter paramSearchString = new SqlParameter()
            {
                ParameterName = "@Search",
                Value = string.IsNullOrEmpty(search) ? null : search
            };
            cmd.Parameters.Add(paramSearchString);

            con.Open();

            //float runningDiff = 0;
            //float opBalance = 0;


            

            
                
           

            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                string startDate = DateTime.Now.ToShortDateString();
                string endDate = DateTime.Now.ToShortDateString();
                float purchaseamt = 0;
                float paymentamt = 0;
                string trntype = "";
                int dtrowid = 0;

                int rowid = 0;
                
                
                VendorMasterFunctions listItems = new VendorMasterFunctions();

                listItems.id = Convert.ToInt32(rdr["id"]);

               
                    ////rowid += 1;


                    filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                    listItems.oisactive = rdr["isactive"].ToString();
                    listItems.vendorname = rdr["vendorname"].ToString();
                    listItems.openingbaldate = rdr["openingbaldate"].ToString();
                    listItems.accountypeid = rdr["accountypeid"].ToString();
                    listItems.accountype = rdr["accountype"].ToString();
                    listItems.openingbal = rdr["openingbal"].ToString();
                    listItems.vendoraddress = rdr["vendoraddress"].ToString();
                    listItems.vendorcontactno = rdr["vendorcontactno"].ToString();

                    ///////////// to get current balance //////////////

                    //////////////////// to get current balance ////////////////


                    /////SqlDataAdapter daCurrentBal = new SqlDataAdapter("spGetDataForCustomerReport", con);
                    ///daCurrentBal.SelectCommand = CommandType.StoredProcedure;
                    /////////////////daCurrentBal.SelectCommand.Parameters.AddWithValue("@customerid", rdr["id"].ToString());

                    if (rdr["id"].ToString().Trim() == "36")
                    {
                        string abd = rdr["id"].ToString();
                        
                    }
                    DataSet dsOpBal = ReportsFunctions.GetVendorOpeningBalance(rdr["id"].ToString());

                    string openingBal = dsOpBal.Tables[0].Rows[0]["openingbal"].ToString();

                    DataSet dsCurrentBal = ReportsFunctions.GetVendorCurrentBalance(rdr["id"].ToString());

                    float currentBal = 0;

                    if (openingBal != "0")
                    {
                        currentBal = float.Parse(openingBal);
                    }

                    if (dsCurrentBal.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow drCurrent in dsCurrentBal.Tables[0].Rows)
                        {
                            currentBal += float.Parse(drCurrent["RunningBalance"].ToString());
                            ///////currentBal -= float.Parse(drCurrent["AmountReceived"].ToString());
                        }
                    }
                    //////////////////// end to get current balance ////////////////
                    listItems.currentbalance = currentBal.ToString();
                   

                    


                    double dueDays = 0;
                    if (currentBal > 0)
                    {

                        DataSet dsPurchase = VendorMasterFunctions.GetVendorsPurchaseTransactionByVendorID(rdr["id"].ToString());
                        DataSet dsPayment = VendorMasterFunctions.GetVendorsPaymentTransactionByVendorID(rdr["id"].ToString());
                        int paymentRows = dsPayment.Tables[0].Rows.Count;
                        int purchaseRows = dsPurchase.Tables[0].Rows.Count;


                        if (dsPurchase.Tables[0].Rows.Count > 0 || dsOpBal.Tables[0].Rows.Count > 0)
                        {
                            //////if (float.Parse(openingBal) > 0)
                            //////{
                            int purchaserowid = 0;
                            //if (dsOpBal.Tables[0].Rows.Count > 0)
                            //{
                            if (openingBal != "0")
                            {
                                startDate = dsOpBal.Tables[0].Rows[0][1].ToString();
                            }
                            else
                            {
                                try
                                {
                                    startDate = dsPurchase.Tables[0].Rows[0][0].ToString();
                                }
                                catch { }
                            }
                            if (dsPurchase.Tables[0].Rows.Count > 0)
                            {
                                purchaseamt = float.Parse(dsPurchase.Tables[0].Rows[0][2].ToString());
                                for (int paymentrowid = 0; paymentrowid < dsPayment.Tables[0].Rows.Count; paymentrowid++)
                                {
                                    paymentamt += float.Parse(dsPayment.Tables[0].Rows[paymentrowid][2].ToString());

                                    if (  float.Parse(openingBal) > paymentamt   )
                                    {
                                        purchaserowid += 1;
                                        //////if (purchaserowid < purchaseRows)
                                        //////{
                                        //////    startDate = dsPurchase.Tables[0].Rows[purchaserowid][0].ToString();
                                        //////    purchaseamt += float.Parse(dsPurchase.Tables[0].Rows[purchaserowid][2].ToString());
                                        //////}
                                    }
                                    else if (purchaseamt <= paymentamt)
                                    {
                                        purchaserowid += 1;
                                        if (purchaserowid < purchaseRows)
                                        {
                                            startDate = dsPurchase.Tables[0].Rows[purchaserowid][0].ToString();
                                            purchaseamt += float.Parse(dsPurchase.Tables[0].Rows[purchaserowid][2].ToString());
                                        }
                                    }
                                    else
                                    {
                                        continue;
                                    }
                                }
                            }
                            dueDays = (Convert.ToDateTime(endDate) - Convert.ToDateTime(startDate)).TotalDays + 1;

                            //////}
                            //////else
                            //////{
                            //////    listItems.currentduedays = "0";
                            //////}

                            ///////////// to get current balance //////////////

                            //float currentBal = 0;
                            //dsLessPayments = MasterEmployeeFunctions.GetEmployeeRunningBalbyID(rdr["Id"].ToString());
                            //if (dsLessPayments.Tables[0].Rows.Count > 0)
                            //{
                            //    if (!string.IsNullOrEmpty(dsLessPayments.Tables[0].Rows[0]["RunningBalance"].ToString()))
                            //    {
                            //        foreach (DataRow dr in dsLessPayments.Tables[0].Rows)
                            //        {
                            //            currentBal += float.Parse(dr["RunningBalance"].ToString());
                            //        }
                            //    }
                            //}
                            ////// runningDiff = opBalance;


                            //////listItems.currentbalance = rdr["currentbalance"].ToString();

                            //listItems.currentbalance = currentBal.ToString();

                            //listItems.attendancestatus = rdr["attendancestatus"].ToString();
                            //listItems.reportstatus = rdr["reportstatus"].ToString();
                            //listItems.emphotoname = rdr["emphotoname"].ToString();
                            ////listItems.esino = rdr["esino"].ToString();



                        }
                    }
                    listItems.currentduedays = dueDays.ToString();
                
                
                    listData.Add(listItems);
                }
            
           
            
            
            con.Close();
        }

        var result = new
        {
            iTotalRecords = GetRecordsTotalCount(),
            iTotalDisplayRecords = filteredCount,
            aaData = listData
        };

        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.Write(js.Serialize(result));
    }

    private int GetRecordsTotalCount()
    {
        int totalRecordsCount = 0;
        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new
                SqlCommand("select count(*) from mastervendor", con);
            con.Open();
            totalRecordsCount = (int)cmd.ExecuteScalar();
        }
        return totalRecordsCount;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}