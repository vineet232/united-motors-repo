
$(document).ready(function () {
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllSalesExecutive",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlSalesExecutive").append($("<option></option>").val(value.id).html(value.Name));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });



    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetVendorsByInsuranceAccount",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlVendors").append($("<option></option>").val(value.id).html(value.vendorname));
            })
        }
        ,
        error: function (response) {
            //alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });


    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllPaymentMethodswithBank",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlCustomerPaymentMode").append($("<option></option>").val(value.paymentcode).html(value.paymentmethod));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });



////////    $.ajax({
////////        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetCustomersByInsuranceAccount",
////////        dataType: "json",
////////        contentType: "application/json",
////////        success: function (res) {
////////            $.each(res.d, function (data, value) {

////////                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.custname));
////////            })
////////        }
////////        ,
////////        error: function (response) {
////////            ///alert(response.responseText);
////////            $.notify("BOOM!", "error");
////////        }

////////    });


////////    $.ajax({
////////        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetCustomersByInsuranceAccount",
////////        dataType: "json",
////////        contentType: "application/json",
////////        success: function (res) {
////////            $.each(res.d, function (data, value) {

////////                $("#ddlPayouts").append($("<option></option>").val(value.id).html(value.custname));
////////            })
////////        }
////////        ,
////////        error: function (response) {
////////            ///alert(response.responseText);
////////            $.notify("BOOM!", "error");
////////        }

////////    });


    GetInvoiceNo();



    //    $('#txtInvoiceDate').datepicker({
    //        format: "mm/dd/yyyy",
    //        autoclose: true,
    //       
    //    });

    //    var date = new Date();
    //  var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
    //$('#txtInvoiceDate').datepicker('update', new Date(Date.parse(today)));

    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = mm + '/' + dd + '/' + yyyy;
    $('#txtInvoiceDate').val(today);


        $('#txtFromInvoiceDt').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });
        $('#txtToInvoiceDt').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });


    GetAllPayoutCustomers();
    GetAllCustomerCustomers();
})

