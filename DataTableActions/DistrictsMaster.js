

$(function () {
   // $("#Showoverlay").show();
    //// GetData();


    $.ajax({
        type: "POST", url: "masterdistricts.aspx/GetAllActiveStates",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlstates").append($("<option></option>").val(value.id).html(value.statename));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!States Error", "error");
        }

    });

});

function ddlstates_selectedindexchanged() {
    GetData();
}


function GetData() {

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

    var stateid = $("#ddlstates :selected").val();
    var model = {}
    model.stateid = stateid;
    $("#Showoverlay").show();
    $.ajax({
        type: "POST",
        url: "masterdistricts.aspx/GetAllData",
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
                ////var id = item.id;
                ////var statename = item.statename;
                rows += "<tr>" +
                "<td>" + item.id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + item.distname + ' ' +
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
                dom: 'lBfrtip',
                responsive: true,
                buttons: buttons,

                "columnDefs": [
                                { "visible": false, "targets": [0] }
                              ],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "paging": true,
                "info": true,
                'processing': true,
               
               stateSave: true,
                "bDestroy": true,
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
    var distname = $('[id*=txtName]').val();
    var stateid = $("#ddlstates :selected").val();
    // name = sentenceCase(name);
    var model = {};
    model.distname = distname;
    model.stateid = stateid;
    $.ajax({
        type: "POST",
        url: "masterdistricts.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtName]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30) {
                    if (r.d == 20) {
                        $.notify("Error!! recrod already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! value cannot be blank!", "error");
                        $('[id*=txtName]').focus();
                        return;
                    }
                }
                else {
                    $('#myModal').modal('hide');
                    ///////$("#ddlstates").prop("selectedIndex", 0);
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
                $.notify("Error!! record already exists!", "error");
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
        url: "masterdistricts.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to add record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                ////var claimstatus = json[0].claimstatus;
                //alert(modelname);
                $('#recordID').val(json[0].id);
                $('#txtName').val(json[0].distname);

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

    var distname = $('[id*=txtName]').val();
    var stateid = $("#ddlstates :selected").val();
    ////name = sentenceCase(name);
    if (id > 0) {
        var model = {};
        model.id = id;
        model.distname = distname;
        model.stateid = stateid;

        $.ajax({
            type: "POST",
            url: "masterdistricts.aspx/UpdateRecord",
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
                        $.notify("Error!! You do not have permission to add record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! record already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! value cannot be blank!", "error");
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
                    $.notify("Error!! record already exists!", "error");
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
            url: "masterdistricts.aspx/DeleteRecord",
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
    $('#txtName').val("");

    var stateid = $("#ddlstates :selected").val();
    ////alert(stateid);

   if (stateid == 0) {
       $.notify("Please select state first!", "error");
   }
   else {
       $('#btnUpdate').hide();
       $('#btnAdd').show();

       $('#txtName').css('border-color', 'lightgrey');
       $('#myModal').modal('show');
       $('#myModal').on('shown.bs.modal', function () {
           $('#txtName').focus();
       });
   }

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

    return isValid;
}



