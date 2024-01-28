
$(document).ready(function () {

$("#ddlModel").select2();


    $.ajax({
        type: "POST", url: "saleTransactionDetailsFitnessCertificate.aspx/GetAllCustomers",
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


     $.ajax({
        type: "POST", url: "policyrenewal.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
            })

          ////// $("#ddlModel").select2();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });


     GetInvoiceNo(7);

   /// GetInvoiceNo(3);



        $('#txtInvoiceDate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });

         $('#txtinsduedate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });

         $('#txtfitnessduedate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });




        

        
         $('#txtSearchtoDate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });


    //    var date = new Date();
    //  var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
    //$('#txtInvoiceDate').datepicker('update', new Date(Date.parse(today)));

   ///GetCurrentDate();

    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = mm + '/' + dd + '/' + yyyy;
    $('#txtInvoiceDate').val(today);


})


function GetSelectedModelbyid(modelid)
 {
 $('#ddlModel').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
       type: "POST", url: "policyrenewal.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
                 $("#ddlModelDisplay").append($("<option></option>").val(value.id).html(value.Name));
            })
         $('#ddlModel').val(modelid);
          $('#ddlModelDisplay').val(modelid);
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


//function GetInvoiceNo() {
//    $.ajax({
//        type: "POST",
//        url: "saleTransactionDetailsFitnessCertificate.aspx/GetInvoiceNoByAccountTypeID",
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
    //// GetInvoiceNo(accounttypeID);
 }

 function GetInvoiceNo(accounttypeid) {
 /////alert(accounttypeid);

 var invNo ="0";

     var accounttype = $("#ddlInvoiceType :selected").text();
     $("#Showoverlay").show();
     $.ajax({
         type: "POST",
         url: "saleTransactionDetailsFitnessCertificate.aspx/GetInvoiceNoByAccountTypeID",
         data: '{ accountTypeID :' + accounttypeid + '}',
         dataType: "json",
         contentType: "application/json",
         success: function (res) {
             ////var invNo = accounttype.substring(0, 4).toUpperCase() +"-" + JSON.stringify(res.d)

             ////var invNo = "HR222R220400000" + JSON.stringify(res.d)

             const d = new Date();
            let month = d.getMonth() + 1;

             let year = d.getFullYear().toString().substr(-2) ;

            var monthval="";
////            let length = month.length;
////            alert(length);
            if(month.toString().length<2)
            {
                monthval="0"+month;
            }
            else
            {
                monthval=month;
            }
           ///// alert("y" + year);


             var myNumber=JSON.stringify(res.d);
            ////// alert(myNumber);

             $("#recordFitnessNo").val(myNumber);

                if(myNumber.toString().length < 2)
                {
                    ////invNo = "HR222R220400000"  + JSON.stringify(res.d)
                    invNo = "HR222R" + year + monthval +"00000"  + JSON.stringify(res.d)
                }
                 if(myNumber.toString().length >= 2 && myNumber.toString().length < 3)
                {
                    ///invNo = "HR222R22040000"  + JSON.stringify(res.d)

                     invNo = "HR222R"+ year + monthval +"0000"  + JSON.stringify(res.d)

                }
                if(myNumber.toString().length >= 3 && myNumber.toString().length < 4)
                {
                    ///invNo = "HR222R2204000"  + JSON.stringify(res.d)

                     invNo = "HR222R"+ year + monthval +"000"  + JSON.stringify(res.d)

                }
                if(myNumber.toString().length >= 4 && myNumber.toString().length < 5)
                {
                    ////invNo = "HR222R220400"  + JSON.stringify(res.d)

                    invNo = "HR222R"+ year + monthval +"00"  + JSON.stringify(res.d)
                }
                 if(myNumber.toString().length >= 5 && myNumber.toString().length < 6)
                {
                   /// invNo = "HR222R22040"  + JSON.stringify(res.d)
                   invNo = "HR222R" + year + monthval +"0"  + JSON.stringify(res.d)
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
     $("#Showoverlay").hide();
 }

//// function GetVendorsByAccountTypeID(accounttypeid) {
////    
////     $("#Showoverlay").show();
////     $.ajax({
////         type: "POST",
////         url: "saleTransactionDetailsFitnessCertificate.aspx/GetVendorsByAccountTypeID",
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
////         url: "saleTransactionDetailsFitnessCertificate.aspx/GetCustomersByAccountTypeID",
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
        type: "POST", url: "saleTransactionDetailsFitnessCertificate.aspx/GetAllVendorsList",
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
        type: "POST", url: "saleTransactionDetailsFitnessCertificate.aspx/GetAllEmployeesList",
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
        type: "POST", url: "saleTransactionDetailsFitnessCertificate.aspx/GetAllCustomersList",
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
        type: "POST", url: "saleTransactionDetailsFitnessCertificate.aspx/GetAllGeneralLedgersList",
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
      $("#txtSearchtoDate").val("");
    BindDataTable();
}

function BindDataTable() {

 $("#tblRecords").dataTable().fnDestroy();
  

  //////////////////For Search Field and value ///////////////////////
             var searchfield = "";
            var searchvalue = "";
            var searchvalue2 = "";

            var searchValue = $("#searchValue").val();
            var searchValue2 = $("#txtSearchtoDate").val();
            var searchField = $("#ddlSearchField :selected").val();

           if ( searchField != "0") {

                if (searchValue == "")
                {
                 $.notify("Please enter search criteria!", "error");
                 $("#searchValue").focus();
                 return;
                }

                 if(searchValue2=="" )
                {
                    searchValue2=searchvalue;
                }

                searchfield = searchField;
                searchvalue = searchValue;
                searchvalue2 = searchValue2;

               
                searchDt = 0;
            }

            //////////////////End For Search Field and value ///////////////////////

           
 ////var i = 1;

            $('#tblRecords').DataTable({
                "order": [[1, 'desc']],
               
             bServerSide: true,
             sAjaxSource: 'SaleTransactionDetailsFitnessCertificate.ashx/GetFitnessTransactionDetailsCustomersData?searchfield=' + searchfield + '&searchvalue=' + searchvalue + '&searchvalue2=' + searchvalue2 ,
                sServerMethod: 'post',
                "processing": true,
                "columns": [
                 { "data": "id" ,


"render": function (data, type, row, meta) {
        return meta.row + meta.settings._iDisplayStart + 1;
        }

},

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
                    

                     { "data": "id",
                       "render": function (id, type, full, meta) {
                           //debugger
                           return '<a href="#" onclick="ShowFitnessSlipDetails(' + id + ')"><i class="glyphicon glyphicon-eye-open text-primary" style="font-size:x-large;"></i></a>'
                       } },

                     {
                       "data": "id",
                       "render": function (data, type, row ) {
                           //debugger
                           if(row.isfitnessfileuploaded==1)
                           {
                            return   '<a href="#" onclick="UploadPDFFile(' + row.id + ')"><i class="glyphicon glyphicon-upload text-success" style="font-size:x-large;"></i></a>'
                           }
                           else
                           {
                             return   '<a href="#" onclick="UploadPDFFile(' + row.id + ')"><i class="glyphicon glyphicon-upload text-danger" style="font-size:x-large;"></i></a>'
                           }
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
                     ,
                    {
                        "data": "id",
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#"  onclick="SendFilebyWhatsapp(' + id + ')"><i class="fa fa-whatsapp text-success" style="font-size:x-large;"></i></a>'
                        }
                    }
                    ,
                    { "data": "createdby",
                        render: function ( data, type, row )
                        {
                        /////alert(moment(row.createdon).format('DD MMM YYYY, hh:mm a'))
                          //var cdate = new Date(row.createdon).format('dd-MMM-yyyy hh:mm:ss a')
                          ///var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                          var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                        var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')

                         return "<div class='text-nowrap'>" + row.createdby + '(' + cdate + ')  <br/>' + row.updatedby + '(' + udate + ')' + "</div>";
                        }
                     }
                  
                    
                ],
                 "columnDefs": [
                              ////  { "visible": false, "targets": [0] }
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


function UploadPDFFile(id)
{
     $('#myModal').modal('show');
    

    $("#lblMessage").html("");
    $("#postedFile").val('');
    $('#recordID').val("0");
     $('#recordID').val(id);
    GetUploadedFiles(id);

}


function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }



    ////var id = table.rows()[0].length + 1;
    
      const d = new Date();
            let month = d.getMonth() + 1;

             let yearval = d.getFullYear().toString() ;

            var monthval="";
////            let length = month.length;
////            alert(length);
            if(month.toString().length<2)
            {
                monthval="0"+month;
            }
            else
            {
                monthval=month;
            }



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

    
    var newcustomername = $('[id*=txtCustomerName]').val();    
    var newmobileno = $('[id*=txtMobileNo]').val();
    var newmodelid = $("#ddlModel :selected").val();
    var newmodel = $("#ddlModel :selected").text();
    var newinsurancedt = $('[id*=txtinsduedate]').val();
    var newfitnessdt = $('[id*=txtfitnessduedate]').val();
    



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
    model.fitnessmonth=monthval;
    model.fitnessyear=yearval;
    model.fitnessid= $("#recordFitnessNo").val();
    model.newcustomername=newcustomername;
    model.newmobileno=newmobileno;
    model.newmodelid=newmodelid;
    model.newmodel=newmodel;
    model.newinsurancedt=newinsurancedt;
    model.newfitnessdt=newfitnessdt;

    if(model.newmobileno.length<10)
    {
         $.notify("Invalid mobile no!!", "error");
         return;
    }

   
    $.ajax({
        type: "POST",
        url: "saleTransactionDetailsFitnessCertificate.aspx/SaveRecord",
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
                ///GetCurrentDate();
                  GetInvoiceNo(7);
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
                 $("#ddlCustomersDisplay").append($("<option></option>").val(value.id).html(value.vendorname));
            })
            $('#ddlCustomers').val( id);
             $('#ddlCustomersDisplay').val( id);
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
                 $("#ddlCustomersDisplay").append($("<option></option>").val(value.id).html(value.employeename));
            })
            $('#ddlCustomers').val( id);
             $('#ddlCustomersDisplay').val( id);
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
                $("#ddlCustomersDisplay").append($("<option></option>").val(value.id).html(value.custname));
            })

            $('#ddlCustomers').val( id);
            $('#ddlCustomersDisplay').val( id);

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


function GetSelectedCustomerDisplay(id)
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

                $("#ddlCustomersDisplay").append($("<option></option>").val(value.id).html(value.custname));
            })

           
            $('#ddlCustomersDisplay').val( id);

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
                 $("#ddlCustomersDisplay").append($("<option></option>").val(value.id).html(value.glname));
            })
             $('#ddlCustomers').val( id);
              $('#ddlCustomersDisplay').val( id);
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


 function GetSelectedGeneralLedgersDisplay(id)
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

                 $("#ddlCustomersDisplay").append($("<option></option>").val(value.id).html(value.glname));
            })
              $('#ddlCustomersDisplay').val( id);
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
        url: "saleTransactionDetailsFitnessCertificate.aspx/GetRecordbyID",
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

                 $('[id*=txtCustomerName]').val(json[0].newcustomername);
                  $('[id*=txtMobileNo]').val(json[0].newmobileno);
                  //// $('#ddlModel').val(json[0].newmodelid);

                  GetSelectedModelbyid(json[0].newmodelid);


                    var newinsurancedt = ""
                    if(json[0].newinsurancedt !="" && json[0].newinsurancedt !=null)
                    {
                        newinsurancedt = new Date(json[0].newinsurancedt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                    }
                     var newfitnessdt = ""
                    if(json[0].newfitnessdt !="" && json[0].newfitnessdt !=null)
                    {
                        newfitnessdt = new Date(json[0].newfitnessdt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                    }

                    $('[id*=txtinsduedate]').val(newinsurancedt);
                     $('[id*=txtfitnessduedate]').val(newfitnessdt);

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
    

    var newcustomername = $('[id*=txtCustomerName]').val();    
    var newmobileno = $('[id*=txtMobileNo]').val();
    var newmodelid = $("#ddlModel :selected").val();
    var newmodel = $("#ddlModel :selected").text();
    var newinsurancedt = $('[id*=txtinsduedate]').val();
    var newfitnessdt = $('[id*=txtfitnessduedate]').val();

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


         model.newcustomername=newcustomername;
    model.newmobileno=newmobileno;
    model.newmodelid=newmodelid;
    model.newmodel=newmodel;
    model.newinsurancedt=newinsurancedt;
    model.newfitnessdt=newfitnessdt;

    if(model.newmobileno.length<10)
    {
         $.notify("Invalid mobile no!!", "error");
         return;
    }


        //////alert(JSON.stringify(model));
        $.ajax({
            type: "POST",
            url: "saleTransactionDetailsFitnessCertificate.aspx/UpdateRecord",
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
                    ///GetCurrentDate();
                    GetInvoiceNo(7);
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
            url: "saleTransactionDetailsFitnessCertificate.aspx/DeleteRecord",
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
                     GetInvoiceNo(7);
                     ////GetCurrentDate();
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
 //$('#txtInvoiceDate').val("");

 GetAllCustomers()

 $('#ddlCustomers').prop("selectedIndex", 0);
 $('#ddlInvoiceType').prop("selectedIndex", 0);
 $('#ddlPaymentMode').prop("selectedIndex", 0);
   $('#ddlAccountType').prop("selectedIndex", 0);
 $('#txtInvoiceNo').val("");
 $('#txtAmount').val("");
 $('#txtDiscount').val("");
 $('#txtVehicleChasisNo').val("");


 $('#txtCustomerName').val("");
 $('#txtMobileNo').val("");
 $('#txtinsduedate').val("");
 $('#txtfitnessduedate').val("");
  $('#ddlModel').prop("selectedIndex", 0).trigger('change');

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

//    if ($('#txtDiscount').val().trim() == "") {
//        $('#txtDiscount').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#txtDiscount').css('border-color', 'lightgrey');
//    }

   
    if ($('#txtVehicleChasisNo').val().trim() == "") {
        $('#txtVehicleChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehicleChasisNo').css('border-color', 'lightgrey');
    }

   
    return isValid;
}






//////////////////////upload files//////////////////

function GetUploadedFilesNew(id)
{
$("#tblUploadedFiles").dataTable().fnDestroy();
 $("#Showoverlay").show();
    $.ajax({
            type: "POST",
            url: "saleTransactionDetailsFitnessCertificate.aspx/GetAttachedFiles",
             data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response.d);
            },
            error: function (response) {
                alert(response.d);
            }
        });
}


function OnSuccess(response) {

 /////alert(response.d);

      $("[id*=tblUploadedFiles]").DataTable(
        {
            bLengthChange: true,
            lengthMenu: [[10, 50, -1], [10, 50, "All"]],
            bFilter: true,
            bSort: true,
            bPaginate: true,
           // dom: 'Bfrtip',
            responsive: true,
           // buttons: buttons,
            data: response.d,
                      "columns": [
                    {  "data": "id" ,
                     
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "ouploadedfilename" },
                    { "data": "createdon" },
                   {
                       "data": "id"
                       ,
                       "render": function (id, type, full, meta) {
                           //debugger
                           return '<a href="#" onclick="DownloadFile(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
                       }
                   },
                    {
                        "data": "id"
                        ,
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#" onclick="DeleteAttachedFile(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ],
                 stateSave: true,
                "bDestroy": true


        });

         $("#Showoverlay").hide();
    }

function GetUploadedFiles(id) {
////    $("#Showoverlay").show(); 
///////alert(id);
if(id!="0")
{
    $.ajax({
        type: "POST",
        url: "saleTransactionDetailsFitnessCertificate.aspx/GetAttachedFiles",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblUploadedFiles").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblUploadedFiles tbody').empty();
            $.each(json, function (key, item) {
                var id = item.id;
                var uploadedfilename = item.uploadedfilename;
                var downloadfilename = item.uploadedfilename;
                var createdon = item.uploadedon;
               
////                var mydate = new Date(json[0].createdon);
////                var uploadDt = new Date(createdon).format('dd-MMM-yyyy HH:mm:ss')

                 var mydate = moment(json[0].createdon).format('DD-MMM-YYYY hh:mm a')
                 var uploadDt = moment(createdon).format('DD-MMM-YYYY hh:mm a')

                /////alert(uploadDt);
                rows += "<tr><td>" + id +
                    "</td><td >" + uploadedfilename  + "<br/>  <input type='button' id='btnDownload'  onclick='DownloadFile(" + id + ")' value='Download' class='btn btn-primary'> " + " " +
                    "<input type='button' id='btnDelete'  onclick='DeleteAttachedFile(" + id + ")' value='Delete' class='btn btn-danger'> " +  ' ' + 

                    "</td>" +
                   " <td class='text-nowrap'>" + uploadDt + ' ' + "</td>" 
////                    "<td> " +
////                    " <input type='button' id='btnDownload'  onclick='DownloadFile(" + id + ")' value='Download' class='btn btn-primary'> </td>" +
//////                    <a onclick='DownloadFile(" + id + ")' >   <i class='fa fa-download' style='font-size:36px;'></i> </a>   
////                    
////                     " <td> <input type='button' id='btnDelete'  onclick='DeleteAttachedFile(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
                    + "</tr>";
            });
            $('#tblUploadedFiles tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblUploadedFiles]').DataTable({
                "order": [[0, "desc"]],
                "paging": false,
              //  "dom": 'lrtip',
                 responsive: true,
////                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                
////                "info": false,
//                'processing': true,
//                fnInitComplete: function () {
//                    $("#Showoverlay").hide();
//                }
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
    else
    {
   // alert("invalid id");
     $("#tblRecords").dataTable().fnDestroy();
    return;
    }

}


function DeleteAttachedFile(id) {
////alert(id);

    if (confirm('Are you sure delete this record?')) {
        var data = table.row($(this).parents('tr')).data();
        table.row($(this).parents('tr')).remove().draw();
         var custid = $('[id*=recordID]').val();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "saleTransactionDetailsFitnessCertificate.aspx/DeleteAttachedFile",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    GetUploadedFiles(custid);
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


function DownloadFile(id) { 
//////alert(id);
  $.ajax({
        type: "POST",
        url: "saleTransactionDetailsFitnessCertificate.aspx/ConvertToPdfAndDownload",
        data: '{id: "' + id + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) { 
            if (response.d == '')
                alert('There is a problem exporting the file');
            else {
            //alert("byte");
                var sampleArr = base64ToArrayBuffer(response.d);
                saveByteArray("File-" + id, sampleArr);
            }
        },
        failure: function (response) {
            alert("Cannot export thefile: Error in calling Ajax");
        }
    });
           
 }

        //convert BASE64 string to Byte{} array
function base64ToArrayBuffer(base64) { 
    var binaryString = window.atob(base64);
    var binaryLen = binaryString.length;
    var bytes = new Uint8Array(binaryLen);
    for (var i = 0; i < binaryLen; i++) {
        var ascii = binaryString.charCodeAt(i);
        bytes[i] = ascii;
    }
    return bytes;
}

//save Byte[] array and download
function saveByteArray(reportName, byte) {
    var blob = new Blob([byte]);
    var link = document.createElement('a');
    link.href = window.URL.createObjectURL(blob);
    var fileName = reportName + ".pdf";
    link.download = fileName;
    link.click();
}


     function  btnUploadFile()
     {
 
        var id = $('[id*=recordID]').val();
       ///// alert(id);
        //                                                            if (id != "0") {
        var fileUpload = $("#postedFile").get(0);
        var files = fileUpload.files;
       ///// alert(files);
        if (files.length == 0) {
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> please select a .pdf file to uplod  </b> ");
            return;
        }
        var docVal = fileUpload.value;
        var extension = docVal.substring(docVal.lastIndexOf(".") + 1, docVal.length);
       ///// alert(extension);
        if (extension.toLowerCase() != 'pdf') {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> only .pdf file is allowed  </b> ");
            return;
        }

        ////// var omobileno = $('[id*=txtMobileNo]').val();

        if (typeof ($("#postedFile")[0].files) != "undefined") {
            var size = parseFloat($("#postedFile")[0].files[0].size / 1024).toFixed(2);
           ///// alert(size + " KB.");
            if (size <= 5000) {
                $.ajax({
                    url: 'SaleTransactionDetailsFitnessUploadFileHandler.ashx?fitnessid=' + id,
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

        ////                                                                //                                                            alert(files.length);
        ////                                                                //                                                            return;
        ////                                                                //                                                            var test = new FormData();
        ////                                                                //                                                            for (var i = 0; i < files.length; i++) {
        ////                                                                //                                                                test.append(files[i].name, files[i]);
        ////                                                                //                                                            }
        //                                                            }
        //                                                            else {
        //                                                                $("#lblMessage").css('color', 'red');
        //                                                                $("#lblMessage").html("<b> invalid customer id  </b> ");
        //                                                            }

                                                      

    }




    function ShowFitnessSlipDetails(id)
    {
        
         $.ajax({
        type: "POST",
        url: "saleTransactionDetailsFitnessCertificate.aspx/GetRecordbyIDDisplay",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to add record!", "error");
            }
            else {
                var json = JSON.parse(result.d);

              
                if(json[0].accounttypeid == 1)
                {
                 $('#ddlAccountTypeDisplay').val(json[0].accounttypeid);
                     GetSelectedVendor(json[0].customerid);
                 $("#paymenttoDisplay").text( "Select Vendor :")

                 }

                 if(json[0].accounttypeid == 2)
                {
                 $('#ddlAccountTypeDisplay').val(json[0].accounttypeid);
                GetSelectedEmployee(json[0].customerid);
                 $("#paymenttoDisplay").text( "Select Employee :")
                 }

                 if(json[0].accounttypeid == 3)
                {
                  $('#ddlAccountTypeDisplay').val(json[0].accounttypeid);
                 GetSelectedCustomerDisplay(json[0].customerid);
                 $("#paymenttoDisplay").text( "Select Customer :")

                 
                 }

                  if(json[0].accounttypeid == 5)
                {
                  $('#ddlAccountTypeDisplay').val(json[0].accounttypeid);
                 GetSelectedGeneralLedgersDisplay(json[0].customerid);
                 $("#paymenttoDisplay").text( "Select General Ledger :")
                 }

////                alert($('[id*=recordPayoutPaymentModeOld]').val());
////                alert($('[id*=recordCustPaymentModeOld]').val());

                ///var mydate = new Date(json[0].duedate.substring(0, 10));
                var invoicedt = new Date(json[0].invoicedt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
                $('[id*=txtInvoiceDateDisplay]').val(invoicedt);
                $("#ddlCustomersDisplay").val(json[0].customerid);
                $("#ddlInvoiceTypeDisplay").val(json[0].invoicetypeid);
                $('[id*=txtInvoiceNoDisplay]').val(json[0].invoiceno);

               $("#ddlPaymentModeDisplay").val(json[0].paymentmodeid);
               $('[id*=txtAmountDisplay]').val(json[0].amount);
                $('[id*=txtDiscountDisplay]').val(json[0].discount);
                $('[id*=txtVehicleChasisNoDisplay]').val(json[0].vehchasisno);

                 $('[id*=txtCustomerNameDisplay]').val(json[0].newcustomername);
                  $('[id*=txtMobileNoDisplay]').val(json[0].newmobileno);
                  //// $('#ddlModel').val(json[0].newmodelid);

                  GetSelectedModelbyid(json[0].newmodelid);
                  ////$('#ddlCustomers').prop("selectedIndex", 0).trigger('change');
                    var newinsurancedt = ""
                    if(json[0].newinsurancedt !="")
                    {
                        newinsurancedt = new Date(json[0].newinsurancedt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                    }
                     var newfitnessdt = ""
                    if(json[0].newfitnessdt !="")
                    {
                        newfitnessdt = new Date(json[0].newfitnessdt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                    }

                    $('[id*=txtinsduedateDisplay]').val(newinsurancedt);
                     $('[id*=txtfitnessduedateDisplay]').val(newfitnessdt);


                     //clearTextBox();
////                $('#myModal').modal('show');
////                $('#myModal').on('shown.bs.modal', function () {
////                    $('#txtName').focus();
////                });



 $('#ddlCustomers').prop("selectedIndex", 0).trigger('change');

                $('#btnUpdate').show();
                $('#btnAdd').hide();
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });

            $('#myDisplayModal').modal('show');
           
    }




    function SendFilebyWhatsapp(id)
    {
    
     $.ajax({
        type: "POST",
        url: "saleTransactionDetailsFitnessCertificate.aspx/SendFileByWhatsapp",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",

              success: function (r) {
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to send record!", "error");
                }
                else {
                    //alert(r.d);

                    window.open( r.d,'_blank'); // <- This is what makes it open in a new window.

                   // $.notify("File sent!", "success");
                }
            },
            error: function (errormessage) {
            ////alert(errormessage.responseText);
                $.notify("Error while sendig file!", "error");
            }

        });
    }




 