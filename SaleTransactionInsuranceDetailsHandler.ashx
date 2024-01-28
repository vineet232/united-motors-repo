<%@ WebHandler Language="C#" Class="SaleTransactionInsuranceDetailsHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class SaleTransactionInsuranceDetailsHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<SaleTransactionDetailsFunctions> listData = new List<SaleTransactionDetailsFunctions>();
        int filteredCount = 0;


        string frominvno = context.Request["frominvno"];
        string toinvno = context.Request["toinvno"];
        string frominvDt = context.Request["frominvdt"];
        string toinvDt = context.Request["toinvdt"];

        if (frominvDt.Trim() == "")
        {
            frominvDt = "0";
        }
        if (toinvDt.Trim() == "")
        {
            toinvDt = "0";
        }

        if (frominvno.Trim() == "")
        {
            frominvno = "0";
        }
        if (toinvno.Trim() == "")
        {
            toinvno = "0";
        }
        
        
        
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForSaleTransactionInsurance", con);
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


            SqlParameter frominvdt = new SqlParameter()
            {
                ParameterName = "@frominvdt",
                Value = frominvDt
            };
            cmd.Parameters.Add(frominvdt);

            SqlParameter toinvdt = new SqlParameter()
            {
                ParameterName = "@toinvdt",
                Value = toinvDt
            };
            cmd.Parameters.Add(toinvdt);

            SqlParameter frominvNo = new SqlParameter()
            {
                ParameterName = "@frominvno",
                Value = frominvno
            };
            cmd.Parameters.Add(frominvNo);

            SqlParameter toinvNo = new SqlParameter()
            {
                ParameterName = "@toinvno",
                Value = toinvno
            };
            cmd.Parameters.Add(toinvNo);
            
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
                SaleTransactionDetailsFunctions listItems = new SaleTransactionDetailsFunctions();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.accounttype = rdr["accounttype"].ToString();
                listItems.invoicedt = rdr["invoicedt"].ToString();
                listItems.invoiceno = rdr["invoiceno"].ToString();
                //listItems.discount = rdr["discount"].ToString();
                listItems.vehchasisno = rdr["vehchasisno"].ToString();
                listItems.vehcustomername = rdr["vehcustomername"].ToString();
               // listItems.salesexecutiveid = rdr["salesexecutiveid"].ToString();
                listItems.salesexecutive = rdr["salesexecutive"].ToString();
                listItems.vendorname = rdr["vendorname"].ToString();
                listItems.venpaymentamt = rdr["venpaymentamt"].ToString();
                listItems.payoutaccounttype = rdr["payoutaccounttype"].ToString();
                listItems.payout = rdr["payout"].ToString();
                listItems.payoutpaymentmode = rdr["payoutpaymentmode"].ToString();
                listItems.payoutpaymentamt = rdr["payoutpaymentamt"].ToString();
                listItems.customeraccounttype = rdr["customeraccounttype"].ToString();
                listItems.customername = rdr["customername"].ToString();
                listItems.custpaymentmodeid = rdr["custpaymentmodeid"].ToString();
                listItems.custpaymentmode = rdr["custpaymentmode"].ToString();
                listItems.custpaymentamt = rdr["custpaymentamt"].ToString();
                listItems.custpaymenttobankid = rdr["custpaymenttobankid"].ToString();
                listItems.custpaymenttobank = rdr["custpaymenttobank"].ToString();
                /////listItems.custpaymenttobank = rdr["custpaymenttobank"].ToString();
                listItems.ocreatedby = rdr["createdby"].ToString();
                listItems.oupdatedby = rdr["updatedby"].ToString();

                listItems.createdon = rdr["createdon"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                
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
            /////SqlCommand cmd = new  SqlCommand("select count(*) from salesTransactionDetailsInsurance where  accounttypeid=1", con);
            SqlCommand cmd = new SqlCommand("select max(saletransactiontypeid) from salesTransactionDetailsInsurance where  accounttypeid=1", con);
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