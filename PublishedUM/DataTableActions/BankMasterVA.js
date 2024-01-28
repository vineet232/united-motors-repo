

$(function () {
    $("#Showoverlay").show();
    GetData();
});


function GetData() {

    $("#Showoverlay").show();
    $.ajax({
        type: "POST",
        url: "masterbankVA.aspx/GetAllData",
        data: '',
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

                var status = item.isactive;
                if (status == "1") {
                    //status = "Active";
                    //onclick="updateattendancestatus(' + row.id + ')"
                    status = '<a href="#" onclick="updatestatus(' + item.id + ')"><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
                }
                else {
                    //status = "Inactive";
                    //onclick="updateattendancestatus(' + row.id + ')"
                    status = '<a href="#" onclick="updatestatus(' + item.id + ')"><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
                }


                rows += "<tr>" +
                "<td>" + item.id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + item.bankname + ' ' +
                    "</td>" +

                    "<td>" + item.openingbal + ' ' +
                    "</td>" +

                ////                    "<td>" + item.currentbal + ' ' +

                "<td>" + item.RunningBalanceNew + ' ' +
                    "</td>" +

                     "<td>" + status + ' ' + "</td>" +

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

function updatestatus(id) {

    $("#Showoverlay").show();
    $.ajax({
        type: "POST",
        url: "masterbankVA.aspx/UpdateStatus",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not updated!", "error");
                return;
            }

            $("#Showoverlay").hide();
            GetData();
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
    var bankname = $('[id*=txtName]').val();
    var openingbal = $('[id*=txtOpeningBalance]').val();
    var currentbal = $('[id*=txtCurrentBalance]').val();
    var isactive = "";
    if ($('#chkStatus').prop('checked')) {
        isactive = "1";
    } else {
        isactive = "0";
    }

   // name = sentenceCase(name);
    var model = {};
    model.bankname = bankname;
    model.openingbal = openingbal;
    model.currentbal = currentbal;
    model.oisactive = isactive;

    $.ajax({
        type: "POST",
        url: "masterbankVA.aspx/SaveRecord",
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
                if (r.d == 20 || r.d == 30) {
                    if (r.d == 20) {
                        $.notify("Error!! bank name already exists!", "error");
                        //$('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
                        $('[id*=txtName]').focus();
                       // $('#myModal').modal('show');
                        return;
                    }
                }
                else {
                    
                    $('#myModal').modal('hide');

                    $.notify("Record saved!", "success");
                    GetData();
                }
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
                $.notify("Error while saving data!", "error");
            }
        }
    });
}


function EditRecordbyID(id) {
    ////alert(id);
    $.ajax({
        type: "POST",
        url: "masterbankVA.aspx/GetRecordbyID",
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
            url: "masterbankVA.aspx/UpdateRecord",
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
                    GetData();
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
            url: "masterbankVA.aspx/DeleteRecord",
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
    $('#txtName').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtName').css('border-color', 'lightgrey');
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

    return isValid;
}



