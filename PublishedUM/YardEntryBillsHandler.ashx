﻿<%@ WebHandler Language="C#" Class="YardEntryBillsHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;


public class YardEntryBillsHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<YardAnkurBillClassFunctions> listData = new List<YardAnkurBillClassFunctions>();
        int filteredCount = 0;

        //string locationidval = "0";
        //try
        //{
        //    locationidval = Convert.ToString(context.Session["userlocation"]);
        //}
        //catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForYardAnkurBills", con);
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
                YardAnkurBillClassFunctions listItems = new YardAnkurBillClassFunctions();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.vehno = rdr["vehno"].ToString();
                listItems.modelname = rdr["modelname"].ToString();
                listItems.totalamt = rdr["totalamt"].ToString();
                listItems.custname = rdr["custname"].ToString();
                listItems.invoiceno = rdr["invoiceno"].ToString();
                listItems.invoicedate = rdr["invoicedate"].ToString();
                listItems.rateperday = rdr["rateperday"].ToString();
                listItems.totaldays = rdr["totaldays"].ToString();
                listItems.createdon = rdr["createdon"].ToString();
                listItems.createdbyid = rdr["createdbyid"].ToString();
                listItems.createdby = rdr["createdby"].ToString();
                listItems.createdip = rdr["createdip"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.updatedbyid = rdr["updatedbyid"].ToString();

                listItems.updatedby = rdr["updatedby"].ToString();
                listItems.updatedip = rdr["updatedip"].ToString();

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
                SqlCommand("select count(*) from tblYardAnkurBills", con);
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