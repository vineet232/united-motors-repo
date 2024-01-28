<%@ WebHandler Language="C#" Class="SaleTransactionDetailsFitnessUploadFileHandler" %>

using System;
using System.Web;
using DBLayerFunctions;

public class SaleTransactionDetailsFitnessUploadFileHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request.Files.Count > 0)
        {
            string fitnessid = context.Request["fitnessid"];
           ////// string mobileno = context.Request["mobileno"];
            string userid = Convert.ToString(context.Session["csusrid"]);
            //Fetch the Uploaded File.

            HttpPostedFile postedFile = context.Request.Files[0];
            string extension = System.IO.Path.GetExtension(postedFile.FileName);
            if (extension.ToLower().Trim() == ".pdf")
            {
                //Set the Folder Path.
                string folderPath = context.Server.MapPath("~/UploadedFitnessFiles/");

                //Set the File Name.
                string fileName = System.IO.Path.GetFileName(postedFile.FileName);
                string fileNamewithouext = System.IO.Path.GetFileNameWithoutExtension(postedFile.FileName);


                string uploadedFileName = fileNamewithouext.Trim() + "_" + fitnessid + "_" + DateTime.Now.ToString("HH_mm_ss") + extension;


                //Save the File in Folder.
                postedFile.SaveAs(folderPath + uploadedFileName);

                if (fitnessid != "" && fitnessid != "0")
                {
                    SaleTransactionDetailsCustomersFunctions obj = new SaleTransactionDetailsCustomersFunctions();



                    obj.fitnessmasterid = fitnessid;
                    obj.ouploadedfilefullpath = folderPath + uploadedFileName;
                    obj.ouploadedfilename = uploadedFileName;
                    obj.ouploadedfiletype = extension;
                    obj.updatedby = userid;
                    int result = SaleTransactionDetailsCustomersFunctions.UploadPolicyFiles(obj);
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

                            ////obj.id = Convert.ToInt32(fitnessid);
                            ////System.Data.DataSet dsInfo = SaleTransactionDetailsCustomersFunctions.GetPolicyDetailsbyID(obj);
                            ////if (dsInfo.Tables[0].Rows.Count > 0)
                            ////{
                            ////    /////string mobileNo = dsInfo.Tables[0].Rows[0]["mobileno"].ToString().Trim();
                            ////    string mobileNo = mobileno;
                            ////    string custName = dsInfo.Tables[0].Rows[0]["custname"].ToString().Trim();
                            ////    string vehNo = dsInfo.Tables[0].Rows[0]["vehchasisno"].ToString().Trim();
                            ////    string filetodownload = uploadedFileName;

                            ////    System.Uri address = new System.Uri("http://tinyurl.com/api-create.php?url=https://unitedmotors.in/UploadedRenewalFiles/" + filetodownload);
                            ////    System.Net.WebClient client = new System.Net.WebClient();
                            ////    string tinyUrl = client.DownloadString(address);

                            ////    string message = "http://connect.hisarsms.com/ApiSmsHttp?UserId=unitedmotorshisar@gmail.com&pwd=pwd2022&Message=Dear " + custName.ToUpper() + " Thank you for insuring your " + vehNo.ToUpper() + " with us.You can download the policy copy of " + vehNo.ToUpper() + " From Clicking on the Link " + tinyUrl + " Warm Regards United Motors Hisar 9991172555&Contacts=" + mobileNo + "& SenderId=United&ServiceName=SMSTRANS&MessageType=1&DLTTemplateId=1607100000000198397";
                            ////    try
                            ////    {
                            ////        string shortUrl = new System.IO.StreamReader(System.Net.WebRequest.Create(message).GetResponse().GetResponseStream()).ReadToEnd();
                            ////    }
                            ////    catch { }
                            ////    try
                            ////    {

                            ////        string instaceID = "5fd0ab353ccfcf079c9d2e97";
                            ////        string wamsg = "Dear " + custName + " Thank you for insuring your " + vehNo + " with us.You can download the policy copy of " + vehNo + " Warm Regards United Motors Hisar 9991172555";

                            ////        string walink = "http://whatsapp.hisarsms.com/api/sendFileWithCaption?token=" + instaceID + "&phone=91" + mobileNo + "&link=https://unitedmotors.in/UploadedRenewalFiles/" + uploadedFileName + "&message=" + "Policy Copy of " + vehNo;
                            ////        System.Net.WebRequest request = System.Net.WebRequest.Create(walink);
                            ////        System.Net.WebResponse response = request.GetResponse();
                            ////        string resultWA = new System.IO.StreamReader(response.GetResponseStream()).ReadToEnd();
                            ////    }
                            ////    catch { }
                            ////}

                            SaleTransactionDetailsCustomersFunctions obj2 = new SaleTransactionDetailsCustomersFunctions();
                            System.Data.DataSet dsInfo = new System.Data.DataSet();
                            obj2.fitnessmasterid = Convert.ToString(fitnessid);
                            dsInfo = SaleTransactionDetailsCustomersFunctions.GetAllPolicyRenewalAttachedFilesOld(obj2);
                            
                           
                            if (dsInfo.Tables[0].Rows.Count > 0)
                            {
                                obj.id = Convert.ToInt32(fitnessid);
                                System.Data.DataSet dsCustData = SaleTransactionDetailsCustomersFunctions.GetCustomersSaleTransactionDetailsbyID(obj);
                                
                                /////string mobileNo = dsInfo.Tables[0].Rows[0]["mobileno"].ToString().Trim();
                                string mobileNo =  dsCustData.Tables[0].Rows[0]["newmobileno"].ToString(); ;
                                string custName = dsCustData.Tables[0].Rows[0]["newcustomername"].ToString().Trim();
                                string vehNo = dsCustData.Tables[0].Rows[0]["vehchasisno"].ToString().Trim();
                                string filetodownload = uploadedFileName;
                                string filepath = "https://unitedmotors.in/UploadedFitnessFiles/" + filetodownload;

                                System.Uri address = new System.Uri("http://tinyurl.com/api-create.php?url=https://unitedmotors.in/UploadedFitnessFiles/" + filetodownload);
                                System.Net.WebClient client = new System.Net.WebClient();
                                string tinyUrl = client.DownloadString(address);

                                //////////string message = "http://connect.hisarsms.com/ApiSmsHttp?UserId=unitedmotorshisar@gmail.com&pwd=pwd2022&Message=Vehicle Fitness Certificate Hello " + custName.ToUpper() + " Thank you for insuring your " + vehNo.ToUpper() + " with us.You can download the policy copy of " + vehNo.ToUpper() + " From Clicking on the Link " + tinyUrl + " Warm Regards United Motors Hisar 9991172555&Contacts=" + mobileNo + "& SenderId=United&ServiceName=SMSTRANS&MessageType=1&DLTTemplateId=1607100000000198397";
                                ////////try
                                ////////{
                                ////////    string shortUrl = new System.IO.StreamReader(System.Net.WebRequest.Create(message).GetResponse().GetResponseStream()).ReadToEnd();
                                ////////}
                                ////////catch { }
                                try
                                {

                                    ////  string instaceID = "5fd0ab353ccfcf079c9d2e97";
                                    ////  string wamsg = "Dear " + custName + " Thank you for insuring your " + vehNo + " with us.You can download the policy copy of " + vehNo + " Warm Regards United Motors Hisar 9991172555";

                                    ////  string walink = "http://whatsapp.hisarsms.com/api/sendFileWithCaption?token=" + instaceID + "&phone=91" + mobileNo + "&link=https://unitedmotors.in/UploadedRenewalFiles/" + uploadedFileName + "&message=" + "Policy Copy of "+ vehNo;
                                    ////System.Net.WebRequest request = System.Net.WebRequest.Create(walink);
                                    ////System.Net.WebResponse response = request.GetResponse();
                                    ////string resultWA = new System.IO.StreamReader(response.GetResponseStream()).ReadToEnd();




                                    System.Net.ServicePointManager.SecurityProtocol = (System.Net.SecurityProtocolType)3072;


                                    string messagetobesent = "https://theultimate.io/WAApi/send?userid=unitedmotorswa&password=Unitedmotors@123&msg=Vehicle Fitness Certificate"

                                                  + " Hello " + custName + ", Vehicle Number - " + vehNo + ","

                                                  + " We're pleased to inform you that your vehicle fitness certificate copy is ready for download and safe keeping. Your fitness certificate details are crucial for your protection on the road."

                                                  + " Download Fitness Certificate Copy - " + tinyUrl + ""

                                                  + " Please make sure to save the copy securely and have it readily available whenever you're driving. If you have any questions or need assistance, feel free to reach out to our customer support team at Phone 📞 - 9896601827"

                                                  + " Drive safely and stay protected! "

                                                  + "Best Regards, "
                                                  + "United Motors, Hisar&wabaNumber=919996010721&output=json&mobile=91" + mobileNo + "&sendMethod=quick&msgType=media&templateName=vehicle_fitness_certificate_copy&mediaUrl=" + filepath + "&mediaType=document&documentName=" + vehNo;



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
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}