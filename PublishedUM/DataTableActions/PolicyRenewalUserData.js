﻿
$(document).ready(function () {
    $.ajax({
        type: "POST", url: "policyRenewalAssigned.aspx/GetLastRenewalName",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlLastRenewalFrom").append($("<option></option>").val(value.id).html(value.renewalFrom));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });

    $.ajax({
        type: "POST", url: "policyRenewalAssigned.aspx/GetModelName",
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


    $('#txtDueDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });


    $('#txtnextcallingdate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });


    

})  

 



$(function () {
    ////$("#Showoverlay").show();
    BindDataTable();
});


function BindDataTable() {

var show = false;
    var printPermission = $("#hdnPrintPermission").val();
    ///alert(printPermission);

    if (printPermission == "1") {
        show = true;
    }

    var buttons = [''];
    /////var buttons = ['colvis'];
    ////var buttons = ['export'];

    if (show) {
        /////buttons.push('copyHtml5', 'excelHtml5', 'pdfHtml5' );
        ////buttons.push('excel',  'pdfHtml5' );

        buttons.push([ //begin array


    {
    extend: 'excelHtml5',
    text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
    titleAttr: 'Excel',
    title: 'Save as Excel',
    exportOptions: {
        columns: [1, 2]
    }


},

        {
            extend: 'pdf',
            text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
            titleAttr: 'Pdf',
            title: 'Save as PDF',
            exportOptions: {
                columns: [1, 2]
            }

        }

         ]) // end array

    }


 $("#tblRecords").dataTable().fnDestroy();

            $('#tblRecords').DataTable({
             "order": [[ 0, 'asc' ]],
             bServerSide: true,
                sAjaxSource: 'PolicyAssignedDataHandler.ashx/GetAssignedPolicyData',
                sServerMethod: 'post',
                "processing": true,
                dom: 'lBfrtip',
                responsive: true,
                buttons: buttons,


                "columns": [
                 { "data": "id" },
                    { "data": "ocustname" },
                    { "data": "ovehChasisno" },
                    { "data": "oduedate" },
                    { "data": "omobileno" },
                    { "data": "owhatsappno" },
                    { "data": "omodelName" },
                    { "data": "olastrenewalfromval" },
                     { "data": "ocreatedby",
                        render: function ( data, type, row )
                        {
////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm a')
                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm a')


                         return "<div class='text-nowrap'>" + row.ocreatedby + '(' + cdate + ')  <br/>' + row.oupdatedby + '(' + udate + ')' + "</div>";
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
                            return '<a href="#" onclick="CallingDetails(' + id + ')"><i class="glyphicon glyphicon-phone text-primary" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ],

                 stateSave: true,
                "bDestroy": true

            });


            }



////     // Before the request starts, show the 'Loading message...'
////     $('.result').text('File is being uploaded...');
////     event.preventDefault();
////     // On the click even,
////     var formData = new FormData($('#form')[0]);
////       $.ajax({
////           type: 'POST',
////           processData: false,
////           contentType: false,
////           data: formData,
////           success: function (data) {
////              // The file was uploaded successfully...
////              $('.result').text('File was uploaded.');
////           },
////           error: function (data) {
////              // there was an error.
////              $('.result').text('Whoops! There was an error in the request.');
////           }
////       });
//    });
// });



//function GetData() {
//    $("#Showoverlay").show();
//    $.ajax({
//        type: "POST",
//        url: "policyRenewalAssigned.aspx/GetAllData",
//            data: '',
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (data) {

//            $("#tblRecords").dataTable().fnDestroy();
//            var json = JSON.parse(data.d)
//            var i=0;
//            var rows = '';
//            $('#tblRecords tbody').empty();
//            $.each(json, function (key, item) {
//            i=i+1;
//                var id = item.id;
//                var custname = item.custname;
//                var vehchasisno = item.vehchasisno;
//                var duedate = item.duedate;
//                var mobileno = item.mobileno;
//                var whatsappno = item.whatsappno;
//                var modelid = item.modelid;
//                var modelname = item.modelname;
//                var lastrenewalfromval = item.lastrenewalfromval;
//                var lastrenewalfromid = item.lastrenewalfromid;
//                var lastchangeson=item.lastchangeson;
//                
//                rows += "<tr><td>" + id +
//                    "</td>" + 
//                     " <td>" + i + ' ' + "</td>" +
//                    "</td><td>" + custname + ' ' +
//                    "</td>" +
//                   " <td>" + vehchasisno + ' ' + "</td>" +
//                    " <td>" + duedate + ' ' + "</td>" +
//                     " <td>" + mobileno + ' ' + "</td>" +
//                      " <td>" + whatsappno + ' ' + "</td>" +
//                       " <td>" + modelname + ' ' + "</td>" +
//                        " <td>" + lastrenewalfromval + ' ' + "</td>" +
//                         " <td>" + lastchangeson + ' ' + "</td>" +

//                    "<td> " +
//                    " <input type='button' id='btnEdit'  onclick='EditRecordbyID(" + id + ")' value='Edit' class='btn btn-primary'>  </td>" +
//                     " <td> <input type='button' id='btnDelete'  onclick='DeleteRecord(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
//                    + "</tr>";
//            });
//            $('#tblRecords tbody').append(rows);

//            // Apply DataTable Plugin.
//            table = $('[id*=tblRecords]').DataTable({
//            "columnDefs": [
//            {
//                "targets": [ 0 ],
//                "visible": false,
//                "searchable": false
//            }
//            ,
//            {
//                "targets": [ 9 ],
//                "visible": false
//            }
//        ]
//        ,
//                "order": [[10, "desc"]],
//                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
//                "paging": true,
//                "info": true,
//                'processing': true,
//                 

//                fnInitComplete: function () {
//                    $("#Showoverlay").hide();
//                }
//            });
//        },
//        failure: function (response) {
//            // alert(response.responseText);
//            $.notify("BOOM!", "error");
//        },
//        error: function (response) {
//            ///alert(response.responseText);

//            $.notify("BOOM!", "error");
//        }
//    });
//}



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
      var fileName = $('[id*=hiddenFileName]').val();
      
    var name = $('[id*=txtName]').val();
     var olastrenewalfromid = $("#ddlLastRenewalFrom :selected").val();
      var olastrenewalfromval = $("#ddlLastRenewalFrom :selected").text();
      var ovehChasisno = $('[id*=txtVehChasisNo]').val();
       var oduedate = $('[id*=txtDueDate]').val();
        var omobileno = $('[id*=txtMobileNo]').val();
         var owhatsappno = $('[id*=txtAlternateNo]').val();
          var omodelid = $("#ddlModel :selected").val();
           var omodelName = $("#ddlModel :selected").text();
            var oremarks = $('[id*=txtRemarks]').val();
   // name = sentenceCase(name);
    var model = {};
    model.ocustname = name;
    model.olastrenewalfromid = olastrenewalfromid;
    model.olastrenewalfromval = olastrenewalfromval;
    model.ovehChasisno = ovehChasisno;
    model.oduedate = oduedate;
    model.omobileno = omobileno;
    model.owhatsappno = owhatsappno;
    model.omodelid = omodelid;
    model.omodelName = omodelName;
    model.oremarks=oremarks;
    model.ouploadedfilename=fileName;
    $.ajax({
        type: "POST",
        url: "policyRenewalAssigned.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
        if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtMobile]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30 || r.d == 50) {
                    if (r.d == 20) {
                        $.notify("Error!! veh./chasis no already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        $('[id*=txtName]').focus();
                        return;
                    }
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtMobile]').focus();
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
    $("#lblMessage").html("");
    $("#postedFile").val('');
    $('#recordID').val("0");
    GetUploadedFiles(id);
    $.ajax({
        type: "POST",
        url: "policyRenewalAssigned.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                var custname = json[0].custname;
               ///// alert(result.d);
                $('#recordID').val(json[0].id);
               
                $('#txtName').val(custname);
                 $("#ddlLastRenewalFrom").val(json[0].lastrenewalfromid);
                $('#txtVehChasisNo').val(json[0].vehChasisno);
                 var mydate = new Date(json[0].duedate.substring(0, 10));
                var duedate = new Date(json[0].duedate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

   
                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
                 $('#txtDueDate').val(duedate);
                  $('#txtMobileNo').val(json[0].mobileno);
                   $('#txtAlternateNo').val(json[0].whatsappno);
                    $('#txtRemarks').val(json[0].remarks);
                    $("#ddlModel").val(json[0].modelid);

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

//function for updating record
function UpdateRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var id = $('[id*=recordID]').val();
    
    var name = $('[id*=txtName]').val();
    var olastrenewalfromid = $("#ddlLastRenewalFrom :selected").val();
    var olastrenewalfromval = $("#ddlLastRenewalFrom :selected").text();
    var ovehChasisno = $('[id*=txtVehChasisNo]').val();
    var oduedate = $('[id*=txtDueDate]').val();
    var omobileno = $('[id*=txtMobileNo]').val();
    var owhatsappno = $('[id*=txtAlternateNo]').val();
    var omodelid = $("#ddlModel :selected").val();
    var omodelName = $("#ddlModel :selected").text();
     var oremarks = $('[id*=txtRemarks]').val();
    ////name = sentenceCase(name);
    if (id > 0) {
        var model = {};
        model.id = id;
        model.ocustname = name;
        model.olastrenewalfromid = olastrenewalfromid;
        model.olastrenewalfromval = olastrenewalfromval;
        model.ovehChasisno = ovehChasisno;
        model.oduedate = oduedate;
        model.omobileno = omobileno;
        model.owhatsappno = owhatsappno;
        model.omodelid = omodelid;
        model.omodelName = omodelName;
        model.oremarks=oremarks;

        $.ajax({
            type: "POST",
            url: "policyRenewalAssigned.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not updated!", "error");
                $('[id*=txtMobile]').focus();
                return;
            }
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50) {
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
                        $('[id*=txtMobile]').focus();
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAdd').hide();
                    $("#lblMessage").html("");
                    $("#postedFile").val('');
                    BindDataTable();
                    $.notify("Record updated!", "success");
                }
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
            url: "policyRenewalAssigned.aspx/DeleteRecord",
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

 $("#tblUploadedFiles").dataTable().fnDestroy();
$('#tblUploadedFiles tbody').empty();
 $('#recordID').val('0');

    $('#txtName').val("");

     $('#ddlLastRenewalFrom').prop("selectedIndex", 0);
    $('#ddlModel').prop("selectedIndex", 0);
    /////  $("#ddlLastRenewalFrom :selected").val("0");
    /////  $("#ddlLastRenewalFrom :selected").text("Please Select");
       $('#txtVehChasisNo').val("");
        $('#txtDueDate').val("");
        $('#txtMobileNo').val("");
         $('#txtRemarks').val("");
         $('#txtAlternateNo').val("");
        //// $("#ddlModel :selected").val("0");
        //// $("#ddlModel :selected").text("Please Select");

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtName').css('border-color', 'lightgrey');
    $('#ddlLastRenewalFrom').css('border-color', 'lightgrey');
    $('#txtVehChasisNo').css('border-color', 'lightgrey');
    $('#txtDueDate').css('border-color', 'lightgrey');
    $('#txtMobileNo').css('border-color', 'lightgrey');
    $('#txtAlternateNo').css('border-color', 'lightgrey');
    $('#ddlModel').css('border-color', 'lightgrey');
   

    $("#lblMessage").html("");
    $("#postedFile").val('');

    $('#myModal').modal('show');
    $('#myModal').on('shown.bs.modal', function () {
        $('#txtName').focus();
    });

}
//Valdidation using jquery  
function validate() {
    var isValid = true;
    if ($('#txtName').val().trim() == "") {
        $('#txtName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtName').css('border-color', 'lightgrey');
    }

    if ($('#ddlLastRenewalFrom :selected').val().trim() == "0") {
        $('#ddlLastRenewalFrom').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlLastRenewalFrom').css('border-color', 'lightgrey');
    }

    if ($('#txtVehChasisNo').val().trim() == "") {
        $('#txtVehChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehChasisNo').css('border-color', 'lightgrey');
    }

    if ($('#txtDueDate').val().trim() == "") {
        $('#txtDueDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDueDate').css('border-color', 'lightgrey');
    }

    if ($('#txtMobileNo').val().trim() == "") {
        $('#txtMobileNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobileNo').css('border-color', 'lightgrey');
    }

////    if ($('#txtAlternateNo').val().trim() == "") {
////        $('#txtAlternateNo').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtAlternateNo').css('border-color', 'lightgrey');
////    }

    if ($('#ddlModel :selected').val().trim() == "0") {
        $('#ddlModel').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlModel').css('border-color', 'lightgrey');
    }

    return isValid;
}




function GetUploadedFiles(id) {
////    $("#Showoverlay").show(); 
///////alert(id);
if(id!="0")
{
    $.ajax({
        type: "POST",
        url: "policyRenewalAssigned.aspx/GetAttachedFiles",
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
               
                var mydate = new Date(json[0].createdon);
   var uploadDt = new Date(createdon).format('dd-MMM-yyyy HH:mm:ss')

                
                rows += "<tr><td>" + id +
                    "</td><td>" + uploadedfilename + ' ' +
                    "</td>" +
                   " <td>" + uploadDt + ' ' + "</td>" +
                    "<td> " +
                    " <a onclick='DownloadFile(" + id + ")' >   <i class='fa fa-download' style='font-size:36px;'></i> </a>   </td>" +
                    
                     " <td> <input type='button' id='btnDelete'  onclick='DeleteAttachedFile(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
                    + "</tr>";
            });
            $('#tblUploadedFiles tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblUploadedFiles]').DataTable({
                "order": [[0, "desc"]],
                "paging": false,
                "dom": 'lrtip'
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
            url: "policyRenewalAssigned.aspx/DeleteAttachedFile",
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

  $.ajax({
        type: "POST",
        url: "policyRenewalAssigned.aspx/ConvertToPdfAndDownload",
        data: '{id: "' + id + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d == '')
                alert('There is a problem exporting the file');
            else {
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
        ////alert(id);
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
        if (extension.toLowerCase() != 'pdf') {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> only .pdf file is allowed  </b> ");
            return;
        }

        if (typeof ($("#postedFile")[0].files) != "undefined") {
            var size = parseFloat($("#postedFile")[0].files[0].size / 1024).toFixed(2);
            //alert(size + " KB.");
            if (size <= 5000) {
                $.ajax({
                    url: 'UploadPolicyHandler.ashx?custid=' + id,
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





    ////////////////////////////////Calling Details ////////////////////////////

function CallingDetails(id) {
   
    GetCallingDetails(id);
    $.ajax({
        type: "POST",
        url: "policyRenewalAssigned.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                var custname = json[0].custname;
               ///// alert(result.d);
                $('#recordIDcalling').val(json[0].id);
               
                $('#txtcallingcustname').val(custname);
                $('#txtcallingvehchasisno').val(json[0].vehChasisno);
                 var mydate = new Date(json[0].duedate.substring(0, 10));
                var duedate = new Date(json[0].duedate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

   
                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
                 $('#txtcallingduedate').val(duedate);
                 $('#txtcallingmobileno').val(json[0].mobileno);
                 $('#txtnextcallingdate').val(json[0].whatsappno);
                 $('#txtcallingremarks').val(json[0].remarks);                   

                $('#myModal2').modal('show');
                $('#myModal2').on('shown.bs.modal', function () {
                    $('#txtcallingremarks').focus();
                });

////                 $('#btnupdatecallingdetails').hide();
////                    $('#btnsavecallingdetails').show();

                $('#btnsavecallingdetails').show();
                $('#btnupdatecallingdetails').hide();
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });
}


function AddCallingDetailsRecord() {
   if ($('#txtcallingremarks').val().trim() == "") {
        $('#txtcallingremarks').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtcallingremarks').css('border-color', 'green');
    }

    if ($('#txtnextcallingdate').val().trim() == "") {
        $('#txtnextcallingdate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtnextcallingdate').css('border-color', 'green');
    }
    

      var callingremarks = $('[id*=txtcallingremarks]').val();
      var nextcallingdate = $('[id*=txtnextcallingdate]').val();
   // name = sentenceCase(name);
    var model = {};
    model.customerid = $('#recordIDcalling').val();
    model.callingremarks = callingremarks;
    model.nextcallingdate = nextcallingdate;

    $.ajax({
        type: "POST",
        url: "policyRenewalAssigned.aspx/SaveRecordCalling",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
        if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtcallingremarks]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
               if (r.d == 10 || r.d == 30 ) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to add record!", "error");
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        $('[id*=txtcallingremarks]').focus();
                        return;
                    }
                }
                else {
                    $('#myModal2').modal('show');
                     ///$('#recordID').val("0");

                    GetCallingDetails($('#recordIDcalling').val());
                    $.notify("Record saved!", "success");
                }
            }
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

function GetCallingDetails(id) {
////    $("#Showoverlay").show(); 
///////alert(id);
if(id!="0")
{
    $.ajax({
        type: "POST",
        url: "policyRenewalAssigned.aspx/GetCallingDetailsByCustID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblCallingDetails").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblCallingDetails tbody').empty();
            $.each(json, function (key, item) {
                var id = item.id;
                var callingremarks = item.callingremarks;

                /////var nextcallingdate = new Date(item.nextcallingdate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
               var nextcallingdate = moment(item.nextcallingdate).format('DD-MMM-YYYY');

               var createdon = moment(item.createdon).format('DD-MMM-YYYY hh:mm a')
               var updatedon = moment(item.updatedon).format('DD-MMM-YYYY hh:mm a')

////               var createdon = new Date(json[0].createdon.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
////                var updatedon = new Date(json[0].updatedon.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                /////var createdon = new Date(json[0].createdon);
                var createdby = json[0].createdby;
               ///// var updatedon = new Date(json[0].updatedon);
                var updatedby = json[0].updatedby;

                
                rows += "<tr><td>" + id +
                    "</td><td>" + callingremarks + ' ' +
                    "</td>" +
                   " <td>" + nextcallingdate + ' ' + "</td>" +

                    " <td>" + createdon + '<br/>' + createdby + '<br/>' + updatedon + '<br/>' + updatedby + '<br/>'  + ' ' + "</td>" +

                    "<td> " +
                    " <input type='button' id='btnEditCalling'  onclick='EditCalling(" + id + ")' value='Edit' class='btn btn-primary'>  </td>" +
                    
                     " <td> <input type='button' id='btnDeleteCalling'  onclick='DeleteCallingDetails(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
                    + "</tr>";
            });
            $('#tblCallingDetails tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblCallingDetails]').DataTable({
                "order": [[0, "desc"]],
                "paging": false,
                "dom": 'lrtip'
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
     $("#tblCallingDetails").dataTable().fnDestroy();
    return;
    }

}


function EditCalling(id) {
    ////alert(id)
    ///$('#recordIDcallingEdit').val("0");
    ////GetCallingDetails(id);
    $.ajax({
        type: "POST",
        url: "policyRenewalAssigned.aspx/GetRecordCallingbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
               
                $('#recordIDcallingEdit').val(json[0].id);
               
                $('#txtcallingremarks').val(json[0].callingremarks);                
                var nextcallingdate = new Date(json[0].nextcallingdate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                $("#txtnextcallingdate").val(nextcallingdate);

                $('#myModal2').modal('show');
                $('#myModal2').on('shown.bs.modal', function () {
                    $('#txtcallingremarks').focus();
                });
                $('#btnupdatecallingdetails').show();
                $('#btnsavecallingdetails').hide();
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });
}

//function for updating record
function UpdateRecordCalling() {
   
    var id = $('[id*=recordIDcallingEdit]').val();
    
    if ($('#txtcallingremarks').val().trim() == "") {
        $('#txtcallingremarks').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtcallingremarks').css('border-color', 'green');
    }

    if ($('#txtnextcallingdate').val().trim() == "") {
        $('#txtnextcallingdate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtnextcallingdate').css('border-color', 'green');
    }
    

      var callingremarks = $('[id*=txtcallingremarks]').val();
      var nextcallingdate = $('[id*=txtnextcallingdate]').val();

    ////name = sentenceCase(name);
    if (id > 0) {
        var model = {};
        model.id = id;
        model.callingremarks = callingremarks;
        model.nextcallingdate = nextcallingdate;

        $.ajax({
            type: "POST",
            url: "policyRenewalAssigned.aspx/UpdateRecordCalling",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not updated!", "error");
                $('[id*=txtcallingremarks]').focus();
                return;
            }
                if (r.d == 10 || r.d == 30 ) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    if (r.d == 20) {
                       $.notify("Error!! required fields cannot be blank!", "error");
                        return;
                    }
                   
                }
                else {
                    $('#recordIDcallingEdit').val('0');
                    $('#myModal2').modal('show');
                    $('#btnupdatecallingdetails').hide();
                    $('#btnsavecallingdetails').show();

                     $('#txtcallingremarks').val("");
                    $('#txtnextcallingdate').val("");

                    GetCallingDetails($('#recordIDcalling').val());
                    $.notify("Record updated!", "success");
                }
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

function DeleteCallingDetails(id) {
////alert(id);

    if (confirm('Are you sure delete this record?')) {
        var data = table.row($(this).parents('tr')).data();
        table.row($(this).parents('tr')).remove().draw();
         var customerid = $('[id*=recordIDcalling]').val();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "policyRenewalAssigned.aspx/DeleteRecordCalling",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    GetCallingDetails(customerid);
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

//////////////////End calling details /////////////////////


