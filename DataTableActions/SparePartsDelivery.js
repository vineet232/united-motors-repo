

$(document).ready(function () {
// $('#txtDate').datepicker({
//        format: "mm/dd/yyyy",
//        autoclose: true,
//    });

    /////GetSlipNo();

    $("#ddlModel").select2();
      $("#ddlIssuedTo").select2();
    

    $.ajax({
        type: "POST", url: "sparepartsdelivery.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }
     });




      $.ajax({
        type: "POST", url: "sparepartsdelivery.aspx/GetAllEmployees",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlIssuedTo").append($("<option></option>").val(value.id).html(value.employeename));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }
     });



})  


if ($('#rdPartno').prop('checked')) {
        $('[id*=txtPartNo]').val("");
    } 

    if ($('#rdLabour').prop('checked')) {
        $('[id*=txtPartNo]').val("Labour");
    } 


function GetPartDetailsbyPartNo()
 {
    var partNo= $('#txtPartNo').val();
    /////alert(partNo);

    var model = {};
        model.partno = partNo;

    $("#Showoverlay").show();
     $.ajax({
         type: "POST",
         url: "sparepartsdelivery.aspx/GetPartDescByPartNo",
        /// data: '{ partno :' + partNo + '}',

        data: '{ model :' + JSON.stringify(model) + '}',

         dataType: "json",
         contentType: "application/json",
         success: function (res) {
       //////alert( JSON.stringify(res.d));
        
        var json = JSON.parse(res.d);
       

          $("#txtParticulars").val(json[0].partdesc);
          $("#txtRate").val(json[0].umrp);
         }
        ,
         error: function (response) {
             ///alert(response.responseText);
             $.notify("BOOM!", "error");
         }

     });
     $("#Showoverlay").hide();
 }




function GetChallanNo() {
var slip ="0";

    $.ajax({
        type: "POST",
        url: "sparepartsdelivery.aspx/GetChallanNo",
        data: '',
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            //var invNo = "INS-" + JSON.stringify(res.d)
            ///alert(invN);

             var slipNumber=JSON.stringify(res.d);
                
           ///////// invNo = "INS/22-23/"  + JSON.stringify(res.d)
                

            $("#txtSlipNo").val(slipNumber);

        }
            ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });
}




 function GetSelectedModelbyid(modelid)
 {
 $('#ddlModel').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
       type: "POST", url: "sparepartsdelivery.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
            })
         $('#ddlModel').val(modelid);
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


  function GetSelectedIssuedto(empid)
 {
 $('#ddlIssuedTo').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
       type: "POST", url: "sparepartsdelivery.aspx/GetAllEmployees",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlIssuedTo").append($("<option></option>").val(value.id).html(value.employeename));
            })
         $('#ddlIssuedTo').val(empid);
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
//    $("#Showoverlay").show();

BindDataTable(1);

});


function ddlStatus_SelectedIndexChanged()
{
     var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);
}



