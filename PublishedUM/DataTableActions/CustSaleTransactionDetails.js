
$(document).ready(function () {

    $.ajax({
        type: "POST", url: "salesTransactionDetailsCustomer.aspx/GetAllCustomers",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.custname));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });




   /// GetInvoiceNo(3);



        $('#txtInvoiceDate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });

    //    var date = new Date();
    //  var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
    //$('#txtInvoiceDate').datepicker('update', new Date(Date.parse(today)));






    ///////assign current date///////////
//    var today = new Date();
//    var dd = String(today.getDate()).padStart(2, '0');
//    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
//    var yyyy = today.getFullYear();

//    today = mm + '/' + dd + '/' + yyyy;
//    $('#txtInvoiceDate').val(today);


})


//function GetInvoiceNo() {
//    $.ajax({
//        type: "POST",
//        url: "salesTransactionDetailsCustomer.aspx/GetInvoiceNoByAccountTypeID",
//        data: '{ accountTypeID :' + "3" + '}',
//        dataType: "json",
//        contentType: "application/json",
//        success: function (res) {
//            var invNo = "CUST-" + JSON.stringify(res.d)
//            ///alert(invN);
//            $("#txtInvoiceNo").val(invNo);

//        }
//            ,
//        error: function (response) {
//            ///alert(response.responseText);
//            $.notify("BOOM!", "error");
//        }

