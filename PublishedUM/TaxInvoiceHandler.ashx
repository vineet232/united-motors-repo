<%@ WebHandler Language="C#" Class="TaxInvoiceHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class TaxInvoiceHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<TaxInvoiceFunctionsClass> listData = new List<TaxInvoiceFunctionsClass>();
        int filteredCount = 0;

        ////string locationidval = "0";
        ////try
        ////{
        ////    locationidval = Convert.ToString(context.Session["userlocation"]);
        ////}
        ////catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataTaxInvoiceMaster", con);
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

                TaxInvoiceFunctionsClass listItems = new TaxInvoiceFunctionsClass();

                listItems.id = Convert.ToInt32(rdr["id"]);

                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.pname1 = rdr["pname1"].ToString();
                ////listItems.pname2 = rdr["pname2"].ToString();
                ////listItems.padd1 = rdr["padd1"].ToString();
                ////listItems.padd2 = rdr["padd2"].ToString();
                //////listItems.padd3 = rdr["padd3"].ToString();
                //////listItems.padd4 = rdr["padd4"].ToString();
                //////listItems.country = rdr["country"].ToString();
                listItems.pphone = rdr["pphone"].ToString();
                //listItems.cgstn = rdr["cgstn"].ToString();
                //listItems.accode = rdr["accode"].ToString();
                //listItems.radd1 = rdr["radd1"].ToString();
                //listItems.radd2 = rdr["radd2"].ToString();
                ////listItems.radd3 = rdr["radd3"].ToString();
                ////listItems.radd4 = rdr["radd4"].ToString();
                ////listItems.rstate = rdr["rstate"].ToString();
                ////listItems.rcountry = rdr["rcountry"].ToString();
                ////listItems.phone2 = rdr["phone2"].ToString();
                ////listItems.cgstn2 = rdr["cgstn2"].ToString();
                ////listItems.accode2 = rdr["accode2"].ToString();
                ////listItems.placeofsupply = rdr["placeofsupply"].ToString();
                listItems.panno = rdr["panno"].ToString();
                listItems.invno = rdr["invno"].ToString();
                listItems.invdt = rdr["invdt"].ToString();
                listItems.pmodel = rdr["pmodel"].ToString();
                listItems.vehregno = rdr["vehregno"].ToString();
                listItems.chasisno = rdr["chasisno"].ToString();
                listItems.inscomp = rdr["inscomp"].ToString();
                listItems.instype = rdr["instype"].ToString();
                listItems.insexpdt = rdr["insexpdt"].ToString();
               //// listItems.kms = rdr["kms"].ToString();
                listItems.vehregno = rdr["vehregno"].ToString();
                listItems.jobcardno = rdr["jobcardno"].ToString();
                listItems.jobcarddt = rdr["jobcarddt"].ToString();
                listItems.servicerequesttype = rdr["servicerequesttype"].ToString();
              ////  listItems.custpono = rdr["custpono"].ToString();
              ////  listItems.paymentmethod = rdr["paymentmethod"].ToString();
                ////listItems.warrentyexp = rdr["warrentyexp"].ToString();
                ////listItems.dealerpan = rdr["dealerpan"].ToString();
                ////listItems.dealergstn = rdr["dealergstn"].ToString();
                listItems.nextservicedt = rdr["nextservicedt"].ToString();
               

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
                SqlCommand("select count(*) from tblTaxInvoiceMaster", con);
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