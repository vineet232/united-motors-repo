

$(document).ready(function () {
   

    $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", 
        url: "masterservicetype.aspx/GetAllEmissionTypeList",
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
        url: "masterservicetype.aspx/GetLineofBusinessByParentIDList",
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


function BindParentProductLine() {

    var emissiontypeid = $("#ddlemissiontype :selected").val();
    var lineofbusinessid = $("#ddllineofbusiness :selected").val();
    var model = {};
    model.emissiontypeid = emissiontypeid;
    model.lineofbusinessid = lineofbusinessid;
    $("#Showoverlay").show();

    $.ajax({
        type: "POST",
        url: "masterservicetype.aspx/GetParentProductLineByParentIDList",
        data: '{ model :' + JSON.stringify(model) + '}',
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $('#ddlparentproductline').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlparentproductline").append($("<option></option>").val(value.id).html(value.parentproductline));
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

function BindProductLine() {

    var emissiontypeid = $("#ddlemissiontype :selected").val();
    var lineofbusinessid = $("#ddllineofbusiness :selected").val();
    var parentproductlineid = $("#ddlparentproductline :selected").val();

    var model = {};
    model.emissiontypeid = emissiontypeid;
    model.lineofbusinessid = lineofbusinessid;
    model.parentproductlineid = parentproductlineid;

    $("#Showoverlay").show();

    $.ajax({
        type: "POST",
        url: "masterservicetype.aspx/GetProductLineByParentIDList",
        data: '{ model :' + JSON.stringify(model) + '}',
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $('#ddlproductline').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlproductline").append($("<option></option>").val(value.id).html(value.productline));
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
   //// GetData();
   BindDataTable();
}

function BindDataTable() {

 $("#tblRecords").dataTable().fnDestroy();

 var emissiontypeid = $("#ddlemissiontype :selected").val();
 var lineofbusinessid = $("#ddllineofbusiness :selected").val();
 var parentproductlineid = $("#ddlparentproductline :selected").val();
 var productlineid = $("#ddlproductline :selected").val();

 var model = {};
 model.emissiontypeid = emissiontypeid;
 model.lineofbusinessid = lineofbusinessid;
 model.parentproductlineid = parentproductlineid;
 model.productlineid = productlineid;

 $("#Showoverlay").show();
 $.ajax({
     type: "POST",
     url: "masterservicetype.aspx/GetAllData",
     data: '{ model :' + JSON.stringify(model) + '}',
     contentType: "application/json; charset=utf-8",
     dataType: "json",
     success: OnSuccess,
     failure: function (response) {
         alert(response.d);
     },
     error: function (response) {
         alert(response.d);
     }
 });


}

function OnSuccess(response) {

    /////alert(response.d);

    $("[id*=tblRecords]").DataTable(
        {
            bLengthChange: true,
            lengthMenu: [[10, 50, -1], [10, 50, "All"]],
            bFilter: true,
            bSort: true,
            bPaginate: true,
            // dom: 'Bfrtip',
            responsive: true,
            // buttons: buttons,
            data: JSON.parse(response.d),
            "columns": [
                    { "data": "id",

                        bSortable: false,
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        }
                    },
                    { "data": "servicetype" },
                     { "data": "kmshrs" },
                      { "data": "startkmshrs" },
                       { "data": "endkmshrs" },
                        { "data": "dayslimit" },
                    { "data": "permissibledeviation" },
                    { "data": "permissibledeviation"
                        ,
                        render: function (data, type, row) {
                            return '<a href="#" onclick="AddServiceDetails(\'' + row.id + '\'\)">  <i class="glyphicon glyphicon-plus text-primary" style="font-size:x-large;"></i> </a>';
                        }

                    },

                    { "data": "createdby",
                        render: function (data, type, row) {
                            var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                            var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')

                            return "<div class='text-nowrap'>" + row.createdby + '(' + cdate + ')  <br/>' + row.updatedby + '(' + udate + ')' + "</div>";
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
                        render: function ( data, type, row )
                        {
                        return '<a href="#" onclick="PrintPDF(' + row.id + ')"><i class="glyphicon glyphicon-print text-primary" style="font-size:x-large;"></i></a>'
                        
                       }


                     }


                ],
            stateSave: true,
            "bDestroy": true


        });

    $("#Showoverlay").hide();
}



//function GetData() {
//    var emissiontypeid = $("#ddlemissiontype :selected").val();
//    var lineofbusinessid = $("#ddllineofbusiness :selected").val();
//    var parentproductlineid = $("#ddlparentproductline :selected").val();
//    var productlineid = $("#ddlproductline :selected").val();

//    var model = {};
//    model.emissiontypeid = emissiontypeid;
//    model.lineofbusinessid = lineofbusinessid;
//    model.parentproductlineid = parentproductlineid;
//    model.productlineid = productlineid;

//    $("#Showoverlay").show();
//    $.ajax({
//        type: "POST",
//        url: "masterservicetype.aspx/GetAllData",
//        //// data: '',
//        data: '{ model :' + JSON.stringify(model) + '}',
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
//               //// alert(item.designation);
//////                var id = item.id;
//////                var designation = item.designation;
//                rows += "<tr>" +
//                "<td>" + item.id + "</td>" +
//                "<td>" + srno + "</td>" +
//                "<td>" + item.servicetype + ' ' +
//                 "<td>" + item.kmshrs + ' ' +
//                  "<td>" + item.startkmshrs + ' ' +
//                   "<td>" + item.endkmshrs + ' ' +
//                    "<td>" + item.dayslimit + ' ' +
//                     "<td>" + item.permissibledeviation + ' ' +


//                      "<td>" +
//                      {
//                          "data": "id",

//                          render: function (data, type, row) {
//                              if (row.statusid == "1") {
//                                  return '<a href="#" onclick="OpenSlipDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="glyphicon glyphicon-plus text-primary" style="font-size:x-large;"></i> </a>';
//                              }
//                              if (row.statusid == "2") {
//                                  return '    <a href="#" onclick="OpenSlipDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="glyphicon glyphicon-open text-success" style="font-size:x-large;"></i> </a>'

//                              +
//                                 ' &nbsp; &nbsp; <a href="#"  onclick="ShowSlipDetails(\'' + row.id + '%' + row.customername + '%' + row.vehicleno + '%' + row.statusid + '\'\)"><i class="glyphicon glyphicon-eye-open text-primary" style="font-size:x-large;"></i></a>';
//                                  //////////////////<i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i> ' + ' &nbsp;&nbsp;&nbsp;&nbsp;' +
//                              }
//                          }
//                      }
//                       + ' ' +


//                 "</td>" +
//                    "<td> " +
//                    " <input type='button' id='btnEdit'  onclick='EditRecordbyID(" + item.id + ")' value='Edit' class='btn btn-primary'>  &nbsp;" +
//                     " <input type='button' id='btnDelete'  onclick='DeleteRecord(" + item.id + ")' value='Delete' class='btn btn-danger'> </td>"
//                    + "</tr>";
//            });
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
//                responsive: true,
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

   ///// var id = table.rows()[0].length + 1;

    var servicetype = $('[id*=txtname]').val();
    var lineofbusinessid = $("#ddllineofbusiness :selected").val();
    var emissiontypeid = $("#ddlemissiontype :selected").val();
    var parentproductlineid = $("#ddlparentproductline :selected").val();
    var productlineid = $("#ddlproductline :selected").val();

    var kmshrs = $('[id*=txtkmshrs]').val();
    var startkmshrs = $('[id*=txtstartkmshrs]').val();
    var endkmshrs = $('[id*=txtendkmshrs]').val();
    var dayslimit = $('[id*=txtdayslimit]').val();
    var permissibledeviation = $('[id*=txtpermissibledeviation]').val();

   // name = sentenceCase(name);
    var model = {};
    model.servicetype = servicetype;
    model.lineofbusinessid = lineofbusinessid;
    model.emissiontypeid = emissiontypeid;
    model.parentproductlineid = parentproductlineid;
    model.productlineid = productlineid;

    model.kmshrs = kmshrs;
    model.startkmshrs = startkmshrs;
    model.endkmshrs = endkmshrs;
    model.dayslimit = dayslimit;
    model.permissibledeviation = permissibledeviation;

    $.ajax({
        type: "POST",
        url: "masterservicetype.aspx/SaveRecord",
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
                   //// GetData();
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
        url: "masterservicetype.aspx/GetRecordbyID",
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
                $('#txtname').val(json[0].servicetype);
                $('#txtkmshrs').val(json[0].kmshrs);
                $('#txtstartkmshrs').val(json[0].startkmshrs);
                $('#txtendkmshrs').val(json[0].endkmshrs);
                $('#txtdayslimit').val(json[0].dayslimit);
                $('#txtpermissibledeviation').val(json[0].permissibledeviation);

                

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

    var servicetype = $('[id*=txtname]').val();

    var kmshrs = $('[id*=txtkmshrs]').val();
    var startkmshrs = $('[id*=txtstartkmshrs]').val();
    var endkmshrs = $('[id*=txtendkmshrs]').val();
    var dayslimit = $('[id*=txtdayslimit]').val();
    var permissibledeviation = $('[id*=txtpermissibledeviation]').val();

    ////name = sentenceCase(name);
    
    if (id > 0) {
        var model = {};
        model.id = id;
        model.servicetype = servicetype;

        model.kmshrs = kmshrs;
        model.startkmshrs = startkmshrs;
        model.endkmshrs = endkmshrs;
        model.dayslimit = dayslimit;
        model.permissibledeviation = permissibledeviation;

        $.ajax({
            type: "POST",
            url: "masterservicetype.aspx/UpdateRecord",
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
                    /////GetData();
                     BindDataTable();
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
       ///// var data = table.row($(this).parents('tr')).data();
        ///////table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "masterservicetype.aspx/DeleteRecord",
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
                    ////GetData();
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
    $('#txtname').val("");

    $('#txtkmshrs').val("");
    $('#txtstartkmshrs').val("");
    $('#txtendkmshrs').val("");
    $('#txtdayslimit').val("");
    $('#txtpermissibledeviation').val("");

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtname').css('border-color', 'lightgrey');

    var emissiontypeid = $("#ddlemissiontype :selected").val();
    var lineofbusinessid = $("#ddllineofbusiness :selected").val();
    var parentproductid = $("#ddlparentproductline :selected").val();

    if (emissiontypeid > 0 && lineofbusinessid > 0 && parentproductid > 0) {
        $('#myModal').modal('show');
        $('#myModal').on('shown.bs.modal', function () {
            $('#txtname').focus();
        });
    }
    else {
        $.notify("please select emission type/ line of business/ parent product line!!", "error");
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



    if ($('#txtkmshrs').val().trim() == "") {
        $('#txtkmshrs').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtkmshrs').css('border-color', 'lightgrey');
    }

    if ($('#txtstartkmshrs').val().trim() == "") {
        $('#txtstartkmshrs').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtstartkmshrs').css('border-color', 'lightgrey');
    }

    if ($('#txtendkmshrs').val().trim() == "") {
        $('#txtendkmshrs').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtendkmshrs').css('border-color', 'lightgrey');
    }

    if ($('#txtdayslimit').val().trim() == "") {
        $('#txtdayslimit').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtdayslimit').css('border-color', 'lightgrey');
    }

    if ($('#txtpermissibledeviation').val().trim() == "") {
        $('#txtpermissibledeviation').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtpermissibledeviation').css('border-color', 'lightgrey');
    }


    return isValid;
}


function GetPartDetailsbyPartNo()
 {
  var isparto = "";
    if ($('#rdPartno').prop('checked')) {
        ispart = "1";
    } else {
        ispart = "0";
    }

     var islabour = "";
    if ($('#rdLabour').prop('checked')) {
        islabour = "1";
    } else {
        islabour = "0";
    }

    if(ispart=="1")
    {
    var partNo= $('#txtPartNo').val();
    /////alert(partNo);

    var model = {};
        model.partno = partNo;

    $("#Showoverlay").show();
     $.ajax({
         type: "POST",
         url: "masterservicetype.aspx/GetPartDescByPartNo",
        /// data: '{ partno :' + partNo + '}',

        data: '{ model :' + JSON.stringify(model) + '}',

         dataType: "json",
         contentType: "application/json",
         success: function (res) {
       //////alert( JSON.stringify(res.d));
        
        var json = JSON.parse(res.d);
       

          $("#txtParticulars").val(json[0].partdesc);
          $("#txtRate").val(json[0].umrp);
         }
        ,
         error: function (response) {
             ///alert(response.responseText);
             $.notify("BOOM!", "error");
         }

     });
     $("#Showoverlay").hide();
     }
 }




function AddServiceDetails(datasent)
{
   
    const myArray = datasent.split(",");
    
    let serviceid = myArray[0];
  //// alert(serviceid);
  
   $('#txtDSlipNo').html(serviceid); 

   
   $('#myModal2').modal('show');
         
         BindDataTableDetails(serviceid)


    
}



function BindDataTableDetails(servicetypeid) {
  
 

  $('#btnUpdateDetails').hide();

    $("#Showoverlay2").show();
    $.ajax({
        type: "POST",
        url: "masterservicetype.aspx/GetAllDataByServiceTypeid",
       data: '{servicetypeid : ' + servicetypeid + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblRecordDetails").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblRecordDetails tbody').empty();
            var srno = 0;
            $.each(json, function (key, item) {
                srno += 1;



                rows += "<tr>" +
//               "<td>" + item.id + "</td>" +

                "<td>" + srno + "</td>" +
                 "<td>" + item.partno + ' ' +
                    "</td>" 
                    +

                "<td>" + item.particulars + ' ' +
                    "</td>" 
                    +

                    "<td>" + item.uom + ' ' +
                    "</td>" +

                    "<td>" + item.qty + ' ' +
                    "</td>" +

                     "<td>" + item.rate + ' ' + "</td>"  +
                     

                      "<td>" + item.totalamount + ' ' + "</td>"  +

                      
                        "<td style='font-size:x-small;'>" + moment(item.createdon).format('DD-MMM-YYYY hh:mm A') + ' (' + item.createdby + ') <br /> ' +  moment(item.updatedon).format('DD-MMM-YYYY hh:mm A') + ' (' + item.updatedby + ') ' + ' ' + "</td>"  +



//                      "<td>" + " <input type='button' id='btnEditDetails'  onclick='EditRecordbyIDDetails(" + item.id + ")' value='Edit' class='btn btn-primary'>" + ' ' + "</td>" +

                        "<td>" +  '<input type="button" id="btnDelete" onclick="EditRecordbyIDDetails(\'' + item.id + ',' + item.rate  + '\'\)" value="Edit" class="btn btn-primary" />'  + "</td>" +


                     
                       "<td>" +
                       '<input type="button" id="btnDelete" onclick="DeleteRecordDetails(\'' + item.id + ',' + item.qty +  ',' + item.partno +   ','  + item.rate + '\'\)"  value="Delete" class="btn btn-danger" /> '
                        
                        
                         +  "</td>"


                         

                         

                      //// return '<a href="#" onclick="OpenChallanDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">  <i class="glyphicon glyphicon-plus text-primary" style="font-size:x-large;"></i> </a>';
                          

                       ////////onclick="OpenChallanDetails(\'' + row.id + ',' + row.customername + ',' + row.vehicleno + ',' + row.statusid + '\'\)">
                       
//                    " <input type='button' id='btnEditDetails'  onclick='EditRecordbyIDDetails(" + item.id + ")' value='Edit' class='btn btn-primary'>  </td>" +

//                    "<td>" + 
//                     " <input type='button' id='btnDelete'  onclick='DeleteRecordDetails(" + item.id + ")' value='Delete' class='btn btn-danger'>  </td>"+
                    + "</tr>";
            });
           
            $('#tblRecordDetails tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblRecordDetails]').DataTable({
                "order": [[0, "asc"]],
                 bSortable: false,
                "columnDefs": [
                                { "visible": false, "targets": [] }
                              ],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "paging": true,
                "info": true,
                'processing': true,
//                 dom: 'Bfrtip',
//        buttons: [
//            'copy', 'csv', 'excel', 'pdf', 'print'
//        ]
//        ,
                fnInitComplete: function () {
                    $("#Showoverlay2").hide();
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


   function AddRecordDetails() {
    

   

    if ($('#txtPartNo').val().trim() == "") {
        $('#txtPartNo').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtPartNo').css('border-color', 'lightgrey');
    }

    if ($('#txtParticulars').val().trim() == "") {
        $('#txtParticulars').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtParticulars').css('border-color', 'lightgrey');
    }

    if ($('#txtQuantity').val().trim() == "") {
        $('#txtQuantity').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtQuantity').css('border-color', 'lightgrey');
    }

    if ($('#txtRate').val().trim() == "") {
        $('#txtRate').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtRate').css('border-color', 'lightgrey');
    }

    
    //var id = table.rows()[0].length + 1;
    $("#addDetailsSlipNo").val("0");

     var partno = $('[id*=txtPartNo]').val();
    var particulars = $('[id*=txtParticulars]').val();
    var qty = $('[id*=txtQuantity]').val();
    var rate = $('[id*=txtRate]').val();
   
    var uomid = $("#ddlUom :selected").val();
    var uom = $("#ddlUom :selected").text();

    var tamt = parseFloat(qty)*parseFloat(rate);

    $("#txtTotalAmount").val(tamt);

    
      var isparto = "";
    if ($('#rdPartno').prop('checked')) {
        ispart = "1";
    } else {
        ispart = "0";
    }

     var islabour = "";
    if ($('#rdLabour').prop('checked')) {
        islabour = "1";
    } else {
        islabour = "0";
    }

    var model = {};
    var servicetypemasterid= $('#txtDSlipNo').html();
    
    model.servicetypemasterid = servicetypemasterid;
    model.partno=partno;
    model.particulars = particulars;
    model.uomid = uomid;
    model.uom = uom;
    model.qty = qty;
    model.rate = rate;
     model.ispart=ispart;
    model.islabour=islabour;

    $.ajax({
        type: "POST",
        url: "masterservicetype.aspx/SaveRecordDetails",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                ////$('[id*=txtName]').focus();
                ////$('#myModal').modal('show');
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
             if (r.d == 20) {
                $.notify("Error!! Part no already added!", "error");
                return;
            }
             if (r.d == 90) {
                $.notify("Error!! Entered qty not available!!", "error");
                $('[id*=txtQuantity]').focus();
                return;
            }
            else {
                if ( r.d == 30 ) {                    
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
                        ////$('[id*=txtName]').focus();
                       // $('#myModal').modal('show');
                        return;
                    }
                }
                else {
                    
                  /////  $('#myModal').modal('hide');

                    $.notify("Record saved!", "success");
                     $('#txtPartNo').val("");
                  $('#txtParticulars').val("");
                 $('#txtQuantity').val("");
                 $('#txtRate').val("");


                    BindDataTableDetails($('#txtDSlipNo').html());
                    /////////BindDataTable();

                     var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);

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


function EditRecordbyIDDetails(rdata) {

const myArray = rdata.split(",");
    
    let id = myArray[0];
    let rate = myArray[1];

    ////alert(id);
     var servicetypemasterid= $('#txtDSlipNo').html();
    $.ajax({
        type: "POST",
        url: "masterservicetype.aspx/GetRecordbyIDDetails",
        data: '{ id :' + id + ', servicetypemasterid: ' + servicetypemasterid + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {

             var json = JSON.parse(result.d);
             //////alert(json);
                
                $('#recordID').val(json[0].id);                
                $('#btnAddNewDetails').hide();
                 $('#btnUpdateDetails').show();

                  $('#txtPartNo').val(json[0].partno);
                  $('#txtParticulars').val(json[0].particulars);
                $('#txtQuantity').val(json[0].qty);
                $('#txtRate').val(json[0].rate);               
                $("#ddlUom").val(json[0].uomid);
                 $('#hdnOldQty').val(json[0].qty) ;

                ///// GetSelectedIssuedto(json[0].issuedtoid);


                  var ispart=json[0].ispart;
                var islabour=json[0].islabour;


                 if(ispart=="1")
                {
                    document.getElementById("rdPartno").checked = true;
                }
                if(islabour=="1")
                {
                    document.getElementById("rdLabour").checked = true;
                }

            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });
}

////function for updating record
function UpdateRecordDetails() {

 

 if ($('#txtPartNo').val().trim() == "") {
        $('#txtPartNo').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtPartNo').css('border-color', 'lightgrey');
    }

    if ($('#txtParticulars').val().trim() == "") {
        $('#txtParticulars').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtParticulars').css('border-color', 'lightgrey');
    }

    if ($('#txtQuantity').val().trim() == "") {
        $('#txtQuantity').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtQuantity').css('border-color', 'lightgrey');
    }

    if ($('#txtRate').val().trim() == "") {
        $('#txtRate').css('border-color', 'Red');
        return false;
    }
    else {
        $('#txtRate').css('border-color', 'lightgrey');
    }

     var isparto = "";
    if ($('#rdPartno').prop('checked')) {
        ispart = "1";
    } else {
        ispart = "0";
    }

     var islabour = "";
    if ($('#rdLabour').prop('checked')) {
        islabour = "1";
    } else {
        islabour = "0";
    }



    var id = $('[id*=recordID]').val();
    ////alert(id);
    var partno = $('[id*=txtPartNo]').val();
  var particulars = $('[id*=txtParticulars]').val();
    var qty = $('[id*=txtQuantity]').val();
    var rate = $('[id*=txtRate]').val();
   
    var uomid = $("#ddlUom :selected").val();
    var uom = $("#ddlUom :selected").text();

    if (id > 0) {
   
        var model = {};
    model.id=id;
   var servicetypemasterid= $('#txtDSlipNo').html();
    
    model.servicetypemasterid = servicetypemasterid;
    model.partno=partno;
    model.particulars = particulars;
    model.uomid = uomid;
    model.uom = uom;
    model.qty = qty;
    model.rate = rate;
    model.oldqty=$('#hdnOldQty').val();
   

      model.ispart=ispart;
    model.islabour=islabour;

    /////alert(paymentmode + modelname + status);

    

        $.ajax({
            type: "POST",
            url: "masterservicetype.aspx/UpdateRecordDetails",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Record not updated!", "error");
                    $('[id*=txtCustomerName]').focus();
                    return;
                }
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50 || r.d == 90) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! name already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
                        return;
                    }
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtMobileNo]').focus();
                        return;
                    }
                    if (r.d == 90) {
                        $.notify("Error!! Entered qty not available!!", "error");
                        $('[id*=txtQuantity]').focus();
                        return;
                      }

                }
                else {
                    $('#recordID').val('0');
                    /////$('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAddNew').show();

                    $('#txtPartNo').val("");
                 $('#txtParticulars').val("");
                 $('#txtQuantity').val("");
                 $('#txtRate').val("");
                  $('#btnAddNewDetails').show();
                 $('#btnUpdateDetails').hide();
                    BindDataTableDetails(servicetypemasterid);
                    $.notify("Record updated!", "success");
                    $('#hdnOldQty').val("0");
                     ////////BindDataTable();

                      var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! already exists!", "error");
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

 


function DeleteRecordDetails(rdata) {


const myArray = rdata.split(",");
    
    let id = myArray[0];
    let qty = myArray[1];
     let partno = myArray[2];
     let rate=myArray[3];

    

    
   
    if (confirm('Are you sure delete this record?')) {
//////        var data = table.row($(this).parents('tr')).data();
//////        table.row($(this).parents('tr')).remove().draw();

 var servicetypemasterid =  $('#txtDSlipNo').val();

        var model = {};
         model.id = id;
        model.qty = qty;  
        model.partno=partno;

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "masterservicetype.aspx/DeleteRecordDetails",
            //////data: '{ id :' + id + '}',
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
                 if (r.d == 99) {
                    $.notify("Error!! unable to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    BindDataTableDetails($('#txtDSlipNo').html());
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


function PrintPDF(printid)
{
   
    btnprintDetails_click(printid);
}

//function btnprintDetails_click()
//{
//   
//    var servicetypeid = $('#txtDSlipNo').html(); 

//    alert(servicetypeid);

//     
//}


