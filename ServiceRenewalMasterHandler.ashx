<%@ WebHandler Language="C#" Class="ServiceRenewalMasterHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;


public class ServiceRenewalMasterHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<ServiceRenewalFunctions> listData = new List<ServiceRenewalFunctions>();
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

        string entrydt = context.Request["entryDt"];
        string entrydt2 = context.Request["entryDt2"];

        string filterBy = context.Request["filterby"];

        if (startDt.Trim() == "")
        {
            startDt = "0";
        }
        if (endDt.Trim() == "")
        {
            endDt = "0";
        }


        if (entrydt.Trim() == "")
        {
            entrydt = "0";
        }

        if (entrydt2.Trim() == "")
        {
            entrydt2 = "0";
        }
        ////if (lastRenID.Trim() == "")
        ////{
        ////    lastRenID = "0";
        ////}


        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataServiceRenewal", con);
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

            SqlParameter entryDt = new SqlParameter()
            {
                ParameterName = "@entryDt",
                Value = entrydt
            };
            cmd.Parameters.Add(entryDt);

            SqlParameter entryDt2 = new SqlParameter()
            {
                ParameterName = "@entryDt2",
                Value = entrydt2
            };
            cmd.Parameters.Add(entryDt2);


            SqlParameter filterby = new SqlParameter()
            {
                ParameterName = "@filterby",
                Value = filterBy
            };
            cmd.Parameters.Add(filterby);
            


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
                ServiceRenewalFunctions listItems = new ServiceRenewalFunctions();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                string modelname = rdr["modelName"].ToString().Replace("Amp;", "");
                listItems.modelName = modelname;
                listItems.vehsaledt = rdr["vehsaledt"].ToString();
                listItems.vehChasisno = rdr["vehChasisno"].ToString();
                listItems.custname = rdr["custname"].ToString();

                listItems.nextserviceduedate = rdr["nextserviceduedate"].ToString();
                listItems.nextserviceduedate2 = rdr["nextserviceduedate2"].ToString();
                listItems.nextserviceonkm = rdr["nextserviceonkm"].ToString();
                listItems.nextserviceonkm2 = rdr["nextserviceonkm2"].ToString();
                listItems.mobileno = rdr["mobileno"].ToString();
                listItems.whatsappno = rdr["whatsappno"].ToString();
                listItems.lastservicefromval = rdr["lastservicefromval"].ToString();
                listItems.serviceonkm = rdr["serviceonkm"].ToString();
                listItems.servicetypeid = rdr["servicetypeid"].ToString();
                listItems.servicetype = rdr["servicetype"].ToString();
                listItems.remarks = rdr["remarks"].ToString();
                listItems.invoiceno = rdr["invoiceno"].ToString();
                listItems.insduedt = rdr["insduedt"].ToString();

                listItems.createdon = rdr["createdon"].ToString();
                listItems.createdby = rdr["createdby"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();

                listItems.emissiontypeid = rdr["emissiontypeid"].ToString();
                listItems.lineofbusinessid = rdr["lineofbusinessid"].ToString();
                listItems.parentproductlineid = rdr["parentproductlineid"].ToString();
                listItems.productlineid = rdr["productlineid"].ToString();
                listItems.productline = rdr["productline"].ToString();
                listItems.servicetypemasterid = rdr["servicetypemasterid"].ToString();

                listItems.nextservicetypeid = rdr["nextservicetypeid"].ToString();
                listItems.nextservicetype = rdr["nextservicetype"].ToString();
                
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
                SqlCommand("select count(*) from tblServiceRenewalMaster", con);
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