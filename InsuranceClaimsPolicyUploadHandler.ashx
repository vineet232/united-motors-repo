<%@ WebHandler Language="C#" Class="InsuranceClaimsPolicyUploadHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class InsuranceClaimsPolicyUploadHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        if (context.Request.Files.Count > 0)
        {
            string claimid = context.Request["claimid"];
            string userid = Convert.ToString(context.Session["csusrid"]);
            //Fetch the Uploaded File.

            HttpPostedFile postedFile = context.Request.Files[0];
            string extension = System.IO.Path.GetExtension(postedFile.FileName);
            if (extension.ToLower().Trim() == ".pdf" || extension.ToLower().Trim() == ".doc" || extension.ToLower().Trim() == ".docx" || extension.ToLower().Trim() == ".xls" || extension.ToLower().Trim() == ".xlsx")
            {
                //Set the Folder Path.
                string folderPath = context.Server.MapPath("~/UploadedSurveyorFiles/");

                //Set the File Name.
                string fileName = System.IO.Path.GetFileName(postedFile.FileName);
                string fileNamewithouext = System.IO.Path.GetFileNameWithoutExtension(postedFile.FileName);


                string uploadedFileName = fileNamewithouext.Trim() + "_" + claimid + "_" + DateTime.Now.ToString("HH_mm_ss") + extension;


                //Save the File in Folder.
                postedFile.SaveAs(folderPath + uploadedFileName);

                if (claimid != "" && claimid != "0")
                {
                    InsuranceClaimsModel obj = new InsuranceClaimsModel();

                    obj.claimid = claimid;
                    obj.ouploadedfilefullpath = folderPath + uploadedFileName;
                    obj.ouploadedfilename = uploadedFileName;
                    obj.ouploadedfiletype = extension;
                    obj.oupdatedby = userid;
                    int result = InsuranceClaimsModel.UploadFiles(obj);
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
                        string json2 = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(
                     new
                     {
                         name = "file uploaded successfully!!"
                     });
                        context.Response.StatusCode = (int)System.Net.HttpStatusCode.OK;
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