function BindDataTable(statusid) {

 /////////////for export import ///////////////
 var show = false;
 var printPermission= $("#hdnPrintPermission").val();
 ////alert(printPermission);

 var statusid = $("#ddlStatus :selected").val();

 if(printPermission == "1")
 {
    show = true;
 }

 var buttons = [''];
  /////var buttons = ['colvis'];
  ////var buttons = ['export'];
  
  if (show) {
    /////buttons.push('copyHtml5', 'excelHtml5', 'pdfHtml5' );
    ////buttons.push('excel',  'pdfHtml5' );

    buttons.push( [ //begin array
    
    
    {
			extend: 'excelHtml5',
				text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
				titleAttr: 'Excel',
				title: 'Save as Excel',
                // "action": newexportaction,
				
		}, 

        {
			extend: 'pdf',
				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
				titleAttr: 'Pdf',
				title: 'Save as PDF',
                // "action": newexportactiontoPDF,
				
		} 

         ]) // end array

  }

 /////////////end for export import ///////////////

 $("#tblRecords").dataTable().fnDestroy();


            $('#tblRecords').DataTable({
            //"order": [[ 1, 'asc' ]],
           


            "columnDefs": [
    { "visible": false, "targets": [] }
    ],

                bServerSide: true,
                sAjaxSource: 'SparePartsDeliveryHandler.ashx?statusid='+ statusid,
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

                     { "data": "invoicechallanno"
                     ,
                      render: function ( data, type, row )
                        {
                            if(row.statusid=="1")
                            {
                                return  "<div style='color:red;'>" + row.id + "</div>"  + '<br/>' +   row.invoicechallanno ;
                            }
                            if(row.statusid=="2")
                            {
                                return  "<div style='color:red;'>" + row.id + "</div>"  + '<br/>' + row.invoicechallanno 
                            }
                     }
                      },

//                    { "data": "slipno" },
                    { "data": "challandate",
                    
                     render: function ( data, type, row )
                        {
                            if(row.statusid=="1")
                            {
                                return    row.challandate ;
                            }
                            if(row.statusid=="2")
                            {
                                return  "<div style='color:red;'>" + "CH/" +  row.challanno + "</div>" + "<br/>" + row.challandate ;
                            }
                     }

                     },

                    { "data": "customername" },
                    { "data": "vehicleno" },

                        
                    /// { "data": "vehno" },
                     
                      { "data": "mobileno" },
                  /////  { "data": "paymentmode" },
                    { "data": "modelname" },
                   
                   { "data": "totalamount" 
                        ,
                    render: function ( data, type, row )
                        {
                            if(row.statusid=="1")
                            {
                                return  " <div style='color:red;'> <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.totalamount + "</div>";
                            }
                            if(row.statusid=="2")
                            {
                                return  "<div style='color:green;'> <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.totalamount + "</div>";
                            }
                     }

                    },

                     { "data": "servicetype"},
                    { "data": "status"
                    
                    ,
                      render: function ( data, type, row )
                        {
                        
                             var status=row.statusid;
                               if (status == "1") 
                               {                               
                                    return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
                                }
                                else
                                {
                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
                                }
                       }
                     },
                     
                     {"data": "gatepassno" },

                   {
                       "data": "id",

                       render: function ( data, type, row )
                       {
                            if(row.statusid=="1")
                            {
                                return '<a href="#" onclick="OpenChallanDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="glyphicon glyphicon-plus text-primary" style="font-size:x-large;"></i> </a>'
                                + '<br /> <br />' + 
                                
                                '<a href="#" onclick="SendDetailsToSlip(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="btn btn-danger" > Send to Slip </i> </a>' 
                                
//                                 + '<br /> <br />' + 
//                                
//                                '<a href="#" onclick="SendDetailsToGLRInventory(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="btn btn-success" > Send to GRL Inventory </i> </a>' ;
                                ;
                            }
                            if(row.statusid=="2")
                            {
                                return '    <a href="#" onclick="OpenChallanDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="glyphicon glyphicon-open text-success" style="font-size:x-large;"></i> </a>'
                               
                                +
                                 ' &nbsp; &nbsp; <a href="#"  onclick="ShowChallanDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)"><i class="glyphicon glyphicon-eye-open text-primary" style="font-size:x-large;"></i></a>';

                                //////////////////<i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i> ' + ' &nbsp;&nbsp;&nbsp;&nbsp;' +
                            }
                       }

////                       "render": function (id, type, full, meta) {
////                           //debugger
////                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-plus text-primary" style="font-size:x-large;"></i></a>'
////                       }
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
                buttons: buttons,


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
  

   function SendDetailsToSlip(slipdata)
   {
     const myArray = slipdata.split(",");
    
    let id = myArray[0];
    let customername = myArray[1];
     let vehno = myArray[2];
     let statusid = myArray[3];

     ///alert(vehno);

      var model = {};
        model.id = id;
        model.vehno=vehno;


         $.ajax({
            type: "POST",
            url: "sparepartsdelivery.aspx/TransfertoSlipPage",
            data: '{ model :' + JSON.stringify(model) + '}',
            //////data: '{slipno : ' + slipno + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! not transferred!", "error");
                    return;
                }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to transfer!", "error");
                    return;
                }
                if (r.d == 50) {
                    $.notify("Error!! this vehicle no already transferred!", "error");
                    return;
                }
                else {
                   
                    $.notify("Transferred to slip page!", "success");
                }
            }
            ,
            error: function (errormessage) {
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! already exists!", "error");
                }
                else {
                    //alert("Error while saving data!!");
                    $.notify("Error while transferring to slip!", "error");
                }
            }
        });


   }



    function SendDetailsToGLRInventory(slipdata)
   {
    
     if (confirm('Are you sure you want to transfer data to GLR Inventory?')) {
    const myArray = slipdata.split(",");
    
    let id = myArray[0];
    let customername = myArray[1];
     let vehno = myArray[2];
     let statusid = myArray[3];

     ///alert(vehno);

      var model = {};
        model.id = id;
        ////model.vehno=vehno;
       

         $.ajax({
            type: "POST",
            url: "sparepartsdelivery.aspx/TransfertoGLRInventory",
            data: '{ model :' + JSON.stringify(model) + '}',
            //////data: '{slipno : ' + slipno + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! not transferred!", "error");
                    return;
                }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to transfer!", "error");
                    return;
                }
                if (r.d == 50) {
                    $.notify("Error!! this data already transferred!", "error");
                    return;
                }
                else {
                   
                    $.notify("transferred to glr inventory!", "success");
                }
            }
            ,
            error: function (errormessage) {
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! already exists!", "error");
                }
                else {
                    //alert("Error while saving data!!");
                    $.notify("Error while transferring to glr inventory!", "error");
                }
            }
        });
        }
   }



