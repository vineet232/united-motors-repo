
$(document).ready(function () {
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllPaymentMethodswithBank",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlPaymentMode").append($("<option></option>").val(value.paymentcode).html(value.paymentmethod));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });




////    var accounttypeID = $("#ddlAccountType :selected").val();
////    alert(accounttypeID);


////    GetAllVendors();
////    GetAllCustomers();
////    GetAllBanks();
////    GetAllEmployees();

    
    ///GetInvoiceNo();



    //    $('#txtInvoiceDate').datepicker({
    //        format: "mm/dd/yyyy",
    //        autoclose: true,
    //       
    //    });

    //    var date = new Date();
    //  var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
    //$('#txtInvoiceDate').datepicker('update', new Date(Date.parse(today)));

     $('#txtDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });


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
//        url: "paymenttransactions.aspx/GetInvoiceNoByAccountTypeID",
//        data: '{ accountTypeID :' + "1" + '}',
//        dataType: "json",
//        contentType: "application/json",
//        success: function (res) {
//            var invNo = "INS-" + JSON.stringify(res.d)
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
 

 function ddlPaymentMode_SelectedIndexChanged()
 {
    var custpaymentmodeid = $("#ddlPaymentMode").val();
    var custpaymentmode = $("#ddlPaymentMode").text();

    if(custpaymentmodeid >= 50)
    {
    
    GetAllBanks2();
   
     $("#divBank").show();
       
    }
    else
    {
         $("#divBank").hide();
    }
 }
 
 function GetAllBanks2()
 {
  
  $('#ddlPaymentToBank2').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllBanksList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                 $("#ddlPaymentToBank2").append($("<option></option>").val(value.id).html(value.bankname));
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
         $("#divOtherBank").hide();
     }
     if(accounttypeID == 2)
     {
     $("#paymentto").text( "Select " + accounttype + ":")
        GetAllEmployees();
         $("#divOtherBank").hide();
     }
     if(accounttypeID == 3)
     {
     /////$('#ddlPaymentTo').find('option:not(:first)').remove();
     $("#paymentto").text( "Select " + accounttype + ":")
        GetAllCustomers();
         $("#divOtherBank").hide();
     }
     if(accounttypeID == 4)
     {
     $("#paymentto").text( "Select " + accounttype + ":")
        GetAllBanks();
        //$("#divOtherBank").show();
     }
     if(accounttypeID == 5)
     {
     $("#paymentto").text( "Select " + accounttype + ":")
        GetAllGeneralLedgers();
        $("#divOtherBank").hide();
     }
 }

 function GetAllVendors()
 {
 $("#Showoverlay").show();
//// $("#ddlPaymentTo").empty();


 $('#ddlPaymentTo').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.vendorname));
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
  $('#ddlPaymentTo').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllEmployeesList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.employeename));
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
  $('#ddlPaymentTo').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.custname));
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

 function GetAllBanks()
 {
  $('#ddlPaymentTo').find('option:not(:first)').remove();
  $('#ddlPaymentToOtherBank').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllBanksList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.bankname));
                 $("#ddlPaymentToOtherBank").append($("<option></option>").val(value.id).html(value.bankname));
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
//// $("#ddlPaymentTo").empty();


 $('#ddlPaymentTo').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllGeneralLedgersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.glname));
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


