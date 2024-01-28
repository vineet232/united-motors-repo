<%@ WebHandler Language="C#" Class="yardEntryUnitedPhotoUploadHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;


public class yardEntryUnitedPhotoUploadHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest (HttpContext context) {
        if (context.Request.Files.Count > 0)
        {
            string id = context.Request["id"];
            string userid = Convert.ToString(context.Session["csusrid"]);
            string username = Convert.ToString(context.Session["loggedUser"]);
            //Fetch the Uploaded File.

            HttpPostedFile postedFile = context.Request.Files[0];
            string extension = System.IO.Path.GetExtension(postedFile.FileName);
            if (extension.ToLower().Trim() == ".jpg" || extension.ToLower().Trim() == ".jpeg" || extension.ToLower().Trim() == ".png")
            {
                //Set the Folder Path.
                string folderPath = context.Server.MapPath("~/UploadedVehicleImages/");

                //Set the File Name.
                //string fileName = System.IO.Path.GetFileNameWithoutExtension(postedFile.FileName);

                string fileextension = System.IO.Path.GetExtension(postedFile.FileName);
                string fileName = "";
                fileName = Guid.NewGuid().ToString() + "_" + id + "_vehphoto" + fileextension;

                //Save the File in Folder.
                // postedFile.SaveAs(folderPath + fileName);

                postedFile.SaveAs(folderPath + fileName);

                byte[] bytes = null;
                using (System.IO.Stream fs = postedFile.InputStream)
                {
                    using (System.IO.BinaryReader br = new System.IO.BinaryReader(fs))
                    {
                        bytes = br.ReadBytes((Int32)fs.Length);
                    }
                }



                if (id != "" && id != "0")
                {
                    YardUnitedFunctions obj = new YardUnitedFunctions();
                    obj.id = Convert.ToInt32(id);
                    ///obj.schoolLogobinary = bytes;
                    obj.photofilename = fileName;
                    obj.photofilepath = folderPath;
                    obj.photofileextension = fileextension;
                    int result = YardUnitedFunctions.UploadFile(obj);
                    if (result > 0)
                    {
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
                        //Send File details in a JSON Response.
                        string json = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(
                            new
                            {
                                name = fileName
                            });
                        context.Response.StatusCode = (int)System.Net.HttpStatusCode.InternalServerError;
                        context.Response.ContentType = "text/json";
                        context.Response.Write(json);
                        context.Response.End();
                    }

                }

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