function GetInvoiceNo() {
var invNo ="0";

    $.ajax({
        type: "POST",
        url: "salesTransactionDetailsInsurance.aspx/GetInvoiceNoByAccountTypeID",
        data: '{ accountTypeID :' + "1" + '}',
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            //var invNo = "INS-" + JSON.stringify(res.d)
            ///alert(invN);

             var myNumber=JSON.stringify(res.d);
                if(myNumber.toString().length < 2)
                {
                    invNo = "INS/22-23/000"  + JSON.stringify(res.d)
                }
                 if(myNumber.toString().length >= 2 && myNumber.toString().length < 3)
                {
                    invNo = "INS/22-23/00"  + JSON.stringify(res.d)
                }
                if(myNumber.toString().length >= 3 && myNumber.toString().length < 4)
                {
                    invNo = "INS/22-23/0"  + JSON.stringify(res.d)
                }
                if(myNumber.toString().length >= 4 && myNumber.toString().length < 5)
                {
                    invNo = "INS/22-23/"  + JSON.stringify(res.d)
                }
                 

            $("#txtInvoiceNo").val(invNo);

        }
            ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });
}
 
 function ddlPayoutAccountType_SelectedIndexChanged()
 {
     var accounttypeID = $("#ddlPayoutAccountType :selected").val();
      var accounttype = $("#ddlPayoutAccountType :selected").text();

     /////alert(accounttypeID);
     if(accounttypeID == 1)
     {
    ///alert(accounttypeID);
        $("#payoutactype").text( "Select " + accounttype + ":")        
        GetAllPayoutVendors();
     }
     if(accounttypeID == 2)
     {
     $("#payoutactype").text( "Select " + accounttype + ":")
        GetAllPayoutEmployees();
     }
     if(accounttypeID == 3)
     {
     $("#payoutactype").text( "Select " + accounttype + ":")
        GetAllPayoutCustomers();
     }
//////     if(accounttypeID == 4)
//////     {
//////     $("#paymentto").text( "Select " + accounttype + ":")
//////        GetAllBanks();
//////        //$("#divOtherBank").show();
//////     }
////     if(accounttypeID == 5)
////     {
////     $("#payoutactype").text( "Select " + accounttype + ":")
////        GetAllGeneralLedgers();
////     }
 }

 function ddlCustAccountType_SelectedIndexChanged()
 {
     var accounttypeID = $("#ddlCustomerAccountType :selected").val();
      var accounttype = $("#ddlCustomerAccountType :selected").text();

     /////alert(accounttypeID);
     if(accounttypeID == 1)
     {
    ///alert(accounttypeID);
        $("#custactype").text( "Select " + accounttype + ":")        
        GetAllCustomerVendors();
     }
     if(accounttypeID == 2)
     {
     $("#custactype").text( "Select " + accounttype + ":")
        GetAllCustomerEmployees();
     }
     if(accounttypeID == 3)
     {
     $("#custactype").text( "Select " + accounttype + ":")
        GetAllCustomerCustomers();
     }
//////     if(accounttypeID == 4)
//////     {
//////     $("#paymentto").text( "Select " + accounttype + ":")
//////        GetAllBanks();
//////        //$("#divOtherBank").show();
//////     }
////     if(accounttypeID == 5)
////     {
////     $("#custactype").text( "Select " + accounttype + ":")
////        GetAllGeneralLedgers();
////     }
 }

 function GetAllPayoutVendors()
 {
 $("#Showoverlay").show();

    $('#ddlPayouts').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();

    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPayouts").append($("<option></option>").val(value.id).html(value.vendorname));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetAllPayoutEmployees()
 {
  $('#ddlPayouts').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllEmployeesList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPayouts").append($("<option></option>").val(value.id).html(value.employeename));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetAllPayoutCustomers()
 {
 $('#ddlPayouts').find('option:not(:first)').remove();
///// $('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPayouts").append($("<option></option>").val(value.id).html(value.custname));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }



  function GetAllCustomerVendors()
 {
 $("#Showoverlay").show();

 $('#ddlCustomers').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();

    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.vendorname));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetAllCustomerEmployees()
 {
 $('#ddlCustomers').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllEmployeesList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.employeename));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetAllCustomerCustomers()
 {
 $('#ddlCustomers').find('option:not(:first)').remove();
///// $('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.custname));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }



 function ddlCustomerPaymentMode_SelectedIndexChanged()
 {
    var custpaymentmodeid = $("#ddlCustomerPaymentMode :selected").val();
    var custpaymentmode = $("#ddlCustomerPaymentMode :selected").text();

    if(custpaymentmodeid >= 50)
    {
    GetAllBanks();
     $("#divBank").show();
       
    }
    else
    {
         $("#divBank").hide();
    }
 }
 
 function GetAllBanks()
 {
  
  $('#ddlPaymentToBank').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllBanksList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                 $("#ddlPaymentToBank").append($("<option></option>").val(value.id).html(value.bankname));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

//// function ddlAccountType_OnChange()
//// {
////     var accounttypeID = $("#ddlAccountType").val();

////     GetVendorsByAccountTypeID(accounttypeID);
////     GetCustomersByAccountTypeID(accounttypeID);
////     GetInvoiceNo(accounttypeID);
//// }

//// function GetInvoiceNo(accounttypeid) {

////     var accounttype = $("#ddlAccountType :selected").text();
////     $("#Showoverlay").show();
////     $.ajax({
////         type: "POST",
////         url: "salesTransactionDetailsInsurance.aspx/GetInvoiceNoByAccountTypeID",
////         data: '{ accountTypeID :' + accounttypeid + '}',
////         dataType: "json",
////         contentType: "application/json",
////         success: function (res) {
////             var invNo = accounttype.substring(0, 4).toUpperCase() +"-" + JSON.stringify(res.d)
////             ///alert(invN);
////             $("#txtInvoiceNo").val(invNo);

////         }
////        ,
////         error: function (response) {
////             ///alert(response.responseText);
////             $.notify("BOOM!", "error");
////         }

////     });
////     $("#Showoverlay").hide();
//// }

//// function GetVendorsByAccountTypeID(accounttypeid) {
////    
////     $("#Showoverlay").show();
////     $.ajax({
////         type: "POST",
////         url: "salesTransactionDetailsInsurance.aspx/GetVendorsByAccountTypeID",
////         data: '{ accountTypeID :' + accounttypeid + '}',
////         dataType: "json",
////         contentType: "application/json",
////         success: function (res) {
////             $("#ddlVendors").empty();
////             $.each(res.d, function (data, value) {

////                 $("#ddlVendors").append($("<option></option>").val(value.id).html(value.vendorname));
////             })
////         }
////        ,
////         error: function (response) {
////             ///alert(response.responseText);
////             $.notify("BOOM!", "error");
////         }

////     });

//////////     $("#ddlVendors option").each(function () {
//////////         // Add $(this).val() to your list
//////////         alert("1");
//////////     });

////     $("#Showoverlay").hide();
//// }

//// function GetCustomersByAccountTypeID(accounttypeid) {

////     $("#Showoverlay").show();
////     $.ajax({
////         type: "POST",
////         url: "salesTransactionDetailsInsurance.aspx/GetCustomersByAccountTypeID",
////         data: '{ accountTypeID :' + accounttypeid + '}',
////         dataType: "json",
////         contentType: "application/json",
////         success: function (res) {

////             $("#ddlCustomers").empty();
////             $.each(res.d, function (data, value) {

////                 $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.custname));
////             })
////         }
////        ,
////         error: function (response) {
////             ///alert(response.responseText);
////             $.notify("BOOM!", "error");
////         }

////     });

////////     $("#ddlCustomers option").each(function () {
////////         // Add $(this).val() to your list
////////         alert($(this).text());
////////     });

////     $("#Showoverlay").hide();
//// }

 


$(function () {
    ////$("#Showoverlay").show();
    BindDataTable();
});


function BindDataTable() {


 $("#tblRecords").dataTable().fnDestroy();

 var fromDt = $("#txtFromInvoiceDt").val();
     var toDt = $("#txtToInvoiceDt").val();

     var frominvno = $("#txtInvoiceFrom").val();
     var toinvno = $("#txtInvoiceTo").val();





 var i = 1;

            $('#tblRecords').DataTable({
                "order": [[2, 'desc']],
               
             bServerSide: true,
             sAjaxSource: 'SaleTransactionInsuranceDetailsHandler.ashx/GetSaleTransactionDetailsData?frominvdt=' + fromDt +'&toinvdt='+ toDt +'&frominvno='+ frominvno+'&toinvno='+ toinvno,
                sServerMethod: 'post',
                "processing": true,
                "columns": [
                 { "data": "id" ,
//                {
//      "render": function(data, type, full, meta) {
//        return i++;
//      }},


"render": function (data, type, row, meta) {
        return meta.row + meta.settings._iDisplayStart + 1;
        }
        },


////                    { "data": "accounttype" },
                    { "data": "invoicedt" },
                    { "data": "invoiceno" },
                    { "data": "vehchasisno",
                        render: function ( data, type, row )
                        {
                          return "<div class='text-nowrap'>" + row.vehchasisno + '<br/> <p style=color:red;"> ' + row.vehcustomername + '</p>' + "</div>";
                        }
                     },
                    { "data": "salesexecutive" },
                    { "data": "vendorname" },
                    { "data": "venpaymentamt"
                        ,
                    render: function ( data, type, row )
                        {
                     return  " <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.venpaymentamt;
                     }
                     },
                    { "data": "payout"
                        ,
                        render: function ( data, type, row )
                        {
                          return "<div class=''>" + row.payout + '<br/> <p style=color:red;"> (' + row.payoutaccounttype + ')</p>' + "</div>";
                        }

                     },
                    { "data": "payoutpaymentamt"
                        ,
                    render: function ( data, type, row )
                        {
                     return  " <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.payoutpaymentamt;
                     }
                     },
                    { "data": "customername" 
                         ,
                        render: function ( data, type, row )
                        {
                          return "<div >" + row.customername + '<br/> <p style=color:red;"> (' + row.customeraccounttype + ')</p>' + "</div>";  
//                          class='text-nowrap'
                        }
                    },
                    { "data": "custpaymentmode",
                    
                    render: function ( data, type, row )
                        {
                       ////// alert(row.custpaymentmodeid);
                          ////if(row.custpaymentmodeid == "3" || row.custpaymentmodeid == "4" || row.custpaymentmodeid == "5")
                            if (row.custpaymentmodeid >= 50)
                          {
                         /////return "<div class='text-nowrap'>" + row.custpaymentmode +  "</div>";
                           return "<div class=''>" + row.custpaymentmode + '<br/> <p style="font-size:x-small;"> (' + row.custpaymenttobank + ')  </p>' + "</div>";
                         }
                         else
                         {
                          return "<div class=''>" + row.custpaymentmode +  "</div>";
                         }

                        }

                     },
                    { "data": "custpaymentamt"
                        ,
                    render: function ( data, type, row )
                        {
                     return  " <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.custpaymentamt;
                     }
                     },
                    { "data": "ocreatedby",
                        render: function ( data, type, row )
                        {
//                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
//                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')
                       
                        var cdate =  moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate =  moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')

                         return "<div class=''>" + row.ocreatedby + '<br/> <p style="font-size:x-small;"> (' + cdate + ')  </p>' + row.oupdatedby + '<br/> <p style="font-size:x-small;"> (' + udate + ') </p>' + "</div>";
                        }
                     },
                   {
                       "data": "id",
                       "render": function (id, type, full, meta) {
                           //debugger
                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
                       }
                   },
                    {
                        "data": "invoiceno",
//                        "render": function (id, type, full, meta) {
//                            //debugger
//                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
//                        }

                        "render": function ( data, type, row )
                        {
                             return '<a href="#" onclick="DeleteRecord(\'' + row.invoiceno +  '\'\)"> <i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i> </a>';
                        }
                    }
                  
                    
                ],
                 "columnDefs": [
                                { "visible": false, "targets": [] }
                              ],

                 responsive: true,
                 stateSave: true,
                 "bDestroy": true
            });


 }

function btnResetSearch() {
 
  
     $("#txtFromInvoiceDt").val("");
     $("#txtToInvoiceDt").val("");
     $("#txtInvoiceFrom").val("");
     $("#txtInvoiceTo").val("");
     BindDataTable();
 }

 function ShowFilteredData()
 {
     var fromDt = $("#txtFromInvoiceDt").val();
     var toDt = $("#txtToInvoiceDt").val();

     var frominvno = $("#txtInvoiceFrom").val();
     var toinvno = $("#txtInvoiceTo").val();

    if((fromDt != "" && toDt !="" ) || (frominvno != "" && toinvno != ""))
    {
        BindDataTable();
    }
    else
    {
         $.notify("Error!! Please enter search criteria!", "error");
         fromDt.focus();
         return;
    }
}


function sentenceCase(str) {
    if ((str === null) || (str === ''))
        return false;
    else
        str = str.toString();

    return str.replace(/\w\S*/g, function (txt) {
        return txt.charAt(0).toUpperCase() +
       txt.substr(1).toLowerCase();
    });
}



function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }



    ////var id = table.rows()[0].length + 1;
   ///// alert("1");

    var accounttypeid = "1";
    var accounttype = "Insurance";
    var invoicedt = $('[id*=txtInvoiceDate]').val();
    var invoiceno = $('[id*=txtInvoiceNo]').val();
    var discount = $('[id*=txtDiscount]').val();
    var vehchasisno = $('[id*=txtVehicleChasisNo]').val();
    var salesexecutiveid = $("#ddlSalesExecutive :selected").val();
    var salesexecutive = $("#ddlSalesExecutive :selected").text();

    var vendorid = $("#ddlVendors :selected").val();
    var vendorname = $("#ddlVendors :selected").text();
    var venpaymentmodeid = $("#ddlVendorPaymentMode :selected").val();
    var venpaymentmode = $("#ddlVendorPaymentMode :selected").text();
    var venpaymentamt = $('[id*=txtVendorAmount]').val();

    var payoutid = $("#ddlPayouts :selected").val();
    var payout = $("#ddlPayouts :selected").text();
    var payoutpaymentmodeid = $("#ddlPayoutPaymentMode :selected").val();
    var payoutpaymentmode = $("#ddlPayoutPaymentMode :selected").text();
    var payoutpaymentamt = $('[id*=txtPayoutAmount]').val();

    var customerid = $("#ddlCustomers :selected").val();
    var customername = $("#ddlCustomers :selected").text();
    var custpaymentmodeid = $("#ddlCustomerPaymentMode :selected").val();
    var custpaymentmode = $("#ddlCustomerPaymentMode :selected").text();
    var custpaymentamt = $('[id*=txtCustomerAmount]').val();

    var custpaymenttobankid= $('#ddlPaymentToBank :selected').val();
     var custpaymenttobank= $('#ddlPaymentToBank :selected').text();

     var payoutaccounttypeid = $('#ddlPayoutAccountType :selected').val();
    var payoutaccounttype =  $('#ddlPayoutAccountType :selected').text();

     var customeraccounttypeid = $("#ddlCustomerAccountType :selected").val();
    var customeraccounttype = $("#ddlCustomerAccountType :selected").text();

   

   // name = sentenceCase(name);
    var model = {};
    model.accounttypeid = accounttypeid;
    model.accounttype = accounttype;
    model.invoicedt = invoicedt;
    model.invoiceno = invoiceno;
    model.discount = discount;
    model.vehchasisno = vehchasisno;
    model.salesexecutiveid = salesexecutiveid;
    model.salesexecutive = salesexecutive;
    model.vendorid = vendorid;
    model.vendorname = vendorname;
    model.venpaymentmodeid = venpaymentmodeid;
    model.venpaymentmode = venpaymentmode;   
   
     model.venpaymentamt = venpaymentamt;
    model.payoutaccounttypeid=payoutaccounttypeid;
    model.payoutaccounttype=payoutaccounttype;
    model.payoutid = payoutid;
    model.payout = payout;
    model.payoutpaymentmodeid = payoutpaymentmodeid;
    model.payoutpaymentmode = payoutpaymentmode;
    model.payoutpaymentamt = payoutpaymentamt;
     model.customeraccounttypeid = customeraccounttypeid;
    model.customeraccounttype = customeraccounttype;
    model.customerid = customerid;
    model.customername = customername;
    model.custpaymentmodeid = custpaymentmodeid;
    model.custpaymentmode = custpaymentmode;
    model.custpaymentamt = custpaymentamt;
    model.custpaymenttobankid=custpaymenttobankid;
    model.custpaymenttobank=custpaymenttobank;
   
   ////////alert(custpaymenttobankid + "-" + custpaymenttobank);
  
    $.ajax({
        type: "POST",
        url: "salesTransactionDetailsInsurance.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            //alert(r.d);
            //return;
            if (r.d.toLowerCase() != "record saved!") {
                $.notify(r.d, "error");
               ///////// $('[id*=txtMobile]').focus();
            }
            else {
                $('#myModal').modal('hide');
                $('#recordID').val("0");
                $.notify(r.d, "success");
                clearTextBox();
                BindDataTable();
            }
            //////$.notify("Record saved!", "success");


            ////////            if (r.d == 0) {
            ////////                $.notify("Error!! Record not saved!", "error");
            ////////                $('[id*=txtMobile]').focus();
            ////////                return;
            ////////            }
            ////////            if (r.d == 10) {
            ////////                $.notify("Error!! You do not have permission to add record!", "error");
            ////////                return;
            ////////            }
            ////////            else {
            ////////                if (r.d == 20 || r.d == 30 || r.d == 50) {
            ////////                    if (r.d == 20) {
            ////////                        $.notify("Error!! invoice no already exists!", "error");
            ////////                        return;
            ////////                    }
            ////////                    if (r.d == 30) {
            ////////                        $.notify("Error!! required fields cannot be blank!", "error");
            ////////                        $('[id*=txtName]').focus();
            ////////                        return;
            ////////                    }
            ////////                    if (r.d == 50) {
            ////////                        $.notify("Error!! invalid mobile no!", "error");
            ////////                        $('[id*=txtMobile]').focus();
            ////////                        return;
            ////////                    }
            ////////                }
            ////////                else {
            ////////                    $('#myModal').modal('hide');
            ////////                    $('#recordID').val("0");

            ////////                    BindDataTable();
            ////////                    $.notify("Record saved!", "success");
            ////////                }
            ////////            }
        }
            ,
        error: function (errormessage) {
            ///////alert(errormessage.responseText);
            if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                //alert("Error!! model name already exists!!");
                $.notify("Error!! model name already exists!", "error");
            }
            else {
                //alert("Error while saving data!!");
                $.notify("Error while saving data!", "error");
            }
        }
    });
}