function BindDataTable() {

 $("#tblRecords").dataTable().fnDestroy();

 var searchDt = $("#txtDate").val();


 var i = 1;

            $('#tblRecords').DataTable({
                "order": [[0, 'desc']],
               
             bServerSide: true,
             sAjaxSource: 'paymenttransactionsHandler.ashx/GetPaymentTransactionData?searchdt=' + searchDt ,
                sServerMethod: 'post',
                "processing": true,
                "columns": [
                 { "data": "id" ,
      "render": function(data, type, full, meta) {
        return i++;
      }},

////                    { "data": "accounttype" },
                    { "data": "paymentdt" },
                    { "data": "accounttype" },
                    { "data": "paymentto",
                         render: function ( data, type, row )
                        {
                        if( row.paymenttobank.toLowerCase()=="please select")
                          {
                          row.paymenttobank="";
                          }
                         return "<div class='text-nowrap'>"  + row.paymentto + '<br />' +   row.paymenttobank +  "</div>";
                        }
                     },
                    { "data": "paymentmode",
                        render: function ( data, type, row )
                        {
                       ////// alert(row.custpaymentmodeid);   || row.paymentmodeid == "4" || row.paymentmodeid == "5"
                         //// if(row.paymentmodeid == "3" || row.paymentmodeid == "4" || row.paymentmodeid == "5" || row.paymentmodeid == "6" || row.paymentmodeid == "7" || row.paymentmodeid == "9") 
                         
                         if(row.paymentmodeid >= 50)
                          {
                         
                         ////return "<div class='text-nowrap'>" + row.paymentmode +  "</div>";
                            return "<div >" + row.paymentmode + '<br/> <p style="font-size:x-small;"> ' + row.pmodebankname + '  </p>' + "</div>";
                         }
                         else
                         {
                          return "<div class='text-nowrap'>" + row.paymentmode +  "</div>";
                         }

                        }

                     },
                    { "data": "paymentreceipt" },
                    { "data": "amount" 
                        ,
                    render: function ( data, type, row )
                        {
                     return  " <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.amount;
                     }
                    },
//                     { "data": "discount" },
                    { "data": "remarks" },
                    { "data": "ocreatedby",
                        render: function ( data, type, row )
                        {
//////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
//////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')



                         return "<div class='text-nowrap'>" + row.ocreatedby + '<br/>(' + cdate + ')  <br/>' + row.oupdatedby + '<br/>(' + udate + ')' + "</div>";
                        }
                     },
//                    { "data": "remarks" },
                   {
                       "data": "id",
                       "render": function (id, type, full, meta) {
                           //debugger

                          

                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
                       }
                   },
                    {
                        "data": "id",
                        "render": function (data, type, row) {
                            //debugger
                            return '<a href="#" onclick="DeleteRecord(\'' + row.accounttypeid + ',' + row.id + '\'\)"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
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

   var paymentdt = $('[id*=txtDate]').val();
    var accounttypeid = $("#ddlAccountType :selected").val();
    var accounttype = $("#ddlAccountType :selected").text();       
    var paymenttoid = $("#ddlPaymentTo :selected").val();
    var paymentto = $("#ddlPaymentTo :selected").text();
    var paymentmodeid = $("#ddlPaymentMode :selected").val();
    var paymentmode = $("#ddlPaymentMode :selected").text();
    var paymentreceiptid = $("#ddlPaymentType :selected").val();
    var paymentreceipt = $("#ddlPaymentType :selected").text();

//     var paymenttobankid = $("#ddlPaymentToOtherBank :selected").val();
//    var paymenttobank = $("#ddlPaymentToOtherBank :selected").text();

    var paymenttobankid = $("#ddlPaymentToBank2 :selected").val();
    var paymenttobank = $("#ddlPaymentToBank2 :selected").text();

    
    var amount = $('[id*=txtAmount]').val();
     var discount = $('[id*=txtDiscount]').val();
    var remarks = $('[id*=txtRemarks]').val();
    
    var pmodebankid = $("#ddlPaymentToBank2 :selected").val();
    var pmodebankname = $("#ddlPaymentToBank2 :selected").text();

   // name = sentenceCase(name);
    var model = {};
    model.paymentdt = paymentdt;
    model.accounttypeid = accounttypeid;
    model.accounttype = accounttype;
    model.paymenttoid = paymenttoid;
    model.paymentto = paymentto;
    model.paymentmodeid = paymentmodeid;
    model.paymentmode = paymentmode;
    model.paymentreceiptid = paymentreceiptid;
    model.paymentreceipt = paymentreceipt;
    model.amount = amount;
    model.discount=discount;
    model.remarks = remarks;
    model.paymenttobankid=paymenttobankid;
    model.paymenttobank=paymenttobank;

    model.pmodebankid=pmodebankid;
    model.pmodebankname=pmodebankname;


    $.ajax({
        type: "POST",
        url: "paymenttransactions.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            //alert(r.d);
            //return;
            if (r.d.toLowerCase() != "record saved!") {
                $.notify(r.d, "error");
               //// $('[id*=txtDate]').focus();
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



function GetSelectedVendor(id)
{
$("#Showoverlay").show();
//// $("#ddlPaymentTo").empty();


 $('#ddlPaymentTo').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.vendorname));
            })
            $('#ddlPaymentTo').val( id);
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
 $('#ddlPaymentTo').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllEmployeesList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.employeename));
            })
            $('#ddlPaymentTo').val( id);
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

    $('#ddlPaymentTo').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.custname));
            })

            $('#ddlPaymentTo').val( id);

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
function GetSelectedBank(id)
{
$('#ddlPaymentTo').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllBanksList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.bankname));
            })
             $('#ddlPaymentTo').val( id);
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

