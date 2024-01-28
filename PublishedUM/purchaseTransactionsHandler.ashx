<%@ WebHandler Language="C#" Class="purchaseTransactionsHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class purchaseTransactionsHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<PurchaseTransactionDetailsFunctions> listData = new List<PurchaseTransactionDetailsFunctions>();
        int filteredCount = 0;

        ////string locationidval = "0";
        ////try
        ////{
        ////    locationidval = Convert.ToString(context.Session["userlocation"]);
        ////}
        ////catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForPurchaseTransaction", con);
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

            ///////////For Search /////////
            string searchdt = context.Request["searchdt"];

            if (searchdt.Trim() == "")
            {
                searchdt = "0";
            }

            SqlParameter searchDt = new SqlParameter()
            {
                ParameterName = "@searchdt",
                Value = searchdt
            };
            cmd.Parameters.Add(searchDt);
            ///////////End For Search /////////


            /////////////For Searchparameter /////////
            /////////////For Searchparameter /////////
            string searchfieldparameters = context.Request["searchfield"];
            string searchvalueparameters = context.Request["searchvalue"];

            if (searchfieldparameters.Trim() == "")
            {
                searchvalueparameters = "0";
            }

            SqlParameter SearchFieldParameters = new SqlParameter()
            {
                ParameterName = "@searcfield",
                Value = searchfieldparameters
            };
            cmd.Parameters.Add(SearchFieldParameters);

            SqlParameter SearchValueParameters = new SqlParameter()
            {
                ParameterName = "@searchvalue",
                Value = searchvalueparameters
            };
            cmd.Parameters.Add(SearchValueParameters);

            /////////////End For Search /////////
            /////////////End For Search /////////
            
            
            con.Open();
            
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                PurchaseTransactionDetailsFunctions listItems = new PurchaseTransactionDetailsFunctions();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);

                listItems.purchasedt = rdr["purchasedt"].ToString();
                listItems.purchasetypename = rdr["purchasetypename"].ToString();
                listItems.vendorid = rdr["vendorid"].ToString();
                listItems.vendorname = rdr["vendorname"].ToString();
                listItems.invoicetypeid = rdr["invoicetypeid"].ToString();
                listItems.invoicetype = rdr["invoicetype"].ToString();
                listItems.invoiceslipno = rdr["invoiceslipno"].ToString();
                listItems.paymentmodeid = rdr["paymentmodeid"].ToString();
                listItems.paymentmode = rdr["paymentmode"].ToString();
                listItems.amount = rdr["amount"].ToString();
                listItems.createdon = rdr["createdon"].ToString();
                listItems.ocreatedby = rdr["createdby"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.oupdatedby = rdr["updatedby"].ToString();
                listItems.uploadedfilename = rdr["uploadedfilename"].ToString();
                listItems.totalitems = rdr["totalitems"].ToString();
                listItems.isbillapproved = rdr["isbillapproved"].ToString();
                listItems.billapprovedby = rdr["billapprovedby"].ToString();
                listItems.billapprovedon = rdr["billapprovedon"].ToString();
                
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
                SqlCommand("select count(*) from purchaseTransactionDetails ", con);
            con.Open();
            totalRecordsCount = (int)cmd.ExecuteScalar();
        }
        return totalRecordsCount;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}