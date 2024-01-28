$(function () {
    $("#Showoverlay").show();
    GetData();




    $.ajax({
        type: "POST", url: "mastersurveyor.aspx/GetAllActiveStates",
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

    $("#Showoverlay").show();

   var stateid =   $('#ddlstates :selected').val();
   var model = {}
   model.stateid = stateid;

   $('#ddldistricts').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "mastersurveyor.aspx/GetAllActiveDistrictsByStateID",
        dataType: "json",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json",
        success: function (res) {
            ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddldistricts").append($("<option></option>").val(value.id).html(value.distname));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM district error!", "error");
            $("#Showoverlay").show();
        }

    });

}

function GetSeletedDistricts(stateid, distid) {

    $("#Showoverlay").show();

   
    var model = {}
    model.stateid = stateid;

    $('#ddldistricts').find('option:not(:first)').remove();
    $.ajax({
        type: "POST", url: "mastersurveyor.aspx/GetAllActiveDistrictsByStateID",
        dataType: "json",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json",
        success: function (res) {
            ///// $('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddldistricts").append($("<option></option>").val(value.id).html(value.distname));
            })

            $("#ddldistricts").val(distid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM district error!", "error");
            $("#Showoverlay").show();
        }

    });

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


    $("#Showoverlay").show();
    $.ajax({
        type: "POST",
        url: "mastersurveyor.aspx/GetAllData",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblRecords").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblRecords tbody').empty();
            $.each(json, function (key, item) {
                var id = item.id;
                var name = item.surveyorname;
                var mobileno = item.surveyormobileno;
//                var status = item.isactive;
//                if (status == "1") {
//                    status = "Active";
//                }
//                else {
//                    status = "Inactive";
//                }
                rows += "<tr><td>" + id +
                    "</td><td>" + name + ' ' +
                    "</td>" +
                    "<td>" + mobileno + ' ' + "</td>" +
                     "<td>" + item.surveyoremail + ' ' + "</td>" +
                    "<td>" + item.statename + ' ' +
                    "</td>" +
                      "<td>" + item.distname + ' ' +
                    "</td>" +
                    "<td> " +
                    " <input type='button' id='btnEdit'  onclick='EditRecordbyID(" + id + ")' value='Edit' class='btn btn-primary'>  &nbsp;" +
                     " <input type='button' id='btnDelete'  onclick='DeleteRecord(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
                    + "</tr>";
            });
            $('#tblRecords tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblRecords]').DataTable({
                "order": [[0, "asc"]],
                dom: 'lBfrtip',
                responsive: true,
                buttons: buttons,
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
    var name = $('[id*=txtName]').val();
    //////name = sentenceCase(name);
    var mobileno = $('[id*=txtMobile]').val();
    var status = $("#status :selected").val();
    var email = $('[id*=txtEmail]').val();

    var stateid = $('#ddlstates :selected').val();
    var statename = $('#ddlstates :selected').text();
    var distid = $('#ddldistricts :selected').val();
    var distname = $('#ddldistricts :selected').text();
   // $("#elementId :selected").text(); // The text content of the selected option
   // $("#elementId :selected").val(); // The value of the selected option

    var model = {};
    model.Name = name;
    model.MobileNo = mobileno;
    model.status = status;
    model.surveyoremail = email;

    model.stateid = stateid;
    model.statename = statename;
    model.distid = distid;
    model.distname = distname;

    $.ajax({
        type: "POST",
        url: "mastersurveyor.aspx/SaveRecord",
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
            }
            else {
                if (r.d == 20 || r.d == 50 || r.d == 30) {
                    if (r.d == 20) {
                        $.notify("Error!! mobile name already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!!  name cannot be blank!", "error");
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
    $.ajax({
        type: "POST",
        url: "mastersurveyor.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to add record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                ////var name = json[0].surveyorname;
                //////alert(json[0].id + "" + json[0].semobileno + " " + json[0].isactive);
                $('#recordID').val(json[0].id);
                $('#txtName').val(json[0].surveyorname);
                $('#txtMobile').val(json[0].surveyormobileno);
                $('[id*=txtEmail]').val(json[0].surveyoremail);
                ////$('#txtName').val(modelname);

                $('#ddlstates').val(json[0].stateid);
                ///$('#ddldistricts').val(json[0].distid);
                GetSeletedDistricts(json[0].stateid, json[0].distid);

                $("#status").val(json[0].isactive);
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
    ////name = sentenceCase(name);

    var mobileno = $('[id*=txtMobile]').val();
    var status = $("#status :selected").val();
    var email = $('[id*=txtEmail]').val();

    var stateid = $('#ddlstates :selected').val();
    var statename = $('#ddlstates :selected').text();
    var distid = $('#ddldistricts :selected').val();
    var distname = $('#ddldistricts :selected').text();


    if (id > 0) {
        var model = {};
        model.id = id;
        model.Name = name;
        model.MobileNo = mobileno;
        model.status = status;
        model.surveyoremail = email;

        model.stateid = stateid;
        model.statename = statename;
        model.distid = distid;
        model.distname = distname;


        $.ajax({
            type: "POST",
            url: "mastersurveyor.aspx/UpdateRecord",
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
                        return;
                    }
                    if (r.d == 20) {
                        $.notify("Error!! mobile name already exists!", "error");
                        $('[id*=txtMobile]').focus();
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! model name cannot be blank!", "error");
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
        var data = table.row($(this).parents('tr')).data();
        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "mastersurveyor.aspx/DeleteRecord",
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
    $('#txtMobile').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtName').css('border-color', 'lightgrey');
    $('#txtMobile').css('border-color', 'lightgrey');
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

    if ($('#txtMobile').val().trim() == "") {
        $('#txtMobile').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobile').css('border-color', 'lightgrey');
    }

    return isValid;
}