function GetPModeSelectedBank(id)
{
$('#ddlPaymentToBank2').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllBanksList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentToBank2").append($("<option></option>").val(value.id).html(value.bankname));
            })
             $('#ddlPaymentToBank2').val( id);
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


function GetOtherSelectedBank(id)
{
$('#ddlPaymentToOtherBank').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllBanksList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentToOtherBank").append($("<option></option>").val(value.id).html(value.bankname));
            })
             $('#ddlPaymentToOtherBank').val( id);
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
//// $("#ddlPaymentTo").empty();


 $('#ddlPaymentTo').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "paymenttransactions.aspx/GetAllGeneralLedgersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.glname));
            })
             $('#ddlPaymentTo').val( id);
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
    ////alert(id);

    $('#recordID').val("0");
    $('#recordOldPaymentDate').val("0");
    $('#recordOldPmentACTypID').val("0");
    $('#recordOldPaymentAccountType').val("0");
    $('#recordoldPtoID').val("0");
    $('#recordoldPaymentTo').val("0");
    $('#recordPModeID').val("0");
    $('#recordPaymentMode').val("0");
    $('#recordPTID').val("0");
    $('#recordPaymentType').val("0");
    $('#recordoldAmt').val("0");
    $('#recordoldRemarks').val("0");
    $('#recordpaymenttransactionid').val("0");
    $('#recordoldBnkID').val("0");
    $('#recordoldBankName').val("0");
     $('#recordoldpmbnkid').val("0");
    $('#recordoldpmodeBankName').val("0");
     $('#recordolddiscount').val("0");

    $.ajax({
        type: "POST",
        url: "paymenttransactions.aspx/GetRecordbyID",
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
                $('#recordpaymenttransactionid').val(json[0].paymenttransactionid);
                $('#recordOldPaymentDate').val(json[0].paymentdt);
                $('#recordOldPmentACTypID').val(json[0].accounttypeid);
                $('#recordOldPaymentAccountType').val(json[0].accounttype);
                $('#recordoldPtoID').val(json[0].paymenttoid);
                $('#recordoldPaymentTo').val(json[0].paymentto);
                $('#recordPModeID').val(json[0].paymentmodeid);
                $('#recordPaymentMode').val(json[0].paymentmode);
                $('#recordPTID').val(json[0].paymentreceiptid);
                $('#recordPaymentType').val(json[0].paymentreceipt);
                $('#recordoldAmt').val(json[0].amount);
                $('#recordolddiscount').val(json[0].discount);
                $('#recordoldRemarks').val(json[0].remarks);

                $('#recordoldBnkID').val(json[0].paymenttobankid);
                $('#recordoldBankName').val(json[0].paymenttobank);

                 $('#recordoldpmbnkid').val(json[0].pmodebankid);
                $('#recordoldpmodeBankName').val(json[0].pmodebankname);

                ///var mydate = new Date(json[0].duedate.substring(0, 10));
                var paymentdt = new Date(json[0].paymentdt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

                

                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
                $('#txtDate').val(paymentdt);
                $('#ddlAccountType').val(json[0].accounttypeid);
                $('#ddlPaymentTo').val(json[0].paymenttoid);
                $("#ddlPaymentToOtherBank").val(json[0].paymenttobankid);
    
               
              
////                var $select1 = $( '#ddlAccountType' ),
////		$select2 = $( '#ddlPaymentTo' ),
////    $options = $select2.find( 'option' );
////  
////    
////$select1.on( 'change', function() {
////	$select2.html( $options.filter( '[value="' + this.value  + '"]' ) );
////   
////} ).trigger( 'change' );

                if(json[0].accounttypeid == 1)
                {
                 $("#divOtherBank").hide();
                     GetSelectedVendor(json[0].paymenttoid);
                 $("#paymentto").text( "Select Vendor :")

                 }

                 if(json[0].accounttypeid == 2)
                {
                 $("#divOtherBank").hide();
                GetSelectedEmployee(json[0].paymenttoid);
                 $("#paymentto").text( "Select Employee :")
                 }

                 if(json[0].accounttypeid == 3)
                {
                 $("#divOtherBank").hide();
                 GetSelectedCustomer(json[0].paymenttoid);
                 $("#paymentto").text( "Select Customer :")
                 }

                 if(json[0].accounttypeid == 4)
                {
                /////$("#divOtherBank").show();
                GetSelectedBank(json[0].paymenttoid)
                 GetOtherSelectedBank(json[0].paymenttobankid)
                 $("#paymentto").text( "Select Bank :")
                 }

                 if(json[0].accounttypeid == 5)
                {
                 $("#divOtherBank").hide();
                 GetSelectedGeneralLedgers(json[0].paymenttoid);
                 $("#paymentto").text( "Select General Ledger :")
                 }
                 

                 


                ////ddlAccountType_SelectedIndexChanged();
                ////sleep(5000);
                //////await $(window).delay(5000).promise();

//                $("#ddlPaymentTo option[value=" + json[0].paymenttoid + "]").attr('selected', 'selected'); 
//$("#ddlPaymentTo").selectmenu('refresh', true);

              
            //// $('#ddlPaymentTo  option[value="3"]').prop("selected", true);

              //// $('#ddlPaymentTo').prop("selectedIndex", json[0].paymenttoid);
              /// $('#ddlPaymentTo').val(json[0].paymenttoid);
             
             ////alert(json[0].paymentreceiptid);
                $('#ddlPaymentMode').val(json[0].paymentmodeid);
                $("#ddlPaymentType").val(json[0].paymentreceiptid);

                $("#txtAmount").val(json[0].amount);
                $("#txtDiscount").val(json[0].discount);
                $('#txtRemarks').val(json[0].remarks);

                ////if(json[0].paymentmodeid == "3" || json[0].paymentmodeid == "4" || json[0].paymentmodeid == "5" || json[0].paymentmodeid == "6" || json[0].paymentmodeid == "7" )

                if(json[0].paymentmodeid >= 50)
                 {
                 /////alert(json[0].custpaymenttobankid);
                    GetPModeSelectedBank(json[0].pmodebankid);
                    $("#divBank").show();
                 }
                 else
                 {
                     $("#divBank").hide();
                 }


//////                $('#myModal').modal('show');
//////                $('#myModal').on('shown.bs.modal', function () {
//////                    $('#txtName').focus();
//////                });
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

////function sleep(milliseconds) {
////  var start = new Date().getTime();
////  for (var i = 0; i < 1e7; i++) {
////    if ((new Date().getTime() - start) > milliseconds){
////      break;
////    }
////  }
////}

//function for updating record
function UpdateRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var id = $('[id*=recordID]').val();
    ////alert(id);

   var paymentdt = $('[id*=txtDate]').val();
    var accounttypeid = $("#ddlAccountType :selected").val();
    var accounttype = $("#ddlAccountType :selected").text();       
    var paymenttoid = $("#ddlPaymentTo :selected").val();
    var paymentto = $("#ddlPaymentTo :selected").text();
    var paymentmodeid = $("#ddlPaymentMode :selected").val();
    var paymentmode = $("#ddlPaymentMode :selected").text();
    var paymentreceiptid = $("#ddlPaymentType :selected").val();
    var paymentreceipt = $("#ddlPaymentType :selected").text();

//    var paymenttobankid = $("#ddlPaymentToOtherBank :selected").val();
//    var paymenttobank = $("#ddlPaymentToOtherBank :selected").text();
    
    var paymenttobankid = $("#ddlPaymentToBank2 :selected").val();
    var paymenttobank = $("#ddlPaymentToBank2 :selected").text();
    

    var amount = $('[id*=txtAmount]').val();
    var discount = $('[id*=txtDiscount]').val();
    var remarks = $('[id*=txtRemarks]').val();

    var pmodebankid = $("#ddlPaymentToBank2 :selected").val();
    var pmodebankname = $("#ddlPaymentToBank2 :selected").text();
   //// alert(pmodebankid);
    
    /////var oldpaymentdt = $('[id*=recordpaymenttransactionid]').val();
    var oldpaymentdt = $('[id*=recordOldPaymentDate]').val();
    var oldaccounttypeid = $('[id*=recordOldPmentACTypID]').val();
    var oldaccounttype = $('[id*=recordOldPaymentAccountType]').val();
    var oldpaymenttoid = $('[id*=recordoldPtoID]').val();
    var oldpaymentto = $('[id*=recordoldPaymentTo]').val();
    var oldpaymentmodeid = $('[id*=recordPModeID]').val();
    var oldpaymentmode = $('[id*=recordPaymentMode]').val();
    var oldpaymentreceiptid = $('[id*=recordPTID]').val();
    var oldpaymentreceipt = $('[id*=recordPaymentType]').val();
    var oldamount = $('[id*=recordoldAmt]').val();
     var olddiscount = $('[id*=recordolddiscount]').val();
    var oldremarks = $('[id*=recordoldRemarks]').val();

    var oldpaymenttobankid = $('[id*=recordoldBnkID]').val();
    var oldpaymenttobank = $('[id*=recordoldBankName]').val();
    
     var oldpmodebankid = $('[id*=recordoldpmbnkid]').val();
    var oldpmodebankname = $('[id*=recordoldpmodeBankName]').val();

   /// alert(pmodebankname + "0" + oldpmodebankname);

    ////name = sentenceCase(name);
    if (id > 0) {
        //////alert(id);
        var model = {};
        model.id = id;
       model.paymentdt = paymentdt;
    model.accounttypeid = accounttypeid;
    model.accounttype = accounttype;
    model.paymenttoid = paymenttoid;
    model.paymentto = paymentto;
    model.paymentmodeid = paymentmodeid;
    model.paymentmode = paymentmode;
    model.paymentreceiptid = paymentreceiptid;
    model.paymentreceipt = paymentreceipt;
    model.amount = amount;
    model.discount=discount;
    
    model.remarks = remarks;
   
    model.paymenttobankid = paymenttobankid;
    model.paymenttobank = paymenttobank;

       model.oldpaymentdt = oldpaymentdt;
    model.oldaccounttypeid = oldaccounttypeid;
    model.oldaccounttype = oldaccounttype;
    model.oldpaymenttoid = oldpaymenttoid;
    model.oldpaymentto = oldpaymentto;
    model.oldpaymentmodeid = oldpaymentmodeid;
    model.oldpaymentmode = oldpaymentmode;
    model.oldpaymentreceiptid = oldpaymentreceiptid;
    model.oldpaymentreceipt = oldpaymentreceipt;
    model.oldamount = oldamount;
    model.olddiscount=olddiscount;
    model.oldremarks = oldremarks;
     model.oldpaymenttobankid = oldpaymenttobankid;
    model.oldpaymenttobank = oldpaymenttobank;

      model.pmodebankid = pmodebankid;
      model.pmodebankname = pmodebankname;
       model.oldpmodebankid = oldpmodebankid;
      model.oldpmodebankname = oldpmodebankname;

      ////alert(oldpmodebankname);

        //////alert(JSON.stringify(model));
        $.ajax({
            type: "POST",
            url: "paymenttransactions.aspx/UpdateRecord",
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
                    $('#recordpaymenttransactionid').val("0");
                    $('#recordOldPaymentDate').val("0");
                    $('#recordOldPmentACTypID').val("0");
                    $('#recordOldPaymentAccountType').val("0");
                    $('#recordoldPtoID').val("0");
                    $('#recordoldPaymentTo').val("0");
                    $('#recordPModeID').val("0");
                    $('#recordPaymentMode').val("0");
                    $('#recordPTID').val("0");
                    $('#recordPaymentType').val("0");
                    $('#recordoldAmt').val("0");
                    $('#recordolddiscount').val("0");
                    $('#recordoldRemarks').val("0");
                    $('#recordoldBnkID').val("0");
                    $('#recordoldBankName').val("0");
                     $('#recordoldpmbnkid').val("0");
                    $('#recordoldpmodeBankName').val("0");
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

function DeleteRecord(empdata) {
    if (confirm('Are you sure delete this record?')) {
////        var data = table.row($(this).parents('tr')).data();
////        table.row($(this).parents('tr')).remove().draw();


const myArray = empdata.split(",");
    let id = myArray[1];
    let accounttypeid = myArray[0];

     var model = {};
    model.id = id;
    model.accounttypeid=accounttypeid;

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "paymenttransactions.aspx/DeleteRecord",
           //// data: '{ id :' + id + '}',
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

function Reset()
{
 $('#recordID').val('0');
 $('#ddlPaymentToBank2').prop("selectedIndex", 0);
  $("#divBank").hide();
 $('#ddlAccountType').prop("selectedIndex", 0);
 $('#ddlPaymentTo').prop("selectedIndex", 0);
 $('#ddlPaymentMode').prop("selectedIndex", 0);
   $('#ddlPaymentType').prop("selectedIndex", 0);

    $('#ddlPaymentToOtherBank').prop("selectedIndex", 0);

 $('#txtAmount').val("");
 $('#txtRemarks').val("");
 $('#txtDate').val("");

  $('#btnUpdate').hide();
  $('#btnAdd').show();
  BindDataTable();
}

//Function for clearing the textboxes  
function clearTextBox() {

 $('#recordID').val('0');
 ////GetInvoiceNo();
 $('#txtDate').val("");

  $('#ddlPaymentToBank2').prop("selectedIndex", 0);
   $("#divBank").hide();
  
 $('#ddlAccountType').prop("selectedIndex", 0);
 $('#ddlPaymentTo').prop("selectedIndex", 0);
 $('#ddlPaymentMode').prop("selectedIndex", 0);
 $('#ddlPaymentType').prop("selectedIndex", 0);   
 $('#txtAmount').val("");
 $('#txtRemarks').val("");
        

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtDate').css('border-color', 'lightgrey');
    $('#txtAmount').css('border-color', 'lightgrey');
    $('#txtRemarks').css('border-color', 'lightgrey');

    $('#ddlAccountType').css('border-color', 'lightgrey');
    $('#ddlPaymentTo').css('border-color', 'lightgrey');
    $('#ddlPaymentMode').css('border-color', 'lightgrey');
    $('#ddlPaymentType').css('border-color', 'lightgrey');

}
//Valdidation using jquery  
function validate() {
    var isValid = true;

    if ($('#txtDate').val().trim() == "") {
        $('#txtDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDate').css('border-color', 'lightgrey');
    }

    if ($('#ddlAccountType :selected').val().trim() == "0") {
        $('#ddlAccountType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlAccountType').css('border-color', 'lightgrey');
    }

    if ($('#ddlPaymentTo :selected').val().trim() == "0") {
        $('#ddlPaymentTo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlPaymentTo').css('border-color', 'lightgrey');
    }

    if ($('#ddlPaymentMode :selected').val().trim() == "0") {
        $('#ddlPaymentMode').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlPaymentMode').css('border-color', 'lightgrey');
    }

    if ($('#ddlPaymentType :selected').val().trim() == "0") {
        $('#ddlPaymentType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlPaymentType').css('border-color', 'lightgrey');
    }


    if ($('#txtAmount').val().trim() == "") {
        $('#txtAmount').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtAmount').css('border-color', 'lightgrey');
    }
    
    return isValid;
}




