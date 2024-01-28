<%@ WebHandler Language="C#" Class="AMCVehServiceHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class AMCVehServiceHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<AMCServiceRenewalFunctions> listData = new List<AMCServiceRenewalFunctions>();
        int filteredCount = 0;

        ////string locationidval = "0";
        ////try
        ////{
        ////    locationidval = Convert.ToString(context.Session["userlocation"]);
        ////}
        ////catch { }

        string lastRenID = context.Request["lrID"];
        string startDt = context.Request["startDt"];
        string endDt = context.Request["endDt"];

        if (startDt.Trim() == "")
        {
            startDt = "0";
        }
        if (endDt.Trim() == "")
        {
            endDt = "0";
        }
        ////if (lastRenID.Trim() == "")
        ////{
        ////    lastRenID = "0";
        ////}


        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForAMCServiceRenewal", con);
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






            SqlParameter fromdt = new SqlParameter()
            {
                ParameterName = "@fromdt",
                Value = startDt
            };
            cmd.Parameters.Add(fromdt);

            SqlParameter todt = new SqlParameter()
            {
                ParameterName = "@todt",
                Value = endDt
            };
            cmd.Parameters.Add(todt);

            ////SqlParameter lastinsbyid = new SqlParameter()
            ////{
            ////    ParameterName = "@lastinsbyid",
            ////    Value = lastRenID
            ////};
            ////cmd.Parameters.Add(lastinsbyid);




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
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                AMCServiceRenewalFunctions listItems = new AMCServiceRenewalFunctions();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                string modelname = rdr["modelName"].ToString().Replace("Amp;", "");
                listItems.vehicleno = rdr["vehicleno"].ToString();
                listItems.modelid = rdr["modelid"].ToString();
                listItems.modelname = modelname;
                listItems.chasisno = rdr["chasisno"].ToString();
                listItems.engineno = rdr["engineno"].ToString();
                listItems.modelyear = rdr["modelyear"].ToString();
                listItems.gvw = rdr["gvw"].ToString();
                listItems.dateofregistration = rdr["dateofregistration"].ToString();
                listItems.bodytypeid = rdr["bodytypeid"].ToString();
                listItems.bodytype = rdr["bodytype"].ToString();
                listItems.bharatstageid = rdr["bharatstageid"].ToString();
                listItems.bharatstageval = rdr["bharatstageval"].ToString();

                listItems.createdon = rdr["createdon"].ToString();
                listItems.createdby = rdr["createdby"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();
                listItems.isactive = rdr["isactive"].ToString();
                listItems.amcstartdt = rdr["amcstartdt"].ToString();
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
                SqlCommand("select count(*) from tblAMCVehicleDetails", con);
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