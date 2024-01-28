
$(document).ready(function () {


        var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = mm + '/' + dd + '/' + yyyy;
    $('#txtBillInvoiceDate').val(today);



})  

 


$(function () {
    //$("#Showoverlay").show();
    //GetData();
    BindDataTable();
});




function BindDataTable() {


 $("#tblRecords").dataTable().fnDestroy();

//  /////////////for export import ///////////////
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
//		}
//////        , 

//////        {
//////			extend: 'pdf',
//////				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
//////				titleAttr: 'Pdf',
//////				title: 'Save as PDF',
//////                // "action": newexportactiontoPDF,
//////				
//////		} 

//         ]) // end array

//  }

// /////////////end for export import ///////////////

 $("#tblRecords").dataTable().fnDestroy();


 $('#tblRecords').DataTable({
    ////  "order": [[ 8, 'desc' ]],



     "columnDefs": [
    { "visible": false, "targets": [] }
    ],

     bServerSide: true,
     sAjaxSource: 'yardEntryBillsHandler.ashx/GetAllList',
     sServerMethod: 'post',
     "processing": true,

     "columns": [

                    { "data": "id",
                        ////                     {
                        ////                     bSortable: false,
                        ////                      render: function (data, type, row, meta) {
                        ////                     return meta.row + meta.settings._iDisplayStart + 1;
                        ////                    }

                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        }
                    },
                    { "data": "vehno"
                        //////                    ,
                        //////                        render: function ( data, type, row )
                        //////                        {
                        //////                         return row.ocustname + '<hr style="border-top: 2px solid #000; margin-top:3px;margin-botton:-2px;" />(' + row.ocontactno + ')';
                        //////                        }
                    },
                    { "data": "modelname" },

                    { "data": "custname" },
                    { "data": "invoicedate",
                        render: function (data, type, row) {
                            return "<b>" + row.invoiceno + "</b>" + " ("+ row.invoicedate + ")"+ '';
                        }
                    },
                     { "data": "rateperday"

                        ,
                         render: function (data, type, row) {
                             //                            if(row.outdt=="01-Jan-1900")
                             //                            row.outdt="";

                             return row.rateperday + '';
                         }


                     },
                       { "data": "totaldays" },

     //                        { "data": "totaldays"
     //                        
     //                         ,
     //                        render: function ( data, type, row )
     //                        {
     //                            return '<a href="#" onclick="CreateBill(\'' + row.id  + '\'\)">  <i class="btn btn-primary" > Create Bill </i> </a>'
     //                        }

     //                         },
                          {"data": "totalamt" },
                        { "data": "createdby",
                            render: function (data, type, row) {
                                ////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
                                ////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                                var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                                var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')


                                return "<div class='text-nowrap'>" + row.createdby + '(' + cdate + ')  <br/>' + row.updatedby + '(' + udate + ')' + "</div>";
                            }
                        }

                 ,

                  

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
                       "data": "invoiceno"
                       ,

                       render: function (data, type, row) {
                           return '<a href="#" onclick="PrintPDF(' + row.invoiceno + ')"><i class="glyphicon glyphicon-print text-primary" style="font-size:x-large;"></i></a>'
                       }
                       ////                       "render": function (id, type, full, meta) {
                       ////                           //debugger
                       ////                           return '<a href="#" onclick="PrintPDF(' + row.invoiceno + ')"><i class="glyphicon glyphicon-print text-success" style="font-size:x-large;"></i></a>'
                       ////                       }
                   }

                          


                ],
     stateSave: true,
     "bDestroy": true
 });


            }




function newexportaction()
 {

      

    
       $("#Showoverlay").show(); 
       $.ajax({
        type: "POST",
        url: "yardentrybills.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Ankur Yard Data", true);

         $("#Showoverlay").hide(); 


        }
        });
    }
            ////alert("export");          

   


