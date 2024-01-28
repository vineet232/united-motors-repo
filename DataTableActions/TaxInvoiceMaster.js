

$(document).ready(function () {
 $('#txtinvdt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtinsexpdt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtjobcarddt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtnextservicedt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtirnackdt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

    /////GetSlipNo();
})  


function GetPartDetailsbyPartNo()
 {
    var partNo= $('#txtPartNo').val();
   //// alert(partNo);

   var model = {};
    
    model.partno = partNo;

    $("#Showoverlay").show();
     $.ajax({
         type: "POST",
         url: "taxinvoice.aspx/GetPartDescByPartNo",
         ////data: '{ partno :' + partNo + '}',

        data: '{ model :' + JSON.stringify(model) + '}',
         dataType: "json",
         contentType: "application/json",
         success: function (res) {
       ///////alert( JSON.stringify(res.d));
        
        var json = JSON.parse(res.d);
       

          $("#txtParticulars").val(json[0].partdesc);
          $("#txtHSNCode").val(json[0].hsncode);
          $("#txtRate").val(json[0].purchaseprice);

         var taxslab= json[0].taxslab;
         var cgst="0";
         /////var sgst="0";
         if(taxslab!=null)
         {
            var txrate=parseFloat(taxslab)/2;
            cgst=txrate;
         }

         $("#txtcgstrate").val(cgst);
         $("#txtsgstrate").val(cgst);


         }
        ,
         error: function (response) {
             alert(response.responseText);
             $.notify("BOOM!", "error");
         }

     });
     $("#Showoverlay").hide();
 }


////////function GetSlipNo() {
////////var slip ="0";

////////    $.ajax({
////////        type: "POST",
////////        url: "taxinvoice.aspx/GetSlipNo",
////////        data: '',
////////        dataType: "json",
////////        contentType: "application/json",
////////        success: function (res) {
////////            //var invNo = "INS-" + JSON.stringify(res.d)
////////            ///alert(invN);

////////             var slipNumber=JSON.stringify(res.d);
////////                
////////           ///////// invNo = "INS/22-23/"  + JSON.stringify(res.d)
////////                

////////            $("#txtSlipNo").val(slipNumber);

////////        }
////////            ,
////////        error: function (response) {
////////            ///alert(response.responseText);
////////            $.notify("BOOM!", "error");
////////        }

////////    });
////////}

$(function () {
//    $("#Showoverlay").show();

BindDataTable();

});






function BindDataTable() {

// /////////////for export import ///////////////
// var show = false;
// var printPermission= $("#hdnPrintPermission").val();
// ////alert(printPermission);

// if(printPermission == "1")
// {
//    show = true;
// }

// var buttons = [''];
//  /////var buttons = ['colvis'];
//  ////var buttons = ['export'];
//  
//  if (show) {
//    /////buttons.push('copyHtml5', 'excelHtml5', 'pdfHtml5' );
//    ////buttons.push('excel',  'pdfHtml5' );

//    buttons.push( [ //begin array
//    
//    
//    {
//			extend: 'excelHtml5',
//				text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
//				titleAttr: 'Excel',
//				title: 'Save as Excel',
//                // "action": newexportaction,
//				
//		}, 

//        {
//			extend: 'pdf',
//				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
//				titleAttr: 'Pdf',
//				title: 'Save as PDF',
//                // "action": newexportactiontoPDF,
//				
//		} 

//         ]) // end array

//  }

// /////////////end for export import ///////////////

$('#divuploadfiles').hide();
 $("#tblRecords").dataTable().fnDestroy();


            $('#tblRecords').DataTable({
            //"order": [[ 1, 'asc' ]],
           


            "columnDefs": [
    { "visible": false, "targets": [] }
    ],

                bServerSide: true,
                sAjaxSource: 'TaxInvoiceHandler.ashx/GetAllTaxInvoiceList',
                sServerMethod: 'post',
                "processing": true,
               
                 
                "columns": [
                    {  "data": "id" 
                    ,
                     
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
//                    { "data": "slipno" },
                    { "data": "pname1"
////                    ,
////                    
////                     render: function ( data, type, row )
////                        {
////                            if(row.statusid=="1")
////                            {
////                                return   row.slipdate ;
////                            }
////                            if(row.statusid=="2")
////                            {
////                                return  "<div style='color:red;'>" + "UM/" +  row.slipno + "</div>" + "<br/>" + row.slipdate ;
////                            }
////                     }

                     },

                    { "data": "pmodel" },
                    { "data": "pphone" },

                        
                    /// { "data": "vehno" },
                     
                      { "data": "inscomp" },

                        { "data": "vehregno" },
                  /////  { "data": "paymentmode" },
                    { "data": "chasisno" },
                   
                   { "data": "invno" 
////                        ,
////                    render: function ( data, type, row )
////                        {
////                            if(row.statusid=="1")
////                            {
////                                return  " <div style='color:red;'> <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.totalamount + "</div>";
////                            }
////                            if(row.statusid=="2")
////                            {
////                                return  "<div style='color:green;'> <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.totalamount + "</div>";
////                            }
////                     }

                    },

                    { "data": "invdt"
                    
////                    ,
////                      render: function ( data, type, row )
////                        {
////                        
////                             var status=row.statusid;
////                               if (status == "1") 
////                               {                               
////                                    return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
////                                }
////                                else
////                                {
////                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
////                                }
////                       }
                     },

                   {
                       "data": "id"
                       ,

                       render: function ( data, type, row )
                       {
                          return '<a href="#" onclick="OpenSlipDetails(\'' + row.id + ',' + row.invno + ',' + row.jobcardno  + '\'\)">  <i class="glyphicon glyphicon-plus text-primary" style="font-size:x-large;"></i> </a>';

//                            if(row.statusid=="1")
//                            {
//                                return '<a href="#" onclick="OpenSlipDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="glyphicon glyphicon-plus text-primary" style="font-size:x-large;"></i> </a>';
//                            }
//                            if(row.statusid=="2")
//                            {
//                                return '    <a href="#" onclick="OpenSlipDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="glyphicon glyphicon-open text-success" style="font-size:x-large;"></i> </a>';
//                               
//                                //////////////////<i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i> ' + ' &nbsp;&nbsp;&nbsp;&nbsp;' +
//                            }
                       }
                   },


                   { "data": "createdby",
                        render: function ( data, type, row )
                        {

                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')

                         return "<div class='text-nowrap'>" + row.createdby + '<br/>(' + cdate + ')  <br/>' + row.updatedby + '<br/>(' + udate + ')' + "</div>";
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

                     

//                        "render": function (id, type, full, meta) {
//                            //debugger
//                            return '<a href="#" onclick="PrintPDF(' + id + ')"><i class="glyphicon glyphicon-print text-primary" style="font-size:x-large;"></i></a>'
//                        }


 render: function ( data, type, row )
                        {
                        return '<a href="#" onclick="PrintPDF(' + row.id + ')"><i class="glyphicon glyphicon-print text-primary" style="font-size:x-large;"></i></a>'
                        +  '<br />'  +  '<br />'  + 
                        '<a href="#" onclick="ExportToExcel(' + row.id + ')"><i class="glyphicon glyphicon-file text-success" style="font-size:x-large;"></i></a>';
                        
//                             var status=row.statusid;
//                               if (status == "1") 
//                               {   
//                                    return '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>'                            
//                                     
//                                }
//                                else
//                                {
//                                  return '<a href="#" onclick="PrintPDF(' + row.id + ')"><i class="glyphicon glyphicon-print text-primary" style="font-size:x-large;"></i></a>'
//                                }
                       }


                     }
                    
                ],




                // stateSave: true,
                "bDestroy": true, 
                responsive: true,
               //// buttons: buttons,


////////                "createdRow": function( row, data, index ) {
////////                alert(row.statusid);
////////    if ( row.statusid == "1" )
////////    {
////////    alert("12");
////////        $('td', row).css('background-color', 'Red');
////////    }
////////    else if ( row.statusid == "2" )
////////    {
////////        $('td', row).css('background-color', 'Orange');
////////    }
////////}



//                "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
//      if (aData[5] == "1") {
//        $('td', nRow).css('background-color', 'Red');
//      } else if (aData[5] == "2") {
//        $('td', nRow).css('background-color', 'Orange');
//      }
//    }



//                 fnRowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
//                            if (aData.statusid == "1") {
////                                $('td', nRow).css('background-color', '#BFFFEB');
//                                 $('td', nRow).css('color', 'green');
//                            } else {
////                                $('td', nRow).css('background-color', '#FEEDF2');
//                                $('td', nRow).css('color', 'red');
//                            }
//                        }


            });


   }

function OpenSlipDetails(empdata)
{
   //OpenSlipDetails(\'' + row.id + ',' + row.invno + ',' + row.jobcardno  + '\'\)">

    const myArray = empdata.split(",");
    
    let taxmasterid = myArray[0];
    let invoiceno = myArray[1];
     let jobcardno = myArray[2];
     
    /////alert(id);

         $('#myModal').modal('show');
         $('#txtDTaxMasterID').html(taxmasterid); 
         $('#txtInvNo').html(invoiceno); 
         $('#txtJobCardNo').html(jobcardno);
        
         BindDataTableDetails(taxmasterid)



////    if(statusid=="2")
////    {
////         /// $.notify("Not allowed. Already closed!!", "error");

////         var result=confirm('Are you sure you want to re-open this slip!!');
////         ////alert(result);

////         if(result==true)
////         {
////            ////ReOpenRemarks(slipno);

////             $("#reOpenSlipNo").val(0);
////            //// $('#reopenDiv').modal('show');
////             $("#reOpenSlipNo").val(slipno);


////             var reopenedreason = "Reopen";
////        var model = {};
////        model.slipno = slipno;
////        model.reopenedreason = reopenedreason;

////        $.ajax({
////            type: "POST",
////            url: "taxinvoice.aspx/ReopenSlip",
////            data: '{ model :' + JSON.stringify(model) + '}',
////            //////data: '{slipno : ' + slipno + '}',
////            contentType: "application/json; charset=utf-8",
////            dataType: "json",
////            async: false,
////            success: function (r) {
////                if (r.d == 0) {
////                    $.notify("Error!! Slip not opened!", "error");
////                    $('[id*=txtReOpenReason]').focus();
////                    return;
////                }
////                if (r.d == 10) {
////                    $.notify("Error!! You do not have permission to reopen record!", "error");
////                    return;
////                }
////                else {
////                   $('#txtReOpenReason').val("");
////                   $('#reopenDiv').modal('hide');
////                   $("#reOpenSlipNo").val("0");
////                    BindDataTable();
////                  
////                    $.notify("Slip reopened!", "success");
////                }
////            }
////            ,
////            error: function (errormessage) {
////                ///////alert(errormessage.responseText);
////                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
////                    //alert("Error!! model name already exists!!");
////                    $.notify("Error!! already exists!", "error");
////                }
////                else {
////                    //alert("Error while saving data!!");
////                    $.notify("Error while reopening slip!", "error");
////                }
////            }
////        });



////         }
////    }
////     else
////     {
////         $('#myModal').modal('show');
////         $('#txtDTaxMasterID').html(slipno); 
////         $('#txtDVehNo').html(vehno); 
////         $('#txtDCustomerName').html(customername);
////         BindDataTableDetails(slipno)
////     }
}


////function ReOpenRemarks(slipno)
////{
////    $("#reOpenSlipNo").val(0);
////    $('#reopenDiv').modal('show');
////     $("#reOpenSlipNo").val(slipno);
////    
////}




//function sentenceCase(str) {
//    if ((str === null) || (str === ''))
//        return false;
//    else
//        str = str.toString();

//    return str.replace(/\w\S*/g, function (txt) {
//        return txt.charAt(0).toUpperCase() +
//       txt.substr(1).toLowerCase();
//    });
//}



function AddRecord() {
//    var res = validate();
//    if (res == false) {
//        return false;
//    }

    //var id = table.rows()[0].length + 1;
   //// var slipno = $('[id*=txtSlipNo]').val();
    //var slipdate = $('[id*=txtDate]').val();
    var pname1 = $('[id*=txtpname1]').val();
    var invno = $('[id*=txtinvno]').val();
    var pname2 = $('[id*=txtpname2]').val();
    var invdt = $('[id*=txtinvdt]').val();
    var padd1 = $('[id*=txtpadd1]').val();
    var pmodel = $('[id*=txtpmodel]').val();
    var padd2 = $('[id*=txtpadd2]').val();
    var chasisno = $('[id*=txtchasisno]').val();
    var padd3 = $('[id*=txtpadd3]').val();
    var inscomp = $('[id*=txtinscomp]').val();
    var padd4 = $('[id*=txtpadd4]').val();
    var pphone = $('[id*=txtpphone]').val();
    var instype = $('[id*=txtinstype]').val();
    var country = $('[id*=txtCountry]').val();
    var cgstn = $('[id*=txtcgstn]').val();
    var insexpdt = $('[id*=txtinsexpdt]').val();
    var accode = $('[id*=txtaccode]').val();
    var kms = $('[id*=txtkms]').val();
    var radd1 = $('[id*=txtradd1]').val();
    var vehregno = $('[id*=txtvehregno]').val();
    var radd2 = $('[id*=txtradd2]').val();
    var jobcardno = $('[id*=txtjobcardno]').val();
    var radd3 = $('[id*=txtradd3]').val();
    var jobcarddt = $('[id*=txtjobcarddt]').val();
    var radd4 = $('[id*=txtradd4]').val();
    var servicerequesttype = $('[id*=txtservicerequesttype]').val();
    var rstate = $('[id*=txtrstate]').val();
    var custpono = $('[id*=txtcustpono]').val();
    var rcountry = $('[id*=txtrcountry]').val();
    var paymentmethod = $('[id*=txtpaymentmethod]').val();
    var phone2 = $('[id*=txtphone2]').val();
    var warrentyexp = $('[id*=txtwarrentyexp]').val();
    var cgstn2 = $('[id*=txtcgstn2]').val();
    var dealerpan = $('[id*=txtdealerpan]').val();
    var accode2 = $('[id*=txtaccode2]').val();
    var dealergstn = $('[id*=txtdealergstn]').val();
    var placeofsupply = $('[id*=txtplaceofsupply]').val();
    var nextservicedt = $('[id*=txtnextservicedt]').val();
    var panno = $('[id*=txtpanno]').val();

    var irnno = $('[id*=txtirn]').val();
    var irnackno = $('[id*=txtirnackno]').val();
    var irnackdate = $('[id*=txtirnackdt]').val();

   //// var modelname = $('[id*=txtModel]').val();

//    var statusid = $("#ddlStatus :selected").val();
//    var status = $("#ddlStatus :selected").text();

    

//    var isactive = "";
//    if ($('#chkStatus').prop('checked')) {
//        isactive = "1";
//    } else {
//        isactive = "0";
//    }

   // name = sentenceCase(name);


   

    var model = {};
    
    model.pname1 = pname1;
    model.pname2 = pname2;
    model.padd1 = padd1;
    model.padd2 = padd2;
    model.padd3 = padd3;
    model.padd4 = padd4;
   

    model.country = country;
    model.pphone=pphone;
    model.cgstn = cgstn;
    model.accode=accode;
    model.radd1=radd1;
    model.radd2 = radd2;
    model.radd3 = radd3;
    model.radd4 = radd4 ;

    

    model.rstate = rstate;
    model.rcountry = rcountry;
    model.phone2=phone2;
    model.cgstn2 = cgstn2;
    model.accode2=accode2;
    model.placeofsupply = placeofsupply;
    model.panno=panno;
    model.invno=invno;
    model.invdt = invdt;
    model.pmodelid = 0;
    model.pmodel = pmodel;
    model.chasisno = chasisno;
    model.inscompid = 0;
    model.inscomp=inscomp;
    model.instype = instype;
    model.insexpdt=insexpdt;
    model.kms = kms;
    
    model.vehregno=vehregno;
    model.jobcardno=jobcardno;
    model.jobcarddt = jobcarddt;
    model.servicerequesttype = servicerequesttype;
    model.custpono = custpono;
    model.paymentmethod = paymentmethod;
    model.warrentyexp = warrentyexp;
    model.dealerpan=dealerpan;
    model.dealergstn = dealergstn;
    model.nextservicedt=nextservicedt;
    model.irnno=irnno;
    model.irnackno=irnackno;
    model.irnackdate=irnackdate;

   

    $.ajax({
        type: "POST",
        url: "taxinvoice.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                ////$('[id*=txtName]').focus();
                ////$('#myModal').modal('show');
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60) {
                    if (r.d == 20) {
                        $.notify("Error!! mobile already exists!", "error");
                        //$('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
                        ////$('[id*=txtName]').focus();
                       // $('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                     if (r.d == 60) {
                        $.notify("Error!! job card no already opened!", "error");
                        /////$('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }

                }
                else {
                    
                  /////  $('#myModal').modal('hide');

                    $.notify("Record saved!", "success");
                    clearTextBox();
                    ////GetSlipNo();

                    BindDataTable();
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


function EditRecordbyID(id) {
    ////alert(id);
    $.ajax({
        type: "POST",
        url: "taxinvoice.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {

             var json = JSON.parse(result.d);
             //////alert(json);
//                if(json[0].statusid == "2")
//                {
//                    $.notify("Not allowed. Already closed!", "error");
//                    $('#btnUpdateSlipMaster').hide();
//                $('#btnAddNewSlipMaster').hide();
//                    return;

//                }

               

                ////var modelname = json[0].modelname;
                //alert(modelname);
                $('#recordID').val(json[0].id);
                 $('#txtpname1').val(json[0].pname1);

                   $('#txtinvno').val(json[0].invno);
                   $('#txtpname2').val(json[0].pname2);
                   if(json[0].invdt != null)
                    {
                        ////slipdate = new Date(json[0].slipdate.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });

                        varinvdt = moment(json[0].invdt).format('MM-DD-YYYY')
                        $('#txtinvdt').val(varinvdt);
                    }
                   $('#txtpadd1').val(json[0].padd1);
                   $('#txtpmodel').val(json[0].pmodel);
                   $('#txtpadd2').val(json[0].padd2);
                   $('#txtchasisno').val(json[0].chasisno);
                   $('#txtpadd3').val(json[0].padd3);
                   $('#txtinscomp').val(json[0].inscomp);
                   $('#txtpadd4').val(json[0].padd4);
                   $('#txtpphone').val(json[0].pphone);
                   $('#txtinstype').val(json[0].instype);
                   $('#txtCountry').val(json[0].country);
                   $('#txtcgstn').val(json[0].cgstn);
                    if(json[0].insexpdt != null)
                    {
                        insexpdt = moment(json[0].insexpdt).format('MM-DD-YYYY')
                        $('#txtinsexpdt').val(insexpdt);
                    }
                   $('#txtaccode').val(json[0].accode);
                   $('#txtkms').val(json[0].kms);
                   $('#txtradd1').val(json[0].radd1);
                   $('#txtvehregno').val(json[0].vehregno);
                   $('#txtradd2').val(json[0].radd2);
                   $('#txtjobcardno').val(json[0].jobcardno);
                   $('#txtradd3').val(json[0].radd3);
                   $('#txtjobcarddt').val(json[0].jobcarddt);
                   $('#txtradd4').val(json[0].radd4);
                   $('#txtservicerequesttype').val(json[0].servicerequesttype);
                   $('#rstate').val(json[0].txtrstate);
                   $('#txtcustpono').val(json[0].custpono);
                   $('#txtrcountry').val(json[0].rcountry);
                   $('#txtpaymentmethod').val(json[0].paymentmethod);
                   $('#txtphone2').val(json[0].phone2);
                   $('#txtwarrentyexp').val(json[0].warrentyexp);
                   $('#txtcgstn2').val(json[0].cgstn2);

                  
                $('#txtdealerpan').val(json[0].dealerpan);
                $('#txtaccode2').val(json[0].accode2);
                $('#txtdealergstn').val(json[0].dealergstn);
                $('#txtplaceofsupply').val(json[0].placeofsupply);
               //// $('#txtnextservicedt').val(json[0].nextservicedt);
                if(json[0].nextservicedt != null)
                    {
                        nextservicedt = moment(json[0].nextservicedt).format('MM-DD-YYYY')
                        $('#txtnextservicedt').val(nextservicedt);
                    }
                $("#txtpanno").val(json[0].panno);


                $('#txtirn').val(json[0].irnno);
                $('#txtirnackno').val(json[0].irnackno);

                if(json[0].irnackdate != null)
                {
                        irnackdate = moment(json[0].irnackdate).format('MM-DD-YYYY')

                        if(irnackdate=="01/01/1900")
                        {
                            irnackdate="";
                        }
                        $('#txtirnackdt').val(irnackdate);
                }

                 $("#lblMessage").html("");
                 $('#divuploadfiles').show();
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

//                $('#myModal').modal('show');
//                $('#myModal').on('shown.bs.modal', function () {
//                    $('#txtName').focus();
//                });
                $('#btnUpdateSlipMaster').show();
                $('#btnAddNewSlipMaster').hide();
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });
}

////function for updating record
function UpdateRecord() {
////    var res = validate();
////    if (res == false) {
////        return false;
////    }

    var id = $('[id*=recordID]').val();
    ////alert(id);
     var pname1 = $('[id*=txtpname1]').val();
    var invno = $('[id*=txtinvno]').val();
    var pname2 = $('[id*=txtpname2]').val();
    var invdt = $('[id*=txtinvdt]').val();
    var padd1 = $('[id*=txtpadd1]').val();
    var pmodel = $('[id*=txtpmodel]').val();
    var padd2 = $('[id*=txtpadd2]').val();
    var chasisno = $('[id*=txtchasisno]').val();
    var padd3 = $('[id*=txtpadd3]').val();
    var inscomp = $('[id*=txtinscomp]').val();
    var padd4 = $('[id*=txtpadd4]').val();
    var pphone = $('[id*=txtpphone]').val();
    var instype = $('[id*=txtinstype]').val();
    var country = $('[id*=txtCountry]').val();
    var cgstn = $('[id*=txtcgstn]').val();
    var insexpdt = $('[id*=txtinsexpdt]').val();
    var accode = $('[id*=txtaccode]').val();
    var kms = $('[id*=txtkms]').val();
    var radd1 = $('[id*=txtradd1]').val();
    var vehregno = $('[id*=txtvehregno]').val();
    var radd2 = $('[id*=txtradd2]').val();
    var jobcardno = $('[id*=txtjobcardno]').val();
    var radd3 = $('[id*=txtradd3]').val();
    var jobcarddt = $('[id*=txtjobcarddt]').val();
    var radd4 = $('[id*=txtradd4]').val();
    var servicerequesttype = $('[id*=txtservicerequesttype]').val();
    var rstate = $('[id*=txtrstate]').val();
    var custpono = $('[id*=txtcustpono]').val();
    var rcountry = $('[id*=txtrcountry]').val();
    var paymentmethod = $('[id*=txtpaymentmethod]').val();
    var phone2 = $('[id*=txtphone2]').val();
    var warrentyexp = $('[id*=txtwarrentyexp]').val();
    var cgstn2 = $('[id*=txtcgstn2]').val();
    var dealerpan = $('[id*=txtdealerpan]').val();
    var accode2 = $('[id*=txtaccode2]').val();
    var dealergstn = $('[id*=txtdealergstn]').val();
    var placeofsupply = $('[id*=txtplaceofsupply]').val();
    var nextservicedt = $('[id*=txtnextservicedt]').val();
    var panno = $('[id*=txtpanno]').val();

    var irnno = $('[id*=txtirn]').val();
    var irnackno = $('[id*=txtirnackno]').val();
    var irnackdate = $('[id*=txtirnackdt]').val();

    ////name = sentenceCase(name);
    if (id > 0) {
   
        var model = {};
    model.id=id;
     model.pname1 = pname1;
    model.pname2 = pname2;
    model.padd1 = padd1;
    model.padd2 = padd2;
    model.padd3 = padd3;
    model.padd4 = padd4;
   

    model.country = country;
    model.pphone=pphone;
    model.cgstn = cgstn;
    model.accode=accode;
    model.radd1=radd1;
    model.radd2 = radd2;
    model.radd3 = radd3;
    model.radd4 = radd4 ;

   

    model.rstate = rstate;
    model.rcountry = rcountry;
    model.phone2=phone2;
    model.cgstn2 = cgstn2;
    model.accode2=accode2;
    model.placeofsupply = placeofsupply;
    model.panno=panno;
    model.invno=invno;
    model.invdt = invdt;
    model.pmodelid = 0;
    model.pmodel = pmodel;
    model.chasisno = chasisno;
    model.inscompid = 0;
    model.inscomp=inscomp;
    model.instype = instype;
    model.insexpdt=insexpdt;
    model.kms = kms;
   
    model.vehregno=vehregno;
    model.jobcardno=jobcardno;
    model.jobcarddt = jobcarddt;
    model.servicerequesttype = servicerequesttype;
    model.custpono = custpono;
    model.paymentmethod = paymentmethod;
    model.warrentyexp = warrentyexp;
    model.dealerpan=dealerpan;
    model.dealergstn = dealergstn;
    model.nextservicedt=nextservicedt;

    model.irnno=irnno;
    model.irnackno=irnackno;
    model.irnackdate=irnackdate;
    /////alert(paymentmode + modelname + status);
    
    

        $.ajax({
            type: "POST",
            url: "taxinvoice.aspx/UpdateRecord",
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
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60) {
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
                       // $('[id*=txtMobileNo]').focus();
                        return;
                    }
                    if (r.d == 60) {
                        $.notify("Error!! slip already opened!", "error");
                        /////$('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    /////$('#myModal').modal('hide');
                    $('#btnUpdateSlipMaster').hide();
                    $('#btnAddNewSlipMaster').show();
                    BindDataTable();
                    clearTextBox();
                    $.notify("Record updated!", "success");
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

function DeleteRecord(id) {
    if (confirm('Are you sure delete this record?')) {
//////        var data = table.row($(this).parents('tr')).data();
//////        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "taxinvoice.aspx/DeleteRecord",
            data: '{ id :' + id + '}',
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


//function PrintPDF(id)
//{
//alert(id);
//document.getElementById("<%=lnkExporttoExcel.ClientID %>").click();

////     $("#Showoverlay").show();
////        $.ajax({
////            type: "POST",
////            url: "taxinvoice.aspx/PrintSlip",
////            data: '{ id :' + id + '}',
////            contentType: "application/json; charset=utf-8",
////            dataType: "json",

////            success: function (r) {
////            $.notify("Status!", r.d);
////////                if (r.d == 0) {
////////                    $.notify("Error!! Record not deleted!", "error");
////////                    $('[id*=txtName]').focus();
////////                    return;
////////                }
////////                if (r.d == 10) {
////////                    $.notify("Error!! You do not have permission to delete record!", "error");
////////                }
////////                 if (r.d == 99) {
////////                    $.notify("Error!! unable to delete record!", "error");
////////                }
////////                else {
////////                    $("#Showoverlay").hide();
////////                    BindDataTable();
////////                    $.notify("Record deleted!", "success");
////////                }
////            },
////            error: function (errormessage) {
////                $.notify("Error while printing data!", "error");
////            }

////        });
////        $("#Showoverlay").hide();
//}


//////Function for clearing the textboxes  
function clearTextBox() {
                $('#txtpname1').val("");

                   $('#txtinvno').val("");
                   $('#txtpname2').val("");
                   $('#txtinvdt').val("");
                   $('#txtpadd1').val("");
                   $('#txtpmodel').val("");
                   $('#txtpadd2').val("");
                   $('#txtchasisno').val("");
                   $('#txtpadd3').val("");
                   $('#txtinscomp').val("");
                   $('#txtpadd4').val("");
                   $('#txtpphone').val("");
                   //////$('#txtinstype').val("");
                   $('#txtCountry').val("");
                   $('#txtcgstn').val("");
                   $('#txtinsexpdt').val("");
                   $('#txtaccode').val("");
                   $('#txtkms').val("");
                   $('#txtradd1').val("");
                   $('#txtvehregno').val("");
                   $('#txtradd2').val("");
                   $('#txtjobcardno').val("");
                   $('#txtradd3').val("");
                   $('#txtjobcarddt').val("");
                   $('#txtradd4').val("");
                  ///// $('#txtservicerequesttype').val("");
                   $('#rstate').val("");
                   $('#txtcustpono').val("");
                   $('#txtrcountry').val("");
                  ///// $('#txtpaymentmethod').val("");
                   $('#txtphone2').val("");
                   $('#txtwarrentyexp').val("");
                   $('#txtcgstn2').val("");

                  
                ////$('#txtdealerpan').val("");
                $('#txtaccode2').val("");
                ////$('#txtdealergstn').val("");
                $('#txtplaceofsupply').val("");
                $('#txtnextservicedt').val("");
                $("#txtpanno").val("");
                
                $("#txtirn").val("");
                $("#txtirnackno").val("");
                $("#txtirnackdt").val("");


    $('#btnUpdate').hide();
    $('#btnAdd').show();

    

//////    $('#myModal').modal('show');
//////    $('#myModal').on('shown.bs.modal', function () {
//////        $('#txtName').focus();
//////    });

    

}

//////Valdidation using jquery  
function validate() {
    var isValid = true;
    if ($('#txtpname1').val().trim() == "") {
        $('#txtpname1').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtpname1').css('border-color', 'lightgrey');
    }

    if ($('#txtinvno').val().trim() == "") {
        $('#txtinvno').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtinvno').css('border-color', 'lightgrey');
    }

////    if ($('#txtDate').val().trim() == "") {
////        $('#txtDate').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtDate').css('border-color', 'lightgrey');
////    }


    if ($('#txtinvdt').val().trim() == "") {
        $('#txtinvdt').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtinvdt').css('border-color', 'lightgrey');
    }

//    if ($('#txtPaymentMode').val().trim() == "") {
//        $('#txtPaymentMode').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#txtPaymentMode').css('border-color', 'lightgrey');
//    }

    if ($('#txtpmodel').val().trim() == "") {
        $('#txtpmodel').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtpmodel').css('border-color', 'lightgrey');
    }
   

////    if ($('#ddlStatus :selected').val().trim() == "0") {
////        $('#ddlStatus').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#ddlStatus').css('border-color', 'lightgrey');
////    }
    return isValid;
}




//////function for Reopen record
//function ReOpenSlip() {
//    
//     if ($('#txtReOpenReason').val().trim() == "") {
//        $('#txtReOpenReason').css('border-color', 'Red');
//        return false;
//    }
//    else {
//        $('#txtReOpenReason').css('border-color', 'lightgrey');
//    }

//    ///var slipno = slipno;
//    /////alert($("#reOpenSlipNo").val());
//   
//    var reopenedreason = $('[id*=txtReOpenReason]').val();

////////    var isactive = "";
////////    if ($('#chkStatus').prop('checked')) {
////////        isactive = "1";
////////    } else {
////////        isactive = "0";
////////    }
////    ////name = sentenceCase(name);
////    if (id > 0) {
////   
//        var model = {};
//    ////model.id=id;
//    model.slipno = $("#reOpenSlipNo").val();
//    model.reopenedreason = reopenedreason;

////    
////    model.customername = customername;
////    model.vehicleno = vehicleno;
////    model.mobileno = mobileno;
////   ////// model.paymentmodeid=0;

////    

////    model.paymentmode = paymentmode;
////    //////model.modelid=0;
////    model.modelname = modelname;
////    model.statusid=statusid;
////    model.status=status;

////    /////alert(paymentmode + modelname + status);

//  

//        $.ajax({
//            type: "POST",
//            url: "taxinvoice.aspx/ReopenSlip",
//            data: '{ model :' + JSON.stringify(model) + '}',
//            //////data: '{slipno : ' + slipno + '}',
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            async: false,
//            success: function (r) {
//                if (r.d == 0) {
//                    $.notify("Error!! Slip not opened!", "error");
//                    $('[id*=txtReOpenReason]').focus();
//                    return;
//                }
//                if (r.d == 10) {
//                    $.notify("Error!! You do not have permission to reopen record!", "error");
//                    return;
//                }
//                else {
//                   $('#txtReOpenReason').val("");
//                   $('#reopenDiv').modal('hide');
//                   $("#reOpenSlipNo").val("0");
//                    BindDataTable();
//                  
//                    $.notify("Slip reopened!", "success");
//                }
//            }
//            ,
//            error: function (errormessage) {
//                ///////alert(errormessage.responseText);
//                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
//                    //alert("Error!! model name already exists!!");
//                    $.notify("Error!! already exists!", "error");
//                }
//                else {
//                    //alert("Error while saving data!!");
//                    $.notify("Error while reopening slip!", "error");
//                }
//            }
//        });
//    }
   




   ////////////////////////slip details/////////////////


   function BindDataTableDetails(taxmasterid) {
  
  $("#lblMessage").html("");
    $("#postedFile").val('');

  $('#btnUpdateDetails').hide();

    $("#Showoverlay2").show();
    $.ajax({
        type: "POST",
        url: "taxinvoice.aspx/GetAllDataByTaxMasterID",
       data: '{taxmasterid : ' + taxmasterid + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblRecordDetails").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblRecordDetails tbody').empty();
            var srno = 0;
            $.each(json, function (key, item) {
                srno += 1;

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


//                "<td>" + srno + "</td>" +
                 "<td>" + item.srno + ' ' +
                    "</td>" 
                    +

                "<td>" + item.hsnsac + ' ' +
                    "</td>" 
                    +

                    "<td>" + item.partjobcode + ' ' +
                    "</td>" +

                    "<td>" + item.particulars + ' ' +
                    "</td>" +

//                     "<td>" + item.ttype + ' ' + "</td>"  +

                      "<td>" + item.uom + ' ' + "</td>"  +

                      "<td>" + item.qty + ' ' + "</td>"  +
                      "<td>" + item.rate + ' ' + "</td>"  +

//                      "<td>" + item.totalamtbaseprice + ' ' + "</td>"  +
//                      "<td>" + item.extrachg + ' ' + "</td>"  +
//                      "<td>" + item.discamt + ' ' + "</td>"  +
//                      "<td>" + item.campagindisc + ' ' + "</td>"  +
//                      "<td>" + item.discper + ' ' + "</td>"  +
//                      "<td>" + item.insuranceliability + ' ' + "</td>"  +
//                      "<td>" + item.taxableamt + ' ' + "</td>"  +
                      "<td>" + item.cgstrate + ' ' + "</td>"  +
                      "<td>" + item.cgstamt + ' ' + "</td>"  +
                      "<td>" + item.sgstrate + ' ' + "</td>"  +
                       "<td>" + item.sgstamt + ' ' + "</td>"  +
//                        "<td>" + item.totalamtinctax + ' ' + "</td>"  +
                       

                      "<td>" + " <input type='button' id='btnEditDetails'  onclick='EditRecordbyIDDetails(" + item.id + ")' value='Edit' class='btn btn-primary'>" + ' ' + "</td>" +

                       "<td>" + "<input type='button' id='btnDelete'  onclick='DeleteRecordDetails(" + item.id + ")' value='Delete' class='btn btn-danger'> " + ' ' + "</td>"
                       
//                    " <input type='button' id='btnEditDetails'  onclick='EditRecordbyIDDetails(" + item.id + ")' value='Edit' class='btn btn-primary'>  </td>" +

//                    "<td>" + 
//                     " <input type='button' id='btnDelete'  onclick='DeleteRecordDetails(" + item.id + ")' value='Delete' class='btn btn-danger'>  </td>"+
                    + "</tr>";
            });
           
            $('#tblRecordDetails tbody').append(rows);

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


   function AddRecordDetails() {
    
    if ($('#txtSrNo').val().trim() == "") {
        $('#txtSrNo').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtSrNo').css('border-color', 'lightgrey');
    }

   

     if ($('#txtHSNCode').val().trim() == "") {
        $('#txtHSNCode').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtHSNCode').css('border-color', 'lightgrey');
    }

    

     if ($('#txtPartNo').val().trim() == "") {
        $('#txtPartNo').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtPartNo').css('border-color', 'lightgrey');
    }

    if ($('#txtParticulars').val().trim() == "") {
        $('#txtParticulars').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtParticulars').css('border-color', 'lightgrey');
    }

    if ($('#txtQuantity').val().trim() == "") {
        $('#txtQuantity').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtQuantity').css('border-color', 'lightgrey');
    }

    if ($('#txtRate').val().trim() == "") {
        $('#txtRate').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtRate').css('border-color', 'lightgrey');
    }

    
    if ($('#txtcgstrate').val().trim() == "") {
        $('#txtcgstrate').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtcgstrate').css('border-color', 'lightgrey');
    }
    if ($('#txtsgstrate').val().trim() == "") {
        $('#txtsgstrate').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtsgstrate').css('border-color', 'lightgrey');
    }
    

    

    //var id = table.rows()[0].length + 1;
   // $("#addDetailsSlipNo").val("0");

    //////// var taxinvmasterid = $('[id*=txtDTaxMasterID]').val();

     var srno = $('[id*=txtSrNo]').val();
     
     var hsnsac = $('[id*=txtHSNCode]').val();
     var partjobcode = $('[id*=txtPartNo]').val();
    var particulars = $('[id*=txtParticulars]').val();
    var ttype="Paid";
    var uomid = $("#ddlUom :selected").val();
    var uom = $("#ddlUom :selected").text();
    var qty = $('[id*=txtQuantity]').val();
    var rate = $('[id*=txtRate]').val();
    
     var totalamtbaseprice = parseFloat(qty)*parseFloat(rate);
    

    var extrachg="";
    var discamt="";
    var campagindisc="";
    var discper="";
    var insuranceliability="";
    var taxableamt=totalamtbaseprice;
   
     var cgstrate = $('[id*=txtcgstrate]').val();
     
     // var cgstamt = float.Parse(totalamtbaseprice) * float.Parse(cgstrate)/100;
     
       var sgstrate = $('[id*=txtsgstrate]').val();
       // var sgstamt = float.Parse(totalamtbaseprice) * float.Parse(sgstrate)/100;
       
       //  var totalamtinctax = float.Parse(totalamtbaseprice) + float.Parse(cgstamt) + float.parse(sgstamt);
   

   
   

    //$("#txtTotalAmount").val(tamt);

//    var isactive = "";
//    if ($('#chkStatus').prop('checked')) {
//        isactive = "1";
//    } else {
//        isactive = "0";
//    }

   // name = sentenceCase(name);
    var model = {};
    var taxinvmasterid= $('#txtDTaxMasterID').html();
    
    model.taxinvmasterid=taxinvmasterid;
    model.srno = srno;
    model.hsnsac=hsnsac;
    model.partjobcode=partjobcode;
    model.particulars = particulars;
    model.ttype=ttype;
    model.uomid = uomid;
    model.uom = uom;
    model.qty = qty;
    model.rate = rate;
    model.totalamtbaseprice=totalamtbaseprice;
    model.extrachg=extrachg;
    model.discamt=discamt;
    model.campagindisc=campagindisc;
    model.discper=discper;
    model.insuranceliability=insuranceliability;
    model.taxableamt=taxableamt;
    model.cgstrate=cgstrate;
   // model.cgstamt=cgstamt;
    model.sgstrate=sgstrate;
   // model.sgstamt=sgstamt;
   // model.totalamtinctax=totalamtinctax;
    
   


    $.ajax({
        type: "POST",
        url: "taxinvoice.aspx/SaveRecordDetails",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                ////$('[id*=txtName]').focus();
                ////$('#myModal').modal('show');
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if ( r.d == 30 ) {                    
                    if (r.d == 30) {
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
                 $('#txtQuantity').val("1");
                 $('#txtRate').val("");
                  $('#txtHSNCode').val("");
                   $('#txtSrNo').val("1");
                    $('#txtcgstrate').val("");
                     $('#txtsgstrate').val("");

                    BindDataTableDetails($('#txtDTaxMasterID').html());
                    BindDataTable();
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
     var invmasid= $('#txtDTaxMasterID').html();
    ///// alert(invmasid);
    $.ajax({
        type: "POST",
        url: "taxinvoice.aspx/GetRecordbyIDDetails",
        data: '{ id :' + id + ', invmasid: ' + invmasid + '}',
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

                  $('#txtSrNo').val(json[0].srno);
                  $('#txtHSNCode').val(json[0].hsnsac);
                  $('#txtPartNo').val(json[0].partjobcode);
                  $('#txtParticulars').val(json[0].particulars);
                $('#txtQuantity').val(json[0].qty);
                $('#txtRate').val(json[0].rate);               
                $("#ddlUom").val(json[0].uomid);

                 $('#txtcgstrate').val(json[0].cgstrate);   
                  $('#txtsgstrate').val(json[0].sgstrate);   

//                $('#myModal').modal('show');
//                $('#myModal').on('shown.bs.modal', function () {
//                    $('#txtName').focus();
//                });
               
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

 

 if ($('#txtSrNo').val().trim() == "") {
        $('#txtSrNo').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtSrNo').css('border-color', 'lightgrey');
    }

    
     if ($('#txtHSNCode').val().trim() == "") {
        $('#txtHSNCode').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtHSNCode').css('border-color', 'lightgrey');
    }

     if ($('#txtPartNo').val().trim() == "") {
        $('#txtPartNo').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtPartNo').css('border-color', 'lightgrey');
    }

    if ($('#txtParticulars').val().trim() == "") {
        $('#txtParticulars').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtParticulars').css('border-color', 'lightgrey');
    }

    if ($('#txtQuantity').val().trim() == "") {
        $('#txtQuantity').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtQuantity').css('border-color', 'lightgrey');
    }

    if ($('#txtRate').val().trim() == "") {
        $('#txtRate').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtRate').css('border-color', 'lightgrey');
    }

    
    if ($('#txtcgstrate').val().trim() == "") {
        $('#txtcgstrate').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtcgstrate').css('border-color', 'lightgrey');
    }
    if ($('#txtsgstrate').val().trim() == "") {
        $('#txtsgstrate').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtsgstrate').css('border-color', 'lightgrey');
    }
    


    var id = $('[id*=recordID]').val();
   var srno = $('[id*=txtSrNo]').val();
     
     var hsnsac = $('[id*=txtHSNCode]').val();
     var partjobcode = $('[id*=txtPartNo]').val();
    var particulars = $('[id*=txtParticulars]').val();
    var ttype="Paid";
    var uomid = $("#ddlUom :selected").val();
    var uom = $("#ddlUom :selected").text();
    var qty = $('[id*=txtQuantity]').val();
    var rate = $('[id*=txtRate]').val();
    
     var totalamtbaseprice = parseFloat(qty)*parseFloat(rate);
    

    var extrachg="";
    var discamt="";
    var campagindisc="";
    var discper="";
    var insuranceliability="";
    var taxableamt=totalamtbaseprice;
   
     var cgstrate = $('[id*=txtcgstrate]').val();
     
     // var cgstamt = float.Parse(totalamtbaseprice) * float.Parse(cgstrate)/100;
     
       var sgstrate = $('[id*=txtsgstrate]').val();
   

    ////name = sentenceCase(name);
    if (id > 0) {
   
        var model = {};
    model.id=id;
   var taxinvmasterid= $('#txtDTaxMasterID').html();
   ///// alert(taxinvmasterid);

    model.taxinvmasterid=taxinvmasterid;
    model.srno = srno;
    model.hsnsac=hsnsac;
    model.partjobcode=partjobcode;
    model.particulars = particulars;
    model.ttype=ttype;
    model.uomid = uomid;
    model.uom = uom;
    model.qty = qty;
    model.rate = rate;
    model.totalamtbaseprice=totalamtbaseprice;
    model.extrachg=extrachg;
    model.discamt=discamt;
    model.campagindisc=campagindisc;
    model.discper=discper;
    model.insuranceliability=insuranceliability;
    model.taxableamt=taxableamt;
    model.cgstrate=cgstrate;
   // model.cgstamt=cgstamt;
    model.sgstrate=sgstrate;
   // model.sgstamt=sgstamt;
   // model.totalamtinctax=totalamtinctax;

    /////alert(paymentmode + modelname + status);

    ////alert(JSON.stringify(model));

        $.ajax({
            type: "POST",
            url: "taxinvoice.aspx/UpdateRecordDetails",
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
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50) {
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

                   $('#txtHSNCode').val("");
                   $('#txtSrNo').val("");
                    $('#txtcgstrate').val("");
                     $('#txtsgstrate').val("");

                  $('#btnAddNewDetails').show();
                 $('#btnUpdateDetails').hide();
                    BindDataTableDetails(taxinvmasterid);
                    $.notify("Record updated!", "success");
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

function DeleteRecordDetails(id) {
    if (confirm('Are you sure delete this record?')) {
//////        var data = table.row($(this).parents('tr')).data();
//////        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "taxinvoice.aspx/DeleteRecordDetails",
            data: '{ id :' + id + '}',
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
                }
                 if (r.d == 99) {
                    $.notify("Error!! unable to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    BindDataTableDetails($('#txtDTaxMasterID').html());
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
 
        //var id = $('[id*=recordID]').val();
        var id=$('#txtDTaxMasterID').html();
       //// alert(id);
        //                                                            if (id != "0") {
        var fileUpload = $("#postedFile").get(0);
        var files = fileUpload.files;
        if (files.length == 0) {
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> please select a .xlsx file to uplod  </b> ");
            return;
        }
        var docVal = fileUpload.value;
        var extension = docVal.substring(docVal.lastIndexOf(".") + 1, docVal.length);
        if (extension.toLowerCase() != 'xlsx') {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> only .xlsx file is allowed  </b> ");
            return;
        }

         //////var omobileno = $('[id*=txtMobileNo]').val();

        if (typeof ($("#postedFile")[0].files) != "undefined") {
            var size = parseFloat($("#postedFile")[0].files[0].size / 1024).toFixed(2);
            //////alert(size + " KB.");
            if (size <= 5000) {
                $.ajax({
                    url: 'TaxInvoiceUploadExcelHandler.ashx?billid=' + id,
                    type: 'POST',
                    data: new FormData($('form')[1]),
                    //  data: '{"ItemSelected=" ' + new FormData($('form')[0]) + ', "ID="',
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (file) {
                        $("#fileProgress").hide();
                        $("#lblMessage").css('color', 'green');
                        $("#lblMessage").html("<b>" + file.name + "</b> has been uploaded.");
                        if (id != "0") {
                            BindDataTableDetails(id);
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




//////function btnUploadExcel()
//////{
//////////var id=$('#txtDTaxMasterID').html();
//////////alert(id);
//////     $("#Showoverlay").show();
//////        $.ajax({
//////            type: "POST",
//////            url: "taxinvoice.aspx/UploadExcelFile",
//////           ///// data: '{ id :' + id + '}',
//////            data: '',
//////            contentType: "application/json; charset=utf-8",
//////            dataType: "json",

//////            success: function (r) {
//////                if (r.d == 0) {
//////                    $.notify("Error!! not uploaded!", "error");
//////                    
//////                    return;
//////                }   
//////                if (r.d == 5) {
//////                    $.notify("Error!! select file to upload!", "error");
//////                    
//////                    return;
//////                }   
//////                if (r.d == 15) {
//////                    $.notify("Error!! select only excel file!", "error");
//////                    
//////                    return;
//////                }                
//////                else {
//////                    $("#Showoverlay").hide();
//////                    BindDataTableDetails($('#txtDTaxMasterID').html());
//////                    $.notify("file uploaded!", "success");
//////                }
//////            },
//////            error: function (errormessage) {
//////                $.notify("Error while uploading file!", "error");
//////            }

//////        });
//////        $("#Showoverlay").hide();
//////}




function  btnUploadFileIRN()
     {
 
        var id = $('[id*=recordID]').val();
        //alert(id);
        //                                                            if (id != "0") {
        var fileUpload = $("#postedfileirn").get(0);
        var files = fileUpload.files;
        if (files.length == 0) {
            $("#lblMessageirn").css('color', 'red');
            $("#lblMessageirn").html("<b> please select a .jpg file to uplod  </b> ");
            return;
        }
        var docVal = fileUpload.value;
        var extension = docVal.substring(docVal.lastIndexOf(".") + 1, docVal.length);
       ///// alert(extension.toLowerCase());
        if (extension.toLowerCase() != 'jpg' && extension.toLowerCase() != 'jpeg' && extension.toLowerCase() != 'png' ) {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessageirn").css('color', 'red');
            $("#lblMessageirn").html("<b> only .jpg/jpeg/png file is allowed  </b> ");
            return;
        }

         ////var omobileno = $('[id*=txtMobileNo]').val();

        if (typeof ($("#postedfileirn")[0].files) != "undefined") {
            var size = parseFloat($("#postedfileirn")[0].files[0].size / 1024).toFixed(2);
            ////alert(size + " KB.");
            if (size <= 1000) {
                $.ajax({
                   ////// url: 'InsuranceClaimsPolicyUploadHandler.ashx?claimid=' + id+'&mobileno=' + omobileno,
                    url: 'TaxInvoiceIRNFileUploadHandler.ashx?pid=' + id ,
                    type: 'POST',
                    data: new FormData($('form')[0]),
                    //  data: '{"ItemSelected=" ' + new FormData($('form')[0]) + ', "ID="',
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (file) {
                        $("#fileProgressirn").hide();
                        $("#lblMessageirn").css('color', 'green');
                        $("#lblMessageirn").html("<b>" + file.name + "</b> has been uploaded.");
                        if (id != "0") {
                            GetUploadedFiles(id);
                        }
                        else {
                                                                               
                            $('#hiddenIRNfileName').val(file.name);
                                                                               
                        }
                    },

                    xhr: function () {
                        var fileXhr = $.ajaxSettings.xhr();
                        if (fileXhr.upload) {
                            $("progress").show();
                            fileXhr.upload.addEventListener("progress", function (e) {
                                if (e.lengthComputable) {
                                    $("#fileProgressirn").attr({
                                        value: e.loaded,
                                        max: e.total
                                    });
                                }
                            }, false);
                        }
                        return fileXhr;
                    },
                    error: function (file) {
                        $("#lblMessageirn").css('color', 'red');
                        $("#lblMessageirn").html("<b> " + file.name + " </b> ");

                    }
                });
            }
            else {
                //alert("Please upload file upto 5MB");
                $("#lblMessageirn").css('color', 'red');
                $("#lblMessageirn").html("<b> Please upload file upto 1MB  </b> ");
                return;
            }
        } else {
            //alert("This browser does not support HTML5.");
            $("#lblMessageirn").css('color', 'red');
            $("#lblMessageirn").html("<b> This browser does not support HTML5.  </b> ");
            return;
        }
        
    }


    function DownloadFileIRN() {
     var id=$("#hdnviewfileid").val();
        $.ajax({
            type: "POST",
        url: "taxinvoice.aspx/ConvertToPdfAndDownload",
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
                  var file = new Blob([bytes], {type: 'image/png'});
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

