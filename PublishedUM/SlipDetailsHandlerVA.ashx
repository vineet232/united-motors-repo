<%@ WebHandler Language="C#" Class="SlipDetailsHandlerVA" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class SlipDetailsHandlerVA : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<SlipDetailsFuncationsVA> listData = new List<SlipDetailsFuncationsVA>();
        int filteredCount = 0;
        string statusid = context.Request["statusid"];
        ////string locationidval = "0";
        ////try
        ////{
        ////    locationidval = Convert.ToString(context.Session["userlocation"]);
        ////}
        ////catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataSlipMasterVA", con);
            cmd.CommandType = CommandType.StoredProcedure;

            ////SqlParameter locationid = new SqlParameter()
            ////{
            ////    ParameterName = "@locationid",
            ////    Value = locationidval
            ////};
            ////cmd.Parameters.Add(locationid);

            SqlParameter statusID = new SqlParameter()
            {
                ParameterName = "@statusid",
                Value = statusid
            };
            cmd.Parameters.Add(statusID);
            
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


            /////////////For Searchparameter /////////
            /////////////For Searchparameter /////////
            string searchfieldparameters = context.Request["searchfield"];
            string searchvalueparameters = context.Request["searchvalue"];
            string searchvalueparameters2 = context.Request["searchvalue2"];

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
                string startDate = DateTime.Now.ToShortDateString();
                string endDate = DateTime.Now.ToShortDateString();

                SlipDetailsFuncationsVA listItems = new SlipDetailsFuncationsVA();

                listItems.id = Convert.ToInt32(rdr["id"]);

                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.slipno = rdr["slipno"].ToString();
                listItems.slipdate = rdr["slipdate"].ToString();
                listItems.customername = rdr["customername"].ToString();
                listItems.vehicleno = rdr["vehicleno"].ToString();
                listItems.mobileno = rdr["mobileno"].ToString();
                //listItems.paymentmodeid = rdr["paymentmodeid"].ToString();
                listItems.paymentmode = rdr["paymentmode"].ToString();
                // listItems.modelid = rdr["modelid"].ToString();
                listItems.modelname = rdr["modelname"].ToString();
                listItems.totalamount = rdr["totalamount"].ToString();
                listItems.statusid = rdr["statusid"].ToString();
                listItems.status = rdr["status"].ToString();

                listItems.createdby = rdr["createdby"].ToString();
                listItems.updatedby = rdr["updatedby"].ToString();
                listItems.createdon = rdr["createdon"].ToString();
                listItems.updatedon = rdr["updatedon"].ToString();
                listItems.isslipcancelled = rdr["isslipcancelled"].ToString();


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
                SqlCommand("select count(*) from tblSlipmasterVA", con);
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