function OpenChallanDetails(empdata)
{
   
    const myArray = empdata.split(",");
    
    let id = myArray[0];
    let customername = myArray[1];
     let vehno = myArray[2];
     let statusid = myArray[3];
   ///// alert(id + "-" + statusid);
    
    if(statusid=="2")
    {
         /// $.notify("Not allowed. Already closed!!", "error");

         var result=confirm('Are you sure you want to re-open this challan!!');
         ////alert(result);

         if(result==true)
         {
            ////ReOpenRemarks(slipno);

             $("#reOpenSlipNo").val(0);
            //// $('#reopenDiv').modal('show');
             $("#reOpenSlipNo").val(id);


             var reopenedreason = "Reopen";
        var model = {};
        model.id = id;
        model.reopenedreason = reopenedreason;

        $.ajax({
            type: "POST",
            url: "sparepartsdelivery.aspx/ReopenChallan",
            data: '{ model :' + JSON.stringify(model) + '}',
            //////data: '{slipno : ' + slipno + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Challan not opened!", "error");
                    $('[id*=txtReOpenReason]').focus();
                    return;
                }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to reopen record!", "error");
                    return;
                }
                else {
                   $('#txtReOpenReason').val("");
                   $('#reopenDiv').modal('hide');
                   $("#reOpenSlipNo").val("0");
                    ////BindDataTable();
                  
                   var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);

                    $.notify("Challan reopened!", "success");
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
                    $.notify("Error while reopening slip!", "error");
                }
            }
        });



         }
    }
     else
     {
         $('#myModal').modal('show');
         $('#txtDSlipNo').html(id); 
          $('#txtDTrackerNo').html(id); 
         $('#txtDVehNo').html(vehno); 
         $('#txtDCustomerName').html(customername);
         
         BindDataTableDetails(id)
     }
}


//function ReOpenRemarks(slipno)
//{
//    $("#reOpenSlipNo").val(0);
//    $('#reopenDiv').modal('show');
//     $("#reOpenSlipNo").val(slipno);
//    
//}




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
    var res = validate();
    if (res == false) {
        return false;
    }

     

    //var id = table.rows()[0].length + 1;
   //// var slipno = $('[id*=txtSlipNo]').val();
    //var slipdate = $('[id*=txtDate]').val();
    var customername = $('[id*=txtCustomerName]').val();
    var vehicleno = $('[id*=txtVehChasisNo]').val();
    var mobileno = $('[id*=txtMobileNo]').val();

    var paymentmode = $('[id*=txtPaymentMode]').val();
    //// var modelname = $('[id*=txtModel]').val();

     var modelid =  $("#ddlModel :selected").val();
      var modelname = $("#ddlModel :selected").text();

    var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
    var servicetypeid = $("#ddlServiceType :selected").val();
    var servicetype = $("#ddlServiceType :selected").text();

     var invoicechallanno = $('[id*=txtInvoiceNo]').val();

      var gatepassno = $('[id*=txtgatepassno]').val();
    
   

