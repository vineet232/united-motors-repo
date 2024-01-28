<%@ WebHandler Language="C#" Class="UploadPolicyHandler" %>

using System;
using System.Web;
using DBLayerFunctions;

public class UploadPolicyHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        if (context.Request.Files.Count > 0)
        {
            string custid = context.Request["custid"];
            string mobileno = context.Request["mobileno"];
            string userid = Convert.ToString(context.Session["csusrid"]);
            //Fetch the Uploaded File.

            HttpPostedFile postedFile = context.Request.Files[0];
            string extension = System.IO.Path.GetExtension(postedFile.FileName);
            if (extension.ToLower().Trim() == ".pdf")
            {
                //Set the Folder Path.
                string folderPath = context.Server.MapPath("~/UploadedRenewalFiles/");

                //Set the File Name.
                string fileName = System.IO.Path.GetFileName(postedFile.FileName);
                string fileNamewithouext = System.IO.Path.GetFileNameWithoutExtension(postedFile.FileName);


                string uploadedFileName = fileNamewithouext.Trim() + "_" + custid + "_" + DateTime.Now.ToString("HH_mm_ss") + extension;


                //Save the File in Folder.
                postedFile.SaveAs(folderPath + uploadedFileName);

                if (custid != "" && custid != "0")
                {
                    PolicyRenewalMasterFunctions obj = new PolicyRenewalMasterFunctions();
                     

                    
                    
                   

                    obj.ocustid = custid;
                    obj.ouploadedfilefullpath = folderPath + uploadedFileName;
                    obj.ouploadedfilename = uploadedFileName;
                    obj.ouploadedfiletype = extension;
                    obj.oupdatedby = userid;
                    int result = PolicyRenewalMasterFunctions.UploadPolicyFiles(obj);
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
                    else
                    {
                        try
                        {
                            //System.Data.SqlClient.SqlConnection conn = Connection.getConnectionDB();
                            //conn.Close();
                            //conn.Open();
                            //string strCmd = "select * from tblpolicyRenewal where  id=@id ";
                            ///System.Data.DataSet dsInfo = new System.Data.DataSet();
                            //System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(strCmd, conn);
                            //da.SelectCommand.Parameters.AddWithValue("@id", custid);
                            //da.Fill(dsInfo);
                            //conn.Close();
                            //conn.Dispose();

                            obj.id = Convert.ToInt32(custid);
                            System.Data.DataSet dsInfo = PolicyRenewalMasterFunctions.GetPolicyDetailsbyID(obj);
                            if (dsInfo.Tables[0].Rows.Count > 0)
                            {
                                /////string mobileNo = dsInfo.Tables[0].Rows[0]["mobileno"].ToString().Trim();
                                string mobileNo =  mobileno;
                                string custName = dsInfo.Tables[0].Rows[0]["custname"].ToString().Trim();

                                string insduedate = "01/01/1900";
                                try
                                {
                                    string[] dtarray = dsInfo.Tables[0].Rows[0]["duedate"].ToString().Split('-', '/');

                                    ///// DateTime datechanged = new DateTime(Convert.ToInt32(dtarray[2]), Convert.ToInt32(dtarray[1]), Convert.ToInt32(dtarray[0]));

                                    string monthName = "";
                                    monthName = new DateTime(2010, Convert.ToInt32(dtarray[0].Trim()), 1).ToString("MMMM");

                                    insduedate = dtarray[1] + "/" + monthName + "/" + dtarray[2].Substring(0, 4);
                                }
                                catch { }
                                
                                
                                string vehNo = dsInfo.Tables[0].Rows[0]["vehchasisno"].ToString().Trim();
                                string filetodownload =  uploadedFileName;
                                string filepath = "https://unitedmotors.in/UploadedRenewalFiles/" +  filetodownload;

                                System.Uri address = new System.Uri("http://tinyurl.com/api-create.php?url=https://unitedmotors.in/UploadedRenewalFiles/" + filetodownload);
                                System.Net.WebClient client = new System.Net.WebClient();
                                string tinyUrl = client.DownloadString(address);
                                
                                string message = "http://connect.hisarsms.com/ApiSmsHttp?UserId=unitedmotorshisar@gmail.com&pwd=pwd2022&Message=Dear " + custName.ToUpper() + " Thank you for insuring your " + vehNo.ToUpper() + " with us.You can download the policy copy of " + vehNo.ToUpper() + " From Clicking on the Link " + tinyUrl + " Warm Regards United Motors Hisar 9991172555&Contacts="+ mobileNo +"& SenderId=United&ServiceName=SMSTRANS&MessageType=1&DLTTemplateId=1607100000000198397";
                                try
                                {
                                    string shortUrl = new System.IO.StreamReader(System.Net.WebRequest.Create(message).GetResponse().GetResponseStream()).ReadToEnd();
                                }
                                catch { }
                                try
                                {
                                    
                                  ////  string instaceID = "5fd0ab353ccfcf079c9d2e97";
                                  ////  string wamsg = "Dear " + custName + " Thank you for insuring your " + vehNo + " with us.You can download the policy copy of " + vehNo + " Warm Regards United Motors Hisar 9991172555";

                                  ////  string walink = "http://whatsapp.hisarsms.com/api/sendFileWithCaption?token=" + instaceID + "&phone=91" + mobileNo + "&link=https://unitedmotors.in/UploadedRenewalFiles/" + uploadedFileName + "&message=" + "Policy Copy of "+ vehNo;
                                  ////System.Net.WebRequest request = System.Net.WebRequest.Create(walink);
                                  ////System.Net.WebResponse response = request.GetResponse();
                                  ////string resultWA = new System.IO.StreamReader(response.GetResponseStream()).ReadToEnd();




                                    System.Net.ServicePointManager.SecurityProtocol = (System.Net.SecurityProtocolType)3072;

                                    //////////string messagetobesent = "https://theultimate.io/WAApi/send?userid=unitedmotorswa&password=Unitedmotors@123&msg=Vehicle Insurance Copy"

                                    //////////              + " Hello " + custName + " , Vehicle Number -" + vehNo + " ,"

                                    //////////              + " We hope this message finds you well. We're pleased to inform you that your vehicle insurance copy is ready for download and safe keeping. Your insurance details are crucial for your protection on the road."

                                    //////////              + " Download Insurance Copy: " + tinyUrl + ""

                                    //////////              + " Please make sure to save the copy securely and have it readily available whenever you're driving. If you have any questions or need assistance, feel free to reach out to our customer support team at Ph: 9991172555 or Insurance@unitedmotors.in."

                                    //////////              + " Drive safely and stay protected! "

                                    //////////              + "Best regards, "
                                    //////////              + "United Motors, Hisar&wabaNumber=919996010721&output=json&mobile=91" + mobileNo + "&sendMethod=quick&msgType=media&templateName=insurance_copy&mediaUrl=" + filepath + "&mediaType=document&documentName=API";


                                    //string messagetobesent = "https://theultimate.io/WAApi/send?userid=unitedmotorswa&password=Unitedmotors@123&msg=Vehicle Insurance Copy"

                                    //              + " Hello " + custName + ", Vehicle Number - " + vehNo + ","

                                    //              + " We're pleased to inform you that your vehicle insurance copy is ready for download and safe keeping. Your insurance details are crucial for your protection on the road."

                                    //              + " Download Insurance Copy - " + tinyUrl + ""

                                    //              + " Please make sure to save the copy securely and have it readily available whenever you're driving. If you have any questions or need assistance, feel free to reach out to our customer support team at Phone - 9991172555 or Insurance@unitedmotors.in."

                                    //              + " Drive safely and stay protected! "

                                    //              + "Best Regards, "
                                    //              + "United Motors, Hisar&wabaNumber=919996010721&output=json&mobile=91" + mobileNo + "&sendMethod=quick&msgType=media&templateName=insurance_policy_popy&mediaUrl=" + filepath + "&mediaType=document&documentName=" + vehNo;

                                    string messagetobesent = "https://theultimate.io/WAApi/send?userid=unitedmotorswa&password=Unitedmotors@123&msg=🚗 **Vehicle Insurance Copy**"

                        + " Dear " + custName + ", Vehicle Number - " + vehNo + ","

                        + " I hope this message finds you well. As per our recent discussion about the vehicle insurance, I'm sharing a copy of the insurance details for your reference."

                        + " Tap this Link to download Insurance Copy - " + tinyUrl + ""

                        + " Should you have any queries or need further clarification regarding the coverage, terms, or any other related information, please don't hesitate to reach out. Your insurance coverage is valid until " + insduedate + "."

                        + " Feel free to review the document, and let me know if there's anything else I can assist you with."

                        + " Best Regards,"
                        + " United Motors, Hisar"
                        + " Mobile Number - 9896609801"
                        + " Email ID - Insurance@unitedmotors.in&wabaNumber=919996010721&output=json&mobile=91" + mobileno + "&sendMethod=quick&msgType=media&templateName=vehicle_insurance_copy&mediaUrl=" + filepath + "&mediaType=document&documentName=" + vehNo;



                                    System.Net.WebRequest request = System.Net.WebRequest.Create(messagetobesent);
                                    System.Net.WebResponse response = request.GetResponse();
                                    string resultWA = new System.IO.StreamReader(response.GetResponseStream()).ReadToEnd();
                                    
                                    
                                }
                                catch { }
                            }
                        }
                        catch (Exception ex)
                        {
                            
                        }
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


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}