function EditRecordbyID(id) {
    ////alert(id);

    $('#recordID').val("0");
    $('#recordOldVehNo').val("0");
    $('#recordOldSalesExID').val("0");
    $('#recordOldSalesExName').val("0");
    $('#recordOldVenID').val("0");
    $('#recordOldVenName').val("0");
    $('#recordOldVenPaymentModeID').val("0");
    $('#recordOldVendorPaymentMode').val("0");
    $('#recordTestVenPaymentMode').val("0");
    $('#recordOldVenAmt').val("0");
    $('#recordOldPayoutID').val("0");
    $('#recordOldPayoutName').val("0");
    $('#recordOldPayoutPaymentModeID').val("0");
    $('#recordPayoutPaymentModeOld').val("0");
    $('#recordOldPayoutAmt').val("0");
    $('#recordOldCustID').val("0");
    $('#recordOldCustName').val("0");
    $('#recordOldCustPaymentModeID').val("0");
    $('#recordCustPaymentModeOld').val("0");
    $('#recordOldCustAmt').val("0");
    $('#recordSaleTrnTypeID').val("0");
    
     $('#recordCustoldBnkID').val("0");
    $('#recordCustoldBankName').val("0");

    
     $('#recordpayoutaccounttypeid').val("0");
    $('#recordcustaccounttypeid').val("0");
    

    $.ajax({
        type: "POST",
        url: "salesTransactionDetailsInsurance.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to add record!", "error");
            }
            else {
                var json = JSON.parse(result.d);

                ////                GetVendorsByAccountTypeID(json[0].accounttypeid);
                ////                GetCustomersByAccountTypeID(json[0].accounttypeid);



                ///// alert(result.d);
                $('#recordID').val(json[0].id);
                $('#recordOldVehNo').val(json[0].vehchasisno);
                $('#recordOldSalesExID').val(json[0].salesexecutiveid);
                $('#recordOldSalesExName').val(json[0].salesexecutive);
                $('#recordOldVenID').val(json[0].vendorid);
                $('#recordOldVenName').val(json[0].vendorname);
                $('#recordOldVenPaymentModeID').val(json[0].venpaymentmodeid);
                $('#recordOldVendorPaymentMode').val(json[0].venpaymentmode);

                $('#recordSaleTrnTypeID').val(json[0].saletransactiontypeid);


                $('#recordOldVenAmt').val(json[0].venpaymentamt);
                $('#recordOldPayoutID').val(json[0].payoutid);
                $('#recordOldPayoutName').val(json[0].payout);
                $('#recordOldPayoutPaymentModeID').val(json[0].payoutpaymentmodeid);
                $('#recordPayoutPaymentModeOld').val(json[0].payoutpaymentmode);
                $('#recordOldPayoutAmt').val(json[0].payoutpaymentamt);
                $('#recordOldCustID').val(json[0].customerid);
                $('#recordOldCustName').val(json[0].customername);
                $('#recordOldCustPaymentModeID').val(json[0].custpaymentmodeid);
                $('#recordCustPaymentModeOld').val(json[0].custpaymentmode);
                $('#recordOldCustAmt').val(json[0].custpaymentamt);

                $('#recordCustoldBnkID').val(json[0].custpaymenttobankid);
                $('#recordCustoldBankName').val(json[0].custpaymenttobank);
               
                  $('#recordpayoutaccounttypeid').val(json[0].payoutaccounttypeid);
                $('#recordcustaccounttypeid').val(json[0].customeraccounttypeid);

////                alert($('[id*=recordPayoutPaymentModeOld]').val());
////                alert($('[id*=recordCustPaymentModeOld]').val());

                ///var mydate = new Date(json[0].duedate.substring(0, 10));
                var invoicedt = new Date(json[0].invoicedt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
               
                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
                $('#txtInvoiceDate').val(invoicedt);
                $('#txtInvoiceNo').val(json[0].invoiceno);
                $('#txtDiscount ').val(json[0].discount);
                $('#txtVehicleChasisNo').val(json[0].vehchasisno);
                $("#ddlSalesExecutive").val(json[0].salesexecutiveid);

                $("#ddlVendors").val(json[0].vendorid);
                // $("#ddlVendorPaymentMode").val(json[0].venpaymentmodeid);
                $('#txtVendorAmount').val(json[0].venpaymentamt);

                $("#ddlPayouts").val(json[0].payoutid);
                $("#ddlPayoutPaymentMode").val(json[0].payoutpaymentmodeid);
                $('#txtPayoutAmount').val(json[0].payoutpaymentamt);

                $("#ddlCustomers").val(json[0].customerid);
                $("#ddlCustomerPaymentMode").val(json[0].custpaymentmodeid);
                $('#txtCustomerAmount').val(json[0].custpaymentamt);

                 $("#ddlPaymentToBank").val(json[0].custpaymenttobankid);

                

                  $("#ddlPayoutAccountType").val(json[0].payoutaccounttypeid);
                    $("#recordpayoutactypename").val(json[0].payoutaccounttype);
                $("#ddlCustomerAccountType").val(json[0].customeraccounttypeid);
                 $("#recordcustactypename").val(json[0].customeraccounttype);

                 if(json[0].payoutaccounttypeid=="1")
                 {
                    GetAllSelectedPayoutVendors(json[0].payoutid);
                 }
                 if(json[0].payoutaccounttypeid=="2")
                 {
                    GetAllSelectedPayoutEmployees(json[0].payoutid);
                 }
                 if(json[0].payoutaccounttypeid=="3")
                 {
                    GetAllSelectedPayoutCustomers(json[0].payoutid);
                 }

                 if(json[0].customeraccounttypeid=="1")
                 {
                    GetAllSelectedCustomerVendors(json[0].customerid);
                 }
                 if(json[0].customeraccounttypeid=="2")
                 {
                    GetAllSelectedCustomerEmployees(json[0].customerid);
                 }
                 if(json[0].customeraccounttypeid=="3")
                 {
                    GetAllSelectedCustomerCustomers(json[0].customerid);
                 }


                 

                 ////if(json[0].custpaymentmodeid == "3" || json[0].custpaymentmodeid == "4" || json[0].custpaymentmodeid == "5")
                if (json[0].custpaymentmodeid >= 50)
                 {
                 /////alert(json[0].custpaymenttobankid);
                    GetSelectedBanks(json[0].custpaymenttobankid);
                    $("#divBank").show();
                 }
                 else
                 {
                     $("#divBank").hide();
                 }


                $('#myModal').modal('show');
                $('#myModal').on('shown.bs.modal', function () {
                    $('#txtName').focus();
                });
                $('#btnUpdate').show();
                $('#btnAdd').hide();
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });
}

