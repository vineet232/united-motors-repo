
$(document).ready(function () {
//    $.ajax({
//        type: "POST", url: "purchasetransactions.aspx/GetAllPaymentMethods",
//        dataType: "json",
//        contentType: "application/json",
//        success: function (res) {
//            $.each(res.d, function (data, value) {

//                $("#ddlPaymentMode").append($("<option></option>").val(value.id).html(value.paymentmethod));
//            })
//        }
//        ,
//        error: function (response) {
//            ///alert(response.responseText);
//            $.notify("BOOM!", "error");
//        }

//    });


$('#ddlPaymentTo').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "purchasetransactions.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlVendors").append($("<option></option>").val(value.id).html(value.vendorname));
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
         endDate: "today"
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
//        url: "purchasetransactions.aspx/GetInvoiceNoByAccountTypeID",
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
 
//// function GetAllVendors()
//// {
//// $("#Showoverlay").show();
//////// $("#ddlPaymentTo").empty();


//// $('#ddlPaymentTo').find('option:not(:first)').remove();
////    $.ajax({
////        type: "POST", url: "purchasetransactions.aspx/GetAllVendorsList",
////        dataType: "json",
////        contentType: "application/json",
////        success: function (res) {
////       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
////            $.each(res.d, function (data, value) {

////                $("#ddlPaymentTo").append($("<option></option>").val(value.id).html(value.vendorname));
////            })
////            $("#Showoverlay").hide();
////        }
////        ,
////        error: function (response) {
////            ///alert(response.responseText);
////            $.notify("BOOM!", "error");
////            $("#Showoverlay").show();
////        }

////    });
//// }

function ddlPurchaseType_SelectedIndexChanged()
 {
     var purchasetypeID = $("#ddlPurchaseType :selected").val();
      var purchasetype = $("#ddlPurchaseType :selected").text();

     /////alert(accounttypeID);
     if(purchasetypeID == 1)
     {
    ///alert(accounttypeID);
        $("#purchaseto").text( "Select " + purchasetype + ":")
        ////document.getElementById('paymentto').innerHTML = 'your tip has been submitted!';
        //document.getElementById('paymentto').textContent = 'Hello \nlcr World!';;

        GetAllVendors();

        ////         $("#divOtherBank").hide();
     }
//////     if(accounttypeID == 2)
//////     {
//////     $("#paymentto").text( "Select " + accounttype + ":")
//////        GetAllEmployees();
//////         $("#divOtherBank").hide();
//////     }
     if(purchasetypeID == 3)
     {
     /////$('#ddlPaymentTo').find('option:not(:first)').remove();
     $("#purchaseto").text( "Select " + purchasetype + ":")
        GetAllCustomers();
////         $("#divOtherBank").hide();
     }
//////     if(accounttypeID == 4)
//////     {
//////     $("#paymentto").text( "Select " + accounttype + ":")
//////        GetAllBanks();
//////        //$("#divOtherBank").show();
//////     }
//////     if(accounttypeID == 5)
//////     {
//////     $("#paymentto").text( "Select " + accounttype + ":")
//////        GetAllGeneralLedgers();
//////        $("#divOtherBank").hide();
//////     }
 }



 function GetAllVendors()
 {
 $("#Showoverlay").show();
//// $("#ddlPaymentTo").empty();


 $('#ddlVendors').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "purchasetransactions.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlVendors").append($("<option></option>").val(value.id).html(value.vendorname));
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
  $('#ddlVendors').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "purchasetransactions.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlVendors").append($("<option></option>").val(value.id).html(value.custname));
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

  /////////////For Searchparameter /////////
function btnResetSearch_Click()
{
   ///// $("#ddlSearchField :selected").val("0");
    $('#ddlSearchField').prop("selectedIndex", 0);
    $("#searchValue").val("");
    BindDataTable();
}
 /////////////End For Searchparameter /////////

$(function () {
    ////$("#Showoverlay").show();
    BindDataTable();
});


