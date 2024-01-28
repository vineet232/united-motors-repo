
$(document).ready(function () {
 $('#txtDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
})  


$(function () {
//    $("#Showoverlay").show();
//    GetData();

BindDataTable();
});


//function GetData() {

//    $("#Showoverlay").show();
//    $.ajax({
//        type: "POST",
//        url: "mastercustomersVA.aspx/GetAllData",
//        data: '',
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (data) {

//            $("#tblRecords").dataTable().fnDestroy();
//            var json = JSON.parse(data.d)

//            var rows = '';
//            $('#tblRecords tbody').empty();
//            var srno = 0;
//            $.each(json, function (key, item) {
//                srno += 1;

//////                var status = item.isactive;
//////                if (status == "1") {
//////                    //status = "Active";
//////                    //onclick="updateattendancestatus(' + row.id + ')"
//////                    status = '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
//////                }
//////                else {
//////                    //status = "Inactive";
//////                    //onclick="updateattendancestatus(' + row.id + ')"
//////                    status = '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
//////                }

//                var opbalDt="";
//                if(item.openingbaldate !=null)
//                {
//                    opbalDt =  new Date(item.openingbaldate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
//                }


//                rows += "<tr>" +
//                "<td>" + item.id + "</td>" +
//                "<td>" + srno + "</td>" +
//                "<td>" + item.custname + ' ' +
//                    "</td>" +

//                    "<td>" + item.accounttype + ' ' +
//                    "</td>" +

//                    "<td>" + item.vehno + ' ' +
//                    "</td>" +

//                     "<td>" + item.contactno + ' ' + "</td>" +

//                       "<td>" + item.openingbal + ' ' + "</td>" +
//                         "<td>" + opbalDt + ' ' + "</td>" +

//                      "<td>" + item.currentbalance + ' ' + "</td>" +

//                       "<td>" + item.paymentduedays + ' ' + "</td>" +

//                    "<td> " +
//                    " <input type='button' id='btnEdit'  onclick='EditRecordbyID(" + item.id + ")' value='Edit' class='btn btn-primary'>  </td>" +

//                    "<td>" + 
//                     " <input type='button' id='btnDelete'  onclick='DeleteRecord(" + item.id + ")' value='Delete' class='btn btn-danger'>  </td>"+
//                    + "</tr>";
//            });
//           
//            $('#tblRecords tbody').append(rows);

//            // Apply DataTable Plugin.
//            table = $('[id*=tblRecords]').DataTable({
//                "order": [[1, "asc"]],
//                "columnDefs": [
//                                { "visible": false, "targets": [0] }
//                              ],
//                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
//                "paging": true,
//                "info": true,
//                'processing': true,
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


function BindDataTable() {


 $("#tblRecords").dataTable().fnDestroy();
//var i = 1;
 
            $('#tblRecords').DataTable({
            "order": [[ 1, 'asc' ]],
            "columnDefs": [
    { "visible": false, "targets": [0] }
    ],

                bServerSide: true,
                sAjaxSource: 'MasterCustomersHandlerVA.ashx/GetCustomersList',
                sServerMethod: 'post',
                "processing": true,
                

                "columns": [
                    {  "data": "id" },
                     {
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "custname" },
                    { "data": "accounttype" },

                    { "data": "vehno" },
                    { "data": "contactno" },

                        
                    /// { "data": "vehno" },
                     
                      { "data": "openingbal" },
                    { "data": "openingbaldate" },
                    { "data": "currentbalance" },
                   
                    { "data": "currentduedays" },

                    { "data": "remarks" },
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

    //var id = table.rows()[0].length + 1;
    var custname = $('[id*=txtName]').val();
    var vehno = $('[id*=txtVehChasisNo]').val();
    var contactno = $('[id*=txtMobileNo]').val();

    var accounttypeid = $("#ddlAccountType :selected").val();
    var accounttype = $("#ddlAccountType :selected").text();

     var openingbal = $('[id*=txtOpeningBalance]').val();
     var openingbaldate = $('[id*=txtDate]').val();
     var remarks = $('[id*=txtRemarks]').val();
//    var isactive = "";
//    if ($('#chkStatus').prop('checked')) {
//        isactive = "1";
//    } else {
//        isactive = "0";
//    }

   // name = sentenceCase(name);
    var model = {};
    model.custname = custname;
    model.accounttypeid = accounttypeid;
    model.accounttype = accounttype;
    model.vehno = vehno;
    model.contactno = contactno;
     model.openingbal = openingbal;
     model.openingbaldate = openingbaldate;
     model.remarks=remarks;
    $.ajax({
        type: "POST",
        url: "mastercustomersVA.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtName]').focus();
                ////$('#myModal').modal('show');
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30 || r.d == 50) {
                    if (r.d == 20) {
                        $.notify("Error!! mobile already exists!", "error");
                        //$('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
                        $('[id*=txtName]').focus();
                       // $('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtName]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                }
                else {
                    
                    $('#myModal').modal('hide');

                    $.notify("Record saved!", "success");
                    ///GetData();
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
        url: "mastercustomersVA.aspx/GetRecordbyID",
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
                $('#txtName').val(json[0].custname);
                $('#txtVehChasisNo').val(json[0].vehno);
                $('#txtMobileNo').val(json[0].contactno);
                $("#ddlAccountType").val(json[0].accounttypeid);
//                var isactive = json[0].isactive;
//                if (isactive == "1") {
//                    $('#chkStatus').prop('checked')
//                } else {
//                    $("#chkStatus").removeAttr("checked");
//                }

             $('[id*=txtOpeningBalance]').val(json[0].openingbal);
              $('[id*=txtRemarks]').val(json[0].remarks);
                var opbaldate="01/01/1900";
                if(json[0].openingbaldate != null)
                {
                ////alert("123");
                 opbaldate = new Date(json[0].openingbaldate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                }
               
                $('[id*=txtDate]').val(opbaldate);


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

    var custname = $('[id*=txtName]').val();
    var vehno = $('[id*=txtVehChasisNo]').val();
    var contactno = $('[id*=txtMobileNo]').val();

    var accounttypeid = $("#ddlAccountType :selected").val();
    var accounttype = $("#ddlAccountType :selected").text();

    var openingbal = $('[id*=txtOpeningBalance]').val();

     var openingbaldate = $('[id*=txtDate]').val();
      var remarks = $('[id*=txtRemarks]').val();

////    var isactive = "";
////    if ($('#chkStatus').prop('checked')) {
////        isactive = "1";
////    } else {
////        isactive = "0";
////    }
    ////name = sentenceCase(name);
    if (id > 0) {
        var model = {};
        model.id = id;
        model.custname = custname;
        model.accounttypeid = accounttypeid;
        model.accounttype = accounttype;
        model.vehno = vehno;
        model.contactno = contactno;
        model.openingbal = openingbal;
        model.openingbaldate = openingbaldate;
        model.remarks=remarks;

        $.ajax({
            type: "POST",
            url: "mastercustomersVA.aspx/UpdateRecord",
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
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50) {
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
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtName]').focus();
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAdd').hide();
                    ////GetData();
                     BindDataTable();
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
//////        var data = table.row($(this).parents('tr')).data();
//////        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "mastercustomersVA.aspx/DeleteRecord",
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
                    ///GetData();
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
    $('#txtName').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtName').css('border-color', 'lightgrey');
    $('#txtVehChasisNo').css('border-color', 'lightgrey');
    $('#txtMobileNo').css('border-color', 'lightgrey');
    $('#ddlAccountType').prop("selectedIndex", 0);

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

    if ($('#txtOpeningBalance').val().trim() == "") {
        $('#txtOpeningBalance').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtOpeningBalance').css('border-color', 'lightgrey');
    }

    if ($('#txtDate').val().trim() == "") {
        $('#txtDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDate').css('border-color', 'lightgrey');
    }

    if ($('#txtVehChasisNo').val().trim() == "") {
        $('#txtVehChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehChasisNo').css('border-color', 'lightgrey');
    }

    if ($('#txtMobileNo').val().trim() == "") {
        $('#txtMobileNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobileNo').css('border-color', 'lightgrey');
    }

    if ($('#ddlAccountType :selected').val().trim() == "0") {
        $('#ddlAccountType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlAccountType').css('border-color', 'lightgrey');
    }
    return isValid;
}



