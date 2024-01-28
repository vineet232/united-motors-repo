<%@ WebHandler Language="C#" Class="InsuranceClaimsListHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;


public class InsuranceClaimsListHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<InsuranceClaimsModel> listData = new List<InsuranceClaimsModel>();
        int filteredCount = 0;

        //string locationidval = "0";
        //try
        //{
        //    locationidval = Convert.ToString(context.Session["userlocation"]);
        //}
        //catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataInsuranceClaims", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //SqlParameter locationid = new SqlParameter()
            //{
            //    ParameterName = "@locationid",
            //    Value = locationidval
            //};
            //cmd.Parameters.Add(locationid);

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
                InsuranceClaimsModel listItems = new InsuranceClaimsModel();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.oinscompname = rdr["inscompname"].ToString();
                listItems.orepairtype = rdr["repairtype"].ToString();
                listItems.osurveyornamespot = rdr["surveyornamespot"].ToString();
                listItems.osurveyornamefinal = rdr["surveyornamefinal"].ToString();
                listItems.osurveyornamereins = rdr["surveyornamereins"].ToString();
                listItems.oinstype = rdr["instype"].ToString();
                listItems.oestimateddate = rdr["estimateddate"].ToString();

                double dueDays = (Convert.ToDateTime(DateTime.Now.ToShortDateString()) - Convert.ToDateTime(rdr["estimateddate"].ToString())).TotalDays + 1;
                listItems.odays = dueDays.ToString();

                
                
                listItems.ovehno = rdr["vehno"].ToString();
                listItems.odateofloss = rdr["dateofloss"].ToString();
                listItems.ocustname = rdr["custname"].ToString();
                listItems.ovehmakemodel = rdr["vehmakemodel"].ToString();
                listItems.ocontactno = rdr["contactno"].ToString();
                listItems.oclaimstatus = rdr["claimstatus"].ToString();
                listItems.remarks = rdr["remarks"].ToString();
                listItems.createdon = rdr["createdon"].ToString();
                listItems.createdby = rdr["createdby"].ToString();
                listItems.createdip = rdr["createdip"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();
                listItems.updatedip = rdr["updatedip"].ToString();

                listItems.craneservicevendorid = rdr["craneservicevendorid"].ToString();
                listItems.craneservicevendorname = rdr["craneservicevendorname"].ToString();
                listItems.craneservicevendorcontactno = rdr["craneservicevendorcontactno"].ToString();
                


                double daysAfterInvDt = 0;
                listItems.invoicedate = "";
                
                if (!string.IsNullOrEmpty(rdr["invoicedate"].ToString() ))
                {
                    daysAfterInvDt = (Convert.ToDateTime(DateTime.Now.ToShortDateString()) - Convert.ToDateTime(rdr["invoicedate"].ToString())).TotalDays + 1;

                    listItems.invoicedate = rdr["invoicedate"].ToString();
                }
                listItems.totaldaysafterinvdt = daysAfterInvDt.ToString();
                listItems.policyno = rdr["policyno"].ToString();
                //listItems.invoicedate = rdr["invoicedate"].ToString().Substring(0,10);


                listItems.spotsurveyormobileno = rdr["spotsurveyormobileno"].ToString();
                listItems.finalsurveyormobileno = rdr["finalsurveyormobileno"].ToString();
                listItems.reinssurveyormobileno = rdr["reinssurveyormobileno"].ToString();


                listItems.invoiceno = rdr["invoiceno"].ToString();
                listItems.invoiceamount = rdr["invoiceamount"].ToString();
                
                
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
                SqlCommand("select count(*) from masterinsuranceclaimdetails", con);
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