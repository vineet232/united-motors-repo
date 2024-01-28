<%@ WebHandler Language="C#" Class="AllEnteriesInsuranceDetailsHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class AllEnteriesInsuranceDetailsHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
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
            SqlCommand cmd = new SqlCommand("spGetDataForInsuranceAllEnteries", con);
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
                listItems.saletransactionid = rdr["saletransactionid"].ToString();
                
                listItems.accounttypeid = rdr["accounttypeid"].ToString();
                listItems.accounttype = rdr["accounttype"].ToString();
                listItems.invoicedt = rdr["invoicedt"].ToString();
                listItems.invoiceno = rdr["invoiceno"].ToString();
                listItems.vehchasisno = rdr["vehchasisno"].ToString();
                listItems.salesexecutiveid = rdr["salesexecutiveid"].ToString();
                listItems.salesexecutive = rdr["salesexecutive"].ToString();
                listItems.vendorid = rdr["vendorid"].ToString();
                listItems.vendorname = rdr["vendorname"].ToString();
                listItems.venpaymentmodeid = rdr["venpaymentmodeid"].ToString();
                listItems.venpaymentmode = rdr["venpaymentmode"].ToString();
                listItems.venpaymentamt = rdr["venpaymentamt"].ToString();
                listItems.payoutid = rdr["payoutid"].ToString();
                listItems.payout = rdr["payout"].ToString();
                listItems.payoutpaymentmodeid = rdr["payoutpaymentmodeid"].ToString();
                listItems.payoutpaymentmode = rdr["payoutpaymentmode"].ToString();
                listItems.payoutpaymentamt = rdr["payoutpaymentamt"].ToString();
                listItems.customerid = rdr["customerid"].ToString();
                listItems.customername = rdr["customername"].ToString();
                listItems.custpaymentmodeid = rdr["custpaymentmodeid"].ToString();
                listItems.custpaymentmode = rdr["custpaymentmode"].ToString();
                listItems.custpaymentamt = rdr["custpaymentamt"].ToString();
                listItems.oldvehchasisno = rdr["oldvehchasisno"].ToString();
                listItems.oldsalesexecutiveid = rdr["oldsalesexecutiveid"].ToString();
                listItems.oldsalesexecutive = rdr["oldsalesexecutive"].ToString();
                listItems.oldvendorid = rdr["oldvendorid"].ToString();
                listItems.oldvendorname = rdr["oldvendorname"].ToString();
                listItems.oldvenpaymentmodeid = rdr["oldvenpaymentmodeid"].ToString();
                listItems.oldvenpaymentamt = rdr["oldvenpaymentamt"].ToString();
                listItems.oldpayoutid = rdr["oldpayoutid"].ToString();
                listItems.oldpayout = rdr["oldpayout"].ToString();
                listItems.oldpayoutpaymentmodeid = rdr["oldpayoutpaymentmodeid"].ToString();
                listItems.oldpayoutpaymentmode = rdr["oldpayoutpaymentmode"].ToString();
                listItems.oldpayoutpaymentamt = rdr["oldpayoutpaymentamt"].ToString();
                listItems.oldcustomerid = rdr["oldcustomerid"].ToString();
                listItems.oldcustomername = rdr["oldcustomername"].ToString();
                listItems.oldcustpaymentmodeid = rdr["oldcustpaymentmodeid"].ToString();
                listItems.oldcustpaymentmode = rdr["oldcustpaymentmode"].ToString();
                listItems.oldcustpaymentamt = rdr["oldcustpaymentamt"].ToString();
               
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
                SqlCommand("select count(*) from salesTransactionDetailsInsuranceAllEnteries", con);
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