<%@ WebHandler Language="C#" Class="AllEnteriesPurchasesHandlerVA" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class AllEnteriesPurchasesHandlerVA : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<AllEnteriesAndDeletedEnteriesClass> listData = new List<AllEnteriesAndDeletedEnteriesClass>();
        int filteredCount = 0;

        //string locationidval = "0";
        //try
        //{
        //    locationidval = Convert.ToString(context.Session["userlocation"]);
        //}
        //catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForPurchaseAllEnteriesVA", con);
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
                AllEnteriesAndDeletedEnteriesClass listItems = new AllEnteriesAndDeletedEnteriesClass();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.purchasetransactiontypeid = rdr["purchasetransactiontypeid"].ToString();

                listItems.accounttypeid = rdr["accounttypeid"].ToString();
                listItems.accounttype = rdr["accounttype"].ToString();

                listItems.purchasedt = rdr["purchasedt"].ToString();
                listItems.vendorid = rdr["vendorid"].ToString();
                listItems.vendorname = rdr["vendorname"].ToString();
                listItems.invoicetypeid = rdr["invoicetypeid"].ToString();
                listItems.invoicetype = rdr["invoicetype"].ToString();
                listItems.invoiceslipno = rdr["invoiceslipno"].ToString();
                listItems.paymentmodeid = rdr["paymentmodeid"].ToString();
                listItems.paymentmode = rdr["paymentmode"].ToString();
                listItems.amount = rdr["amount"].ToString();
                listItems.oldpurchasedt = rdr["oldpurchasedt"].ToString();
                listItems.oldvendorid = rdr["oldvendorid"].ToString();
                listItems.oldvendorname = rdr["oldvendorname"].ToString();
                listItems.oldinvoicetypeid = rdr["oldinvoicetypeid"].ToString();
                listItems.oldinvoicetype = rdr["oldinvoicetype"].ToString();
                listItems.oldinvoiceslipno = rdr["oldinvoiceslipno"].ToString();
                listItems.oldpaymentmodeid = rdr["oldpaymentmodeid"].ToString();
                listItems.oldpaymentmode = rdr["oldpaymentmode"].ToString();
                listItems.oldamount = rdr["oldamount"].ToString();
                listItems.createdon = rdr["createdon"].ToString();
                listItems.createdby = rdr["createdby"].ToString();
                listItems.createdip = rdr["createdip"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();
                listItems.updatedip = rdr["updatedip"].ToString();
                listItems.deletedon = rdr["deletedon"].ToString();
                listItems.deletedby = rdr["deletedby"].ToString();
                listItems.deletedip = rdr["deletedbyid"].ToString();
                listItems.remarks = rdr["remarks"].ToString();
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
                SqlCommand("select count(*) from purchaseTransactionDetailsAllEnteriesVA ", con);
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