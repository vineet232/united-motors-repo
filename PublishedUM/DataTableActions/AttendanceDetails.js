$(document).ready(function () {

 $('#txtDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

////////    $('#txtDate').datepicker({
////////        format: "mm/dd/yyyy",
////////        autoclose: true,
////////        endDate: "today"
////////    });
    

})  

//$(function () {
//   //// $("#Showoverlay").show();
//    GetData();
//    ////SelectRadio();
//   ///// BindDataTable()
//});

function SelectRadio()
{
  var $radios = $('input:radio[name=empAbsent]');
        if($radios.is(':checked') === false) {
            $radios.filter('[value=Absent]').prop('checked', true);
        }
}

function ShowEmployeesList()
{ 
////alert("12");

     GetData();
}


////function BindDataTable() {
////var i=1;
////var cnt=1;
//// $("#tblRecords").dataTable().fnDestroy();
//////var i = 1;
//// 
////            $('#tblRecords').DataTable({
////            "order": [[ 2, 'asc' ]],
////            "columnDefs": [
////    { "visible": false, "targets": [0] }
////    ],

////                bServerSide: true,
////                sAjaxSource: 'MarkDailyAttendanceHandler.ashx/GetEmployeesList',
////                sServerMethod: 'post',
////                "processing": true,
////                "paging":false,

////                "columns": [
////                    {  "data": "id" },
////                     {
////                     bSortable: false,
////                      render: function (data, type, row, meta) {
////                     return meta.row + meta.settings._iDisplayStart + 1;
////                    }
////                    },
////                    { "data": "empname" },
////                   
//////                   
//////                    { "data": "vendoraddress" },
//////                    { "data": "vendorcontactno" },
//////                    { "data": "currentduedays" },
////                     { "data": "attendstatus",
////                    

////                     render: function ( data, type, row )
////                        {
////                       return '<input type="radio" class="custom-control-input"  name="emp_id"'+ i++ +'" id="emp_id"'+ i++ +'" checked  value="P"/>'

////////                             var status=row.attendstatus;
////////                               if (status == "1") 
////////                               {                               
////////                                   return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
////////                                  //// alert(cnt++);

////////                                  //// return '<input id="chk" '+(cnt++)+" name='radio'"+cnt+++'"  type="radio" '+(status == "1" ? "checked":"")+' value="' + status + '">';  
////////                                }
////////                                else
////////                                {
////////                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
////////                                }
////                       }
////                       },
////                       { "data": "attendstatus",
////                    

////                     render: function ( data, type, row )
////                        {
////                        
////                             var status=row.attendstatus;
////                               if (status == "1") 
////                               {                               
////                                   return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
////                                  //// alert(cnt++);

////                                  //// return '<input id="chk" '+(cnt++)+" name='radio'"+cnt+++'"  type="radio" '+(status == "1" ? "checked":"")+' value="' + status + '">';  
////                                }
////                                else
////                                {
////                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
////                                }
////                       }
////                       },
////                       { "data": "attendstatus",
////                    

////                     render: function ( data, type, row )
////                        {
////                        
////                             var status=row.attendstatus;
////                               if (status == "1") 
////                               {                               
////                                   return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
////                                  //// alert(cnt++);

////                                  //// return '<input id="chk" '+(cnt++)+" name='radio'"+cnt+++'"  type="radio" '+(status == "1" ? "checked":"")+' value="' + status + '">';  
////                                }
////                                else
////                                {
////                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
////                                }
////                       }



////////                     render: function (data, type, full, meta) {  
////////                     
////////                                    ///return '<input id="chk'+(cnt++)+" name="radio'+cnt+'"  type="radio" '+(data == true ? "checked":"")+' value="' + data + '">';   
////////                                    data=1;
////////                                    return '<input id="chk" '+(cnt++)+" name='radio'"+cnt+'"  type="radio" '+(data == true ? "checked":"")+' value="' + data + '">';   
////////                                   
////////                                     //return   " <input id='chk' type='radio' name='empPresent"+i +"' groupname='grppresent"+ i+"'  value='Present'  >" ;
////////                                     // i=i+1;
////////                                    }


////////                      render: function ( data, type, row )
////////                        {
////////                        
////////                             var status="1";
////////                               if (status == "1") 
////////                               {                               
////////                                    ///return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';

////////                                     var $radios = $('input:radio[name=empPresent]');
////////        if($radios.is(':checked') === false) {
////////            $radios.filter('[value=Present]').prop('checked', true);
////////        }



////////                                 return   " <input type='radio' name='empPresent' checked='true' value='Present'>" ;

////////                                }
////////                                else
////////                                {
////////                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
////////                                }
////////                       }
////                     },
//////                   
//////                   {
//////                       "data": "id",
//////                       "render": function (id, type, full, meta) {
//////                           //debugger
//////                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
//////                       }
//////                   },
//////                    {
//////                        "data": "id",
//////                        "render": function (id, type, full, meta) {
//////                            //debugger
//////                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
//////                        }
//////                    }
////                  
////                    
////                ],

////                 ///stateSave: true,
////                "bDestroy": true
////            });


////  }



//function ShowEmployeesList() {
//    GetData();
//}

function GetData() {



 var attendDt=$('#txtDate').val();
 
 if(attendDt != "")
 {
 alert(attendDt);
 
 $("#tblRecords").dataTable().fnDestroy();
 $('#tblRecords tbody').empty();
 /////  $("#Showoverlay").show();
    $.ajax({

     

        type: "POST",
        url: "markdailyattendance.aspx/GetAllEmployeesList",
        data: '{ attendDt :' + JSON.stringify(attendDt) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

           ///// $("#tblRecords").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblRecords tbody').empty();
            var srno = 0;
            var data=1;
            var data2=0;
            $.each(json, function (key, item) {
                srno += 1;

              ///// alert('emp_id'+ srno);


                rows += "<tr>" +
               "<td style='display:none;'>" + item.id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + item.employeename + ' ' +
                    "</td>" +

//                    "<td>" + item.openingbal + ' ' +
//                    "</td>" +

                //                    "<td>" + item.currentbal + ' ' +

//////                "<td>" +   "<input id='chk"+(srno)+" name='radio'"+srno+'"   type="radio" '+(data == true ? "checked":"")+' value="P">'  + ' ' +

//////                    "</td>" +

 "<td>" +   '<input type="radio" class="custom-control-input" name="emp_id'+srno+'" id="emp_idP'+srno+'"  checked value="P"/>'  + ' ' +

                    "</td>" +

                     "<td>" + '<input type="radio" class="custom-control-input" name="emp_id'+srno+'" id="emp_idA'+srno+'"  value="A"/>' + ' ' + "</td>" +

                     "<td>" + '<input type="radio" class="custom-control-input" name="emp_id'+srno+'" id="emp_idH'+srno+'"  value="H"/>' + ' ' + "</td>" +

                      "<td style='display:none;'>" + item.salary + "</td>" +

////                    "<td> " +
////                    " <input type='button' id='btnEdit'  onclick='EditRecordbyID(" + item.id + ")' value='Edit' class='btn btn-primary'>  &nbsp;" +
////                     " <input type='button' id='btnDelete'  onclick='DeleteRecord(" + item.id + ")' value='Delete' class='btn btn-danger'> </td>"
                    + "</tr>";
            });
           
          // alert(rows);
            $('#tblRecords tbody').append(rows);

             

            // Apply DataTable Plugin.
            table = $('[id*=tblRecords]').DataTable({
                "order": [[1, "asc"]],
                "columnDefs": [
                               /////// { "visible": false, "targets": [0] }
                              ],
               // "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],

////                "fnDrawCallback": function( oSettings ) {
////            lastSelectedRadio=currentSelectedRadio();
////         },


                "paging": false,
                "info": true,
                'processing': true,
                fnInitComplete: function () {
                  ////  $("#Showoverlay").hide();
                }
                

            });
        },
        failure: function (response) {
            // alert(response.responseText);
          //  $.notify("BOOM!", "error");
             ///// $("#Showoverlay").hide();
        },
        error: function (response) {
            ///alert(response.responseText);
           
          //  $.notify("Attendance already submitted!", "error");
             ////  $("#Showoverlay").hide();

             $("#tblRecords").dataTable().fnDestroy();
 $('#tblRecords tbody').empty();

        }

        
    });

      $("#Showoverlay").hide();
      }
      else
      {
      alert("Please select attendance date!!");
      $("#txtDate").focus();
      }
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

var i = 1;
var t = document.getElementById('tblRecords');
var saved=0;
var errorsaving=0;
   $("#tblRecords tr").each(function() {
   
     var empid = $(t.rows[i].cells[0]).text();
     var empname = $(t.rows[i].cells[2]).text();

      var empsalinmonth = $(t.rows[i].cells[6]).text();


//     var presentStatusID=1; //     var absentStatusID=2; //     var halfdayStatusID=3;
     var statusID=0;
     var status="";

     $('input:radio[id=emp_idP' + i + ']').each(function () {
        if ($(this).is(':checked')) {           
            statusID=1;
            status="P" ;     
            }
            
            });

 $('input:radio[id=emp_idA' + i + ']').each(function () {
        if ($(this).is(':checked')) {           
            statusID=2;
            status="A" ;   
            }
            
            });

 $('input:radio[id=emp_idH' + i + ']').each(function () {
        if ($(this).is(':checked')) {           
             statusID=3;
            status="H" ;    
            }
            
            });

    ///////alert("id" + val1 + "name" +  val2 + "p" + present + "a" + absent + "h" + halfday ) ;

     var attenddt = $('[id*=txtDate]').val();

    var model = {};
    model.attenddt = attenddt;
    model.empid = empid;
    model.empname = empname;
    model.attendstatusid = statusID;
    model.attendstatus=status;
    model.empsalinmonth=empsalinmonth;

    $.ajax({
        type: "POST",
        url: "markdailyattendance.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
        saved=1;
//////////            if (r.d == 0) {
//////////                $.notify("Error!! Record not saved!", "error");
//////////                $('[id*=txtName]').focus();
//////////                ////$('#myModal').modal('show');
//////////                return;
//////////            }
//////////            if (r.d == 10) {
//////////                $.notify("Error!! You do not have permission to add record!", "error");
//////////                return;
//////////            }
//////////            else {
//////////                if (r.d == 20 || r.d == 30) {
//////////                    if (r.d == 20) {
//////////                        $.notify("Error!! bank name already exists!", "error");
//////////                        //$('#myModal').modal('show');
//////////                        return;
//////////                    }
//////////                    if (r.d == 30) {
//////////                        $.notify("Error!! fields cannot be blank!", "error");
//////////                        $('[id*=txtName]').focus();
//////////                       // $('#myModal').modal('show');
//////////                        return;
//////////                    }
//////////                }
//////////                else {
//////////                    
//////////                    $('#myModal').modal('hide');

//////////                    $.notify("Record saved!", "success");
//////////                    GetData();
//////////                }
//////////            }
        }
//////            ,
//////        error: function (errormessage) {
//////            ///////alert(errormessage.responseText);
//////            if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
//////                //alert("Error!! model name already exists!!");
//////                $.notify("Error!! bank name already exists!", "error");
//////            }
//////            else {
//////                //alert("Error while saving data!!");
//////                $.notify("Error while saving data!", "error");
//////            }
//////        }
    });







    i++;
    






});

