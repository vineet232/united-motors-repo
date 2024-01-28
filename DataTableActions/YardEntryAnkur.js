
$(document).ready(function () {

$("#ddlModel").select2();
$("#ddlFC").select2();

 $.ajax({
        type: "POST", url: "yardentry.aspx/GetFinanceCompanyName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlFC").append($("<option></option>").val(value.id).html(value.fcname));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });

    $.ajax({
        type: "POST", url: "yardentry.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.MakenModel));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });



    $('#txtInDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

    $('#txtOutDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
        //////endDate: "today"
    });
    




    


//     $('#txtBillInvoiceDate').datepicker({
//        format: "mm/dd/yyyy",
//        autoclose: true,
//        //////endDate: "today"
//    });


        var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = mm + '/' + dd + '/' + yyyy;
    $('#txtBillInvoiceDate').val(today);



})  

 
 function GetSelectedFCbyid(fcid)
 {
 $('#ddlFC').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
   $.ajax({
        type: "POST", url: "yardentry.aspx/GetFinanceCompanyName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlFC").append($("<option></option>").val(value.id).html(value.fcname));
            })
        
         $('#ddlFC').val(fcid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").hide();
        }

    });
 }


 function GetSelectedModelbyid(modelid)
 {
 $('#ddlModel').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
  $.ajax({
        type: "POST", url: "yardentry.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.MakenModel));
            })
           
            $('#ddlModel').val(modelid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").hide();
        }

    });
 }





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
           /////// "order": [[ 0, 'desc' ]],
           


            "columnDefs": [
    { "visible": false, "targets": [] }
    ],

                bServerSide: true,
                sAjaxSource: 'yardEntryHandler.ashx/GetAllList',
                sServerMethod: 'post',
                "processing": true,

                "columns": [
                
                    {  "data": "id" ,
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
                    { "data": "fcname" },
                    { "data": "custname" },
                    { "data": "entrydt" ,
                        render: function ( data, type, row )
                        {
                         return row.entrydt + '';
                        }
                    },
                     { "data": "outdt"

                        ,
                        render: function ( data, type, row )
                        {
                            if(row.outdt=="01-Jan-1900")
                            row.outdt="";

                         return row.outdt  + '';
                        }

                     
                      },
                       { "data": "totaldays" },
                       
                        { "data": "totaldays"
                        
                         ,
                        render: function ( data, type, row )
                        {
                            if(row.outdt != "")
                            {
                                return '<a href="#" onclick="CreateBill(\'' + row.id  + '\'\)">  <i class="btn btn-primary" > Create Bill </i> </a>';
                            }
                            else{
                               /// $.notify("please enter out date before create bill", "error");
                                return "Enter out date before create bill";
                            }
                        }

                         },

                        { "data": "createdby",
                        render: function ( data, type, row )
                        {
////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

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
                stateSave: true,
                "bDestroy": true
            });


            }

function chkOut_CheckChange(status)
{
   /////alert(status);
     /// $("#chkOut").removeAttr("checked");

////      if (isout == "1") {
////                    $('#chkOut').prop('checked')
////                    $("#txtOutDate").attr('disabled',false);
////                } else {
////                    $("#chkOut").removeAttr("checked");
////                     $("#txtOutDate").val("");
////                    $("#txtOutDate").attr('disabled',true);
////                }


    if (status == "1" || status == 1) {
    
    $('#chkOut').prop('checked')
    //$('#chkOut').prop('checked', true)
       $("#txtOutDate").attr('disabled',false);
       $('#chkOut').prop('checked')
    } 
    else 
    {
    $("#chkOut").removeAttr("checked");
     ////$('#chkOut').prop('checked', false)
        $('#txtOutDate').val("");
       $("#txtOutDate").attr('disabled',true);

    }
   
}



function chkOut_CheckChange1()
{
   
    if ( $('#chkOut').prop('checked')) {
    
    $('#chkOut').prop('checked')
    //$('#chkOut').prop('checked', true)
       $("#txtOutDate").attr('disabled',false);
    } 
    else 
    {
    $("#chkOut").removeAttr("checked");
     ////$('#chkOut').prop('checked', false)
        $('#txtOutDate').val("");
       $("#txtOutDate").attr('disabled',true);

    }
   
}





function newexportaction()
 {

      

    
       $("#Showoverlay").show(); 
       $.ajax({
        type: "POST",
        url: "yardentry.aspx/GetDatainExcel",
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
        url: "yardentry.aspx/GetDatainExcel",
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






function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    

    //var id = table.rows()[0].length + 1;
     
      
   ////debugger;

   var vehno = $('[id*=txtVehNo]').val();
     var modelid = $("#ddlModel :selected").val();
      var modelname = $("#ddlModel :selected").text();
      var fcid = $("#ddlFC :selected").val();
      var fcname = $("#ddlFC :selected").text();
      var custname = $('[id*=txtCustName]').val();

      var entrydt = $('[id*=txtInDate]').val();
      var outdt = $('[id*=txtOutDate]').val();
      var isout = "";
    if ($('#chkOut').prop('checked')) {
        isout = "1";
    } else {
        isout = "0";
    }


   // name = sentenceCase(name);
    var model = {};
        model.vehno = vehno;
        model.modelid = modelid;
        model.modelname = modelname;
        model.fcid = fcid;
        model.fcname = fcname;
        model.custname = custname;
        model.entrydt = entrydt;
        model.isout = isout;
        model.outdt = outdt;

           
    $.ajax({
        type: "POST",
        url: "yardentry.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
        if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtVehNo]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60) {
                    if (r.d == 20) {
                        $.notify("Error!! veh./chasis no already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        $('[id*=txtVehNo]').focus();
                        return;
                    }
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtVehNo]').focus();
                        return;
                    }
                     if (r.d == 60) {
                        $.notify("Error!! out date cannot be less than entry date!!", "error");
                        $('[id*=txtName]').focus();
                        return;
                    }
                }
                else {
                    $('#myModal').modal('hide');
                     $('#recordID').val("0");

                    BindDataTable();
                    $.notify("Record saved!", "success");
                }
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
                $.notify("Error while saving data!", "error");
            }
        }
    });
}