//    });
//}
 

 function ddlInvoiceType_Change()
 {
     var accounttypeID = $("#ddlInvoiceType").val();

//     GetVendorsByAccountTypeID(accounttypeID);
//     GetCustomersByAccountTypeID(accounttypeID);
     GetInvoiceNo(accounttypeID);
 }

 function GetInvoiceNo(accounttypeid) {

     var accounttype = $("#ddlInvoiceType :selected").text();
      var accounttypeid = $("#ddlInvoiceType :selected").val();
     var invNo ="0";

//             if(accounttypeid=="1")
//             {
//             /////invNo =  accounttype.substring(0, 4).toUpperCase() +"-" + JSON.stringify(res.d)
//             invNo =  "SLIP" 
//             }

             if(accounttypeid=="2")
             {
             /////invNo =  accounttype.substring(0, 4).toUpperCase() +"-" + JSON.stringify(res.d)
             ////invNo =  "IUM4HS22230000"
             invNo =  "IUM4HS23240000"
             }
              if(accounttypeid=="3")
             {
             /////invNo =  accounttype.substring(0, 4).toUpperCase() +"-" + JSON.stringify(res.d)
             invNo =  "I22208842400026"
             }
              if(accounttypeid=="4")
             {
             /////invNo =  accounttype.substring(0, 4).toUpperCase() +"-" + JSON.stringify(res.d)
             ////invNo =  "UM/22-23/00"

                 invNo = "UM/23-24/00"
             }
              if(accounttypeid=="5")
             {
             /////invNo =  accounttype.substring(0, 4).toUpperCase() +"-" + JSON.stringify(res.d)
             invNo =  "TMI/UM/02"
             }

             if(accounttypeid=="2" || accounttypeid == "4")
             {
             ////alert(accounttypeid);
                    $("#Showoverlay").show();
     $.ajax({
         type: "POST",
         url: "salesTransactionDetailsCustomer.aspx/GetInvoiceNoByAccountTypeIDandFinancialYear",
         data: '{ accountTypeID :' + accounttypeid + '}',
         dataType: "json",
         contentType: "application/json",
         success: function (res) {
             


             if(accounttypeid=="2")
             {
             var myNumber=JSON.stringify(res.d);
             ////alert(myNumber);
                if(myNumber.toString().length < 2)
                {
                    /////invNo = "IUM4HS222300000"  + JSON.stringify(res.d)
                    invNo = "IUM4HS232400000"  + JSON.stringify(res.d)
                }
                if(myNumber.toString().length >= 2 && myNumber.toString().length < 3)
                {
                    //////invNo = "IUM4HS22230000"  + JSON.stringify(res.d)
                    invNo = "IUM4HS23240000"  + JSON.stringify(res.d)
                }
                if(myNumber.toString().length >= 3 && myNumber.toString().length < 4)
                {
                    ////invNo = "IUM4HS2223000"  + JSON.stringify(res.d)
                    invNo = "IUM4HS2324000"  + JSON.stringify(res.d)
                }
                if(myNumber.toString().length >= 4 && myNumber.toString().length < 5)
                {
                   ////// invNo = "IUM4HS222300"  + JSON.stringify(res.d)
                    invNo = "IUM4HS232400"  + JSON.stringify(res.d)
                }
                 if(myNumber.toString().length >= 5 && myNumber.toString().length < 6)
                {
                    //////invNo = "IUM4HS22230"  + JSON.stringify(res.d)
                    invNo = "IUM4HS23240"  + JSON.stringify(res.d)
                }
             }

             
                         if(accounttypeid == "4")
                         {
                          invNo = invNo  + JSON.stringify(res.d)
                         }
             ///alert(invN);
             $("#txtInvoiceNo").val(invNo);

         }
        ,
         error: function (response) {
             ///alert(response.responseText);
             $.notify("BOOM!", "error");
         }

     });

             }
              
             else
             {
             ////alert("withoutfyear" + accounttypeid);
                 $("#Showoverlay").show();
                 $.ajax({
                     type: "POST",
                     url: "salesTransactionDetailsCustomer.aspx/GetInvoiceNoByAccountTypeID",
                     data: '{ accountTypeID :' + accounttypeid + '}',
                     dataType: "json",
                     contentType: "application/json",
                     success: function (res) {
                         ////var invNo = accounttype.substring(0, 4).toUpperCase() +"-" + JSON.stringify(res.d)

                         ////alert(JSON.stringify(res.d));

                         if(accounttypeid=="1")
                         {
                                ////var myNumber=1759;
                               ////////// myNumber+=JSON.stringify(res.d);
                               //// invNo= parseInt(1759)  +  parseInt( JSON.stringify(res.d));
                                
                                //invNo=   parseInt( JSON.stringify(res.d));
                               ///// alert("1");
                                 $.ajax({
                     type: "POST",
                     url: "salesTransactionDetailsCustomer.aspx/GetSlipDetailofPendingSlips",
                     ////data: '{ accountTypeID :' + accounttypeid + '}',
                     dataType: "json",
                     contentType: "application/json",
                     success: function (res2) {
                     //////alert(res2.d);
                     var json2 = JSON.parse(res2.d);
                         $("#txtInvoiceNo").val("UM/" + json2[0].slipno);
                         $("#txtAmount").val(json2[0].totalamount);
                         $("#txtVehicleChasisNo").val(json2[0].vehicleno);

                        ///// $("#hdnSaleTrnTypeID").val(parseInt( JSON.stringify(res.d)));
                         $("#hdnSlipNofromSlipMaster").val(json2[0].slipno);
                         
                     }
                      ,
                     error: function (response) {
                         ///alert(response.responseText);
                         $.notify("BOOM slip!", "error");
                     }

                 });

                         }



                         if(accounttypeid=="3")
                         {
                          ////var myNumber=1759;
                          var newnum = parseInt(24000266)  +  parseInt( JSON.stringify(res.d));
               
                            const d = new Date();
                            let year = d.getFullYear().toString().substr(-2) ;


                            var myNumber=JSON.stringify(res.d);
            //                invNo = "I2220884"  +  newnum;

                        invNo = "I"+year+"20884"  +  newnum;


            //                alert(myNumber.toString().length);

            //                if(myNumber.toString().length < 2)
            //                {
            //                    invNo = "I2220884240002"  +  newnum;
            //                }
            //                if(myNumber.toString().length >= 2 && myNumber.toString().length < 3)
            //                {
            //                    invNo = "I2220884240002"  +  newnum;
            //                }
            //                if(myNumber.toString().length >= 3 && myNumber.toString().length < 4)
            //                {
            //                    invNo = "I222088424000"  +  newnum;
            //                }
            //                if(myNumber.toString().length >= 4 && myNumber.toString().length < 5)
            //                {
            //                    invNo = "I22208842400"  +  newnum;
            //                }
            //                if(myNumber.toString().length >= 5 && myNumber.toString().length < 6)
            //                {
            //                    invNo = "I2220884240"  +  newnum;
            //                }
            //                if(myNumber.toString().length >= 6 && myNumber.toString().length < 7)
            //                {
            //                    invNo = "I222088424"  +  newnum;
            //                }
                            ////invNo =  "I22208842400026"
                         }

                         if(accounttypeid!="1" && accounttypeid != "2" && accounttypeid != "3")
                         {
                          invNo = invNo  + JSON.stringify(res.d)
                         }
                         ///alert(invN);
                         $("#txtInvoiceNo").val(invNo);

                         ///// $("#txtinvnoforslip").val(invNo);

                     }
                    ,
                     error: function (response) {
                         ///alert(response.responseText);
                         $.notify("BOOM!", "error");
                     }

                 });
     }
     $("#Showoverlay").hide();
 }

