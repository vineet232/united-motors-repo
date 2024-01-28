
$(document).ready(function () {

$("#ddlDesignation").select2();

    $.ajax({
        type: "POST", url: "masteremployeesva.aspx/GetDesignation",
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
        type: "POST", url: "masteremployeesva.aspx/GetDressName",
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


     $.ajax({
        type: "POST", url: "masteremployeesva.aspx/GetDressNameQtyAboveZero",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {
                $("#ddlempdress").append($("<option></option>").val(value.id).html(value.dressname));
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

     $('#txtOpBalDt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

      $('#txtdoresignation').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });



 var maxDate = new Date();
var pastYear = maxDate.getFullYear() - 15;
maxDate.setFullYear(pastYear);
maxDate.setMonth(11);
maxDate.setDate(31);

     $('#txtDOB').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
        endDate: maxDate,
    });

     $('#txtDressDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtSalaryDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtempdressdate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtEmpSalDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
    
     $('#txtHealthInsDueDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtAccidentalInsDueDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

})  


$(function () {
    //$("#Showoverlay").show();
    //GetData();
    BindDataTable();
});

////$('.hide-column').click(function(e){
////  var $btn = $(this);
////  var $cell = $btn.closest('th,td')
////  var $table = $btn.closest('tblRecords')

////  // get cell location - https://stackoverflow.com/a/4999018/1366033
////  var cellIndex = $cell[0].cellIndex + 1;

////  $table.find(".show-column-footer").show()
////  $table.find("tbody tr, thead tr")
////        .children(":nth-child("+cellIndex+")")
////        .hide()
////})

////$(".show-column-footer").click(function(e) {
////    var $table = $(this).closest('tblRecords')
////    $table.find(".show-column-footer").hide()
////    $table.find("th, td").show()

////})

function GetSelectedDesignations(id)
{
     $('#ddlDesignation').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "masteremployees.aspx/GetDesignation",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlDesignation").append($("<option></option>").val(value.id).html(value.designation));
            })
             $('#ddlDesignation').val( id);
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });
}



