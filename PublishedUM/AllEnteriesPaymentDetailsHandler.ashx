﻿<%@ WebHandler Language="C#" Class="AllEnteriesPaymentDetailsHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class AllEnteriesPaymentDetailsHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
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
            SqlCommand cmd = new SqlCommand("spGetDataForPaymentTransactionAllEnteries", con);
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
                listItems.paymenttransactionid = Convert.ToInt32(rdr["paymenttransactionid"].ToString());
                listItems.paymentdt = rdr["paymentdt"].ToString();
                listItems.accounttypeid =rdr["accounttypeid"].ToString();
                listItems.accounttype = rdr["accounttype"].ToString();

                listItems.paymenttoid = rdr["paymenttoid"].ToString();
                listItems.paymentto = rdr["paymentto"].ToString();
                listItems.paymenttobankid = rdr["paymenttobankid"].ToString();
                listItems.paymenttobank = rdr["paymenttobank"].ToString();
                listItems.paymentmodeid = rdr["paymentmodeid"].ToString();
                listItems.paymentmode = rdr["paymentmode"].ToString();
                listItems.paymentreceiptid = rdr["paymentreceiptid"].ToString();
                listItems.paymentreceipt = rdr["paymentreceipt"].ToString();
                listItems.amount = rdr["amount"].ToString();
                listItems.remarks = rdr["remarks"].ToString();
                listItems.oldpaymentdt = rdr["oldpaymentdt"].ToString();
                listItems.oldaccounttypeid = rdr["oldaccounttypeid"].ToString();
                listItems.oldaccounttype = rdr["oldaccounttype"].ToString();
                listItems.oldpaymenttoid = rdr["oldpaymenttoid"].ToString();
                listItems.oldpaymentto = rdr["oldpaymentto"].ToString();
                listItems.oldpaymenttobankid = rdr["oldpaymenttobankid"].ToString();
                listItems.oldpaymenttobank = rdr["oldpaymenttobank"].ToString();
                listItems.oldpaymentmodeid = rdr["oldpaymentmodeid"].ToString();
                listItems.oldpaymentmode = rdr["oldpaymentmode"].ToString();
                listItems.oldpaymentreceiptid = rdr["oldpaymentreceiptid"].ToString();
                listItems.oldpaymentreceipt = rdr["oldpaymentreceipt"].ToString();
                listItems.oldamount = rdr["oldamount"].ToString();
                listItems.oldremarks = rdr["oldremarks"].ToString();
                listItems.createdon = rdr["createdon"].ToString();
                listItems.createdby = rdr["createdby"].ToString();
                listItems.createdip = rdr["createdip"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();
                listItems.updatedip = rdr["updatedip"].ToString();
                listItems.deletedon = rdr["deletedon"].ToString();
                listItems.deletedby = rdr["deletedby"].ToString();
                listItems.deletedip = rdr["deletedbyid"].ToString();
                listItems.trnremarks = rdr["trnremarks"].ToString();
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
                SqlCommand("select count(*) from paymentTransactionDetailsAllEnteries", con);
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