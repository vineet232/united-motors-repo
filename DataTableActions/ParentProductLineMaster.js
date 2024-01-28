

$(document).ready(function () {
   

    $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", 
        url: "masterparentproductline.aspx/GetAllEmissionTypeList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlemissiontype").append($("<option></option>").val(value.id).html(value.emissiontype));
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


    
});



////$(function () {
////    $("#Showoverlay").show();
////    GetData();
////});

function BindLineofBusiness() {

    var emissiontypeid = $("#ddlemissiontype :selected").val();
    $("#Showoverlay").show();

    $.ajax({
        type: "POST",
        url: "masterparentproductline.aspx/GetLineofBusinessByParentIDList",
        data: '{ emissiontypeid :' + emissiontypeid + '}',
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $('#ddllineofbusiness').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddllineofbusiness").append($("<option></option>").val(value.id).html(value.lineofbusiness));
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

function BindDataTable() {
    GetData();
}


function GetData() {
    var emissiontypeid = $("#ddlemissiontype :selected").val();
    var lineofbusinessid = $("#ddllineofbusiness :selected").val();

    var model = {};
    model.emissiontypeid = emissiontypeid;
    model.lineofbusinessid = lineofbusinessid;

    $("#Showoverlay").show();
    $.ajax({
        type: "POST",
        url: "masterparentproductline.aspx/GetAllData",
        //// data: '',
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblRecords").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblRecords tbody').empty();
            var srno = 0;
            $.each(json, function (key, item) {
                srno += 1;
               //// alert(item.designation);
////                var id = item.id;
////                var designation = item.designation;
                rows += "<tr>" +
                "<td>" + item.id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + item.parentproductline + ' ' +
                 "</td>" +
                    "<td> " +
                    " <input type='button' id='btnEdit'  onclick='EditRecordbyID(" + item.id + ")' value='Edit' class='btn btn-primary'>  &nbsp;" +
                     " <input type='button' id='btnDelete'  onclick='DeleteRecord(" + item.id + ")' value='Delete' class='btn btn-danger'> </td>"
                    + "</tr>";
            });
            $('#tblRecords tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblRecords]').DataTable({
                "order": [[1, "asc"]],
                "columnDefs": [
                                { "visible": false, "targets": [0] }
                              ],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "paging": true,
                "info": true,
                'processing': true,
                responsive: true,
                fnInitComplete: function () {
                    $("#Showoverlay").hide();
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

    var id = table.rows()[0].length + 1;
    var parentproductline = $('[id*=txtname]').val();
    var lineofbusinessid = $("#ddllineofbusiness :selected").val();
    var emissiontypeid = $("#ddlemissiontype :selected").val();
   // name = sentenceCase(name);
    var model = {};
    model.parentproductline = parentproductline;
    model.lineofbusinessid = lineofbusinessid;
    model.emissiontypeid = emissiontypeid;

    $.ajax({
        type: "POST",
        url: "masterparentproductline.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtname]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30) {
                    if (r.d == 20) {
                        $.notify("Error!! record already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! record cannot be blank!", "error");
                        $('[id*=txtname]').focus();
                        return;
                    }
                }
                else {
                    $('#myModal').modal('hide');
                    GetData();
                    $.notify("Record saved!", "success");
                }
            }
        }
            ,
        error: function (errormessage) {
            ///////alert(errormessage.responseText);
            if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                //alert("Error!! model name already exists!!");
                $.notify("Error!! designation already exists!", "error");
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
        url: "masterparentproductline.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
               var json = JSON.parse(result.d);
//                var modelname = json[0].modelname;
                //alert(modelname);
                $('#recordID').val(json[0].id);
                $('#txtname').val(json[0].parentproductline);

                $('#myModal').modal('show');
                $('#myModal').on('shown.bs.modal', function () {
                    $('#txtname').focus();
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

    var parentproductline = $('[id*=txtname]').val();
    ////name = sentenceCase(name);
    if (id > 0) {
        var model = {};
        model.id = id;
        model.parentproductline = parentproductline;

        $.ajax({
            type: "POST",
            url: "masterparentproductline.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Record not updated!", "error");
                    $('[id*=txtname]').focus();
                    return;
                }
                if (r.d == 10 || r.d == 20 || r.d == 30) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! record already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! record cannot be blank!", "error");
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAdd').hide();
                    GetData();
                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! designation already exists!", "error");
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
            url: "masterparentproductline.aspx/DeleteRecord",
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
                if (r.d == 99) {
                    $.notify("Error!! unable to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    GetData();
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
    $('#txtname').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtname').css('border-color', 'lightgrey');

    var emissiontypeid = $("#ddlemissiontype :selected").val();
    var lineofbusinessid = $("#ddllineofbusiness :selected").val();
    if (emissiontypeid > 0 && lineofbusinessid > 0) {
        $('#myModal').modal('show');
        $('#myModal').on('shown.bs.modal', function () {
            $('#txtname').focus();
        });
    }
    else {
        $.notify("please select emission type/ line of business!!", "error");
    }

}
//Valdidation using jquery  
function validate() {
    var isValid = true;
    if ($('#txtname').val().trim() == "") {
        $('#txtname').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtname').css('border-color', 'lightgrey');
    }

    return isValid;
}



