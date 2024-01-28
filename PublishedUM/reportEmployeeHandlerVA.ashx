﻿<%@ WebHandler Language="C#" Class="reportEmployeeHandlerVA" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class reportEmployeeHandlerVA : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<ReportsFunctions> listData = new List<ReportsFunctions>();
        int filteredCount = 0;

        string empID = context.Request["employeeID"];
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


        ////string locationidval = "0";
        ////try
        ////{
        ////    locationidval = Convert.ToString(context.Session["userlocation"]);
        ////}
        ////catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForEmployeeReportVA", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter employeeID = new SqlParameter()
            {
                ParameterName = "@employeeID",
                Value = empID
            };
            cmd.Parameters.Add(employeeID);

            SqlParameter startDate = new SqlParameter()
            {
                ParameterName = "@startDate",
                Value = startDt
            };
            cmd.Parameters.Add(startDate);

            SqlParameter endDate = new SqlParameter()
            {
                ParameterName = "@endDate",
                Value = endDt
            };
            cmd.Parameters.Add(endDate);

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

            float debit = 0;
            float credit = 0;
            float runningDiff = 0;
            float opBalance = 0;
            ///////////// to add opening balance //////////////
            ReportsFunctions OBlistItems = new ReportsFunctions();
            DataSet ds = ReportsFunctions.GetEmployeeOpeningBalanceVA(empID);


            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["openingbaldate"].ToString().Trim()))
            {
                opBalance = float.Parse(ds.Tables[0].Rows[0]["openingbal"].ToString());
            }
            runningDiff = opBalance;
            
            
            while (rdr.Read())
            {
                ReportsFunctions listItems = new ReportsFunctions();
                runningDiff += float.Parse(rdr["creditamt"].ToString()) - float.Parse(rdr["debitamt"].ToString());
                ////listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                // listItems.srno = Convert.ToInt32(rdr["srno"]);
                listItems.trndate = rdr["trndate"].ToString();
                ////listItems.vehicleno = rdr["vehicleno"].ToString();
                listItems.mode = rdr["mode"].ToString();
                listItems.remarks = rdr["remarks"].ToString();
                ////listItems.paymentmodeid = rdr["paymentmodeid"].ToString();
                listItems.paymentmode = rdr["paymentmode"].ToString();

                listItems.paymentmodeid = rdr["paymentmodeid"].ToString();

                if (!string.IsNullOrEmpty(rdr["pmodebankid"].ToString()))
                {
                    listItems.pmodebankid = rdr["pmodebankid"].ToString();
                    listItems.pmodebankname = rdr["pmodebankname"].ToString();
                }
                else
                {
                    listItems.pmodebankid = "";
                    listItems.pmodebankname = "";
                }
                
                listItems.debitamt = rdr["debitamt"].ToString();
                listItems.creditamt = rdr["creditamt"].ToString();
                listItems.createdon = rdr["createdon"].ToString();
                listItems.createdby = rdr["createdby"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();

                listItems.RunningBalance = runningDiff.ToString();

                listData.Add(listItems);
            }
            con.Close();

            ////////////// To Show Opening Balance //////////////


            ///OBlistItems.trndate = "01/04/" + DateTime.Now.Year;
            ///

            if (ds.Tables[0].Rows.Count > 0)
            {
                OBlistItems.srno = 0;
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["openingbaldate"].ToString().Trim()))
                {


                    OBlistItems.trndate = ds.Tables[0].Rows[0]["openingbaldate"].ToString().Trim();
                    ////listItems.paymentmodeid = rdr["paymentmodeid"].ToString();
                    OBlistItems.mode = "Credit";
                    OBlistItems.remarks = "Opening Balance";
                    OBlistItems.paymentmodeid = "";
                    OBlistItems.paymentmode = "";
                    OBlistItems.creditamt = "0";
                    OBlistItems.debitamt = ds.Tables[0].Rows[0]["openingbal"].ToString();
                    OBlistItems.createdon = ds.Tables[0].Rows[0]["createdon"].ToString().Trim().Substring(0, 10);
                    OBlistItems.createdby = "";
                    OBlistItems.updatedon = ds.Tables[0].Rows[0]["updatedon"].ToString().Trim().Substring(0, 10);
                    OBlistItems.updatedby = "";
                    //// OBlistItems.remarks = "Opening Balance";
                    OBlistItems.RunningBalance = ds.Tables[0].Rows[0]["openingbal"].ToString();
                    listData.Insert(0, OBlistItems);
                }
            }
            
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
                SqlCommand("select count(*) from tmpEmpReportVA ", con);
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