<%@ WebHandler Language="C#" Class="TaxInvoicePriceListHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class TaxInvoicePriceListHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<InventoryFunctions> listData = new List<InventoryFunctions>();
        int filteredCount = 0;

        //string locationidval = "0";
        //try
        //{
        //    locationidval = Convert.ToString(context.Session["userlocation"]);
        //}
        //catch { }

        int totalRecordsCount = 0;
        
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForTaxInvoicePriceListMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //SqlParameter locationid = new SqlParameter()
            //{
            //    ParameterName = "@locationid",
            //    Value = locationidval
            //};
            //cmd.Parameters.Add(locationid);


            string compValue = context.Request["compval"];

            if (compValue.Trim() == "")
            {
                compValue = "0";
            }
            if (compValue.Trim() == "1")
            {
                SqlCommand cmd2 = new SqlCommand("select count(*) from tblTaxInvoicePriceListMaster", con);
                con.Open();
                totalRecordsCount = (int)cmd2.ExecuteScalar();
            }
            if (compValue.Trim() == "2")
            {
                SqlCommand cmd2 = new SqlCommand("select count(*) from tblTaxInvoicePriceListMasterMahindra", con);
                con.Open();
                totalRecordsCount = (int)cmd2.ExecuteScalar();
            }
            if (compValue.Trim() == "3")
            {
                SqlCommand cmd2 = new SqlCommand("select count(*) from tblTaxInvoicePriceListMasterEicher", con);
                con.Open();
                totalRecordsCount = (int)cmd2.ExecuteScalar();
            }
            if (compValue.Trim() == "4")
            {
                SqlCommand cmd2 = new SqlCommand("select count(*) from tblTaxInvoicePriceListMasterSMLIsuzu", con);
                con.Open();
                totalRecordsCount = (int)cmd2.ExecuteScalar();
            }
            if (compValue.Trim() == "5")
            {
                SqlCommand cmd2 = new SqlCommand("select count(*) from tblTaxInvoicePriceListMasterAshokLeyland", con);
                con.Open();
                totalRecordsCount = (int)cmd2.ExecuteScalar();
            }
            if (compValue.Trim() == "6")
            {
                SqlCommand cmd2 = new SqlCommand("select count(*) from tblTaxInvoicePriceListMasterBharatBenz", con);
                con.Open();
                totalRecordsCount = (int)cmd2.ExecuteScalar();
            }
            if (compValue.Trim() == "7")
            {
                SqlCommand cmd2 = new SqlCommand("select count(*) from tblTaxInvoicePriceListMasterForceMotors", con);
                con.Open();
                totalRecordsCount = (int)cmd2.ExecuteScalar();
            }
            
            SqlParameter TruckCompanyValue = new SqlParameter()
            {
                ParameterName = "@compval",
                Value = compValue
            };
            cmd.Parameters.Add(TruckCompanyValue);


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

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.umrp = rdr["umrp"].ToString();
                //listItems.product = rdr["product"].ToString();
                listItems.partno = rdr["partno"].ToString();
                listItems.partdesc = rdr["partdesc"].ToString();
               ///// listItems.purchaseprice = rdr["purchaseprice"].ToString();
                listItems.taxslab = rdr["taxslab"].ToString();
                listItems.uom = rdr["uom"].ToString();
                listItems.hsncode = rdr["hsncode"].ToString();
                listItems.purchaseprice = rdr["purchaseprice"].ToString();
                listItems.discountcode = rdr["discountcode"].ToString();

                //listItems.createdby = rdr["createdby"].ToString();
                //listItems.createdip = rdr["createdip"].ToString();
                listItems.createdon = rdr["updatedon"].ToString();
                //listItems.updatedbyid = rdr["updatedbyid"].ToString();

                listItems.createdby = rdr["updatedby"].ToString();
                //listItems.updatedip = rdr["updatedip"].ToString();

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

    ////private int GetRecordsTotalCount()
    ////{
        
    ////    int totalRecordsCount = 0;
    ////    string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
    ////    using (SqlConnection con = new SqlConnection(cs))
    ////    {
            
    ////        SqlCommand cmd = new SqlCommand("select count(*) from tblTaxInvoicePriceListMaster", con);
    ////        con.Open();
    ////        totalRecordsCount = (int)cmd.ExecuteScalar();
    ////    }
    ////    return totalRecordsCount;
    ////}
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}