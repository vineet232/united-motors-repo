
$(document).ready(function () {
 $('#txtDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
})  



$(function () {
   ///// $("#Showoverlay").show();
   /// GetData();

  //// BindDataTable();
 // BindDataTableNew();
});


//function GetData() {
//    $("#Showoverlay").show();
//    $.ajax({
//        type: "POST",
//        url: "inventoryStockDetails.aspx/GetAllData",
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
//                var id = item.id;
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

//                var opbalDt="";
//                if(item.openingbaldate !=null)
//                {
//               opbalDt =  new Date(item.openingbaldate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
//              }

//                rows += "<tr>" +
//                "<td>" + item.id + "</td>" +
//                "<td>" + srno + "</td>" +
//                "<td>" + item.vendorname + ' ' +
//                    "</td>" +
//                     "<td>" + item.accountype + ' ' +
//                    "</td>" +
//                     "<td>" + item.openingbal + ' ' +
//                      "<td>" + opbalDt + ' ' +
//                    "</td>" +
//                     "<td>" + item.vendoraddress + ' ' +
//                    "</td>" +
//                     "<td>" + item.vendorcontactno + ' ' +
//                      "<td>" + item.currentduedays + ' ' +

//                    "</td>" +
//                     "<td>" + status + ' ' +
//                    "</td>" +
//                    "<td nowrap> " +
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


////function BindDataTable() {


//// $("#tblRecords").dataTable().fnDestroy();
//////var i = 1;
//// 
////            $('#tblRecords').DataTable({
////            "order": [[ 2, 'asc' ]],
////            "columnDefs": [
////    ////{ "visible": false, "targets": [0] }
////    ],

////                bServerSide: true,
////                sAjaxSource: 'MasterVendorsHandler.ashx/GetVendorsList',
////                sServerMethod: 'post',
////                "processing": true,
////                

////                "columns": [
////                   {  "data": "id" ,
////                    
////                   render: function (data, type, row, meta) {
////            return meta.row + meta.settings._iDisplayStart + 1;
////       }
////          },
////                    { "data": "vendorname" },
////                    { "data": "accountype" },
////                   ///// { "data": "openingbal" },
////                    { "data": "openingbaldate" },
////                     { "data": "currentbalance" },
////                   
////                   
////                    { "data": "vendoraddress" },
////                    { "data": "vendorcontactno" },
////                    { "data": "currentduedays" },
////                     { "data": "oisactive",
////                      render: function ( data, type, row )
////                        {
////                        
////                             var status=row.oisactive;
////                               if (status == "1") 
////                               {                               
////                                    return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
////                                }
////                                else
////                                {
////                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
////                                }
////                       }
////                     },
////                   
////                   {
////                       "data": "id",
////                       "render": function (id, type, full, meta) {
////                           //debugger
////                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
////                       }
////                   },
////                    {
////                        "data": "id",
////                        "render": function (id, type, full, meta) {
////                            //debugger
////                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
////                        }
////                    }
////                  
////                    
////                ],

////                 stateSave: true,
////                "bDestroy": true,
////                responsive: true,
////            });


////  }


function BindDataTableNew()
{
$("#tblRecords").dataTable().fnDestroy();
 $("#Showoverlay").show();
    $.ajax({
            type: "POST",
            url: "inventoryStockDetails.aspx/GetAllData",
            data: '',
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

   
   ////alert(response.d.length);

   /////////////for export import ///////////////
 var show = false;
 var printPermission= $("#hdnPrintPermission").val();
 ////alert(printPermission);

 if(printPermission == "1")
 {
 
    show = true;
 }

 var buttons = [''];
  /////var buttons = ['colvis'];
  ////var buttons = ['export'];
  
  if (show) {
    /////buttons.push('copyHtml5', 'excelHtml5', 'pdfHtml5' );
    ////buttons.push('excel',  'pdfHtml5' );

    buttons.push( [ //begin array
    
    
    {
			extend: 'excelHtml5',
				text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
				titleAttr: 'Excel',
				title: 'Save as Excel',
                // "action": newexportaction,
				
		}, 

        {
			extend: 'pdf',
				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
				titleAttr: 'Pdf',
				title: 'Save as PDF',
                // "action": newexportactiontoPDF,
				
		} 

         ]) // end array

  }

 /////////////end for export import ///////////////


    $("[id*=tblRecords]").DataTable(
        {
            bLengthChange: true,
            lengthMenu: [[10, 50, -1], [10, 50, "All"]],
            "order": [[ 1, 'asc' ]],
            bFilter: true,
            bSort: true,
            bPaginate: true,
           // dom: 'Bfrtip',
            responsive: true,
           // buttons: buttons,
            data: response.d,
//            columns: [{ 'data': 'id' },
//                      { 'data': 'custname' },
//                      { 'data': 'accounttype' },
//                      { 'data': 'vehno'},
//                      { 'data': 'contactno'},
//                      { 'data': 'openingbal'},
//                      { 'data': 'openingbaldate'},
//                      { 'data': 'currentbalance'},
//                      { 'data': 'currentduedays'},
//                      { 'data': 'remarks'},
//                      { 'data': 'id'},
//                      { 'data': 'id'}

//                      ]



                      "columns": [
                    {  "data": "id" 
                    ,
                     
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    }
//                    ,
//                    { "data": "partno" },
//                    { "data": "partdesc" },

////                    { "data": "openingbaldate" },
//                    { "data": "stockqty" },

//                        
//                    /// { "data": "vehno" },
//                     
//                      { "data": "challanno" },
//                    { "data": "createdon" },
//                    { "data": "createdby" },
//                   
//                    { "data": "invoiceslipno"
////                    ,                    
////                         render: function ( data, type, row )
////                         {
////                        
////                             var status=row.oisactive;
////                               if (status == "1") 
////                               {                               
////                                    return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
////                                }
////                                else
////                                {
////                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
////                                }
////                       }
//                     },

//                   {
//                       "data": "id",
//                       "render": function (id, type, full, meta) {
//                           //debugger
//                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
//                       }
//                   },
//                    {
//                        "data": "id",
//                        "render": function (id, type, full, meta) {
//                            //debugger
//                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
//                        }
//                    }
//                  
                    
                ],
                 stateSave: true,
                "bDestroy": true


        });

         $("#Showoverlay").hide();
     ///////////////////////////////////////////////////////////////https://www.aspsnippets.com/Articles/Simple-jQuery-DataTables-Tutorial-with-example-in-ASPNet.aspx////////////////////////

////        $("[id*=gvCustomers]").DataTable(
////        {
////            bLengthChange: true,
////            lengthMenu: [[5, 10, -1], [5, 10, "All"]],
////            bFilter: true,
////            bSort: true,
////            bPaginate: true,
////            data: response.d,
////            columns: [{ 'data': 'CustomerID' },
////                      { 'data': 'ContactName' },
////                      { 'data': 'City' },
////                      { 'data': 'Country'}]
////        });
   
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

   /// var id = table.rows()[0].length + 1;
    var vendorname = $('[id*=txtName]').val();
    var accountypeid = $("#ddlAccountType :selected").val();
    var accountype = $("#ddlAccountType :selected").text();
    var openingbal = $('[id*=txtOpeningBalance]').val();
    var openingbaldate = $('[id*=txtDate]').val();
    var vendoraddress = $('[id*=txtAddress]').val();
    var vendorcontactno = $('[id*=txtContactNo]').val();
    var isactive = "";
    if ($('#chkStatus').prop('checked')) {
        isactive = "1";
    } else {
        isactive = "0";
    }
   // name = sentenceCase(name);
    var model = {};
    model.vendorname = vendorname;
    model.accountypeid = accountypeid;
    model.accountype = accountype;
    model.openingbal = openingbal;
    model.openingbaldate = openingbaldate;
    model.vendoraddress = vendoraddress;
    model.vendorcontactno = vendorcontactno;
    model.oisactive = isactive;

   

    $.ajax({
        type: "POST",
        url: "inventoryStockDetails.aspx/SaveRecord",
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

                if (r.d == 20 || r.d == 30 || r.d == 50) {
                    if (r.d == 20) {
                        $.notify("Error!! vendor name already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
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
                     /////BindDataTable();

                     BindDataTableNew();
                    $.notify("Record saved!", "success");
                }
            }
        }
            ,
        error: function (errormessage) {
            ///////alert(errormessage.responseText);
            if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                //alert("Error!! model name already exists!!");
                $.notify("Error!! vendor name already exists!", "error");
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
        url: "inventoryStockDetails.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                //var modelname = json[0].modelname;
                //alert(modelname);
                $('#recordID').val(json[0].id);
                $('#txtName').val(json[0].vendorname);
                $("#ddlAccountType").val(json[0].accountypeid);
                //$("#ddlAccountType :selected").text();
                $('[id*=txtOpeningBalance]').val(json[0].openingbal);
                ////alert(json[0].openingbaldate);
                var opbaldate="01/01/1900";
                if(json[0].openingbaldate != null)
                {
                ////alert("123");
                 opbaldate = new Date(json[0].openingbaldate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                }
               
                $('[id*=txtDate]').val(opbaldate);
                $('[id*=txtAddress]').val(json[0].vendoraddress);
                $('[id*=txtContactNo]').val(json[0].vendorcontactno);
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

    var vendorname = $('[id*=txtName]').val();
    var accountypeid = $("#ddlAccountType :selected").val();
    var accountype = $("#ddlAccountType :selected").text();
    var openingbal = $('[id*=txtOpeningBalance]').val();
    var openingbaldate = $('[id*=txtDate]').val();
    var vendoraddress = $('[id*=txtAddress]').val();
    var vendorcontactno = $('[id*=txtContactNo]').val();
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
        model.vendorname = vendorname;
        model.accountypeid = accountypeid;
        model.accountype = accountype;
        model.openingbal = openingbal;
        model.openingbaldate = openingbaldate;
        model.vendoraddress = vendoraddress;
        model.vendorcontactno = vendorcontactno;
        model.oisactive = isactive;

        $.ajax({
            type: "POST",
            url: "inventoryStockDetails.aspx/UpdateRecord",
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
                        $.notify("Error!! vendor name already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
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
                     /////BindDataTable();

                     BindDataTableNew();

                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! vendor name already exists!", "error");
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
        //var data = table.row($(this).parents('tr')).data();
        //table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "inventoryStockDetails.aspx/DeleteRecord",
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
                    ///// BindDataTable();

                    BindDataTableNew();

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

     if ($('#txtDate').val().trim() == "") {
        $('#txtDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDate').css('border-color', 'lightgrey');
    }

    return isValid;
}