function BindDataTable() {


 $("#tblRecords").dataTable().fnDestroy();

 ////////////////////// for extra permission ////////////////////
 var show = false;
 var extraPermission= $("#hdnExtraPermission").val();

 var table = $('#tblRecords').DataTable();
 


 //////////////////////end for extra permission ////////////////////



//var i = 1;
 
            $('#tblRecords').DataTable({
            "order": [[ 1, 'asc' ]],
            "columnDefs": [
   // { "visible": false, "targets": [1] }
    ],
//            "async": false,
//                "processing": true,
//                "serverSide": true,
//                "ajax": {
//                    url: "WebServiceDataTable.asmx/GetDataForDataTable", type: "post"
//                },

                bServerSide: true,
                sAjaxSource: 'masteremployeesvahandler.ashx/GetEmployeesList',
                sServerMethod: 'post',
                "processing": true,
                
//                 dom: 'Bfrtip',
//             buttons: [
////            {
////                extend: 'excelHtml5',
////                ////text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
////                exportOptions: {
////                    columns: ':visible',
////                }
////            },
//            'colvis'
//        ]
//        ,

                "columns": [
//                {"data": "employeename"},
                    {  "data": "id" ,
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "employeename" },
                    { "data": "designation" },
                    { "data": "mobileno" },
//                    { "data": "doj" },
//                    { "data": "dob" },

 { "data": "salaryupdatedate" },
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
                            if(row.dress=="")
                            {
                                return '<a href="#" onclick="OpenEmpDressDetails(\'' + row.employeename + ',' + row.id + '\'\)">' + "No Dress" + '</a>';
                            }
                            else
                            {
                                 return '<a href="#" onclick="OpenEmpDressDetails(\'' + row.employeename + ',' + row.id + '\'\)">' + row.dress + '</a>';
                            }

                        // return row.dress + '<hr style="border-top: 1px solid #000; margin-top:1px;margin-botton:0px;" />  ' + row.dressdate + '';
                        }
                     },
                    { "data": "salary" ,
                        render: function ( data, type, row )
                        {
                         //return row.salary + '<hr style="border-top: 1px solid #000; margin-top:1px;margin-botton:0px;" />  ' + row.salaryupdatedate + '';
                        ////// return '<a href="#" onclick="OpenEmpSalaryDetails(\'' + row.employeename + ',' + row.id + '\'\)">' + row.salary + '</a>';



                        ////////////////////// for extra permission ////////////////////
////                         if(extraPermission==1)
////                         {
                         return '<a href="#" onclick="OpenEmpSalaryDetails(\'' + row.employeename + ',' + row.id + '\'\)">' + row.salary +  '</a>';
////                         }
////                         else
////                         {
////                         //////table.column( 9 ).visible( false );
////                            return '';
////                         }

                         //////////////////////end for extra permission ////////////////////


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
//                    { "data": "emphotoname",
//                        render: function (emphotoname) {                    
//                    if (!emphotoname) {
//                        return 'N/A';
//                    } else {
//                        //var img = 'data:image/png;base64,' + TeacherPhotoFileName;
//                        //return '<img src="' + TeacherPhotoFileName + '" height="50px" width="50px" />';
//                        return '<img src="UploadedEmployeesPhoto/' + emphotoname + '" style="height:80px;width:60px;"/>';  
//                    }

//                    /*return '<img src="data:image/gif;base64,{0},' + TeacherPhotoPath + '" />';*/

//                }  
// 
//                    },
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
                "bDestroy": true,
                 responsive: true,
                 "sPaginationType": "input",
            });


            }



  function updateattendancestatus(id)
  {
           $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "masteremployeesva.aspx/UpdateAttendanceStatus",
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
            url: "masteremployeesva.aspx/UpdateReportStatus",
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
   var healthinsdt = $('[id*=txtHealthInsDueDate]').val();
   var accidentalinsdt = $('[id*=txtAccidentalInsDueDate]').val();
    var address = '';

     var openingbal = $('[id*=txtOpeningBalance]').val();
   var openingbaldate = $('[id*=txtOpBalDt]').val();
   var doresignation = $('[id*=txtdoresignation]').val();

          

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
    model.healthinsuranceduedt=healthinsdt;
    model.accidentalinsuranceduedt=accidentalinsdt;
    model.address = address;
    /////model.empphotopath='/UploadedEmployeesPhoto/' + fileName;
    model.emphotoname=fileName;

    model.openingbal = openingbal;
    model.openingbaldate = openingbaldate;
    model.doresignation=doresignation;
    /////alert(model.openingbal);

    //        debugger;
    $.ajax({
        type: "POST",
        url: "masteremployeesva.aspx/SaveRecord",
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
        url: "masteremployeesva.aspx/GetRecordbyID",
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
                /// $("#ddlDesignation").val(json[0].desigid);

                 GetSelectedDesignations(json[0].desigid);

                $('#txtMobileNo').val(json[0].mobileno);                
                //// var dob = new Date(json[0].dob.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                //// var doj = new Date(json[0].doj.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                //// var dressDt = new Date(json[0].dressdate.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                 ///var salDt = new Date(json[0].salaryupdatedate.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                

                var dob = moment(json[0].dob.substring(0, 10)).format('DD-MMM-YYYY')
                var doj = moment(json[0].doj.substring(0, 10)).format('DD-MMM-YYYY')
                var dressDt = moment(json[0].dressdate.substring(0, 10)).format('DD-MMM-YYYY')
                var salDt = moment(json[0].salaryupdatedate.substring(0, 10)).format('DD-MMM-YYYY')

                if( json[0].doresignation != null)
                {
                
                var doresignation=moment(json[0].doresignation.substring(0, 10)).format('DD-MMM-YYYY')
                 $('[id*=txtdoresignation]').val(doresignation);
                }
                else
                {
                    $('[id*=txtdoresignation]').val("");
                }

                 //var healthinsuranceduedt = new Date(json[0].healthinsuranceduedt.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                // var accidentalinsuranceduedt = new Date(json[0].accidentalinsuranceduedt.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });

               //// var healthinsuranceduedt = moment(json[0].healthinsuranceduedt.substring(0, 10)).format('DD-MMM-YYYY hh:mm a')
                var healthinsuranceduedt = moment(json[0].healthinsuranceduedt.substring(0, 10)).format('DD-MMM-YYYY')
                var accidentalinsuranceduedt = moment(json[0].accidentalinsuranceduedt.substring(0, 10)).format('DD-MMM-YYYY')

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
                 $('[id*=txtHealthInsDueDate]').val(healthinsuranceduedt);
                 $('[id*=txtAccidentalInsDueDate]').val(accidentalinsuranceduedt);

                 var opbaldt = "01/01/1900";
                 if(json[0].openingbaldate != null)
                 {
                   ////opbaldt = new Date(json[0].openingbaldate.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });
                   var opbaldt = moment(json[0].openingbaldate.substring(0, 10)).format('DD-MMM-YYYY')
                 }

                 $('[id*=txtOpeningBalance]').val(json[0].openingbal);
                 $('[id*=txtOpBalDt]').val(opbaldt);




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
   var healthinsdt = $('[id*=txtHealthInsDueDate]').val();
   var accidentalinsdt = $('[id*=txtAccidentalInsDueDate]').val();
    var address = '';

    var openingbal = $('[id*=txtOpeningBalance]').val();
   var openingbaldate = $('[id*=txtOpBalDt]').val();
    var doresignation = $('[id*=txtdoresignation]').val();
    

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
     model.healthinsuranceduedt=healthinsdt;
    model.accidentalinsuranceduedt=accidentalinsdt;
    model.address = address;

    model.emphotoname=fileName;

     model.openingbal = openingbal;
    model.openingbaldate = openingbaldate;
    model.doresignation=doresignation;

        $.ajax({
            type: "POST",
            url: "masteremployeesva.aspx/UpdateRecord",
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
            url: "masteremployeesva.aspx/DeleteRecord",
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

//     if ($('#txtSalary').val().trim() == "") {
//        $('#txtSalary').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#txtSalary').css('border-color', 'lightgrey');
//    }

//     if ($('#txtSalaryDate').val().trim() == "") {
//        $('#txtSalaryDate').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#txtSalaryDate').css('border-color', 'lightgrey');
//    }


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
////        url: "masteremployeesva.aspx/GetAttachedFiles",
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


function OpenEmpDressDetails(empdata)
{
   
    const myArray = empdata.split(",");
    let arlength=myArray.length;
    let id = myArray[arlength - 1];
    let empname = myArray[0];
    //alert(empname);

     $('#empIDforDress').val('0');
     $('#EmpDressModel').modal('show');
     $('#empIDforDress').val(id);   
      $('#txtEmpDressDisplayName').val(empname);
     BindDressDataTable(id);
}



function btnAddEmpDress()
{
    //alert("123");
    var id = $('[id*=empIDforDress]').val();
     if(id > 0)
     {
         var dressid = $("#ddlempdress :selected").val();
        var dress = $("#ddlempdress :selected").text();
        var dressdate = $('[id*=txtempdressdate]').val();
        var dressqty = $('[id*=txtDressQty]').val();
        var employeename = $('[id*=txtEmpDressDisplayName]').val();
        
    var model = {};
    model.id = id;
    model.employeename = employeename;
    model.dressid=dressid;
    model.dress=dress;
    model.dressdate=dressdate;
    model.dressqty=dressqty;

//    if(model.dressdate=="")
//    {
//         $.notify("Error!! Required field missing!", "error");
//         return false;
//    }

    $.ajax({
            type: "POST",
            url: "masteremployeesva.aspx/UpdateDressRecord",
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
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        return;
                    }
                }
                else {
                    ///$('#empIDforDress').val('0');
                    //$('#EmpDressModel').modal('hide');
                   
                    BindDressDataTable(id);
                    BindDataTable();
                    $('#EmpDressModel').modal('show');
                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                    $.notify("Error while updating data!", "error");
            }
        });

     }
     else {
        alert("invalid id!!");
        return;
    }
}
function BindDressDataTable(id)
{
    ////alert(id);
   // debugger;
      $.ajax({
        type: "POST",
        url: "masteremployeesva.aspx/GetAllDressDetailsByEmpID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
         
            $("#tblDressDetails").dataTable().fnDestroy();
            var json = JSON.parse(data.d)
           //////alert(data.d);
            var rows = '';
            $('#tblDressDetails tbody').empty();
            var srno = 0;
            $.each(json, function (key, item) {
                srno += 1;
                ///var id = item.id;
                ////var modelname = item.dressname;

                ///var dressdt = new Date(item.updatedon).format('dd-MMM-yyyy HH:mm:ss')
                 var dressdt = moment(item.updatedon).format('DD-MMM-YYYY hh:mm a')
                var dressid=item.dressid;
                rows += "<tr>" +
                "<td>" + item.id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + item.dressname + ' ' +
                    "</td>" +
                     "<td>" + item.qty + ' ' +
                    "</td>" +
                    "<td>" + dressdt + ' ' +
                    "</td>" +
                    "<td> " +
                   
                    ' <input type="button" id="btnDelete" value="Delete" class="btn btn-danger" onclick="DeleteEmpDressRecord(\'' + item.id + ',' + item.dressname +  ',' + dressid +   ',' + item.qty + '\'\)"  />' 

//            '<a href="#" class="btn btn-danger" onclick="alert(\'' + item.dressname + ',' + item.id + '\'\)">' + row.dress + '</a>'

              +  "</td>"
                    + "</tr>";
            });
            $('#tblDressDetails tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblDressDetails]').DataTable({
                "order": [[1, "asc"]],
                "columnDefs": [
                                { "visible": false, "targets": [0] }
                              ],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "paging": true,
                "info": true,
                'processing': true
                
            });

           
        },
        failure: function (response) {
            ///// alert(response.responseText);
            $.notify("BOOM!", "error");
        },
        error: function (response) {
          /////alert(response.responseText);

            $.notify("BOOM!", "error");
        }
    });
}

function DeleteEmpDressRecord(dressdata)
{

  const myArray = dressdata.split(",");
    let id = myArray[0];
    let dress = myArray[1];
    let dressid=myArray[2];
    let qty=myArray[3];

      if (confirm('Are you sure delete this record?')) {
//        var data = table.row($(this).parents('tr')).data();
//        table.row($(this).parents('tr')).remove().draw();

        var empid =  $('#empIDforDress').val();

        var model = {};
         model.id = id;
        model.empid = empid;
        model.employeename =  $('[id*=txtEmpDressDisplayName]').val(); 
        model.dressid=dressid;
        model.dress=dress;
        model.dressqty=qty;

    ////alert(JSON.stringify(model));

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "masteremployeesva.aspx/DeleteDressRecord",
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
                else {
                    $("#Showoverlay").hide();
                    BindDressDataTable(empid);
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


function OpenEmpSalaryDetails(empdata)
{
////alert(empdata);
    const myArray = empdata.split(",");
    let arlength=myArray.length;
    ////alert(arlength);

    let id = myArray[arlength - 1];
    let empname = myArray[0];

      $('#empIDforSalary').val('0');
     $('#EmpSalaryModel').modal('show');
     $('#empIDforSalary').val(id);
      $('#txtEmpSalDisplayName').val(empname);
      BindSalaryDataTable(id);
}

function btnEmpSalary()
{
     
    var id = $('[id*=empIDforSalary]').val();
   
     if(id > 0)
     {
      
         var salary = $('[id*=txtEmpSalary]').val();
        var salarydate = $('[id*=txtEmpSalDate]').val();
        var employeename = $('[id*=txtEmpSalDisplayName]').val();
        
        

    var model = {};
    model.id = id;
    model.employeename = employeename;
    model.salary=salary;
    model.salaryupdatedate=salarydate;
//    if(model.dressdate=="")
//    {
//         $.notify("Error!! Required field missing!", "error");
//         return false;
//    }

/////alert(JSON.stringify(model));

    $.ajax({
            type: "POST",
            url: "masteremployeesva.aspx/UpdateSalaryRecord",
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
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        return;
                    }
                }
                else {
                    ///$('#empIDforDress').val('0');
                    //$('#EmpDressModel').modal('hide');
                   
                    BindSalaryDataTable(id);
                    BindDataTable();
                    $('#EmpSalaryModel').modal('show');
                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                    $.notify("Error while updating data!", "error");
            }
        });

     }
     else {
        alert("invalid id!!");
        return;
    }
}


function BindSalaryDataTable(id)
{
   ///alert(id);
   // debugger;
      $.ajax({
        type: "POST",
        url: "masteremployeesva.aspx/GetAllSalaryDetailsByEmpID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
         
            $("#tblSalaryDetails").dataTable().fnDestroy();
            var json = JSON.parse(data.d)
           ////alert(data.d);
            var rows = '';
            $('#tblSalaryDetails tbody').empty();
            var srno = 0;
            $.each(json, function (key, item) {
                srno += 1;
                ///var id = item.id;
                ////var modelname = item.dressname;

                ///var updatedt = new Date(item.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                 var updatedt = moment(item.updatedon).format('DD-MMM-YYYY')
                  var createddt = moment(item.createdon).format('DD-MMM-YYYY hh:mm a')

                ////var dressid=item.dressid;
                rows += "<tr>" +
                "<td>" + item.id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + item.salary + ' ' +
                    "</td>" +
                    "<td>" + updatedt + ' ' +
                    "</td>" +

                     "<td>" + item.createdby + '<br/>' + createddt + ' ' + "</td>" +
                    "<td> " +
                   
                    ' <input type="button" id="btnDelete" value="Delete" class="btn btn-danger" onclick="DeleteEmpSalaryRecord(\'' + item.id + ',' + item.salary +   '\'\)"  />' 

//            '<a href="#" class="btn btn-danger" onclick="alert(\'' + item.dressname + ',' + item.id + '\'\)">' + row.dress + '</a>'

              +  "</td>"
                    + "</tr>";
            });
            $('#tblSalaryDetails tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblSalaryDetails]').DataTable({
                "order": [[1, "asc"]],
                "columnDefs": [
                                { "visible": false, "targets": [0] }
                              ],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "paging": true,
                "info": true,
                'processing': true
                
            });

           
        },
        failure: function (response) {
            //// alert(response.responseText);
            $.notify("BOOM!", "error");
        },
        error: function (response) {
          ////alert(response.responseText);

            $.notify("BOOM!", "error");
        }
    });
}

function DeleteEmpSalaryRecord(salaryData)
{

  const myArray = salaryData.split(",");
  //let arlength=myArray.length;
    let id = myArray[0];
    let salary = myArray[1];
    


      if (confirm('Are you sure delete this record?')) {
//        var data = table.row($(this).parents('tr')).data();
//        table.row($(this).parents('tr')).remove().draw();

        var empid =  $('#empIDforSalary').val();

        var model = {};
         model.id = id;
        model.empid = empid;
        model.employeename =  $('[id*=txtEmpSalDisplayName]').val(); 

    ////alert(JSON.stringify(model));

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "masteremployeesva.aspx/DeleteSalaryRecord",
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
                else {
                    $("#Showoverlay").hide();
                    BindSalaryDataTable(empid);
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