if(saved==1)
{
alert("saved");
  $('[id*=txtDate]').val("");
    $.notify("Record saved!", "success");
 }
   

else
{
alert("error");
 $.notify("Error while saving record!", "error");
}

}

function EditRecordbyID(id) {
    ////alert(id);
    $.ajax({
        type: "POST",
        url: "markdailyattendance.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                ////var modelname = json[0].modelname;
                //alert(modelname);
                $('#recordID').val(json[0].id);
                $('#txtName').val(json[0].bankname);
                ////$('[id*=txtName]').val();
                $('#txtOpeningBalance').val(json[0].openingbal);
                $('#txtCurrentBalance').val(json[0].currentbal);
                var isactive = json[0].isactive;
                if (isactive == "1") {
                    $('#chkStatus').prop('checked')
                } else {
                    $("#chkStatus").removeAttr("checked");
                }

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

    var bankname = $('[id*=txtName]').val();
    var openingbal = $('[id*=txtOpeningBalance]').val();
    var currentbal = $('[id*=txtCurrentBalance]').val();
    var isactive = "";
    if ($('#chkStatus').prop('checked')) {
        isactive = "1";
    } else {
        isactive = "0";
    }
    ////name = sentenceCase(name);
    if (id > 0) {
        var model = {};
        model.id = id;
        model.bankname = bankname;
        model.openingbal = openingbal;
        model.currentbal = currentbal;
        model.oisactive = isactive;

        $.ajax({
            type: "POST",
            url: "markdailyattendance.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Record not updated!", "error");
                    $('[id*=txtName]').focus();
                    return;
                }
                if (r.d == 10 || r.d == 20 || r.d == 30) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! bank name already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAdd').hide();
                    /////GetData();
                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! bank name already exists!", "error");
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
        var data = table.row($(this).parents('tr')).data();
        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "markdailyattendance.aspx/DeleteRecord",
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
                   ///// GetData();
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
    $('#txtDate').val("");
   
        $('#txtDate').focus();

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
   
    return isValid;
}