function BindDataTable() {

 $('#divuploadfiles').hide();

 $("#tblRecords").dataTable().fnDestroy();

 /////////////For Searchparameter /////////
 var searchDt = 0;

            var searchfield = "";
            var searchvalue = "";

            var searchValue = $("#searchValue").val();
            var searchField = $("#ddlSearchField :selected").val();

            if (searchValue != "") {
                searchfield = searchField;
                searchvalue = searchValue;
                searchDt = 0;
            }

             /////////////End For Searchparameter /////////

 var searchDt = $("#txtDate").val();

 var i = 1;

            $('#tblRecords').DataTable({
                "order": [[0, 'desc']],
               
             bServerSide: true,
             sAjaxSource: 'purchaseTransactionsHandler.ashx/GetPurchaseTransactionData?searchdt=' + searchDt + '&searchfield=' + searchfield + '&searchvalue=' + searchvalue,
                sServerMethod: 'post',
                "processing": true,
                "columns": [
                 { "data": "id" ,
      "render": function(data, type, full, meta) {
        return i++;
      }},

////                    { "data": "accounttype" },
                    { "data": "purchasedt" },
                    { "data": "invoiceslipno" },
                    { "data": "vendorname",
                         render: function ( data, type, row )
                        {
                        return "<div>" + row.vendorname + ' <br/> <p style="color:red; font-size:small;" > (' + row.purchasetypename + ")</p> </div>";

                        }
                     },
                    { "data": "invoicetype" },
                    { "data": "paymentmode" },
                    { "data": "amount"
                        ,
                    render: function ( data, type, row )
                        {
                     return  " <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.amount;
                     }


                     },


                     {
                       "data": "id",

                       "render": function (data, type, row ) {
                           //debugger
                           if(row.uploadedfilename=="")
                           {
                           return '<a href="#" onclick="OpenPartsDetails(' + row.id + ')"><i class="glyphicon glyphicon-plus text-danger" style="font-size:x-large;"></i></a>' + "<br/><br/> <div style='color:blue;'><span ><i class='fa fa-list-alt '></i></span> &nbsp;" + row.totalitems +  "</div>";
                           }
                           else
                           {
                             return '<a href="#" onclick="OpenPartsDetails(' + row.id + ')"><i class="glyphicon glyphicon-plus text-success" style="font-size:x-large;"></i></a>' + "<br/><br/> <div style='color:blue;'><span ><i class='fa fa-list-alt '></i></span> &nbsp;" + row.totalitems +  "</div>";
                           }
                       }


                       }
                       ,

                        {
                       "data": "id",

                       "render": function (data, type, row ) {
                           //debugger
                           if(row.isbillapproved=="0" || row.isbillapproved == null || row.isbillapproved == "")
                           {
                           return   '<a href="#" onclick="ChangeApprovalStatus(' + row.id + ')"><i class="glyphicon glyphicon-remove text-danger" style="font-size:large;">Rejected</i></a>' +   "</div>";
                           }
                           else
                           {
////                            if(row.uploadedfilename=="")
////                            {
////                                return '<a href="#" onclick="OpenPartsDetails(' + row.id + ')"><i class="glyphicon glyphicon-eye-open text-primary" style="font-size:x-large;"></i>Pending</a>' +   "</div>";
////                            }
////                            else
////                             {
                                 return  '<a href="#" onclick="ChangeApprovalStatus(' + row.id + ')"><i class="glyphicon glyphicon-ok text-success" style="font-size:large;">Approved</i></a>' +  "</div>";
                             ////}
                           }
                       }


                       }
                       ,


                    { "data": "ocreatedby",
                        render: function ( data, type, row )
                        {
////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')
                         var billapprovedon = moment(row.billapprovedon).format('DD-MMM-YYYY hh:mm A')


                         return "<div class='text-nowrap'>" + row.ocreatedby + '(' + cdate + ')  <br/>' + row.oupdatedby + '(' + udate + ') <br/><b>Approved/Rejected By:</b> <br/>' + row.billapprovedby + '(' + billapprovedon + ')'  + "</div>";
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
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#" onclick="DeleteRecord('+ id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ],
                 "columnDefs": [
                                { "visible": false, "targets": [0] }
                              ],
                                responsive: true,
                               stateSave: true,
                "bDestroy": true,

                 bPaginate: true,

             "sPaginationType": "input",
            
            dom: 'Bfrtip',

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
   /// alert("1");

   var purchasedt = $('[id*=txtDate]').val();

   var purchasetypeid = $("#ddlPurchaseType :selected").val();
   var purchasetypename = $("#ddlPurchaseType :selected").text(); 

    var vendorid = $("#ddlVendors :selected").val();
    var vendorname = $("#ddlVendors :selected").text(); 
    var invoicetypeid = $("#ddlInvoiceType :selected").val();
    var invoicetype = $("#ddlInvoiceType :selected").text();    
    var invoiceslipno = $('[id*=txtInvoiceSlipNo]').val();
    var paymentmodeid = $("#ddlPaymentMode :selected").val();
    var paymentmode = $("#ddlPaymentMode :selected").text();    
    var amount = $('[id*=txtAmount]').val();
    

   // name = sentenceCase(name);
    var model = {};
    model.purchasedt = purchasedt;
    model.vendorid = vendorid;
    model.vendorname = vendorname;
    model.invoicetypeid = invoicetypeid;
    model.invoicetype = invoicetype;
    model.invoiceslipno = invoiceslipno;
    model.paymentmodeid = paymentmodeid;
    model.paymentmode = paymentmode;
    model.amount = amount;
    model.purchasetypeid=purchasetypeid;
    model.purchasetypename=purchasetypename;
    ////alert(purchasetypeid);

    $.ajax({
        type: "POST",
        url: "purchasetransactions.aspx/SaveRecord",
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
                //$('#myModal').modal('hide');
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
                $.notify("Error!! record  already exists!", "error");
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
    $('#recordoldpurchasedt').val("0");
    $('#recordOldVenID').val("0");
    $('#recordOldVendorName').val("0");
    $('#recordOldInvTypID').val("0");
    $('#recordoldInvoiceType').val("0");
    $('#recordoldInvSlipNo').val("0");
    $('#recordPModeID').val("0");
    $('#recordPaymentMode').val("0");
    $('#recordoldAmt').val("0");
    $('#recordoldPTypeid').val("0");
    $('#recordoldPurchaseTypeName').val("0");

    $.ajax({
        type: "POST",
        url: "purchasetransactions.aspx/GetRecordbyID",
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



                ////// alert(result.d);

                $('#recordID').val(json[0].id);
               $('#recordoldpurchasedt').val(json[0].purchasedt);
                $('#recordOldVenID').val(json[0].vendorid);
                $('#recordOldVendorName').val(json[0].vendorname);
                $('#recordOldInvTypID').val(json[0].invoicetypeid);
                $('#recordoldInvoiceType').val(json[0].invoicetype);
                $('#recordoldInvSlipNo').val(json[0].invoiceslipno);
                $('#recordPModeID').val(json[0].paymentmodeid);
                $('#recordPaymentMode').val(json[0].paymentmode);
                $('#recordoldAmt').val(json[0].amount);
                 $('#recordoldPTypeid').val(json[0].purchasetypeid);
                $('#recordoldPurchaseTypeName').val(json[0].purchasetypename);
                ///var mydate = new Date(json[0].duedate.substring(0, 10));
                var purchasedt = new Date(json[0].purchasedt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
               
               
                                
                if(json[0].purchasetypeid == 1)
                {
               
                     GetSelectedVendor(json[0].vendorid);
                    $("#purchaseto").text( "Select Vendor :")
                   GetSelectedPurchaseType(1);

                 }

                 if(json[0].purchasetypeid == 3)
                 {
                 
                    GetSelectedCustomer(json[0].vendorid);
                    $("#purchaseto").text( "Select Customer :")
                    GetSelectedPurchaseType(3);
                 }


                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
                $('#txtDate').val(purchasedt);
                $('#ddlVendors').val(json[0].vendorid);
                $('#ddlInvoiceType').val(json[0].invoicetypeid);
                $('#txtInvoiceSlipNo').val(json[0].invoiceslipno);
                $("#ddlPaymentMode").val(json[0].paymentmodeid);    
                $("#txtAmount").val(json[0].amount);
                

                $("#lblMessage").html("");
                 $('#divuploadfiles').show();

                 /////alert(json[0].uploadedfilename);
                 if(json[0].uploadedfilename!="" )
                 {
                   ////return  <input type="button" value="Download" onclick="DownloadFile("+ json[0].id + ")" />
                   $("#hdnviewfileid").val(json[0].id);
                    $('#btnviewfile').show();
                 }
                if(json[0].uploadedfilename === null)
                 {
                    ////alert("hide");
                    $("#hdnviewfileid").val("0");
                    $('#btnviewfile').hide();
                 }

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


function GetSelectedPurchaseType(id)
{
   $('#ddlPurchaseType').val( id);
}



function GetSelectedVendor(id)
{
$("#Showoverlay").show();
//// $("#ddlPaymentTo").empty();


 $('#ddlVendors').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "purchasetransactions.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
       ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlVendors").append($("<option></option>").val(value.id).html(value.vendorname));
            })
            $('#ddlVendors').val( id);
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

    $('#ddlVendors').find('option:not(:first)').remove();
 $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "purchasetransactions.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlVendors").append($("<option></option>").val(value.id).html(value.custname));
            })

            $('#ddlVendors').val( id);

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

   var purchasedt = $('[id*=txtDate]').val();
    var vendorid = $("#ddlVendors :selected").val();
    var vendorname = $("#ddlVendors :selected").text();       
    var invoicetypeid = $("#ddlInvoiceType :selected").val();
    var invoicetype = $("#ddlInvoiceType :selected").text();
    var invoiceslipno = $('[id*=txtInvoiceSlipNo]').val();
    var paymentmodeid = $("#ddlPaymentMode :selected").val();
    var paymentmode = $("#ddlPaymentMode :selected").text(); 
    var amount = $('[id*=txtAmount]').val();

    var purchasetypeid = $("#ddlPurchaseType :selected").val();
   var purchasetypename = $("#ddlPurchaseType :selected").text();

    /////var oldpaymentdt = $('[id*=recordpaymenttransactionid]').val();
    var oldpurchasedt = $('[id*=recordoldpurchasedt]').val();
    var oldvendorid = $('[id*=recordOldVenID]').val();
    var oldvendorname = $('[id*=recordOldVendorName]').val();
    var oldinvoicetypeid = $('[id*=recordOldInvTypID]').val();
    var oldinvoicetype = $('[id*=recordoldInvoiceType]').val();
    var oldinvoiceslipno = $('[id*=recordoldInvSlipNo]').val();
    var oldpaymentmodeid = $('[id*=recordPModeID]').val();
    var oldpaymentmode = $('[id*=recordPaymentMode]').val();
    var oldamount = $('[id*=recordoldAmt]').val();
     var oldpurchasetypeid = $('[id*=recordoldPTypeid]').val();
    var oldpurchasetypename = $('[id*=recordoldPurchaseTypeName]').val();
    
    ////name = sentenceCase(name);
    if (id > 0) {
        /////alert(id);
    var model = {};
    model.id = id;
    model.purchasedt = purchasedt;
    model.vendorid = vendorid;
    model.vendorname = vendorname;
    model.invoicetypeid = invoicetypeid;
    model.invoicetype = invoicetype;
    model.invoiceslipno = invoiceslipno;
    model.paymentmodeid = paymentmodeid;
    model.paymentmode = paymentmode;
    model.amount = amount;

     

    model.purchasetypeid=purchasetypeid;
    model.purchasetypename=purchasetypename;
   
  

    model.oldpurchasedt = oldpurchasedt;
    model.oldvendorid = oldvendorid;
    model.oldvendorname = oldvendorname;
    model.oldinvoicetypeid = oldinvoicetypeid;
    model.oldinvoicetype = oldinvoicetype;
    model.oldinvoiceslipno = oldinvoiceslipno;
    model.oldpaymentmodeid = oldpaymentmodeid;
    model.oldpaymentmode = oldpaymentmode;
    model.oldamount = oldamount;
      model.oldpurchasetypeid=oldpurchasetypeid;
    model.oldpurchasetypename=oldpurchasetypename;

       ///// alert(JSON.stringify(model));
        $.ajax({
            type: "POST",
            url: "purchasetransactions.aspx/UpdateRecord",
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
                    ////$('#myModal').modal('hide');
                   //// $('#recordID').val("0");
                    ////$.notify(r.d, "success");
                    $.notify("Record updated!", "success");
                    clearTextBox();
                    BindDataTable();

    $('#recordID').val("0");
    $('#recordoldpurchasedt').val("0");
    $('#recordOldVenID').val("0");
    $('#recordOldVendorName').val("0");
    $('#recordOldInvTypID').val("0");
    $('#recordoldInvoiceType').val("0");
    $('#recordoldInvSlipNo').val("0");
    $('#recordPModeID').val("0");
    $('#recordPaymentMode').val("0");
    $('#recordoldAmt').val("0");
     $('#recordoldPTypeid').val("0");
    $('#recordoldPurchaseTypeName').val("0");
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


//const myArray = empdata.split(",");
//    let id = myArray[1];
//    let accounttypeid = myArray[0];

//     var model = {};
//    model.id = id;
//    model.accounttypeid=accounttypeid;

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "purchasetransactions.aspx/DeleteRecord",
           data: '{ id :' + id + '}',
           
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not deleted!", "error");
                ////$('[id*=txtMobile]').focus();
                return;
            }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                }
                if (r.d == 11) {
                    $.notify("Error!! cannot delete! data exists under this record", "error");
                    return;

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

 // $('#ddlServiceAdvisor').prop("selectedIndex", 0).trigger('change');

 $('#ddlAccountType').prop("selectedIndex", 0);
 $('#ddlPaymentTo').prop("selectedIndex", 0);
 $('#ddlPaymentMode').prop("selectedIndex", 0);
    $('#ddlVendors').prop("selectedIndex", 0).trigger('change');

    $('#ddlInvoiceType').prop("selectedIndex", 0);
    $('#txtInvoiceSlipNo').val("");

     $('#ddlPurchaseType').prop("selectedIndex", 0);

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

   $('#ddlVendors').prop("selectedIndex", 0).trigger('change');

   

     $('#ddlPurchaseType').prop("selectedIndex", 0);

///// $('#ddlVendors').prop("selectedIndex", 0);
 $('#ddlInvoiceType').prop("selectedIndex", 0);
 $('#ddlPaymentMode').prop("selectedIndex", 0);
 $('#txtAmount').val("");
 $('#txtInvoiceSlipNo').val("");
        

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtDate').css('border-color', 'lightgrey');
    $('#txtAmount').css('border-color', 'lightgrey');
    $('#txtInvoiceSlipNo').css('border-color', 'lightgrey');

    $('#ddlVendors').css('border-color', 'lightgrey');
    $('#ddlInvoiceType').css('border-color', 'lightgrey');
    $('#ddlPaymentMode').css('border-color', 'lightgrey');

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

    if ($('#ddlVendors :selected').val().trim() == "0") {
        $('#ddlVendors').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlVendors').css('border-color', 'lightgrey');
    }

    if ($('#ddlInvoiceType :selected').val().trim() == "0") {
        $('#ddlInvoiceType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlInvoiceType').css('border-color', 'lightgrey');
    }

     if ($('#txtInvoiceSlipNo').val().trim() == "") {
        $('#txtInvoiceSlipNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtInvoiceSlipNo').css('border-color', 'lightgrey');
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
    
    return isValid;
}


function ChangeApprovalStatus(id)
{
     $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "purchasetransactions.aspx/UpdateReportStatus",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not updated!", "error");
                return;
            }

                    $("#Showoverlay").hide();
                    BindDataTable();
                    $.notify("Record udpated!", "success");
              
            },
            error: function (errormessage) {
                $.notify("Error while updating data!", "error");
            }

        });
        $("#Showoverlay").hide();  
}




////////////////////////slip details/////////////////


function OpenPartsDetails(id)
{

      $('#myPartsModal').modal('show');
//         $('#txtDSlipNo').html(challanno); 
//         $('#txtDVehNo').html(vehno); 
//         $('#txtDCustomerName').html(customername);
         
         $('#txtPartNo').removeAttr("disabled"); 
         $('#txtParticulars').val("");
         $('#txtQuantity').val("");
         $('#txtRate').val("");
         $('#txtPurchasePrice').val("");
         $('#txtDiscountCode').val("");
         $('#txtremarks').val("");
         $('#txtPartNo').val("");
         $('#txtPartNo').val("");

          $("#txtitemoldprice").val("");
          $("#txtlastvendorname").val("");
          $("#txtlastinvoiceno").val("");

          $('#btnUpdateDetails').hide();
                $('#btnAddNewDetails').show();

                $("#purchaseID").val(id);
         BindDataTableDetails(id)
}



   function BindDataTableDetails(id) {
  
 

  ////$('#btnUpdateDetails').hide();

    $("#Showoverlay2").show();
    $.ajax({
        type: "POST",
        url: "purchasetransactions.aspx/GetAllPartsByID",
       data: '{purchaseid : ' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblRecordDetails").dataTable().fnDestroy();
            var json = JSON.parse(data.d)
            var totalamt=0;
            var totalPurchases=0;
             var totalPurchaseQty=0;

            var tpamt=0;
            var rows = '';
            $('#tblRecordDetails tbody').empty();
            var srno = 0;
            $.each(json, function (key, item) {
                srno += 1;

                tpamt=item.purchaseprice * item.qty ; 
                ////alert(item.totalamount);
                totalamt+=  item.totalamount;
                totalPurchases += tpamt;

                totalPurchaseQty+=item.qty
                ////alert(item.purchaseprice);

               //// alert(totalamt);
////                var status = item.isactive;
////                if (status == "1") {
////                    //status = "Active";
////                    //onclick="updateattendancestatus(' + row.id + ')"
////                    status = '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
////                }
////                else {
////                    //status = "Inactive";
////                    //onclick="updateattendancestatus(' + row.id + ')"
////                    status = '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
////                }

            

////                var opbalDt="";
////                if(item.openingbaldate !=null)
////                {
////               opbalDt =  new Date(item.openingbaldate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
////              }
              

                rows += "<tr>" +
//               "<td>" + item.id + "</td>" +

                "<td>" + srno + "</td>" +
                 "<td>" + item.partno + ' ' +
                    "</td>" 
                    +

                "<td>" + item.particulars + ' ' +
                    "</td>" 
                    +

                    "<td>" + item.uom + ' ' +
                    "</td>" +

                    "<td>" + item.qty + ' ' +
                    "</td>" +
                     "<td>" + item.purchaseprice + ' ' +
                    "</td>" +

                     "<td>" + item.rate + ' ' + "</td>"  +

                      "<td>" +   item.discountpercentage + ' ' +


                    "</td>" +

                     "<td>" + item.discountcode + ' ' + "</td>"  +

                      "<td>" + item.totalamount + ' ' + "</td>"  +

                       "<td>" + item.remarks + ' ' + "</td>"  +
                      

                    "<td>" +
                       


                          item.createdby + ' (' + moment(item.createdon).format('DD-MMM-YYYY hh:mm A') + ')  <br/>' + item.updatedby + ' (' + moment(item.updatedon).format('DD-MMM-YYYY hh:mm A') + ')' 
                       
                     + ' ' + "</td>"  +



                      "<td>" + " <input type='button' id='btnEditDetails'  onclick='EditRecordbyIDDetails(" + item.id + ")' value='Edit' class='btn btn-primary'>" + ' ' + "</td>" +

                       "<td>" +
                       '<input type="button" id="btnDelete" onclick="DeleteRecordDetails(\'' + item.id + ',' + item.qty +  ',' + item.partno +   ',' + item.qty + '\'\)"  value="Delete" class="btn btn-danger" /> '
                        
                        
                         +  "</td>"

                      //// return '<a href="#" onclick="OpenChallanDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="glyphicon glyphicon-plus text-primary" style="font-size:x-large;"></i> </a>';
                          

                       ////////onclick="OpenChallanDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">
                       
//                    " <input type='button' id='btnEditDetails'  onclick='EditRecordbyIDDetails(" + item.id + ")' value='Edit' class='btn btn-primary'>  </td>" +

//                    "<td>" + 
//                     " <input type='button' id='btnDelete'  onclick='DeleteRecordDetails(" + item.id + ")' value='Delete' class='btn btn-danger'>  </td>"+
                    + "</tr>";
            });
           
            $('#tblRecordDetails tbody').append(rows);

            $('#txtTotalAmt').val(totalamt);
             $('#txtTotalPurchasePrice').val(totalPurchases.toFixed(2));
               $('#txttotalpurchasedqty').val(totalPurchaseQty.toFixed(2));
             
            // Apply DataTable Plugin.
            table = $('[id*=tblRecordDetails]').DataTable({
                "order": [[0, "asc"]],
                 bSortable: false,
                "columnDefs": [
                                { "visible": false, "targets": [] }
                              ],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "paging": true,
                "info": true,
                'processing': true,
                responsive: true,
                fnInitComplete: function () {
                    $("#Showoverlay2").hide();
                }
            });
        },
        failure: function (response) {
            // alert(response.responseText);
            $.notify("BOOM!", "error");
        },
        error: function (response) {
            ///alert(response.responseText);

            $.notify("BOOM!", "error");
        }
    });
}

 function GetPartDetailsbyPartNo()
 {
    var partNo= $('#txtPartNo').val();
   ///// alert(partNo);

   
    var model = {};
        model.partno = partNo;

    $("#Showoverlay").show();
     $.ajax({
         type: "POST",
         url: "purchasetransactions.aspx/GetPartDescByPartNo",
       ////  data: '{ partno :' + partNo + '}',
       data: '{ model :' + JSON.stringify(model) + '}',
         dataType: "json",
         contentType: "application/json",
         success: function (res) {
      ////// alert( JSON.stringify(res.d));
        
         /// $("#txtParticulars").val(JSON.parse(res.d));
        ////alert(res.d);

         if(JSON.parse(res.d)=="invalid partno")
         {
            $.notify("Invalid part no!", "error");
            $('#txtPartNo').val("");
         }
         else{
                 var json = JSON.parse(res.d);
                /////alert(json[0].partdesc);
                $("#txtParticulars").val(json[0].partdesc);
                $("#txtRate").val(json[0].umrp);
                ////////alert(json[0].discountcode);
                $("#txtDiscountCode").val(json[0].discountcode);

               
         }
         }
        ,
         error: function (response) {
             alert(response.responseText);
             $.notify("BOOM!", "error");
         }

     });
     $("#Showoverlay").hide();
 }


   function AddRecordDetails() {
    

    $('#hdnOldQty').val("0") 

     

//    if ($('#txtPartNo').val().trim() == "") {
//        $('#txtPartNo').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtPartNo').css('border-color', 'lightgrey');
//    }

//     

//    if ($('#txtParticulars').val().trim() == "") {
//        $('#txtParticulars').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtParticulars').css('border-color', 'lightgrey');
//    }

    if ($('#txtQuantity').val().trim() == "") {
        $('#txtQuantity').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtQuantity').css('border-color', 'lightgrey');
    }

//    if ($('#txtRate').val().trim() == "") {
//        $('#txtRate').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtRate').css('border-color', 'lightgrey');
//    }


//     if ($('#txtPurchasePrice').val().trim() == "") {
//        $('#txtPurchasePrice').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtPurchasePrice').css('border-color', 'lightgrey');
//    }
    
    
    


    //var id = table.rows()[0].length + 1;
   //// $("#addDetailsSlipNo").val("0");

     

   var purchaseid =  $("#purchaseID").val();

   /////alert(purchaseid);

     var partno = $('[id*=txtPartNo]').val();
    var particulars = $('[id*=txtParticulars]').val();
    var qty = $('[id*=txtQuantity]').val();
    var rate = $('[id*=txtRate]').val();
   
    var uomid = $("#ddlUom :selected").val();
    var uom = $("#ddlUom :selected").text();
    var purchaseprice = $('[id*=txtPurchasePrice]').val(); 
    var discountpercentage = $('[id*=txtDiscountPercentage]').val();

    var discountcode= $('[id*=txtDiscountCode]').val();
    var remarks= $('[id*=txtremarks]').val();

//    var tamt = parseFloat(qty)*parseFloat(rate);

//    $("#txtTotalAmount").val(tamt);

//    var isactive = "";
//    if ($('#chkStatus').prop('checked')) {
//        isactive = "1";
//    } else {
//        isactive = "0";
//    }

    if(qty<0)
    {
         $.notify("Error!! qty must be greater than 0!!", "error");
    }

   // name = sentenceCase(name);
    var model = {};
   ///// var challanno= $('#txtDSlipNo').html();
    
    model.purchaseid = purchaseid;
    model.partno=partno;
    model.particulars = particulars;
    model.uomid = uomid;
    model.uom = uom;
    model.qty = qty;
    model.rate = rate;
    model.purchaseprice=purchaseprice;
    model.discountpercentage=discountpercentage;
    model.discountcode=discountcode;
    model.remarks=remarks;
    

    $.ajax({
        type: "POST",
        url: "purchasetransactions.aspx/SaveRecordDetails",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {

       //// alert(r.d);
        if(r.d=="99")
        {
             $.notify("Error!! part no already exists in this invoice no!!", "error");
             return;
        }
        else
        {
       const myArray = r.d.split(">");
       
       var result=myArray[0];
       var oldprice=myArray[1];

        var lastvendname=myArray[2];
        var lastinvno=myArray[3];

       
       ////alert("r"+ result + "price" + oldprice);

       $("#txtitemoldprice").val("Last purchased price was: (Rs.) " + oldprice + "      ");
       $("#txtlastvendorname").val("Last Vendor name was: (Rs.) " + lastvendname + "      ");
       $("#txtlastinvoiceno").val("Last Invoice No was: (Rs.) " + lastinvno + "      ");

       

            if (result == 0) {
                $.notify("Error!! Record not saved!", "error");
                ////$('[id*=txtName]').focus();
                ////$('#myModal').modal('show');
                return;
            }
            if (result == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
             if (result == 90) {
                $.notify("Error!! Entered qty not available!!", "error");
                $('[id*=txtQuantity]').focus();
                return;
            }
            else {
                if ( result == 30 ) {                    
                    if (result == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
                        ////$('[id*=txtName]').focus();
                       // $('#myModal').modal('show');
                        return;
                    }
                }
                else {
                    
                  /////  $('#myModal').modal('hide');

                    $.notify("Record saved!", "success");
                     $('#txtPartNo').val("");
                  $('#txtParticulars').val("");
                 $('#txtQuantity').val("");
                 $('#txtRate').val("");
                  $('#txtPurchasePrice').val("");
                 $('#txtDiscountCode').val("");

                    BindDataTableDetails(purchaseid);
                    BindDataTable();
                }
            }
            }
        }
            ,
        error: function (errormessage) {
            ///////alert(errormessage.responseText);
            if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                //alert("Error!! model name already exists!!");
                $.notify("Error!! mobile no already exists!", "error");
            }
            else {
                //alert("Error while saving data!!");
                $.notify("Error while saving data!", "error");
            }
        }
    });
}


function EditRecordbyIDDetails(id) {
    ////alert(id);
    //// var challanno= $('#txtDSlipNo').html();

    var purchaseid =  $("#purchaseID").val();

    $.ajax({
        type: "POST",
        url: "purchasetransactions.aspx/GetRecordbyIDDetails",
        data: '{ id :' + id + ', purchaseid: ' + purchaseid + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {

             var json = JSON.parse(result.d);
             //////alert(json);
                
                $('#recordID').val(json[0].id);
               //  $('#txtSlipNo').val(json[0].slipno);

//                 if(json[0].slipdate != null)
//                 {
//                   ////slipdate = new Date(json[0].slipdate.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });

//                    var slipdate = moment(json[0].slipdate).format('MM-DD-YYYY')

//                 }

                
                $('#btnAddNewDetails').hide();
                 $('#btnUpdateDetails').show();

                  $('#txtPartNo').val(json[0].partno);
                  $('#txtParticulars').val(json[0].particulars);
                $('#txtQuantity').val(json[0].qty);
                 $('#txtPurchasePrice').val(json[0].purchaseprice); 
                $('#txtRate').val(json[0].rate);               
                $("#ddlUom").val(json[0].uomid);
                 $('#hdnOldQty').val(json[0].qty) ;
                  $('#txtDiscountPercentage').val(json[0].discountpercentage);
                  $('#txtDiscountCode').val(json[0].discountcode);
                   $('#txtremarks').val(json[0].remarks);
//                $('#myModal').modal('show');
//                $('#myModal').on('shown.bs.modal', function () {
//                    $('#txtName').focus();
//                });


            $('#txtPartNo').attr("disabled", "disabled"); 
               
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });
}

////function for updating record
function UpdateRecordDetails() {

 

// if ($('#txtPartNo').val().trim() == "") {
//        $('#txtPartNo').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtPartNo').css('border-color', 'lightgrey');
//    }

//    if ($('#txtParticulars').val().trim() == "") {
//        $('#txtParticulars').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtParticulars').css('border-color', 'lightgrey');
//    }

//    if ($('#txtQuantity').val().trim() == "") {
//        $('#txtQuantity').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtQuantity').css('border-color', 'lightgrey');
//    }

//    if ($('#txtRate').val().trim() == "") {
//        $('#txtRate').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtRate').css('border-color', 'lightgrey');
//    }

//    if ($('#txtPurchasePrice').val().trim() == "") {
//        $('#txtPurchasePrice').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtPurchasePrice').css('border-color', 'lightgrey');
//    }



 ///alert(purchaseid);

    var discountpercentage = $('[id*=txtDiscountPercentage]').val();


    var id = $('[id*=recordID]').val();
    ////alert(id);
    var partno = $('[id*=txtPartNo]').val();
  var particulars = $('[id*=txtParticulars]').val();
    var qty = $('[id*=txtQuantity]').val();
    var rate = $('[id*=txtRate]').val();
   var purchaseprice=  $('[id*=txtPurchasePrice]').val(); 
    var uomid = $("#ddlUom :selected").val();
    var uom = $("#ddlUom :selected").text();
   
    var purchaseid =  $("#purchaseID").val();

    var discountcode= $('[id*=txtDiscountCode]').val();
    var remarks= $('[id*=txtremarks]').val();
////    var isactive = "";
////    if ($('#chkStatus').prop('checked')) {
////        isactive = "1";
////    } else {
////        isactive = "0";
////    }
    ////name = sentenceCase(name);


    if(qty<=0)
    {
         $.notify("Error!! qty must be greater than 0!!", "error");
    }


    if (id > 0) {
   
        var model = {};
    model.id=id;
    model.purchaseid=purchaseid;
  //// var challanno= $('#txtDSlipNo').html();
    
  //  model.challanno = challanno;
 
    model.partno=partno;
    model.particulars = particulars;
    model.uomid = uomid;
    model.uom = uom;
    model.qty = qty;
    model.purchaseprice=purchaseprice;
    model.rate = rate;
    model.oldqty=$('#hdnOldQty').val();
     model.discountpercentage=discountpercentage;
     model.discountcode=discountcode;
     model.remarks=remarks;

    /////alert(paymentmode + modelname + status);

    

        $.ajax({
            type: "POST",
            url: "purchasetransactions.aspx/UpdateRecordDetails",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Record not updated!", "error");
                    $('[id*=txtCustomerName]').focus();
                    return;
                }
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50 || r.d == 90) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! name already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
                        return;
                    }
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtMobileNo]').focus();
                        return;
                    }
                    if (r.d == 90) {
                        $.notify("Error!! Entered qty not available!!", "error");
                        $('[id*=txtQuantity]').focus();
                        return;
                      }

                }
                else {
                    $('#recordID').val('0');
                    /////$('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAddNew').show();

                    $('#txtPartNo').val("");
                 $('#txtParticulars').val("");
                 $('#txtQuantity').val("");
                 $('#txtRate').val("");
                  $('#txtPurchasePrice').val("");
                 $('#txtDiscountCode').val("");
                  $('#btnAddNewDetails').show();
                 $('#btnUpdateDetails').hide();
                    BindDataTableDetails(purchaseid);
                    $.notify("Record updated!", "success");
                    $('#hdnOldQty').val("0");
                     BindDataTable();
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! already exists!", "error");
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

 


function DeleteRecordDetails(empdata) {


const myArray = empdata.split(",");
    
    let id = myArray[0];
    let qty = myArray[1];
     let partno = myArray[2];
     
   var purchaseid =  $("#purchaseID").val();

    if (confirm('Are you sure delete this record?')) {
//////        var data = table.row($(this).parents('tr')).data();
//////        table.row($(this).parents('tr')).remove().draw();

 ////var challanno =  $('#txtDSlipNo').val();

        var model = {};
         model.id = id;
        model.qty = qty;  
        model.partno=partno;
        model.purchaseid=purchaseid;

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "purchasetransactions.aspx/DeleteRecordDetails",
            //////data: '{ id :' + id + '}',
             data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {

           
                if (r.d == 0) {
                    $.notify("Error!! Record not deleted!", "error");
                    $('[id*=txtName]').focus();
                    return;
                }
                 

                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                    return;

                }
                 if (r.d == 99) {
                    $.notify("Error!! unable to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    BindDataTableDetails(purchaseid);
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




 function  btnUploadFile()
     {
 
        var id = $('[id*=recordID]').val();
        /////alert(id);
        //                                                            if (id != "0") {
        var fileUpload = $("#postedFile").get(0);
        var files = fileUpload.files;
        if (files.length == 0) {
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> please select a .pdf file to uplod  </b> ");
            return;
        }
        var docVal = fileUpload.value;
        var extension = docVal.substring(docVal.lastIndexOf(".") + 1, docVal.length);
       ///// alert(extension.toLowerCase());
        if (extension.toLowerCase() != 'pdf' && extension.toLowerCase() != 'doc' && extension.toLowerCase() != 'docx' && extension.toLowerCase() != 'xls' && extension.toLowerCase() != 'xlsx') {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> only .pdf/word/excel file is allowed  </b> ");
            return;
        }

         ////var omobileno = $('[id*=txtMobileNo]').val();

        if (typeof ($("#postedFile")[0].files) != "undefined") {
            var size = parseFloat($("#postedFile")[0].files[0].size / 1024).toFixed(2);
            ////alert(size + " KB.");
            if (size <= 5000) {
                $.ajax({
                   ////// url: 'InsuranceClaimsPolicyUploadHandler.ashx?claimid=' + id+'&mobileno=' + omobileno,
                    url: 'PurchaseTransactionsBillUploadHandler.ashx?pid=' + id ,
                    type: 'POST',
                    data: new FormData($('form')[0]),
                    //  data: '{"ItemSelected=" ' + new FormData($('form')[0]) + ', "ID="',
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (file) {
                        $("#fileProgress").hide();
                        $("#lblMessage").css('color', 'green');
                        $("#lblMessage").html("<b>" + file.name + "</b> has been uploaded.");
                        if (id != "0") {
                            GetUploadedFiles(id);
                        }
                        else {
                                                                               
                            $('#hiddenFileName').val(file.name);
                                                                               
                        }
                    },

                    xhr: function () {
                        var fileXhr = $.ajaxSettings.xhr();
                        if (fileXhr.upload) {
                            $("progress").show();
                            fileXhr.upload.addEventListener("progress", function (e) {
                                if (e.lengthComputable) {
                                    $("#fileProgress").attr({
                                        value: e.loaded,
                                        max: e.total
                                    });
                                }
                            }, false);
                        }
                        return fileXhr;
                    },
                    error: function (file) {
                        $("#lblMessage").css('color', 'red');
                        $("#lblMessage").html("<b> " + file.name + " </b> ");

                    }
                });
            }
            else {
                //alert("Please upload file upto 5MB");
                $("#lblMessage").css('color', 'red');
                $("#lblMessage").html("<b> Please upload file upto 5MB  </b> ");
                return;
            }
        } else {
            //alert("This browser does not support HTML5.");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> This browser does not support HTML5.  </b> ");
            return;
        }

       

    }







     function DownloadFile() {
     var id=$("#hdnviewfileid").val();
        $.ajax({
            type: "POST",
        url: "purchasetransactions.aspx/ConvertToPdfAndDownload",
        data: '{id: "' + id + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                //Convert Base64 string to Byte Array.
                

                var text=r.d;
                const myArray = text.split("<");
               /// alert(myArray[0]);
                /// alert(myArray[1]);
                 var bytes = Base64ToBytes(myArray[1]);
                 var fileName=myArray[0];

                  //////////////////To open in new tab blob as pdf file ////////////////
                  var file = new Blob([bytes], {type: 'application/pdf'});
       var fileURL = URL.createObjectURL(file);
       window.open(fileURL);

        //////////////////To open in new tab blob as pdf file ////////////////
 

 //////////////////To download blob as pdf file ////////////////
                ///////Convert Byte Array to BLOB.
//                var blob = new Blob([bytes], { type: "application/octetstream" });
// 
//                //Check the Browser type and download the File.
//                var isIE = false || !!document.documentMode;
//                if (isIE) {
//                    window.navigator.msSaveBlob(blob, fileName);
//                } else {
//                    var url = window.URL || window.webkitURL;
//                    link = url.createObjectURL(blob);

//                    var a = $("<a />");
//                    /////a.attr("download", fileName);
//                    a.attr("href", link);
//                    $("body").append(a);
//                    a[0].click();
//                    $("body").remove(a);
//                }

 //////////////////end To download blob as pdf file ////////////////
            }
        });
    };
    function Base64ToBytes(base64) {
        var s = window.atob(base64);
        var bytes = new Uint8Array(s.length);
        for (var i = 0; i < s.length; i++) {
            bytes[i] = s.charCodeAt(i);
        }
        return bytes;
    };



    


