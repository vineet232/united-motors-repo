<%@ WebHandler Language="C#" Class="BackOrderDetailsHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;


public class BackOrderDetailsHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<InventoryFunctions> listData = new List<InventoryFunctions>();
        int filteredCount = 0;

       

        int totalRecordsCount = 0;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForBackOrderPriceListMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;



            try
            {
                SqlCommand cmd2 = new SqlCommand("select count(*) from tblmasterbackorderdetails", con);
                con.Open();
                totalRecordsCount = (int)cmd2.ExecuteScalar();
            }
            catch
            {
            }

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
            con.Close();
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                InventoryFunctions listItems = new InventoryFunctions();

                listItems.id = Convert.ToInt32(rdr["LINE"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
               
                listItems.partno = rdr["Part"].ToString();
                listItems.partdesc = rdr["Description"].ToString();
                listItems.taxslab = rdr["partyname"].ToString();
                listItems.purchaseqty = rdr["Qty"].ToString();
                listItems.stockqty = rdr["OrderDate"].ToString();
                listItems.saleqty = rdr["OrderID"].ToString();
                listItems.purchaseprice = rdr["Price"].ToString();
                listItems.discountcode = rdr["DiscPer"].ToString();

                listItems.challanno = rdr["StatusID"].ToString();
                listItems.discount = rdr["TypeID"].ToString();


                listData.Add(listItems);
            }
            con.Close();
        }

        var result = new
        {
            ////iTotalRecords = GetRecordsTotalCount(),
            iTotalRecords = totalRecordsCount,
            iTotalDisplayRecords = filteredCount,
            aaData = listData
        };

        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.Write(js.Serialize(result));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}