function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    
    var CSV = '';    
    //Set Report title in first row or line
    
    CSV += ReportTitle + '\r\n\n';

    //This condition will generate the Label/Header
    if (ShowLabel) {
        var row = "";
        
        //This loop will extract the label from 1st index of on array
        for (var index in arrData[0]) {
            
            //Now convert each value to string and comma-seprated
            row += index + ',';
        }

        row = row.slice(0, -1);
        
        //append Label row with line break
        CSV += row + '\r\n';
    }
    
    //1st loop is to extract each row
    for (var i = 0; i < arrData.length; i++) {
        var row = "";
        
        //2nd loop will extract each column and convert it in string comma-seprated
        for (var index in arrData[i]) {
            row += '"' + arrData[i][index] + '",';
        }

        row.slice(0, row.length - 1);
        
        //add a line break after each row
        CSV += row + '\r\n';
    }

    if (CSV == '') {        
        alert("Invalid data");
        return;
    }   
    
    //Generate a file name
    var fileName = "Ankur Yard";
    //this will remove the blank-spaces from the title and replace it with an underscore
    fileName += ReportTitle.replace(/ /g,"_");   
    
    //Initialize file format you want csv or xls
    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
    
    // Now the little tricky part.
    // you can use either>> window.open(uri);
    // but this will not work in some browsers
    // or you will not get the correct file extension    
    
    //this trick will generate a temp <a /> tag
    var link = document.createElement("a");    
    link.href = uri;
    
    //set the visibility hidden so it will not effect on your web-layout
    link.style = "visibility:hidden";
    link.download = fileName + ".csv";
    
    //this part will append the anchor tag and remove it after automatic click
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

 

 function newexportactiontoPDF()
  {

     
      $("#Showoverlay").show();
           $.ajax({
        type: "POST",
        url: "yardentrybills.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
       
         var json = JSON.parse(data.d)

         var count = Object.keys(json).length;
         
        if(json == '')
            return;        

       var doc = new jspdf.jsPDF()

        var head = [['ID', 'Insurance Company', 'Repair Type', 'Spot Surveyor', 'Final Surveyor', 'Ins. Surveyor', 'Insurance Type', 'Estimated Date',  'Veh. No', 'Date of Loss', 'Customer Name', 'Model', 'Contact No', 'Claim Status']]
        var body = []
      $.each(json, function (key, item) {

        var data =  [item.id, item.inscompname, item.repairtype, item.surveyornamespot, item.surveyornamefinal, item.surveyornamereins, item.instype, item.estimateddate, item.vehno, item.dateofloss, item.custname, item.vehmakemodel, item.contactno, item.claimstatus];
        body.push(data);
         });

       doc.autoTable({ head: head, body: body })

        // Simple html example
        doc.autoTable({ html: '#tabledata' })

        doc.save('AnkurYard.pdf')
         $("#Showoverlay").hide(); 

        }
       });
   
    
 }    






////function AddRecord() {
////    var res = validate();
////    if (res == false) {
////        return false;
////    }
////    

////    //var id = table.rows()[0].length + 1;
////     
////      
////   ////debugger;

////   var vehno = $('[id*=txtVehNo]').val();
////     var modelid = $("#ddlModel :selected").val();
////      var modelname = $("#ddlModel :selected").text();
////      var fcid = $("#ddlFC :selected").val();
////      var fcname = $("#ddlFC :selected").text();
////      var custname = $('[id*=txtCustName]').val();

////      var entrydt = $('[id*=txtInDate]').val();
////      var outdt = $('[id*=txtOutDate]').val();
////      var isout = "";
////    if ($('#chkOut').prop('checked')) {
////        isout = "1";
////    } else {
////        isout = "0";
////    }


////   // name = sentenceCase(name);
////    var model = {};
////        model.vehno = vehno;
////        model.modelid = modelid;
////        model.modelname = modelname;
////        model.fcid = fcid;
////        model.fcname = fcname;
////        model.custname = custname;
////        model.entrydt = entrydt;
////        model.isout = isout;
////        model.outdt = outdt;

////           
////    $.ajax({
////        type: "POST",
////        url: "yardentrybills.aspx/SaveRecord",
////        data: '{ model :' + JSON.stringify(model) + '}',
////        contentType: "application/json; charset=utf-8",
////        dataType: "json",
////        async: false,
////        success: function (r) {
////        if (r.d == 0) {
////                $.notify("Error!! Record not saved!", "error");
////                $('[id*=txtVehNo]').focus();
////                return;
////            }
////            if (r.d == 10) {
////                $.notify("Error!! You do not have permission to add record!", "error");
////                return;
////            }
////            else {
////                if (r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60) {
////                    if (r.d == 20) {
////                        $.notify("Error!! veh./chasis no already exists!", "error");
////                        return;
////                    }
////                    if (r.d == 30) {
////                        $.notify("Error!! required fields cannot be blank!", "error");
////                        $('[id*=txtVehNo]').focus();
////                        return;
////                    }
////                    if (r.d == 50) {
////                        $.notify("Error!! invalid mobile no!", "error");
////                        $('[id*=txtVehNo]').focus();
////                        return;
////                    }
////                     if (r.d == 60) {
////                        $.notify("Error!! out date cannot be less than entry date!!", "error");
////                        $('[id*=txtName]').focus();
////                        return;
////                    }
////                }
////                else {
////                    $('#myModal').modal('hide');
////                     $('#recordID').val("0");

