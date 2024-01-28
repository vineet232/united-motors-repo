<%@ WebHandler Language="C#" Class="inventorylistgrHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class inventorylistgrHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<GRInventoryListFunctions> listData = new List<GRInventoryListFunctions>();
        int filteredCount = 0;

        //string locationidval = "0";
        //try
        //{
        //    locationidval = Convert.ToString(context.Session["userlocation"]);
        //}
        //catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataForInventoryListGR", con);
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

            string cDate = DateTime.Now.ToShortDateString();
            double dueDays = 0;

            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                GRInventoryListFunctions listItems = new GRInventoryListFunctions();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.hsncode = rdr["hsncode"].ToString();
                listItems.cvbusaleprice = rdr["cvbusaleprice"].ToString();
                listItems.location1 = rdr["location1"].ToString();
                listItems.PartNo = rdr["PartNo"].ToString();

                GRInventoryFunctions obj = new GRInventoryFunctions();
                obj.partno = rdr["PartNo"].ToString().Trim();
                DataTable dtcurrentStockBalance = GRInventoryFunctions.GetInventoryStockReportwithReturnbyPartNo(obj);



                ///return JsonConvert.SerializeObject(dtcurrentStockBalance);
                ///


                //// decimal availQty = decimal.Parse(rdr["qty"].ToString());
                decimal availStock = 0;
                decimal saleQty = 0;
                string lastreceivedon = "";

                //////DataTable newTable = dtcurrentStockBalance.Copy();
                for (int i = dtcurrentStockBalance.Rows.Count - 1; i >= 0; i--)
                {
                    availStock += decimal.Parse(dtcurrentStockBalance.Rows[i]["purchaseqty"].ToString()) - decimal.Parse(dtcurrentStockBalance.Rows[i]["saleqty"].ToString());
                    /// 

                    ////saleQty += decimal.Parse(dtcurrentStockBalance.Rows[i]["saleqty"].ToString());
                    ////dtcurrentStockBalance.Rows[i]["currentStock"] = availStock.ToString();

                    lastreceivedon = dtcurrentStockBalance.Rows[i]["createdon"].ToString();
                }

                ////availStock = decimal.Parse(rdr["qty"].ToString()) - saleQty ;

                listItems.description1 = rdr["description1"].ToString();
                listItems.lastissued = rdr["lastissued"].ToString();
                listItems.lastreceived = lastreceivedon; ///// rdr["lastreceived"].ToString();
                //listItems.qty = rdr["qty"].ToString();
                // listItems.qty = rdr["qty"].ToString();

                listItems.umrp = rdr["umrp"].ToString();

                listItems.openingbal = rdr["qty"].ToString();
                
                listItems.qty = availStock.ToString();

                listItems.totalprice = rdr["totalprice"].ToString();

                listItems.createdbyid = rdr["createdbyid"].ToString();
                listItems.createdby = rdr["createdby"].ToString();
                listItems.createdon = rdr["createdon"].ToString();

                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.updatedbyid = rdr["updatedbyid"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();
                ////listItems.openingbal = rdr["openingbalance"].ToString();

                if (listItems.id == 21232)
                {
                    string id = listItems.id.ToString();
                }
                if (decimal.Parse(listItems.qty) > 0)
                {
                    dueDays = double.Parse((Math.Round(decimal.Parse(((Convert.ToDateTime(cDate) - Convert.ToDateTime(listItems.lastissued)).TotalDays + 1).ToString()), 0)).ToString());
                }
                else
                {
                    dueDays = 0;
                }
                listItems.days = dueDays.ToString();

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
                SqlCommand("select count(*) from tblInventoryListgr", con);
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