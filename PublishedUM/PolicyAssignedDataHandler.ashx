<%@ WebHandler Language="C#" Class="PolicyAssignedDataHandler" %>

using System;
using System.Web;

using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class PolicyAssignedDataHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<PolicyRenewalMasterFunctions> listData = new List<PolicyRenewalMasterFunctions>();
        int filteredCount = 0;

        ////string locationidval = "0";
        ////try
        ////{
        ////    locationidval = Convert.ToString(context.Session["userlocation"]);
        ////}
        ////catch { }

        string callingAssignedtoIDVal = "0";
        try
        {
            callingAssignedtoIDVal = Convert.ToString(context.Session["csusrid"]);
        }
        catch { }
        

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataPolicyAssigned", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //SqlParameter locationid = new SqlParameter()
            //{
            //    ParameterName = "@locationid",
            //    Value = locationidval
            //};
            //cmd.Parameters.Add(locationid);

            SqlParameter callingAssignedtoID = new SqlParameter()
            {
                ParameterName = "@callingAssignedtoID",
                Value = callingAssignedtoIDVal.Trim()
            };
            cmd.Parameters.Add(callingAssignedtoID);
            

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
                PolicyRenewalMasterFunctions listItems = new PolicyRenewalMasterFunctions();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.ocustname = rdr["custname"].ToString();
                listItems.ovehChasisno = rdr["vehChasisno"].ToString();
                listItems.oduedate = rdr["duedate"].ToString();
                listItems.omobileno = rdr["mobileno"].ToString();
                listItems.owhatsappno = rdr["whatsappno"].ToString();
                listItems.omodelName = rdr["modelName"].ToString();
                listItems.olastrenewalfromval = rdr["lastrenewalfromval"].ToString();
                ////listItems.olastchangeson = rdr["lastchangeson"].ToString();

                listItems.createdon = rdr["createdon"].ToString();
                listItems.ocreatedby = rdr["createdby"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.oupdatedby = rdr["updatedby"].ToString();
                
                
                listData.Add(listItems);
            }
            con.Close();
        }

        var result = new
        {
            iTotalRecords = GetRecordsTotalCount(callingAssignedtoIDVal),
            iTotalDisplayRecords = filteredCount,
            aaData = listData
        };

        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.Write(js.Serialize(result));
    }

    private int GetRecordsTotalCount(string callingAssignedID)
    {
        int totalRecordsCount = 0;
        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new
                SqlCommand("select count(*) from tblpolicyRenewal where callingAssignedtoID=" + callingAssignedID, con);
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