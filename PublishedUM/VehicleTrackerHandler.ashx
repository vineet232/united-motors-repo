<%@ WebHandler Language="C#" Class="VehicleTrackerHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class VehicleTrackerHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<VehicleTrackerFunctions> listData = new List<VehicleTrackerFunctions>();
        int filteredCount = 0;

        string statusid = context.Request["statusid"];
        
        ////string locationidval = "0";
        ////try
        ////{
        ////    locationidval = Convert.ToString(context.Session["userlocation"]);
        ////}
        ////catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataVehicleTracking", con);
            cmd.CommandType = CommandType.StoredProcedure;

            ////SqlParameter locationid = new SqlParameter()
            ////{
            ////    ParameterName = "@locationid",
            ////    Value = locationidval
            ////};
            ////cmd.Parameters.Add(locationid);

            
            SqlParameter statusID = new SqlParameter()
            {
                ParameterName = "@statusid",
                Value = statusid
            };
            cmd.Parameters.Add(statusID);

            

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


            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                //string startDate = DateTime.Now.ToShortDateString();
                //string endDate = DateTime.Now.ToShortDateString();

                VehicleTrackerFunctions listItems = new VehicleTrackerFunctions();

                listItems.id = Convert.ToInt32(rdr["id"]);

                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.vehno = rdr["vehno"].ToString();
                listItems.vehowner = rdr["vehowner"].ToString();
                listItems.vehownercontactno = rdr["vehownercontactno"].ToString();
                listItems.vehowneraddress = rdr["vehowneraddress"].ToString();
                listItems.modelid = rdr["modelid"].ToString();
                listItems.modelname = rdr["modelname"].ToString();
                listItems.companyid = rdr["companyid"].ToString();
                listItems.companyname = rdr["companyname"].ToString();
                listItems.serviceadvid = rdr["serviceadvid"].ToString();
                listItems.serviceadvname = rdr["serviceadvname"].ToString();
                listItems.technicianid = rdr["technicianid"].ToString();
                listItems.technicianname = rdr["technicianname"].ToString();
                listItems.remarks = rdr["remarks"].ToString();
                listItems.kms = rdr["kms"].ToString();

                listItems.mobileno = rdr["mobileno"].ToString();
                if (rdr["modelname"].ToString().Trim() != "")
                {
                    listItems.modelname = rdr["modelname"].ToString();
                }
                else
                {
                    listItems.modelname = "";
                }

                var timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
                var now = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, timeZoneInfo);
                /////////Response.Write(now.ToShortDateString());

                string formattedDate = now.ToString("yyyy-MM-dd HH:mm:ss");
                string entryDt = rdr["createdon"].ToString();
                string updateDt = rdr["updatedon"].ToString();

                decimal hours = 0;
                
                if (rdr["statusid"].ToString().Trim() == "1")
                {
                     hours = Math.Round(Convert.ToDecimal((Convert.ToDateTime(formattedDate) - Convert.ToDateTime(entryDt)).TotalHours), 2);
                }
                if (rdr["statusid"].ToString().Trim() == "2")
                {
                    hours = Math.Round(Convert.ToDecimal((Convert.ToDateTime(updateDt) - Convert.ToDateTime(entryDt)).TotalHours), 2);
                }
                
                
                listItems.hrs = hours.ToString();
                listItems.statusid = rdr["statusid"].ToString();
                listItems.status = rdr["status"].ToString();
                listItems.gatepassno = rdr["gatepassno"].ToString();
                listItems.createdby = rdr["createdby"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();
                listItems.createdon = rdr["createdon"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();


                if (rdr["id"].ToString().Trim() == "202")
                {
                    string abd = rdr["id"].ToString();
                }

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
                SqlCommand("select count(*) from tblVehicleTracker", con);
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