function EditRecordbyID(id) {
    /////alert(id);
    
    $('#recordID').val("0");
   
    $.ajax({
        type: "POST",
        url: "yardentry.aspx/GetRecordbyID",
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
               
                
                 $('#txtVehNo').val(json[0].vehno);
                $('#txtCustName').val(json[0].custname); 

                 GetSelectedModelbyid(json[0].modelid);
                 GetSelectedFCbyid(json[0].fcid);
                  

                     var entrydt = new Date(json[0].entrydt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                     var outdt = new Date(json[0].outdt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                $('#txtInDate').val(entrydt);
                $('#txtOutDate').val(outdt);

                ////chkOut_CheckChange();

                var isout = json[0].isout;

                chkOut_CheckChange(isout);
               
////                if (isout == "1") {
////                    $('#chkOut').prop('checked')
////                    $("#txtOutDate").attr('disabled',false);
////                } else {
////                    $("#chkOut").removeAttr("checked");
////                     $("#txtOutDate").val("");
////                    $("#txtOutDate").attr('disabled',true);
////                }


////     if (isout == "1") {
////     
////        $('#chkOut').prop('checked');
////       $("#txtOutDate").attr('disabled',false);
////    } 
////    else 
////    {
////        $('#txtOutDate').val("");
////       $("#txtOutDate").attr('disabled',true);

////    }


               

                $('#myModal').modal('show');
                $('#myModal').on('shown.bs.modal', function () {
                    $('#txtVehNo').focus();
                });
                $('#btnUpdate').show();
                $('#btnAdd').hide();
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
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
     
 var vehno = $('[id*=txtVehNo]').val();
     var modelid = $("#ddlModel :selected").val();
      var modelname = $("#ddlModel :selected").text();
      var fcid = $("#ddlFC :selected").val();
      var fcname = $("#ddlFC :selected").text();
      var custname = $('[id*=txtCustName]').val();

      var entrydt = $('[id*=txtInDate]').val();
      var outdt = $('[id*=txtOutDate]').val();
      var isout = "";
    if ($('#chkOut').prop('checked')) {
        isout = "1";
    } else {
        isout = "0";
    }

    

    if (id > 0) {
        var model = {};
        model.id = id;
        model.vehno = vehno;
        model.modelid = modelid;
        model.modelname = modelname;
        model.fcid = fcid;
        model.fcname = fcname;
        model.custname = custname;
        model.entrydt = entrydt;
        model.isout = isout;
        model.outdt = outdt;

        

        $.ajax({
            type: "POST",
            url: "yardentry.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not updated!", "error");
                $('[id*=txtVehNo]').focus();
                return;
            }
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! veh./chasis no already exists!", "error");
                        return;
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
                     if (r.d == 60) {
                        $.notify("Error!! out date cannot be less than entry date!!", "error");
                        $('[id*=txtName]').focus();
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAdd').hide();
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
            url: "yardentry.aspx/DeleteRecord",
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
    
    if ($('#txtVehNo').val().trim() == "") {
        $('#txtVehNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehNo').css('border-color', 'green');
    }


    if ($('#ddlModel :selected').val().trim() == "0") {
        $('#ddlModel').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlModel').css('border-color', 'green');
    }

    
    if ($('#ddlFC :selected').val().trim() == "0") {
        $('#ddlFC').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlFC').css('border-color', 'green');
    }

    

//    if ($('#txtCustName').val().trim() == "") {
//        $('#txtCustName').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#txtCustName').css('border-color', 'green');
//    }

    if ($('#txtInDate').val().trim() == "") {
        $('#txtInDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtInDate').css('border-color', 'green');
    }

    

    return isValid;
}








function CreateBill(recordid)
{

// var model = {};
//        model.id = recordid;

$("#hdnyardid").val(recordid);

 $.ajax({
        type: "POST", url: "yardentry.aspx/GetInvoiceNo",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        /////alert(res.d);
        $("#txtBillInvoiceNo").val(res.d);

//////            $.each(res.d, function (data, value) {

//////                $("#txtBillInvoiceNo").val(value.invoiceno);
//////            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });


 $.ajax({
        type: "POST",
        url: "yardentry.aspx/GetRecordbyID",
        data: '{ id :' + recordid + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                ////$('#recordID').val(json[0].id);
               
                
                 $('#txtBillVehNo').val(json[0].vehno);
                $('#txtBillCustName').val(json[0].custname); 

              
                     var entrydt = new Date(json[0].entrydt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

                       $('#hdnentrydt').val(entrydt);

                      
                        $('#hdnmodelid').val(json[0].modelid);
                         $('#hdnmodelname').val(json[0].modelname);

                         $('#hdnparkingtoforbill').val(json[0].outdt);
                         $('#hdntotalparkingdaysforbill').val(json[0].totaldays);

////////                     var outdt = new Date(json[0].outdt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
////////////                $('#txtInDate').val(entrydt);
////////////                $('#txtOutDate').val(outdt);

              
                 $('#myModal2').modal('show');
                    $('#myModal2').on('shown.bs.modal', function () {
                        $('#txtBillRate').focus();
                    });
    
               
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetching data!", "error");
        }
    });


}

function SaveBill() {
////    var res = validate();
////    if (res == false) {
////        return false;
////    }
    
  

////    if ($('#txtBillContactNo').val().trim() == "") {
////        $('#txtBillContactNo').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtBillContactNo').css('border-color', 'green');
////    }

    if ($('#txtBillRate').val().trim() == "") {
        $('#txtBillRate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtBillRate').css('border-color', 'green');
    }

   
  

////      var fcid = $("#ddlFC :selected").val();
////      var fcname = $("#ddlFC :selected").text();
       var custname = $('[id*=txtBillCustName]').val();
       var invoiceno = $('[id*=txtBillInvoiceNo]').val();
        
       var paymentmethodid = $("#ddlBillPaymentmethod :selected").val();
       var paymentmethod = $("#ddlBillPaymentmethod :selected").text();
       var invoicedate = $('[id*=txtBillInvoiceDate]').val();
       var vehno = $('[id*=txtBillVehNo]').val();
       
       var contactno = $('[id*=txtBillContactNo]').val();
        var aadhaarno = $('[id*=txtBillAadhaarNo]').val();
         var gstinno = $('[id*=txtGstinNo]').val();
          
         var rateperday = $('[id*=txtBillRate]').val();
        var modelid = $("#hdnmodelid").val();
        var modelname = $("#hdnmodelname").val();
        
         //////alert($('#hdnentrydt').val());
         var parkingfrom = $("#hdnentrydt").val();
          /////alert(parkingfrom);
          //var parkingto = $("hdnmodelname").val();
        
        var yardid = $("#hdnyardid").val();
    

      var outdt = $('[id*=txtBillInvoiceDate]').val();
      var isout = "";   
        isout = "1";


        var totaldays= $('[id*=hdntotalparkingdaysforbill]').val(); 

        var outdt=$('[id*=hdnparkingtoforbill]').val();;
        var parkingto = new Date(outdt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

     

   // name = sentenceCase(name);
    var model = {};
        model.yardid = yardid;
        model.invoiceno = invoiceno;
        model.custname = custname;
        model.aadhaarno = aadhaarno;
        model.gstinno = gstinno;
        model.fcid = "0";
        model.fcname = "";
        model.paymentmethodid = paymentmethodid;
        model.paymentmethod = paymentmethod;
        model.vehno = vehno;
        model.invoicedate = invoicedate;
        model.contactno = contactno;
        model.modelid = modelid;
        model.modelname = modelname;
        model.parkingfrom = parkingfrom;
        model.parkingto = parkingto;
        model.rateperday = rateperday;
        model.totaldays=totaldays;
       //////// model.parkingto = invoicedate;
           
    $.ajax({
        type: "POST",
        url: "yardentry.aspx/SaveBillRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
        if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtBillRate]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60) {
                    if (r.d == 20) {
                        $.notify("Error!! veh./chasis no already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        $('[id*=txtBillRate]').focus();
                        return;
                    }
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtBillRate]').focus();
                        return;
                    }
                     if (r.d == 60) {
                        $.notify("Error!! out date cannot be less than entry date!!", "error");
                        $('[id*=txtBillRate]').focus();
                        return;
                    }
                }
                else {
                    $('#myModal2').modal('hide');
                     $('#recordID').val("0");
                     $('#txtBillRate').val("")
                    BindDataTable();
                    $.notify("Record saved!", "success");
                }
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
                $.notify("Error while saving data!", "error");
            }
        }
    });
}