//    var isactive = "";
//    if ($('#chkStatus').prop('checked')) {
//        isactive = "1";
//    } else {
//        isactive = "0";
//    }

   // name = sentenceCase(name);
    var model = {};
    model.challanno = "0";
    model.challannotext = "0";
   ///// model.slipdate = slipdate;
    model.customername = customername;
    model.vehicleno = vehicleno;
    model.mobileno = mobileno;
   ////// model.paymentmodeid=0;
    model.paymentmode = paymentmode;
    model.modelid=modelid;
    model.modelname = modelname;
    model.statusid=statusid;
    model.status=status;

     model.servicetypeid=servicetypeid;
    model.servicetype=servicetype;
    model.invoicechallanno=invoicechallanno;

    model.gatepassno=gatepassno;
    

    $.ajax({
        type: "POST",
        url: "sparepartsdelivery.aspx/SaveRecord",
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
                if (r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60 || r.d == 90) {
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
                        $.notify("Error!! slip already opened!", "error");
                        /////$('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 90) {
                        $.notify("Error!!  vehicle number not found in service!!", "error");
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

                    //////BindDataTable();

                     var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);
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
        url: "sparepartsdelivery.aspx/GetRecordbyID",
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
                if(json[0].statusid == "2")
                {
                    $.notify("Not allowed. Already closed!", "error");
                    $('#btnUpdateSlipMaster').hide();
                $('#btnAddNewSlipMaster').hide();
                    return;

                }

               

                ////var modelname = json[0].modelname;
                //alert(modelname);
                $('#recordID').val(json[0].id);
                 $('#txtSlipNo').val(json[0].slipno);

                 if(json[0].challandate != null)
                 {
                   ////slipdate = new Date(json[0].slipdate.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });

                    var slipdate = moment(json[0].challandate).format('MM-DD-YYYY')

                 }

                  ///$('#txtDate').val(slipdate);
                $('#txtCustomerName').val(json[0].customername);
                $('#txtVehChasisNo').val(json[0].vehicleno);
                $('#txtMobileNo').val(json[0].mobileno);
                $('#txtPaymentMode').val(json[0].paymentmode);
                $('#txtgatepassno').val(json[0].gatepassno);


                $("#ddlStatus").val(json[0].statusid);
                 $("#ddlServiceType").val(json[0].servicetypeid);

                 $("#txtInvoiceNo").val(json[0].invoicechallanno);


                  GetSelectedModelbyid(json[0].modelid);


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
    var res = validate();
    if (res == false) {
        return false;
    }
    var id = $('[id*=recordID]').val();
    ////alert(id);
    var slipno = $('[id*=txtSlipNo]').val();
  //// var slipdate = $('[id*=txtDate]').val();
    var customername = $('[id*=txtCustomerName]').val();
    var vehicleno = $('[id*=txtVehChasisNo]').val();
    var mobileno = $('[id*=txtMobileNo]').val();

    var paymentmode = $('[id*=txtPaymentMode]').val();
    //// var modelname = $('[id*=txtModel]').val();

     var modelid =  $("#ddlModel :selected").val();
      var modelname = $("#ddlModel :selected").text();

    var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
     var servicetypeid = $("#ddlServiceType :selected").val();
    var servicetype = $("#ddlServiceType :selected").text();

    var invoicechallanno = $('[id*=txtInvoiceNo]').val();


     var gatepassno = $('[id*=txtgatepassno]').val();

     if(gatepassno=="" && statusid == 2)
     {
         $.notify("Error!! please enter gate pass no!!", "error");
         return;
     }

////    var isactive = "";
////    if ($('#chkStatus').prop('checked')) {
////        isactive = "1";
////    } else {
////        isactive = "0";
////    }
    ////name = sentenceCase(name);
    if (id > 0) {
   
        var model = {};
    model.id=id;
    model.slipno = slipno;
    //////model.slipdate = slipdate;

    
    model.customername = customername;
    model.vehicleno = vehicleno;
    model.mobileno = mobileno;
   ////// model.paymentmodeid=0;

    

    model.paymentmode = paymentmode;
    model.modelid=modelid;
    model.modelname = modelname;
    model.statusid=statusid;
    model.status=status;

    
     model.servicetypeid=servicetypeid;
    model.servicetype=servicetype;

    model.invoicechallanno=invoicechallanno;
    /////alert(paymentmode + modelname + status);
     model.gatepassno=gatepassno;
    

        $.ajax({
            type: "POST",
            url: "sparepartsdelivery.aspx/UpdateRecord",
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
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60 || r.d == 70 || r.d == 90) {
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
                    if (r.d == 60) {
                        $.notify("Error!! slip already opened!", "error");
                        /////$('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 90) {
                        $.notify("Error!!  vehicle number not found in service!!", "error");
                        /////$('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                    if(r.d == 70)
                    {
                         $.notify("Error!! please enter gate pass no!", "error");
                          return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    /////$('#myModal').modal('hide');
                    $('#btnUpdateSlipMaster').hide();
                    $('#btnAddNewSlipMaster').show();
                    //////BindDataTable();

                     var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);

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
            url: "sparepartsdelivery.aspx/DeleteRecord",
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
                 if (r.d == 90) {
                    $.notify("Error!! items exists under this record. Please delete all items under this record first!!", "error");
                     return;
                }
                else {
                    $("#Showoverlay").hide();
                    ////////BindDataTable();

                     var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);

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
////            url: "sparepartsdelivery.aspx/PrintSlip",
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
$('#txtInvoiceNo').val("");
    $('#txtCustomerName').val("");
     $('#txtVehChasisNo').val("");
      $('#txtMobileNo').val("");
       $('#txtgatepassno').val("");
       /// $('#txtModel').val("");

        


    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtCustomerName').css('border-color', 'lightgrey');
    $('#txtVehChasisNo').css('border-color', 'lightgrey');
    $('#txtMobileNo').css('border-color', 'lightgrey');
  /////  $('#txtPaymentMode').css('border-color', 'lightgrey');
   //// $('#txtModel').css('border-color', 'lightgrey');
    $('#ddlModel').prop("selectedIndex", 0);
    $('#ddlStatus').prop("selectedIndex", 0);
     $('#ddlServiceType').prop("selectedIndex", 0);

//////    $('#myModal').modal('show');
//////    $('#myModal').on('shown.bs.modal', function () {
//////        $('#txtName').focus();
//////    });

    

}

//////Valdidation using jquery  
function validate() {
    var isValid = true;

////     if ($('#txtInvoiceNo').val().trim() == "") {
////        $('#txtInvoiceNo').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtInvoiceNo').css('border-color', 'lightgrey');
////    }


    if ($('#txtCustomerName').val().trim() == "") {
        $('#txtCustomerName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtCustomerName').css('border-color', 'lightgrey');
    }

    if ($('#txtVehChasisNo').val().trim() == "") {
        $('#txtVehChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehChasisNo').css('border-color', 'lightgrey');
    }

////    if ($('#txtDate').val().trim() == "") {
////        $('#txtDate').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtDate').css('border-color', 'lightgrey');
////    }


    if ($('#txtMobileNo').val().trim() == "") {
        $('#txtMobileNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobileNo').css('border-color', 'lightgrey');
    }

//    if ($('#txtPaymentMode').val().trim() == "") {
//        $('#txtPaymentMode').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#txtPaymentMode').css('border-color', 'lightgrey');
//    }

//////    if ($('#txtModel').val().trim() == "") {
//////        $('#txtModel').css('border-color', 'Red');
//////        isValid = false;
//////    }
//////    else {
//////        $('#txtModel').css('border-color', 'lightgrey');
//////    }



// if ($('#ddlModel :selected').val().trim() == "0") {
//       //// $('#ddlModel').css('border-color', 'Red');
//       alert("Please select model!!");
//        isValid = false;
//    }
//    else {
//        $('#ddlModel').css('border-color', 'lightgrey');
//    }


   

    if ($('#ddlStatus :selected').val().trim() == "0") {
        $('#ddlStatus').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlStatus').css('border-color', 'lightgrey');
    }

     if ($('#ddlServiceType :selected').val().trim() == "0") {
        $('#ddlServiceType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlServiceType').css('border-color', 'lightgrey');
    }

    return isValid;
}




////function for Reopen record
function ReOpenSlip() {
    
     if ($('#txtReOpenReason').val().trim() == "") {
        $('#txtReOpenReason').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtReOpenReason').css('border-color', 'lightgrey');
    }

    ///var slipno = slipno;
    /////alert($("#reOpenSlipNo").val());
   
    var reopenedreason = $('[id*=txtReOpenReason]').val();

//////    var isactive = "";
//////    if ($('#chkStatus').prop('checked')) {
//////        isactive = "1";
//////    } else {
//////        isactive = "0";
//////    }
//    ////name = sentenceCase(name);
//    if (id > 0) {
//   
        var model = {};
    ////model.id=id;
    model.slipno = $("#reOpenSlipNo").val();
    model.reopenedreason = reopenedreason;

//    
//    model.customername = customername;
//    model.vehicleno = vehicleno;
//    model.mobileno = mobileno;
//   ////// model.paymentmodeid=0;

//    

//    model.paymentmode = paymentmode;
//    //////model.modelid=0;
//    model.modelname = modelname;
//    model.statusid=statusid;
//    model.status=status;

//    /////alert(paymentmode + modelname + status);

  

        $.ajax({
            type: "POST",
            url: "sparepartsdelivery.aspx/ReopenSlip",
            data: '{ model :' + JSON.stringify(model) + '}',
            //////data: '{slipno : ' + slipno + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Slip not opened!", "error");
                    $('[id*=txtReOpenReason]').focus();
                    return;
                }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to reopen record!", "error");
                    return;
                }
                else {
                   $('#txtReOpenReason').val("");
                   $('#reopenDiv').modal('hide');
                   $("#reOpenSlipNo").val("0");
                    ////////BindDataTable();
                  
                   var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);

                    $.notify("Slip reopened!", "success");
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
                    $.notify("Error while reopening slip!", "error");
                }
            }
        });
    }
   




   ////////////////////////slip details/////////////////

    function rdTypeChange_Click()
   {
     
    if ($('#rdPartno').prop('checked')) {
        $('[id*=txtPartNo]').val("");
    } 
    
    if ($('#rdLabour').prop('checked')) {
        $('[id*=txtPartNo]').val("Labour");
    } 
   }


   function BindDataTableDetails(challanno) {
  
 

  $('#btnUpdateDetails').hide();

    $("#Showoverlay2").show();
    $.ajax({
        type: "POST",
        url: "sparepartsdelivery.aspx/GetAllDataByChallanno",
       data: '{challanno : ' + challanno + '}',
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

                     "<td>" + item.rate + ' ' + "</td>"  +
                      "<td>" + item.availstock + ' ' + "</td>"  +

                      "<td>" + item.totalamount + ' ' + "</td>"  +

                       "<td>" + item.issuedto + ' ' + "</td>"  +

                        "<td style='font-size:x-small;'>" + moment(item.createdon).format('DD-MMM-YYYY hh:mm A') + ' (' + item.createdby + ') <br /> ' +  moment(item.updatedon).format('DD-MMM-YYYY hh:mm A') + ' (' + item.updatedby + ') ' + ' ' + "</td>"  +



//                      "<td>" + " <input type='button' id='btnEditDetails'  onclick='EditRecordbyIDDetails(" + item.id + ")' value='Edit' class='btn btn-primary'>" + ' ' + "</td>" +

                        "<td>" +  '<input type="button" id="btnDelete" onclick="EditRecordbyIDDetails(\'' + item.id + ',' + item.rate  + '\'\)" value="Edit" class="btn btn-primary" />'  + "</td>" +


                      "<td>" +  '<input type="button" id="btnDelete" onclick="ReturnPartRecordDetails(\'' + item.id + ',' + item.qty +  ',' + item.partno +   ',' + item.particulars + ',' + item.issuedto + '\'\)"  value="Return" class="btn btn-success" /> ' + "</td>" +

                       "<td>" +
                       '<input type="button" id="btnDelete" onclick="DeleteRecordDetails(\'' + item.id + ',' + item.qty +  ',' + item.partno +   ','  + item.rate + '\'\)"  value="Delete" class="btn btn-danger" /> '
                        
                        
                         +  "</td>"

                         

                      //// return '<a href="#" onclick="OpenChallanDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="glyphicon glyphicon-plus text-primary" style="font-size:x-large;"></i> </a>';
                          

                       ////////onclick="OpenChallanDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">
                       
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
                dom: 'Bfrtip',
        buttons: [
             'excel'
        ]
        ,

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
    

    $('#hdnOldQty').val("0") 

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

////     if ($('#ddlIssuedTo').val().trim() == "") {
////        $('#ddlIssuedTo').css('border-color', 'Red');
////        return false;
////    }
////    else {
////        $('#ddlIssuedTo').css('border-color', 'lightgrey');
////    }


 if ($('#ddlIssuedTo :selected').val().trim() == "0") {
       //// $('#ddlModel').css('border-color', 'Red');
       alert("Please select employee!!");
      
        isValid = false;
         return;
    }
    else {
        $('#ddlIssuedTo').css('border-color', 'lightgrey');
    }

    

    


    //var id = table.rows()[0].length + 1;
    $("#addDetailsSlipNo").val("0");

     var partno = $('[id*=txtPartNo]').val();
    var particulars = $('[id*=txtParticulars]').val();
    var qty = $('[id*=txtQuantity]').val();
    var rate = $('[id*=txtRate]').val();
   
    var uomid = $("#ddlUom :selected").val();
    var uom = $("#ddlUom :selected").text();

    var tamt = parseFloat(qty)*parseFloat(rate);

    $("#txtTotalAmount").val(tamt);

     var issuedtoid =  $("#ddlIssuedTo :selected").val();
      var issuedto = $("#ddlIssuedTo :selected").text();



      var isparto = "";
    if ($('#rdPartno').prop('checked')) {
        ispart = "1";
    } else {
        ispart = "0";
    }

     var islabour = "";
    if ($('#rdLabour').prop('checked')) {
        islabour = "1";
    } else {
        islabour = "0";
    }


//    var isactive = "";
//    if ($('#chkStatus').prop('checked')) {
//        isactive = "1";
//    } else {
//        isactive = "0";
//    }

   // name = sentenceCase(name);
    var model = {};
    var challanno= $('#txtDSlipNo').html();
    
    model.challanno = challanno;
    model.partno=partno;
    model.particulars = particulars;
    model.uomid = uomid;
    model.uom = uom;
    model.qty = qty;
    model.rate = rate;
    model.issuedtoid=issuedtoid;
    model.issuedto=issuedto;
     model.ispart=ispart;
    model.islabour=islabour;

    $.ajax({
        type: "POST",
        url: "sparepartsdelivery.aspx/SaveRecordDetails",
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
             if (r.d == 20) {
                $.notify("Error!! Part no already added!", "error");
                return;
            }
             if (r.d == 90) {
                $.notify("Error!! Entered qty not available!!", "error");
                $('[id*=txtQuantity]').focus();
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
                 $('#txtQuantity').val("");
                 $('#txtRate').val("");


                    BindDataTableDetails($('#txtDSlipNo').html());
                    /////////BindDataTable();

                     var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);

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


function EditRecordbyIDDetails(rdata) {

const myArray = rdata.split(",");
    
    let id = myArray[0];
    let rate = myArray[1];

    

     if(rate=='0')
     {
        alert('Partno cannot be edited as it is returned!!');
        return;
     }

    ////alert(id);
     var challanno= $('#txtDSlipNo').html();
    $.ajax({
        type: "POST",
        url: "sparepartsdelivery.aspx/GetRecordbyIDDetails",
        data: '{ id :' + id + ', challanno: ' + challanno + '}',
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
                $('#txtRate').val(json[0].rate);               
                $("#ddlUom").val(json[0].uomid);
                 $('#hdnOldQty').val(json[0].qty) ;

                 GetSelectedIssuedto(json[0].issuedtoid);


                  var ispart=json[0].ispart;
                var islabour=json[0].islabour;


                 if(ispart=="1")
                {
                    document.getElementById("rdPartno").checked = true;
                }
                if(islabour=="1")
                {
                    document.getElementById("rdLabour").checked = true;
                }


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

    if ($('#ddlIssuedTo :selected').val().trim() == "0") {
       //// $('#ddlModel').css('border-color', 'Red');
       alert("Please select employee!!");
      
        isValid = false;
         return;
    }
    else {
        $('#ddlIssuedTo').css('border-color', 'lightgrey');
    }


     var isparto = "";
    if ($('#rdPartno').prop('checked')) {
        ispart = "1";
    } else {
        ispart = "0";
    }

     var islabour = "";
    if ($('#rdLabour').prop('checked')) {
        islabour = "1";
    } else {
        islabour = "0";
    }



    var id = $('[id*=recordID]').val();
    ////alert(id);
    var partno = $('[id*=txtPartNo]').val();
  var particulars = $('[id*=txtParticulars]').val();
    var qty = $('[id*=txtQuantity]').val();
    var rate = $('[id*=txtRate]').val();
   
    var uomid = $("#ddlUom :selected").val();
    var uom = $("#ddlUom :selected").text();

    var issuedtoid =  $("#ddlIssuedTo :selected").val();
      var issuedto = $("#ddlIssuedTo :selected").text();

////    var isactive = "";
////    if ($('#chkStatus').prop('checked')) {
////        isactive = "1";
////    } else {
////        isactive = "0";
////    }
    ////name = sentenceCase(name);
    if (id > 0) {
   
        var model = {};
    model.id=id;
   var challanno= $('#txtDSlipNo').html();
    
    model.challanno = challanno;
    model.partno=partno;
    model.particulars = particulars;
    model.uomid = uomid;
    model.uom = uom;
    model.qty = qty;
    model.rate = rate;
    model.oldqty=$('#hdnOldQty').val();
    model.issuedtoid=issuedtoid;
    model.issuedto=issuedto;

      model.ispart=ispart;
    model.islabour=islabour;

    /////alert(paymentmode + modelname + status);

    

        $.ajax({
            type: "POST",
            url: "sparepartsdelivery.aspx/UpdateRecordDetails",
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
                  $('#btnAddNewDetails').show();
                 $('#btnUpdateDetails').hide();
                    BindDataTableDetails(challanno);
                    $.notify("Record updated!", "success");
                    $('#hdnOldQty').val("0");
                     ////////BindDataTable();

                      var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);
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

 


function DeleteRecordDetails(rdata) {


const myArray = rdata.split(",");
    
    let id = myArray[0];
    let qty = myArray[1];
     let partno = myArray[2];
     let rate=myArray[3];

    

     if(rate=='0')
     {
        alert('Partno cannot be deleted as it is returned!!');
        return;
     }
   
    if (confirm('Are you sure delete this record?')) {
//////        var data = table.row($(this).parents('tr')).data();
//////        table.row($(this).parents('tr')).remove().draw();

 var challanno =  $('#txtDSlipNo').val();

        var model = {};
         model.id = id;
        model.qty = qty;  
        model.partno=partno;

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "sparepartsdelivery.aspx/DeleteRecordDetails",
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
                }
                 if (r.d == 99) {
                    $.notify("Error!! unable to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    BindDataTableDetails($('#txtDSlipNo').html());
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






function ReturnPartRecordDetails(rdata) {


const myArray = rdata.split(",");
    
    let id = myArray[0];
    let qty = myArray[1];
     let partno = myArray[2];
     let particulars = myArray[3];
     let issuedto=myArray[4];
     
   
   if(issuedto=="Part Returned")
   {
        $.notify("Error!! This part is already returned!!", "error");
   }
   else{
    if (confirm('Are you sure you want to return this part?')) {
//////        var data = table.row($(this).parents('tr')).data();
//////        table.row($(this).parents('tr')).remove().draw();

 var challanno =  $('#txtDSlipNo').val();

        var model = {};
         model.id = id;
        model.qty = qty;  
        model.partno=partno;
        model.particulars=particulars;

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "sparepartsdelivery.aspx/ReturnPartRecordDetails",
            //////data: '{ id :' + id + '}',
             data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Part not returned!", "error");
                    $('[id*=txtName]').focus();
                    return;
                }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to return part!", "error");
                }
                 if (r.d == 99) {
                    $.notify("Error!! unable to return part!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    BindDataTableDetails($('#txtDSlipNo').html());
                    $.notify("Part returned!", "success");
                }
            },
            error: function (errormessage) {
                $.notify("Error while returning part!", "error");
            }

        });
        $("#Showoverlay").hide();
    }
    }
}




////////////////only display items///////////////

 function ShowChallanDetails(empdata)
    {
   
        const myArray = empdata.split(",");
    
        let slipno = myArray[0];
        let customername = myArray[1];
        let vehno = myArray[2];
        let statusid = myArray[3];
        /////alert(id);

        if(statusid=="2")
        {
            $('#myDisplayModal').modal('show');
         BindDisplayDataTableDetails(slipno)
        }
    }

 function BindDisplayDataTableDetails(challanno) {
  
  ///$('#btnUpdateDetails').hide();

    $("#Showoverlay3").show();
    $.ajax({
        type: "POST",
       url: "sparepartsdelivery.aspx/GetAllDataByChallanno",
       data: '{challanno : ' + challanno + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblDetailsDisplay").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblDetailsDisplay tbody').empty();
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

                     "<td>" + item.rate + ' ' + "</td>"  +

                      "<td>" + item.totalamount + ' ' + "</td>"  +

                       "<td>" + item.issuedto + ' ' + "</td>"  +

                        "<td style='font-size:x-small;'>" + moment(item.createdon).format('DD-MMM-YYYY hh:mm A') + ' (' + item.createdby + ') <br /> ' +  moment(item.updatedon).format('DD-MMM-YYYY hh:mm A') + ' (' + item.updatedby + ') ' + ' ' + "</td>"  +


                    + "</tr>";
            });
           
            $('#tblDetailsDisplay tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblDetailsDisplay]').DataTable({
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
                    $("#Showoverlay3").hide();
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