function GetSelectedBanks(bankid)
{
/////alert("bnk" + bankid);
    $('#ddlPaymentToBank').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllBanksList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentToBank").append($("<option></option>").val(value.id).html(value.bankname));
            })
             $('#ddlPaymentToBank').val(bankid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
}


function GetAllSelectedPayoutVendors(venid)
 {
 
 $("#Showoverlay").show();

    $('#ddlPayouts').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();

    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPayouts").append($("<option></option>").val(value.id).html(value.vendorname));
            })
             $('#ddlPayouts').val(venid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetAllSelectedPayoutEmployees(empid)
 {
  $('#ddlPayouts').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllEmployeesList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPayouts").append($("<option></option>").val(value.id).html(value.employeename));
            })
             $('#ddlPayouts').val(empid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetAllSelectedPayoutCustomers(custid)
 {
 $('#ddlPayouts').find('option:not(:first)').remove();
///// $('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPayouts").append($("<option></option>").val(value.id).html(value.custname));
            })
             $('#ddlPayouts').val(custid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }



  function GetAllSelectedCustomerVendors(venid)
 {
 $("#Showoverlay").show();

 $('#ddlCustomers').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();

    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.vendorname));
            })
             $('#ddlCustomers').val(venid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetAllSelectedCustomerEmployees(empid)
 {
 $('#ddlCustomers').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllEmployeesList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.employeename));
            })
             $('#ddlCustomers').val(empid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetAllSelectedCustomerCustomers(custid)
 {
 $('#ddlCustomers').find('option:not(:first)').remove();
///// $('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "salesTransactionDetailsInsurance.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.custname));
            })
             $('#ddlCustomers').val(custid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }


//function for updating record
function UpdateRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var id = $('[id*=recordID]').val();
    /////alert(id);

    

    var accounttypeid = "1";
    var accounttype = "Insurance";
    var invoicedt = $('[id*=txtInvoiceDate]').val();
    var invoiceno = $('[id*=txtInvoiceNo]').val();
    var discount = $('[id*=txtDiscount]').val();
    var vehchasisno = $('[id*=txtVehicleChasisNo]').val();
    var salesexecutiveid = $("#ddlSalesExecutive :selected").val();
    var salesexecutive = $("#ddlSalesExecutive :selected").text();

    var vendorid = $("#ddlVendors :selected").val();
    var vendorname = $("#ddlVendors :selected").text();
    var venpaymentmodeid = $("#ddlVendorPaymentMode :selected").val();
    var venpaymentmode = $("#ddlVendorPaymentMode :selected").text();
    var venpaymentamt = $('[id*=txtVendorAmount]').val();

    var payoutid = $("#ddlPayouts :selected").val();
    var payout = $("#ddlPayouts :selected").text();
    var payoutpaymentmodeid = $("#ddlPayoutPaymentMode :selected").val();
    var payoutpaymentmode = $("#ddlPayoutPaymentMode :selected").text();
    var payoutpaymentamt = $('[id*=txtPayoutAmount]').val();

    var customerid = $("#ddlCustomers :selected").val();
    var customername = $("#ddlCustomers :selected").text();
    var custpaymentmodeid = $("#ddlCustomerPaymentMode :selected").val();
    var custpaymentmode = $("#ddlCustomerPaymentMode :selected").text();
    var custpaymentamt = $('[id*=txtCustomerAmount]').val();
    var custpaymenttobankid= $('#ddlPaymentToBank :selected').val();
     var custpaymenttobank= $('#ddlPaymentToBank :selected').text();

    var oldvehchasisno = $('[id*=recordOldVehNo]').val();
    var oldsalesexecutiveid = $('[id*=recordOldSalesExID]').val();
    var oldsalesexecutive = $('[id*=recordOldSalesExName]').val();
    var oldvendorid = $('[id*=recordOldVenID]').val();
    var oldvendorname = $('[id*=recordOldVenName]').val();
    var oldvenpaymentmodeid = $('[id*=recordOldVenPaymentModeID]').val();
    var oldvenpaymentmode = $('[id*=recordOldVendorPaymentMode]').val();
    var oldvenpaymentamt = $('[id*=recordOldVenAmt]').val();
    
    var saletransactiontypeid = $('[id*=recordSaleTrnTypeID]').val();
    

    var oldpayoutid = $('[id*=recordOldPayoutID]').val();
    var oldpayout = $('[id*=recordOldPayoutName]').val();
    var oldpayoutpaymentmodeid = $('[id*=recordOldPayoutPaymentModeID]').val();
    var oldpayoutpaymentmode = $('[id*=recordPayoutPaymentModeOld]').val();
    var oldpayoutpaymentamt = $('[id*=recordOldPayoutAmt]').val();
    var oldcustomerid = $('[id*=recordOldCustID]').val();
    var oldcustomername = $('[id*=recordOldCustName]').val();
    var oldcustpaymentmodeid = $('[id*=recordOldCustPaymentModeID]').val();
    var oldcustpaymentmode = $('[id*=recordCustPaymentModeOld]').val();
    var oldcustpaymentamt = $('[id*=recordOldCustAmt]').val();
    var oldcustpaymenttobankid = $('[id*=recordCustoldBnkID]').val();
    var oldcustpaymenttobank = $('[id*=recordCustoldBankName]').val();

     var payoutaccounttypeid = $('#ddlPayoutAccountType :selected').val();
    var payoutaccounttype =  $('#ddlPayoutAccountType :selected').text();

     var customeraccounttypeid = $("#ddlCustomerAccountType :selected").val();
    var customeraccounttype = $("#ddlCustomerAccountType :selected").text();

    

    var oldpayoutaccounttypeid = $('[id*=recordpayoutaccounttypeid]').val();
     var oldpayoutaccounttype = $('[id*=recordpayoutactypename]').val();
    var oldcustomeraccounttypeid = $('[id*=recordcustaccounttypeid]').val();
     var oldcustomeraccounttype = $('[id*=recordcustactypename]').val();

     
    
   

    ////alert($('#recordCustoldBankName').val());

    ////alert( recordCustoldBankName);
    ////name = sentenceCase(name);
    if (id > 0) {
        ////alert(id);
        var model = {};
        model.id = id;
        model.accounttypeid = accounttypeid;
        model.accounttype = accounttype;
        model.invoicedt = invoicedt;
        model.invoiceno = invoiceno;
        model.discount = discount;
        model.vehchasisno = vehchasisno;
        model.salesexecutiveid = salesexecutiveid;
        model.salesexecutive = salesexecutive;
        model.vendorid = vendorid;
        model.vendorname = vendorname;
        model.venpaymentmodeid = venpaymentmodeid;
        model.venpaymentmode = venpaymentmode;
        model.venpaymentamt = venpaymentamt;
        model.payoutid = payoutid;
        model.payout = payout;
        model.payoutpaymentmodeid = payoutpaymentmodeid;
        model.payoutpaymentmode = payoutpaymentmode;
        model.payoutpaymentamt = payoutpaymentamt;
        model.customerid = customerid;
        model.customername = customername;
        model.custpaymentmodeid = custpaymentmodeid;
        model.custpaymentmode = custpaymentmode;
        model.custpaymentamt = custpaymentamt;
        model.custpaymenttobankid=custpaymenttobankid;
        model.custpaymenttobank=custpaymenttobank;

        

        model.payoutaccounttypeid=payoutaccounttypeid;
        model.payoutaccounttype=payoutaccounttype;
        model.customeraccounttypeid = customeraccounttypeid;
        model.customeraccounttype = customeraccounttype;


        model.oldvehchasisno = oldvehchasisno;
        model.oldsalesexecutiveid = oldsalesexecutiveid;
        model.oldsalesexecutive = oldsalesexecutive;
        model.oldvendorid = oldvendorid;
        model.oldvendorname = oldvendorname;
        model.oldvenpaymentmodeid = oldvenpaymentmodeid;
        model.oldvenpaymentmode = oldvenpaymentmode;
        model.oldvenpaymentamt = oldvenpaymentamt;
        model.oldpayoutid = oldpayoutid;
        model.oldpayout = oldpayout;
        model.oldpayoutpaymentmodeid = oldpayoutpaymentmodeid;
        model.oldpayoutpaymentmode = oldpayoutpaymentmode;
        model.oldpayoutpaymentamt = oldpayoutpaymentamt;
        model.oldcustomerid = oldcustomerid;
        model.oldcustomername = oldcustomername;
        model.oldcustpaymentmodeid = oldcustpaymentmodeid;
        model.oldcustpaymentmode = oldcustpaymentmode;
        model.oldcustpaymentamt = oldcustpaymentamt;
       model.saletransactiontypeid=saletransactiontypeid;
        model.oldcustpaymenttobankid = oldcustpaymenttobankid;
        model.oldcustpaymenttobank  = oldcustpaymenttobank;
        
       

        model.oldpayoutaccounttypeid= oldpayoutaccounttypeid;
        model.oldpayoutaccounttype= oldpayoutaccounttype;
        model.oldcustomeraccounttypeid = oldcustomeraccounttypeid;
        model.oldcustomeraccounttype = oldcustomeraccounttype;

        //////alert(oldcustomeraccounttypeid + "," + oldcustmeraccounttype);

        //alert(JSON.stringify(model));
        $.ajax({
            type: "POST",
            url: "salesTransactionDetailsInsurance.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
////            if (r.d == 0) {
////                $.notify("Error!! Record not updated!", "error");
////                $('[id*=txtMobile]').focus();
////                return;
////            }
////                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50) {
////                    if (r.d == 10) {
////                        $.notify("Error!! You do not have permission to add record!", "error");
////                    }
////                    if (r.d == 20) {
////                        $.notify("Error!! veh./chasis no already exists!", "error");
////                        return;
////                    }
////                    if (r.d == 30) {
////                        $.notify("Error!! required fields cannot be blank!", "error");
////                        return;
////                    }
////                   if (r.d == 50) {
////                        $.notify("Error!! invalid mobile no!", "error");
////                        $('[id*=txtMobile]').focus();
////                        return;
////                    }
////                }
////                else {
////                    $('#recordID').val('0');
////                    $('#myModal').modal('hide');
////                    $('#btnUpdate').hide();
////                    $('#btnAdd').hide();
////                    $("#lblMessage").html("");
////                    $("#postedFile").val('');
////                    BindDataTable();
////                    $.notify("Record updated!", "success");
                ////                }

                if (r.d.toLowerCase() != "record saved!") {
                    $.notify(r.d, "error");
                    $('[id*=txtMobile]').focus();
                }
                else {
                    $('#myModal').modal('hide');
                    $('#recordID').val("0");
                    ////$.notify(r.d, "success");
                    $.notify("Record updated!", "success");
                    clearTextBox();
                    BindDataTable();

                    $('#recordID').val("0");
                    $('#recordOldVehNo').val("0");
                    $('#recordOldSalesExID').val("0");
                    $('#recordOldSalesExName').val("0");
                    $('#recordOldVenID').val("0");
                    $('#recordOldVenName').val("0");
                    $('#recordOldVenPaymentModeID').val("0");
                    $('#recordOldVendorPaymentMode').val("0");
                    $('#recordTestVenPaymentMode').val("0");
                    $('#recordOldVenAmt').val("0");
                    $('#recordOldPayoutID').val("0");
                    $('#recordOldPayoutName').val("0");
                    $('#recordOldPayoutPaymentModeID').val("0");
                    $('#recordPayoutPaymentModeOld').val("0");
                    $('#recordOldPayoutAmt').val("0");
                    $('#recordOldCustID').val("0");
                    $('#recordOldCustName').val("0");
                    $('#recordOldCustPaymentModeID').val("0");
                    $('#recordCustPaymentModeOld').val("0");
                    $('#recordOldCustAmt').val("0");
                    $('#recordCustoldBnkID').val("0");
                    $('#recordCustoldBankName').val("0");
                    $('#recordSaleTrnTypeID').val("0");

                    $('#recordpayoutaccounttypeid').val("0");
                    $('#recordpayoutactypename').val("0");
                    $('#recordcustaccounttypeid').val("0");
                    $('#recordcustactypename').val("0");
                }

            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! record already exists!", "error");
                }
                else {
                    //alert("Error while saving data!!");
                    $.notify("Error while updating data!", "error");
                }
            }
        });
    }
    else {
        alert("invalid id!!");
        return;
    }
}

