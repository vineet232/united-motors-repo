<%@ WebHandler Language="C#" Class="masteremployeesvahandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using DBLayerFunctions;

public class masteremployeesvahandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        int displayLength = int.Parse(context.Request["iDisplayLength"]);
        int displayStart = int.Parse(context.Request["iDisplayStart"]);
        int sortCol = int.Parse(context.Request["iSortCol_0"]);
        string sortDir = context.Request["sSortDir_0"];
        string search = context.Request["sSearch"];

        string cs = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        List<MasterEmployeeFunctionsVA> listData = new List<MasterEmployeeFunctionsVA>();
        int filteredCount = 0;

        ////string locationidval = "0";
        ////try
        ////{
        ////    locationidval = Convert.ToString(context.Session["userlocation"]);
        ////}
        ////catch { }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetDataEmployeeMasterVA", con);
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

            DataSet dsLessPayments = new DataSet();
            
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                MasterEmployeeFunctionsVA listItems = new MasterEmployeeFunctionsVA();

                listItems.id = Convert.ToInt32(rdr["Id"]);
                filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                listItems.employeename = rdr["employeename"].ToString();
                listItems.designation = rdr["designation"].ToString();
                listItems.mobileno = rdr["mobileno"].ToString();
                listItems.doj = rdr["doj"].ToString();
                listItems.dob = rdr["dob"].ToString();
                listItems.aadharno = rdr["aadharno"].ToString();
                listItems.uanno = rdr["uanno"].ToString();
                listItems.esino = rdr["esino"].ToString();
                listItems.dress = rdr["dress"].ToString();
                listItems.dressdate = rdr["dressdate"].ToString();

                //////MasterEmployeeFunctions obj = new MasterEmployeeFunctions();
                DataSet dsSalary = new DataSet();
                ////obj.id = Convert.ToInt32(rdr["Id"]);
                dsSalary = MasterEmployeeFunctionsVA.GetEmployeesSalaryListByEmpID(Convert.ToInt32(rdr["Id"]));

                if (dsSalary.Tables[0].Rows.Count > 0)
                {
                    ////listItems.salary = dsSalary.Tables[0].Rows[0]["salary"].ToString().Trim();
                    if (dsSalary.Tables[0].Rows[0]["salary"].ToString().Trim() == rdr["salary"].ToString())
                    {
                        listItems.salary = dsSalary.Tables[0].Rows[0]["salary"].ToString().Trim();
                    }
                    else
                    {
                        MasterEmployeeFunctions objsal = new MasterEmployeeFunctions();
                        objsal.id = Convert.ToInt32(rdr["Id"]);
                        objsal.salary = dsSalary.Tables[0].Rows[0]["salary"].ToString().Trim();
                        int resultsal = MasterEmployeeFunctions.UpdateEmployeesSalarybyEmpID(objsal);

                        listItems.salary = dsSalary.Tables[0].Rows[0]["salary"].ToString().Trim();
                    }
                }
                else
                {
                    listItems.salary = rdr["salary"].ToString();
                }
                listItems.salaryupdatedate = rdr["salaryupdatedate"].ToString();

                if (Convert.ToString(context.Session["extraPermission"]) == "1")
                {
                    listItems.salary = listItems.salary;
                }
                else
                {
                    listItems.salary = "";
                }
                
                
                ////listItems.currentbalance = rdr["currentbalance"].ToString();

                ///////////// to get current balance //////////////

                float currentBal = 0;
                dsLessPayments = MasterEmployeeFunctionsVA.GetEmployeeRunningBalbyID(rdr["Id"].ToString());
                if (dsLessPayments.Tables[0].Rows.Count > 0)
                {
                    if (!string.IsNullOrEmpty(dsLessPayments.Tables[0].Rows[0]["RunningBalance"].ToString()))
                    {
                        foreach (DataRow dr in dsLessPayments.Tables[0].Rows)
                        {
                            currentBal += float.Parse(dr["RunningBalance"].ToString());
                        }
                    }
                }
                //// runningDiff = opBalance;


                ////listItems.currentbalance = rdr["currentbalance"].ToString();

                listItems.currentbalance = currentBal.ToString();
                
                
                listItems.attendancestatus = rdr["attendancestatus"].ToString();
                listItems.reportstatus = rdr["reportstatus"].ToString();
                listItems.emphotoname = rdr["emphotoname"].ToString();
                ////listItems.esino = rdr["esino"].ToString();
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
                SqlCommand("select count(*) from masterEmployeesva", con);
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