//// function GetVendorsByAccountTypeID(accounttypeid) {
////    
////     $("#Showoverlay").show();
////     $.ajax({
////         type: "POST",
////         url: "salesTransactionDetailsCustomer.aspx/GetVendorsByAccountTypeID",
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
////         url: "salesTransactionDetailsCustomer.aspx/GetCustomersByAccountTypeID",
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


 function ddlAccountType_SelectedIndexChanged()
 {
     var accounttypeID = $("#ddlAccountType :selected").val();
      var accounttype = $("#ddlAccountType :selected").text();

     /////alert(accounttypeID);
     if(accounttypeID == 1)
     {
    ///alert(accounttypeID);
        $("#paymentto").text( "Select " + accounttype + ":")
        ////document.getElementById('paymentto').innerHTML = 'your tip has been submitted!';
        //document.getElementById('paymentto').textContent = 'Hello \nlcr World!';;

        GetAllVendors();
         
     }
     if(accounttypeID == 2)
     {
     $("#paymentto").text( "Select " + accounttype + ":")
        GetAllEmployees();
         
     }
     if(accounttypeID == 3)
     {
     /////$('#ddlCustomers').find('option:not(:first)').remove();
     $("#paymentto").text( "Select " + accounttype + ":")
        GetAllCustomers();
       
     }
    
     if(accounttypeID == 5)
     {
     $("#paymentto").text( "Select " + accounttype + ":")
        GetAllGeneralLedgers();
       
     }
 }

  function GetAllVendors()
 {
 $("#Showoverlay").show();
//// $("#ddlCustomers").empty();


 $('#ddlCustomers').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsCustomer.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlCustomers').find('option:not(:first)').remove();
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

 function GetAllEmployees()
 {
  $('#ddlCustomers').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsCustomer.aspx/GetAllEmployeesList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlCustomers').find('option:not(:first)').remove();
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

 function GetAllCustomers()
 {
  $('#ddlCustomers').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "salesTransactionDetailsCustomer.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlCustomers').find('option:not(:first)').remove();
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

 

 function GetAllGeneralLedgers()
 {
 $("#Showoverlay").show();
//// $("#ddlCustomers").empty();


 $('#ddlCustomers').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsCustomer.aspx/GetAllGeneralLedgersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlCustomers').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.glname));
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



$(function () {
    ////$("#Showoverlay").show();
    BindDataTable();
});

function btnResetSearch_Click()
{
   ///// $("#ddlSearchField :selected").val("0");
    $('#ddlSearchField').prop("selectedIndex", 0);
    $("#searchValue").val("");
    BindDataTable();
}

function BindDataTable() {

 $("#tblRecords").dataTable().fnDestroy();


 var searchDt = 0;

            var searchfield = "";
            var searchvalue = "";

            var searchValue = $("#searchValue").val();
            var searchField = $("#ddlSearchField :selected").val();

////            if (searchValue != "") {
////                searchfield = searchField;
////                searchvalue = searchValue;
////                searchDt = 0;
////            }


            if ( searchField != "0") {

                if (searchValue == "")
                {
                 $.notify("Please enter search criteria!", "error");
                 $("#searchValue").focus();
                 return;
                }

                searchfield = searchField;
                searchvalue = searchValue;
                searchDt = 0;
            }
////////            else
////////            {
////////                if (searchValue != "" && searchField != "0")
////////                {
////////                 $.notify("Please enter search criteria!", "error");
////////                 $("#searchValue").focus();
////////                 return;
////////                }
////////            }


   searchDt = $("#txtInvoiceDate").val();


 var i = 1;

            $('#tblRecords').DataTable({
                "order": [[0, 'desc']],
               
             bServerSide: true,
             sAjaxSource: 'SaleTransactionDetailsCustomersHandler.ashx/GetSaleTransactionDetailsCustomersData?searchdt=' + searchDt+ '&searchfield=' + searchfield + '&searchvalue=' + searchvalue,
                sServerMethod: 'post',
                "processing": true,
                "columns": [
                 { "data": "id" ,
      "render": function(data, type, full, meta) {
        return i++;
      }},

////                    { "data": "accounttype" },
                    { "data": "invoicedt" },
                    { "data": "accounttype" },
                    { "data": "invoiceno" },
                    { "data": "customername" },
                    { "data": "invoicetype" },
                    { "data": "paymentmode" },
                    { "data": "amount" 
                        ,
                    render: function ( data, type, row )
                        {
                     return  " <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.amount;
                     }

                    },
                    { "data": "discount" 
                        ,
                    render: function ( data, type, row )
                        {
                     return  " <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.discount;
                     }
                    },
                    { "data": "vehchasisno" },
                     { "data": "createdby",
                        render: function ( data, type, row )
                        {
//////                         var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
//////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                     var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')


                         return "<div class='text-nowrap'>" + row.createdby + '(' + cdate + ')  <br/>' + row.updatedby + '(' + udate + ')' + "</div>";
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
                        "data": "id",
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ],
                 "columnDefs": [
                                { "visible": false, "targets": [] }
                              ],

                                responsive: true,
            });


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
   //// alert("1");

    var accounttypeid = $("#ddlAccountType :selected").val();
    var accounttype = $("#ddlAccountType :selected").text();   
    var invoicedt = $('[id*=txtInvoiceDate]').val();
     var customerid = $("#ddlCustomers :selected").val();
    var customername = $("#ddlCustomers :selected").text();
     var invoicetypeid = $("#ddlInvoiceType :selected").val();
    var invoicetype = $("#ddlInvoiceType :selected").text();
    var invoiceno = $('[id*=txtInvoiceNo]').val();
     var paymentmodeid = $("#ddlPaymentMode :selected").val();
    var paymentmode = $("#ddlPaymentMode :selected").text();
    var amount = $('[id*=txtAmount]').val();
    var discount = $('[id*=txtDiscount]').val();   
    var vehchasisno = $('[id*=txtVehicleChasisNo]').val();  
    
     var slipinvno = $('[id*=hdnSlipNofromSlipMaster]').val();   
    /////var vehchasisno = $('[id*=hdnSaleTrnTypeID]').val();  
      

   // name = sentenceCase(name);
    var model = {};
    model.accounttypeid = accounttypeid;
    model.accounttype = accounttype;
    model.invoicedt = invoicedt;
    model.customerid = customerid;
    model.customername = customername;
    model.invoicetypeid = invoicetypeid;
    model.invoicetype = invoicetype;
    model.invoiceno = invoiceno;
    model.paymentmodeid = paymentmodeid;
    model.paymentmode = paymentmode;
    model.amount = amount;
    model.discount = discount;
    model.vehchasisno = vehchasisno;
    model.slipinvno=slipinvno;

    $.ajax({
        type: "POST",
        url: "salesTransactionDetailsCustomer.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            //alert(r.d);
            //return;
            if (r.d.toLowerCase() != "record saved!") {
                $.notify(r.d, "error");
                $('[id*=txtMobile]').focus();
            }
            else {
                ///////$('#myModal').modal('hide');
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
                $.notify("Error!! invoice no already exists!", "error");
            }
            else {
                //alert("Error while saving data!!");
                $.notify("Error while saving data!", "error");
            }
        }
    });
}


function GetSelectedVendor(id)
{
$("#Showoverlay").show();
//// $("#ddlCustomers").empty();

//////alert(id);
 $('#ddlCustomers').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsCustomer.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlCustomers').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.vendorname));
            })
            $('#ddlCustomers').val( id);
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
function GetSelectedEmployee(id)
{
 $('#ddlCustomers').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsCustomer.aspx/GetAllEmployeesList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlCustomers').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.employeename));
            })
            $('#ddlCustomers').val( id);
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
function GetSelectedCustomer(id)
{
    ///alert(id);

    $('#ddlCustomers').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "salesTransactionDetailsCustomer.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlCustomers').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.custname));
            })

            $('#ddlCustomers').val( id);

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

function GetSelectedGeneralLedgers(id)
 {
 $("#Showoverlay").show();
//// $("#ddlCustomers").empty();


 $('#ddlCustomers').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "salesTransactionDetailsCustomer.aspx/GetAllGeneralLedgersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlCustomers').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.glname));
            })
             $('#ddlCustomers').val( id);
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



function EditRecordbyID(id) {
    //////alert(id);

    $('#recordID').val("0");
    $('#recordOldInvDt').val("0");
     $('#recordOldPmentACTypID').val("0");
    $('#recordOldPaymentAccountType').val("0");
    $('#recordOldCustID').val("0");
    $('#recordOldCustomerName').val("0");
    $('#recordOldInvTypID').val("0");
    $('#recordOldInvoiceType').val("0");
    $('#recordOldInvoiceNo').val("0");
    $('#recordOldPayModeID').val("0");
    $('#recordOldPaymentMode').val("0");
    $('#recordOldAmount').val("0");
    $('#recordOldDiscount').val("0");
    $('#recordOldVehChasisNo').val("0");

    $.ajax({
        type: "POST",
        url: "salesTransactionDetailsCustomer.aspx/GetRecordbyID",
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
                $('#recordOldInvDt').val(json[0].invoicedt);
                 $('#recordOldPmentACTypID').val(json[0].accounttypeid);
                $('#recordOldPaymentAccountType').val(json[0].accounttype);
                $('#recordOldCustID').val(json[0].customerid);
                $('#recordOldCustomerName').val(json[0].customername);
                $('#recordOldInvTypID').val(json[0].invoicetypeid);
                $('#recordOldInvoiceType').val(json[0].invoicetype);
                $('#recordOldInvoiceNo').val(json[0].invoiceno);
                $('#recordOldPayModeID').val(json[0].paymentmodeid);
                $('#recordOldPaymentMode').val(json[0].paymentmode);
                $('#recordOldAmount').val(json[0].amount);
                $('#recordOldDiscount').val(json[0].discount);
                $('#recordOldVehChasisNo').val(json[0].vehchasisno);

                /////alert(json[0].accounttypeid);

                if(json[0].accounttypeid == 1)
                {
                 $('#ddlAccountType').val(json[0].accounttypeid);
                     GetSelectedVendor(json[0].customerid);
                 $("#paymentto").text( "Select Vendor :")

                 }

                 if(json[0].accounttypeid == 2)
                {
                 $('#ddlAccountType').val(json[0].accounttypeid);
                GetSelectedEmployee(json[0].customerid);
                 $("#paymentto").text( "Select Employee :")
                 }

                 if(json[0].accounttypeid == 3)
                {
                  $('#ddlAccountType').val(json[0].accounttypeid);
                 GetSelectedCustomer(json[0].customerid);
                 $("#paymentto").text( "Select Customer :")
                 }

                  if(json[0].accounttypeid == 5)
                {
                  $('#ddlAccountType').val(json[0].accounttypeid);
                 GetSelectedGeneralLedgers(json[0].customerid);
                 $("#paymentto").text( "Select General Ledger :")
                 }

////                alert($('[id*=recordPayoutPaymentModeOld]').val());
////                alert($('[id*=recordCustPaymentModeOld]').val());

                ///var mydate = new Date(json[0].duedate.substring(0, 10));
                var invoicedt = new Date(json[0].invoicedt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
                $('[id*=txtInvoiceDate]').val(invoicedt);
                $("#ddlCustomers").val(json[0].customerid);
                $("#ddlInvoiceType").val(json[0].invoicetypeid);
                $('[id*=txtInvoiceNo]').val(json[0].invoiceno);

               $("#ddlPaymentMode").val(json[0].paymentmodeid);
               $('[id*=txtAmount]').val(json[0].amount);
                $('[id*=txtDiscount]').val(json[0].discount);
                $('[id*=txtVehicleChasisNo]').val(json[0].vehchasisno);
////                $('#myModal').modal('show');
////                $('#myModal').on('shown.bs.modal', function () {
////                    $('#txtName').focus();
////                });
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

//function for updating record
function UpdateRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var id = $('[id*=recordID]').val();
    /////alert(id);

    
    var accounttypeid = $("#ddlAccountType :selected").val();
    var accounttype = $("#ddlAccountType :selected").text();  
    var invoicedt = $('[id*=txtInvoiceDate]').val();
     var customerid = $("#ddlCustomers :selected").val();
    var customername = $("#ddlCustomers :selected").text();
     var invoicetypeid = $("#ddlInvoiceType :selected").val();
    var invoicetype = $("#ddlInvoiceType :selected").text();
    var invoiceno = $('[id*=txtInvoiceNo]').val();
     var paymentmodeid = $("#ddlPaymentMode :selected").val();
    var paymentmode = $("#ddlPaymentMode :selected").text();
    var amount = $('[id*=txtAmount]').val();
    var discount = $('[id*=txtDiscount]').val();   
    var vehchasisno = $('[id*=txtVehicleChasisNo]').val();

    var oldinvoicedt = $('[id*=recordOldInvDt]').val();
    var oldcustomerid = $('[id*=recordOldCustID]').val();
    var oldcustomername = $('[id*=recordOldCustomerName]').val();
    var oldinvoicetypeid = $('[id*=recordOldInvTypID]').val();
    var oldinvoicetype = $('[id*=recordOldInvoiceType]').val();
    var oldinvoiceno = $('[id*=recordOldInvoiceNo]').val();
    var oldpaymentmodeid = $('[id*=recordOldPayModeID]').val();
    var oldpaymentmode = $('[id*=recordOldPaymentMode]').val();
    var oldamount = $('[id*=recordOldAmount]').val();
    var olddiscount = $('[id*=recordOldDiscount]').val();
    var oldvehchasisno = $('[id*=recordOldVehChasisNo]').val();
    
    ////name = sentenceCase(name);
    if (id > 0) {
        //////alert(id);
        var model = {};
        model.id = id;
        model.accounttypeid = accounttypeid;
    model.accounttype = accounttype;
    model.invoicedt = invoicedt;
    model.customerid = customerid;
    model.customername = customername;
    model.invoicetypeid = invoicetypeid;
    model.invoicetype = invoicetype;
    model.invoiceno = invoiceno;
    model.paymentmodeid = paymentmodeid;
    model.paymentmode = paymentmode;
    model.amount = amount;
    model.discount = discount;
    model.vehchasisno = vehchasisno;

        model.oldinvoicedt = oldinvoicedt;
        model.oldcustomerid = oldcustomerid;
        model.oldcustomername = oldcustomername;
        model.oldinvoicetypeid = oldinvoicetypeid;
        model.oldinvoicetype = oldinvoicetype;
        model.oldinvoiceno = oldinvoiceno;
        model.oldpaymentmodeid = oldpaymentmodeid;
        model.oldpaymentmode = oldpaymentmode;
        model.oldamount = oldamount;
        model.olddiscount = olddiscount;
        model.oldvehchasisno = oldvehchasisno;

        //////alert(JSON.stringify(model));
        $.ajax({
            type: "POST",
            url: "salesTransactionDetailsCustomer.aspx/UpdateRecord",
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
                   ///// $('#myModal').modal('hide');
                   //// $('#recordID').val("0");
                    ////$.notify(r.d, "success");
                    $.notify("Record updated!", "success");
                    clearTextBox();
                    BindDataTable();

    $('#recordID').val("0");
    $('#recordOldInvDt').val("0");
    $('#recordOldCustID').val("0");
    $('#recordOldCustomerName').val("0");
    $('#recordOldInvTypID').val("0");
    $('#recordOldInvoiceType').val("0");
    $('#recordOldInvoiceNo').val("0");
    $('#recordOldPayModeID').val("0");
    $('#recordOldPaymentMode').val("0");
    $('#recordOldAmount').val("0");
    $('#recordOldDiscount').val("0");
    $('#recordOldVehChasisNo').val("0");
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
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "salesTransactionDetailsCustomer.aspx/DeleteRecord",
            data: '{ id :' + id + '}',
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
 ///////GetInvoiceNo();
///// $('#txtInvoiceDate').val("");

 GetAllCustomers()

 $('#ddlCustomers').prop("selectedIndex", 0);
 $('#ddlInvoiceType').prop("selectedIndex", 0);
 $('#ddlPaymentMode').prop("selectedIndex", 0);
   $('#ddlAccountType').prop("selectedIndex", 0);
 $('#txtInvoiceNo').val("");
 $('#txtAmount').val("");
 $('#txtDiscount').val("0");
 $('#txtVehicleChasisNo').val("");
  $('#txtInvoiceDate').val("");

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtInvoiceDate').css('border-color', 'lightgrey');
    $('#txtInvoiceNo').css('border-color', 'lightgrey');
    $('#txtAmount').css('border-color', 'lightgrey');
    $('#txtDiscount').css('border-color', 'lightgrey');
    $('#txtVehicleChasisNo').css('border-color', 'lightgrey');
    $('#ddlCustomers').css('border-color', 'lightgrey');
    $('#ddlInvoiceType').css('border-color', 'lightgrey');
    $('#ddlPaymentMode').css('border-color', 'lightgrey');

    BindDataTable();

////    $('#myModal').modal('show');
////    $('#myModal').on('shown.bs.modal', function () {
////        $('#txtVehicleChasisNo').focus();
////    });

}
//Valdidation using jquery  
function validate() {
    var isValid = true;

    if ($('#txtInvoiceDate').val().trim() == "") {
        $('#txtInvoiceDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtInvoiceDate').css('border-color', 'lightgrey');
    }

    if ($('#ddlCustomers :selected').val().trim() == "0") {
        $('#ddlCustomers').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlCustomers').css('border-color', 'lightgrey');
    }

    if ($('#ddlInvoiceType :selected').val().trim() == "0") {
        $('#ddlInvoiceType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlInvoiceType').css('border-color', 'lightgrey');
    }

    if ($('#txtInvoiceNo').val().trim() == "") {
        $('#txtInvoiceNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtInvoiceNo').css('border-color', 'lightgrey');
    }

    if ($('#ddlPaymentMode :selected').val().trim() == "0") {
        $('#ddlPaymentMode').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlPaymentMode').css('border-color', 'lightgrey');
    }

    if ($('#txtAmount').val().trim() == "") {
        $('#txtAmount').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtAmount').css('border-color', 'lightgrey');
    }

    if ($('#txtDiscount').val().trim() == "") {
        $('#txtDiscount').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDiscount').css('border-color', 'lightgrey');
    }

   
    if ($('#txtVehicleChasisNo').val().trim() == "") {
        $('#txtVehicleChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehicleChasisNo').css('border-color', 'lightgrey');
    }

   
    return isValid;
}




