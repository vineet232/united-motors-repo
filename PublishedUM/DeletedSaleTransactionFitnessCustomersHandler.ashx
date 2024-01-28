<%@ WebHandler Language="C#" Class="DeletedSaleTransactionFitnessCustomersHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class DeletedSaleTransactionFitnessCustomersHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<SaleTransactionDetailsCustomersFunctions> listData = new List<SaleTransactionDetailsCustomersFunctions>();
        int filteredCount = 0;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForSaleTransactionCustomersDeletedFitness", con);
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
                SaleTransactionDetailsCustomersFunctions listItems = new SaleTransactionDetailsCustomersFunctions();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.accounttype = rdr["accounttype"].ToString();
                listItems.invoicedt = rdr["invoicedt"].ToString();
                listItems.customerid = rdr["customerid"].ToString();
                listItems.customername = rdr["customername"].ToString();
                listItems.invoicetypeid = rdr["invoicetypeid"].ToString();
                listItems.invoicetype = rdr["invoicetype"].ToString();
                listItems.invoiceno = rdr["invoiceno"].ToString();
                listItems.paymentmodeid = rdr["paymentmodeid"].ToString();
                listItems.paymentmode = rdr["paymentmode"].ToString();
                listItems.amount = rdr["amount"].ToString();
                listItems.discount = rdr["discount"].ToString();
                listItems.vehchasisno = rdr["vehchasisno"].ToString();

                listItems.createdby = rdr["createdby"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();

                listItems.createdon = rdr["createdon"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();

                listItems.deletedon = rdr["deletedon"].ToString();
                listItems.deletedby = rdr["deletedby"].ToString();

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
                SqlCommand("select count(*) from salesTransactionDetailsCustomersDeleted where invoicetypeid=7", con);
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