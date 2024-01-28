<%@ WebHandler Language="C#" Class="SparePartsDeliveryHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class SparePartsDeliveryHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<SparePartsDeliveryFunctions> listData = new List<SparePartsDeliveryFunctions>();
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
            SqlCommand cmd = new SqlCommand("spGetDataSparePartsDeliveryMaster", con);
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
                string startDate = DateTime.Now.ToShortDateString();
                string endDate = DateTime.Now.ToShortDateString();

                SparePartsDeliveryFunctions listItems = new SparePartsDeliveryFunctions();

                listItems.id = Convert.ToInt32(rdr["id"]);

                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.invoicechallanno = rdr["invoicechallanno"].ToString();
                listItems.challanno = rdr["challanno"].ToString();
                listItems.challandate = rdr["challandate"].ToString();
                listItems.customername = rdr["customername"].ToString();
                listItems.vehicleno = rdr["vehicleno"].ToString();
                listItems.mobileno = rdr["mobileno"].ToString();
                //listItems.paymentmodeid = rdr["paymentmodeid"].ToString();
                listItems.paymentmode = rdr["paymentmode"].ToString();
                // listItems.modelid = rdr["modelid"].ToString();
                listItems.modelname = rdr["modelname"].ToString();
                listItems.totalamount = rdr["totalamount"].ToString();
                listItems.statusid = rdr["statusid"].ToString();
                listItems.status = rdr["status"].ToString();
                
                listItems.challannotext = rdr["challannotext"].ToString();
                listItems.servicetypeid = rdr["servicetypeid"].ToString();
                listItems.servicetype = rdr["servicetype"].ToString();

                ////listItems.issuedtoid = rdr["issuedtoid"].ToString();
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
                SqlCommand("select count(*) from tblsparepartsdeliverymaster", con);
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