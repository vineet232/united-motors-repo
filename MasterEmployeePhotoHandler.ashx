<%@ WebHandler Language="C#" Class="MasterEmployeePhotoHandler" %>

using System;
using System.Web;
using DBLayerFunctions;

public class MasterEmployeePhotoHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request.Files.Count > 0)
        {
            string empid = context.Request["empid"];
            string userid = Convert.ToString(context.Session["csusrid"]);
            string username = Convert.ToString(context.Session["loggedUser"]);
            //Fetch the Uploaded File.

            HttpPostedFile postedFile = context.Request.Files[0];
            string extension = System.IO.Path.GetExtension(postedFile.FileName);
            if (extension.ToLower().Trim() == ".jpg" || extension.ToLower().Trim() == ".jpeg" || extension.ToLower().Trim() == ".png")
            {
                //Set the Folder Path.
                string folderPath = context.Server.MapPath("~/UploadedEmployeesPhoto/");

                //Set the File Name.
                string fileName = System.IO.Path.GetFileName(postedFile.FileName);

                //Save the File in Folder.
                postedFile.SaveAs(folderPath + fileName);

                if (empid != "" && empid != "0")
                {
                    MasterEmployeeFunctions obj = new MasterEmployeeFunctions();
                    obj.id = Convert.ToInt32(empid);
                    obj.empphotopath = folderPath + fileName;
                    obj.emphotoname = fileName;
                    obj.photoextension = extension;
                    obj.oupdatedbyid = userid;
                    obj.oupdatedby = username;
                    MasterEmployeeFunctions.UploadEmployeePhoto(obj);
                }
                //Send File details in a JSON Response.
                string json = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(
                    new
                    {
                        name = fileName
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
                        name = ".jpg/.jpeg file only"
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