////                    BindDataTable();
////                    $.notify("Record saved!", "success");
////                }
////            }
////        }
////            ,
////        error: function (errormessage) {
////            ///////alert(errormessage.responseText);
////            if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
////                //alert("Error!! model name already exists!!");
////                $.notify("Error!! Vehicle No already exists!", "error");
////            }
////            else {
////                //alert("Error while saving data!!");
////                $.notify("Error while saving data!", "error");
////            }
////        }
////    });
////}


function EditRecordbyID(id) {
    /////alert(id);
    
    $('#recordID').val("0");
   
    $.ajax({
        type: "POST",
        url: "yardentryankurbills.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                ////var custname = json[0].custname;
               //// alert(result.d);
                $('#recordID').val(json[0].id);


                 $('#txtBillCustName').val(json[0].custname)

                 $('#txtBillInvoiceNo').val(json[0].invoiceno)
                 $('#ddlBillPaymentmethod').val(json[0].paymentmethodid)
                 $('#txtBillVehNo').val(json[0].vehno)
                 $('#txtBillContactNo').val(json[0].contactno)
                 $('#txtBillAadhaarNo').val(json[0].aadhaarno)
                 $('#txtGstinNo').val(json[0].gstinno)
                 $('#txtBillRate').val(json[0].rateperday)
                 $('#hdntotaldays').val(json[0].totaldays);
                     var invoiceDt = new Date(json[0].invoicedate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
//                    /////// var outdt = new Date(json[0].outdt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                $('#txtBillInvoiceDate').val(invoiceDt);
                ///////$('#txtOutDate').val(outdt);

                ////chkOut_CheckChange();

                               

                $('#myModal').modal('show');
                $('#myModal').on('shown.bs.modal', function () {
                    $('#txtBillRate').focus();
                });
                $('#btnUpdate').show();
              ////  $('#btnAdd').hide();
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
            $.notify("Error while fetching data!", "error");
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


      var contactno = $('[id*=txtBillContactNo]').val();
      var paymentmethodid = $("#ddlBillPaymentmethod :selected").val();
      var paymentmethod = $("#ddlBillPaymentmethod :selected").text();

      var aadhaarno = $('[id*=txtBillAadhaarNo]').val();

      var gstinno = $('[id*=txtGstinNo]').val();
      var rateperday = $('[id*=txtBillRate]').val();
      var totadays = $('#hdntotaldays').val();

      alert(id);

    if (id > 0) {
        var model = {};
        model.id = id;
        model.contactno = contactno;
        model.paymentmethodid = paymentmethodid;
        model.paymentmethod = paymentmethod;
        model.aadhaarno = aadhaarno;
        model.gstinno = gstinno;
        model.rateperday = rateperday;
        model.totaldays = totadays;

        $.ajax({
            type: "POST",
            url: "yardentryankurbills.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not updated!", "error");
                $('[id*=txtBillRate]').focus();
                return;
            }
                if (r.d == 10 ||  r.d == 30 || r.d == 50 || r.d == 60) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        return;
                    }
                   if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtVehNo]').focus();
                        return;
                    }
                     
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                   ////// $('#btnAdd').hide();
                    BindDataTable();
                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! Vehicle No already exists!", "error");
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
//        var data = table.row($(this).parents('tr')).data();
//        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "yardentryankurbills.aspx/DeleteRecord",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not deleted!", "error");
                $('[id*=txtVehNo]').focus();
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
 
 chkOut_CheckChange("0");
 $('#recordID').val('0');

    $('#txtVehNo').val("");
   
    $('#ddlModel').prop("selectedIndex", 0);
     $('#ddlFC').prop("selectedIndex", 0);
     
        $('#txtCustName').val("");
        $('#txtInDate').val("");
        $('#txtOutDate').val("");

      $('#ddlModel').css('border-color', 'lightgrey');


    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtCustName').css('border-color', 'lightgrey');   
    $('#txtVehChasisNo').css('border-color', 'lightgrey'); 
    $('#txtInDate').css('border-color', 'lightgrey');   
    $('#ddlFC').css('border-color', 'lightgrey');


    $('#myModal').modal('show');
    $('#myModal').on('shown.bs.modal', function () {
        $('#txtVehNo').focus();
    });

}
//Valdidation using jquery  
function validate() {
    var isValid = true;

    if ($('#txtBillRate').val().trim() == "") {
        $('#txtBillRate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtBillRate').css('border-color', 'green');
    }


    if ($('#ddlBillPaymentmethod :selected').val().trim() == "0") {
        $('#ddlBillPaymentmethod').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlBillPaymentmethod').css('border-color', 'green');
    }


    return isValid;
}