function DeleteRecord(id) {

    if (confirm('Are you sure delete this record?')) {
////        var data = table.row($(this).parents('tr')).data();
////        table.row($(this).parents('tr')).remove().draw();

  var model = {};
    model.invoiceno = id;
    

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "salesTransactionDetailsInsurance.aspx/DeleteRecord",
            ///data: '{ invoiceno :' + id + '}',
             data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not deleted!", "error");
                $('[id*=txtMobile]').focus();
                return;
            }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    BindDataTable();
                    $.notify("Record deleted!", "success");
                }
            },
            error: function (errormessage) {
                $.notify("Error while deleting data!", "error");
            }

        });
        $("#Showoverlay").hide();
    }
}


//Function for clearing the textboxes  
function clearTextBox() {

 $('#recordID').val('0');
 GetInvoiceNo();
 $('#txtVehicleChasisNo').val("");
 //////alert("add1");
 $('#ddlSalesExecutive').prop("selectedIndex", 0);
 //////$('#ddlVendors').prop("selectedIndex", 0);

 $("#ddlVendors").select2("val", "0");


 $('#ddlPayouts').select2("val", "0");
 $('#ddlCustomers').select2("val", "0");
 $('#ddlCustomerPaymentMode').prop("selectedIndex", 0);
 $('#ddlPaymentToBank').prop("selectedIndex", 0);


// 
//   //// $('#ddlPayoutAccountType').prop("selectedIndex", 3);
//   ////  $('#ddlCustomerAccountType').prop("selectedIndex", 3);
//   alert("add2");
 $('#txtVendorAmount').val("");
 $('#txtPayoutAmount').val("");
 $('#txtCustomerAmount').val("");
       

    $('#btnUpdate').hide();
    $('#btnAdd').show();
//    alert("add3");
//    $('#txtVehicleChasisNo').css('border-color', 'lightgrey');
//    $('#txtVendorAmount').css('border-color', 'lightgrey');
//    $('#txtPayoutAmount').css('border-color', 'lightgrey');
//    $('#txtCustomerAmount').css('border-color', 'lightgrey');

//    $('#ddlSalesExecutive').css('border-color', 'lightgrey');
//    $('#ddlVendors').css('border-color', 'lightgrey');
//    $('#ddlPayouts').css('border-color', 'lightgrey');
//    $('#ddlCustomers').css('border-color', 'lightgrey');
//    $('#ddlCustomerPaymentMode').css('border-color', 'lightgrey');
//    $("#divBank").hide();

////    $('#myModal').modal('show');
////    $('#myModal').on('shown.bs.modal', function () {
////        $('#txtVehicleChasisNo').focus();
////    });

}
//Valdidation using jquery  
function validate() {
    var isValid = true;
    ///alert("1");
    if ($('#ddlSalesExecutive :selected').val().trim() == "0") {
        $('#ddlSalesExecutive').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlSalesExecutive').css('border-color', 'lightgrey');
    }
    //alert("2");
    if ($('#txtInvoiceDate').val().trim() == "") {
        $('#txtInvoiceDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtInvoiceDate').css('border-color', 'lightgrey');
    }
    ///alert("3");
    if ($('#ddlVendors :selected').val().trim() == "0") {
        $('#ddlVendors').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlVendors').css('border-color', 'lightgrey');
    }
    //alert("4");

    if ($('#ddlPayouts :selected').val().trim() == "0") {
        $('#ddlPayouts').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlPayouts').css('border-color', 'lightgrey');
    }
    ////alert("5");
    if ($('#ddlCustomers :selected').val().trim() == "0") {
        $('#ddlCustomers').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlCustomers').css('border-color', 'lightgrey');
    }
   //////// alert("6");

    if ($('#txtInvoiceNo').val().trim() == "") {
        $('#txtInvoiceNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtInvoiceNo').css('border-color', 'lightgrey');
    }
    ////////alert("7");
    if ($('#ddlVendorPaymentMode :selected').val().trim() == "0") {
        $('#ddlVendorPaymentMode').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlVendorPaymentMode').css('border-color', 'lightgrey');
    }
    ////////alert("8");
    if ($('#ddlPayoutPaymentMode :selected').val().trim() == "0") {
        $('#ddlPayoutPaymentMode').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlPayoutPaymentMode').css('border-color', 'lightgrey');
    }
    /////alert("9");
    if ($('#ddlCustomerPaymentMode :selected').val().trim() == "0") {
        $('#ddlCustomerPaymentMode').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlCustomerPaymentMode').css('border-color', 'lightgrey');
    }
    //////alert("10");
    if ($('#ddlSalesExecutive :selected').val().trim() == "0") {
        $('#ddlSalesExecutive').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlSalesExecutive').css('border-color', 'lightgrey');
    }
    /////alert("11");
    if ($('#txtVehicleChasisNo').val().trim() == "") {
        $('#txtVehicleChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehicleChasisNo').css('border-color', 'lightgrey');
    }
    //////alert("12");
    if ($('#txtVendorAmount').val().trim() == "") {
        $('#txtVendorAmount').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVendorAmount').css('border-color', 'lightgrey');
    }
    ///////alert("13");
    if ($('#txtPayoutAmount').val().trim() == "") {
        $('#txtPayoutAmount').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtPayoutAmount').css('border-color', 'lightgrey');
    }
    ////alert("14");
    if ($('#txtCustomerAmount').val().trim() == "") {
        $('#txtCustomerAmount').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtCustomerAmount').css('border-color', 'lightgrey');
    }

//    if ($('#ddlModel :selected').val().trim() == "0") {
//        $('#ddlModel').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#ddlModel').css('border-color', 'lightgrey');
//    }

    return isValid;
}




