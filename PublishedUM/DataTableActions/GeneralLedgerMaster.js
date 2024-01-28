

$(function () {
    $("#Showoverlay").show();
    GetData();
});


function GetData() {

    $("#Showoverlay").show();
    $.ajax({
        type: "POST",
        url: "masterGeneralLedger.aspx/GetAllData",
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

//                var status = item.isactive;
//                if (status == "1") {
//                    //status = "Active";
//                    //onclick="updateattendancestatus(' + row.id + ')"
//                    status = '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
//                }
//                else {
//                    //status = "Inactive";
//                    //onclick="updateattendancestatus(' + row.id + ')"
//                    status = '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
//                }


                rows += "<tr>" +
                "<td>" + item.id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + item.glname + ' ' +
                    "</td>" +
                    
                    "</td>" +
                    "<td>" + item.currentbalance + ' ' + "</td>" +
                     "<td>" + item.glphoneno + ' ' +
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

    //var id = table.rows()[0].length + 1;
    var glname = $('[id*=txtName]').val();
    var glphoneno = $('[id*=txtMobileNo]').val();
    var currentbalance = $('[id*=txtCurrentBalance]').val();

   // name = sentenceCase(name);
    var model = {};
    model.glname = glname;
    model.glphoneno = glphoneno;
    model.currentbalance = currentbalance;

    $.ajax({
        type: "POST",
        url: "masterGeneralLedger.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {

            if (r.d.toLowerCase() != "record saved!") {
                $.notify(r.d, "error");
                $('[id*=txtMobile]').focus();
            }
            else {
                $('#myModal').modal('hide');
                $('#recordID').val("0");
                $.notify(r.d, "success");

                GetData();
            }

        }
            ,
        error: function (errormessage) {
            ///////alert(errormessage.responseText);
            if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                //alert("Error!! model name already exists!!");
                $.notify("Error!! general ledger name already exists!", "error");
            }
            else {
                //alert("Error while saving data!!");
                $.notify("Error while saving data!", "error");
            }
        }
    });
}


function EditRecordbyID(id) {
    ///alert(id);
    $.ajax({
        type: "POST",
        url: "masterGeneralLedger.aspx/GetRecordbyID",
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
                $('#txtName').val(json[0].glname);
                $('#txtMobileNo').val(json[0].glphoneno);
                $('#txtCurrentBalance').val(json[0].currentbalance);
////                var isactive = json[0].isactive;
////                if (isactive == "1") {
////                    $('#chkStatus').prop('checked')
////                } else {
////                    $("#chkStatus").removeAttr("checked");
////                }

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

    var glname = $('[id*=txtName]').val();
    var glphoneno = $('[id*=txtMobileNo]').val();
    var currentbalance = $('[id*=txtCurrentBalance]').val();

    if (id > 0) {
        var model = {};
        model.id = id;
        model.glname = glname;
        model.glphoneno = glphoneno;
        model.currentbalance = currentbalance;
        
        $.ajax({
            type: "POST",
            url: "masterGeneralLedger.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d.toLowerCase() != "record saved!") {
                    $.notify(r.d, "error");
                    $('[id*=txtName]').focus();
                }
                else {
                    $('#myModal').modal('hide');
                    $('#recordID').val("0");
                    ////$.notify(r.d, "success");
                    $.notify("Record updated!", "success");
                    GetData();
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!!  name already exists!", "error");
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
            url: "masterGeneralLedger.aspx/DeleteRecord",
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
    $('#txtMobileNo').val("");
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
    if ($('#txtMobileNo').val().trim() == "") {
        $('#txtMobileNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobileNo').css('border-color', 'lightgrey');
    }
    

    return isValid;
}



