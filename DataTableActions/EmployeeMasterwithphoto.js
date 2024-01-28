
$(document).ready(function () {
    $.ajax({
        type: "POST", url: "masteremployees.aspx/GetDesignation",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlDesignation").append($("<option></option>").val(value.id).html(value.designation));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });

    $.ajax({
        type: "POST", url: "masteremployees.aspx/GetDressName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlDress").append($("<option></option>").val(value.id).html(value.dressname));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });


    $('#txtDOJ').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtDOB').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtDressDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtSalaryDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
    

})  


$(function () {
    //$("#Showoverlay").show();
    //GetData();
    BindDataTable();
});



function BindDataTable() {


 $("#tblRecords").dataTable().fnDestroy();
//var i = 1;
 
            $('#tblRecords').DataTable({
            "order": [[ 0, 'desc' ]],
            "columnDefs": [
    { "visible": false, "targets": [1] }
    ],
//            "async": false,
//                "processing": true,
//                "serverSide": true,
//                "ajax": {
//                    url: "WebServiceDataTable.asmx/GetDataForDataTable", type: "post"
//                },

                bServerSide: true,
                sAjaxSource: 'masteremployeeshandler.ashx/GetEmployeesList',
                sServerMethod: 'post',
                "processing": true,
                
                "columns": [
//                {"data": "employeename"},
                    {  "data": "id" },
                     {
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "employeename" },
                    { "data": "designation" },
                    { "data": "mobileno" },
                    { "data": "doj" },
                    { "data": "dob" },
                    { "data": "aadharno" },
                    { "data": "uanno" },
                    { "data": "esino" },
                     { "data": "dress",
                        render: function ( data, type, row )
                        {
//                            if(row.dressdate=="01-Jan-1900")
//                            {
//                                row.dressdate="";
//                            }
                            if(row.dress=="Please Select")
                            {
                                row.dress="";
                            }

                             return '<a href="#" onclick="alert(' + row.id + ')">' + row.dress + '</a>';

                        // return row.dress + '<hr style="border-top: 1px solid #000; margin-top:1px;margin-botton:0px;" />  ' + row.dressdate + '';
                        }
                     },
                    { "data": "salary" ,
                        render: function ( data, type, row )
                        {
                         //return row.salary + '<hr style="border-top: 1px solid #000; margin-top:1px;margin-botton:0px;" />  ' + row.salaryupdatedate + '';
                         return '<a href="#" onclick="alert(' + row.id + ')">' + row.salary + '</a>';
                        }
                    },
                    { "data": "currentbalance" },
                    { "data": "attendancestatus",
                     
                     render: function (data, type, row) {
                           //debugger
                            if(row.attendancestatus=="1")
                             {
                                return '<a href="#" onclick="updateattendancestatus(' + row.id + ')"><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
                             }
                             else
                             {
                                 return '<a href="#" onclick="updateattendancestatus(' + row.id + ')"><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
                             }
                       }
                    },
                    { "data": "reportstatus",
                        render: function (data, type, row) {
                           //debugger
                            if(row.reportstatus=="1")
                             {
                                return '<a href="#" onclick="updatereportstatus(' + row.id + ')"><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
                             }
                             else
                             {
                                 return '<a href="#" onclick="updatereportstatus(' + row.id + ')"><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
                             }
                       } 
                    },
                    { "data": "emphotoname",
                        render: function (emphotoname) {                    
                    if (!emphotoname) {
                        return 'N/A';
                    } else {
                        //var img = 'data:image/png;base64,' + TeacherPhotoFileName;
                        //return '<img src="' + TeacherPhotoFileName + '" height="50px" width="50px" />';
                        return '<img src="UploadedEmployeesPhoto/' + emphotoname + '" style="height:80px;width:60px;"/>';  
                    }

                    /*return '<img src="data:image/gif;base64,{0},' + TeacherPhotoPath + '" />';*/

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
                  
                    
                ]
            });


            }

  function updateattendancestatus(id)
  {
           $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "masteremployees.aspx/UpdateAttendanceStatus",
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
                    $.notify("Record updated!", "success");
                
            },
            error: function (errormessage) {
                $.notify("Error while updating data!", "error");
            }

        });
        $("#Showoverlay").hide();     
  }
 function updatereportstatus(id)
 {
 
     $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "masteremployees.aspx/UpdateReportStatus",
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


function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    

    //var id = table.rows()[0].length + 1;
      var fileName = $('[id*=hiddenFileName]').val();
      
    var employeename = $('[id*=txtName]').val();
    var desigid = $("#ddlDesignation :selected").val();
    var designation = $("#ddlDesignation :selected").text();
    var mobileno = $('[id*=txtMobileNo]').val();
    var doj = $('[id*=txtDOJ]').val();
    var dob = $('[id*=txtDOB]').val();
    var aadharno = $('[id*=txtAadhaarNo]').val();
    var uanno = $('[id*=txtUANNo]').val();
    var esino = $('[id*=txtESINo]').val();
    var dressid = $("#ddlDress :selected").val();
    var dress = $("#ddlDress :selected").text();
    var dressdate = $('[id*=txtDressDate]').val();
    var salary = $('[id*=txtSalary]').val();
    var salaryupdatedate = $('[id*=txtSalaryDate]').val();
    var currentbalance = $('[id*=txtCurrentBalance]').val();
   
    var address = '';

            var fileName = $('[id*=hiddenFileName]').val();

            ////alert(fileName);
    
   // name = sentenceCase(name);
    var model = {};
    model.employeename = employeename;
    model.desigid = desigid;
    model.designation = designation;
    model.mobileno = mobileno;
    model.doj = doj;
    model.dob = dob;
    model.aadharno = aadharno;
    model.uanno = uanno;
    model.esino = esino;
    model.dressid = dressid;
    model.dress = dress;
    model.dressdate = dressdate;
    model.salary = salary;
    model.salaryupdatedate = salaryupdatedate;
    model.currentbalance = currentbalance;
    model.address = address;
    /////model.empphotopath='/UploadedEmployeesPhoto/' + fileName;
    model.emphotoname=fileName;

    //        debugger;
    $.ajax({
        type: "POST",
        url: "masteremployees.aspx/SaveRecord",
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
                        $.notify("Error!! mobile no already exists!", "error");
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
    $("#lblMessage").html("");
    $("#postedFile").val('');
    $('#recordID').val("0");
    ////GetUploadedFiles(id);
    $.ajax({
        type: "POST",
        url: "masteremployees.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to fetch record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                ////var custname = json[0].custname;
               ///// alert(result.d);
                $('#recordID').val(json[0].id);               
                $('#txtName').val(json[0].employeename);
                 $("#ddlDesignation").val(json[0].desigid);
                $('#txtMobileNo').val(json[0].mobileno);                
                 var dob = new Date(json[0].dob.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                 var doj = new Date(json[0].doj.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                 var dressDt = new Date(json[0].dressdate.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                 var salDt = new Date(json[0].salaryupdatedate.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                
                 $('#txtDOJ').val(doj);
                 $('#txtDOB').val(dob);
                 $('#txtAadhaarNo').val(json[0].aadharno);
                 $('#txtUANNo').val(json[0].uanno);
                 $('#txtESINo').val(json[0].esino);
                 $("#ddlDress").val(json[0].dressid);
                 $('#txtDressDate').val(dressDt);
                 $('#txtSalary').val(json[0].salary);
                 $('#txtSalaryDate').val(salDt);
                 $('#txtCurrentBalance').val(json[0].currentbalance);
//                 $('#txtAlternateNo').val(json[0].attendancestatus);
//                 $('#txtAlternateNo').val(json[0].reportstatus);
//                 $('#txtAlternateNo').val(json[0].emphotoname);
                    
                    ///alert(json[0].emphotoname);

                  ////$('#targetImg').attr("src","UploadedEmployeesPhoto/" + json[0].emphotoname) ;  //'src="UploadedEmployeesPhoto/' + emphotoname + '" style="height:100px;width:100px;"/>'

                  $("#targetImg").attr('src', "UploadedEmployeesPhoto/" + json[0].emphotoname);
                    $("#imgPreview").show();


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
    
     var fileName = $('[id*=hiddenFileName]').val();
      
    var employeename = $('[id*=txtName]').val();
    var desigid = $("#ddlDesignation :selected").val();
    var designation = $("#ddlDesignation :selected").text();
    var mobileno = $('[id*=txtMobileNo]').val();
    var doj = $('[id*=txtDOJ]').val();
    var dob = $('[id*=txtDOB]').val();
    var aadharno = $('[id*=txtAadhaarNo]').val();
    var uanno = $('[id*=txtUANNo]').val();
    var esino = $('[id*=txtESINo]').val();
    var dressid = $("#ddlDress :selected").val();
    var dress = $("#ddlDress :selected").text();
    var dressdate = $('[id*=txtDressDate]').val();
    var salary = $('[id*=txtSalary]').val();
    var salaryupdatedate = $('[id*=txtSalaryDate]').val();
    var currentbalance = $('[id*=txtCurrentBalance]').val();
   
    var address = '';
    
   // name = sentenceCase(name);
    if (id > 0) {
         var model = {};
         model.id = id;
    model.employeename = employeename;
    model.desigid = desigid;
    model.designation = designation;
    model.mobileno = mobileno;
    model.doj = doj;
    model.dob = dob;
    model.aadharno = aadharno;
    model.uanno = uanno;
    model.esino = esino;
    model.dressid = dressid;
    model.dress = dress;
    model.dressdate = dressdate;
    model.salary = salary;
    model.salaryupdatedate = salaryupdatedate;
    model.currentbalance = currentbalance;
    model.address = address;

    model.emphotoname=fileName;

        $.ajax({
            type: "POST",
            url: "masteremployees.aspx/UpdateRecord",
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
                        $.notify("Error!! You do not have permission to add record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! mobile no already exists!", "error");
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
//        var data = table.row($(this).parents('tr')).data();
//        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "masteremployees.aspx/DeleteRecord",
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

    $('#ddlDesignation').prop("selectedIndex", 0);
    $('#ddlDress').prop("selectedIndex", 0);

////      $("#ddlLastRenewalFrom :selected").val("0");
////      $("#ddlLastRenewalFrom :selected").text("Please Select");
       $('#txtMobileNo').val("");
        $('#txtDOJ').val("");
        $('#txtDOB').val("");
         $('#txtAadhaarNo').val("");
         $('#txtUANNo').val("");
         $('#txtESINo').val("");
         $('#txtDressDate').val("");
         $('#txtSalary').val("");
         $('#txtSalaryDate').val("");
         $('#txtCurrentBalance').val("");

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtName').css('border-color', 'lightgrey');
    $('#ddlDesignation').css('border-color', 'lightgrey');
    $('#ddlDress').css('border-color', 'lightgrey');
    $('#txtMobileNo').css('border-color', 'lightgrey');
    $('#txtDOJ').css('border-color', 'lightgrey');
    $('#txtDOB').css('border-color', 'lightgrey');
    $('#txtAadhaarNo').css('border-color', 'lightgrey');
    $('#txtUANNo').css('border-color', 'lightgrey');
    $('#txtESINo').css('border-color', 'lightgrey');
    $('#txtDressDate').css('border-color', 'lightgrey');
    $('#txtSalary').css('border-color', 'lightgrey');
    $('#txtSalaryDate').css('border-color', 'lightgrey');
    $('#txtCurrentBalance').css('border-color', 'lightgrey');

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

    if ($('#ddlDesignation :selected').val().trim() == "0") {
        $('#ddlDesignation').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlDesignation').css('border-color', 'lightgrey');
    }

    if ($('#txtMobileNo').val().trim() == "") {
        $('#txtMobileNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobileNo').css('border-color', 'lightgrey');
    }

    if ($('#txtDOJ').val().trim() == "") {
        $('#txtDOJ').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDOJ').css('border-color', 'lightgrey');
    }

    if ($('#txtDOB').val().trim() == "") {
        $('#txtDOB').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDOB').css('border-color', 'lightgrey');
    }

 if ($('#txtAadhaarNo').val().trim() == "") {
        $('#txtAadhaarNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtAadhaarNo').css('border-color', 'lightgrey');
    }

     if ($('#txtSalary').val().trim() == "") {
        $('#txtSalary').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtSalary').css('border-color', 'lightgrey');
    }

     if ($('#txtSalaryDate').val().trim() == "") {
        $('#txtSalaryDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtSalaryDate').css('border-color', 'lightgrey');
    }


//    if ($('#ddlDress :selected').val().trim() == "0") {
//        $('#ddlDress').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#ddlDress').css('border-color', 'lightgrey');
//    }

    return isValid;
}




////function GetUploadedFiles(id) {
////////    $("#Showoverlay").show(); 
///////////alert(id);
////if(id!="0")
////{
////    $.ajax({
////        type: "POST",
////        url: "masteremployees.aspx/GetAttachedFiles",
////        data: '{ id :' + id + '}',
////        contentType: "application/json; charset=utf-8",
////        dataType: "json",
////        success: function (data) {

////            $("#tblUploadedFiles").dataTable().fnDestroy();
////            var json = JSON.parse(data.d)

////            var rows = '';
////            $('#tblUploadedFiles tbody').empty();
////            $.each(json, function (key, item) {
////                var id = item.id;
////                var uploadedfilename = item.uploadedfilename;
////                var downloadfilename = item.uploadedfilename;
////                var createdon = item.uploadedon;
////               
////                var mydate = new Date(json[0].createdon);
////                var uploadDt = new Date(createdon).format('dd-MMM-yyyy HH:mm:ss')

////                
////                rows += "<tr><td>" + id +
////                    "</td><td>" + uploadedfilename + ' ' +
////                    "</td>" +
////                   " <td>" + uploadDt + ' ' + "</td>" +
////                    "<td> " +
////                    " <a onclick='DownloadFile(" + id + ")' >   <i class='fa fa-download' style='font-size:36px;'></i> </a>   </td>" +
////                    
////                     " <td> <input type='button' id='btnDelete'  onclick='DeleteAttachedFile(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
////                    + "</tr>";
////            });
////            $('#tblUploadedFiles tbody').append(rows);

////            // Apply DataTable Plugin.
////            table = $('[id*=tblUploadedFiles]').DataTable({
////                "order": [[0, "desc"]],
////                "paging": false,
////                "dom": 'lrtip'
////////                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
////                
////////                "info": false,
//////                'processing': true,
//////                fnInitComplete: function () {
//////                    $("#Showoverlay").hide();
//////                }
////            });
////        },
////        failure: function (response) {
////            // alert(response.responseText);
////            $.notify("BOOM!", "error");
////        },
////        error: function (response) {
////            ///alert(response.responseText);

////            $.notify("BOOM!", "error");
////        }
////    });
////    }
////    else
////    {
////   // alert("invalid id");
////     $("#tblRecords").dataTable().fnDestroy();
////    return;
////    }

////}





     function  btnUploadFile()
     {
 
        var id = $('[id*=recordID]').val();
        ////alert(id);
        //                                                            if (id != "0") {
        var fileUpload = $("#postedFile").get(0);
        var files = fileUpload.files;
        if (files.length == 0) {
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> please select a image file to uplod  </b> ");
            return;
        }
        var docVal = fileUpload.value;
        var extension = docVal.substring(docVal.lastIndexOf(".") + 1, docVal.length);
        ////alert(extension);
        if (extension.toLowerCase() != 'jpg' && extension.toLowerCase() != 'jpeg'  && extension.toLowerCase() != 'png') {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> only .jpg/.jpeg file is allowed  </b> ");
            return;
        }

        if (typeof ($("#postedFile")[0].files) != "undefined") {
            var size = parseFloat($("#postedFile")[0].files[0].size / 1024).toFixed(2);
           //// alert(size + " KB.");
            if (size <= 1000) { 
            ////alert(id);
                $.ajax({
                     url: 'MasterEmployeePhotoHandler.ashx?empid=' + id,
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
                        BindDataTable() ;
                        if (id != "0") {
                            //GetUploadedFiles(id);
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
                $("#lblMessage").html("<b> Please upload file upto 1MB  </b> ");
                return;
            }
        } else {
            //alert("This browser does not support HTML5.");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> This browser does not support HTML5.  </b> ");
            return;
        }

                                                          

    }