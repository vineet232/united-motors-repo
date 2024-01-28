
$(document).ready(function () {

////////$("#ddlUOM").select2();
////////$("#ddlFC").select2();

//////// $.ajax({
////////        type: "POST", url: "inventoryuploadandsavecsvfiletodb.aspx/GetFinanceCompanyName",
////////        dataType: "json",
////////        contentType: "application/json",
////////        success: function (res) {
////////            $.each(res.d, function (data, value) {

////////                $("#ddlFC").append($("<option></option>").val(value.id).html(value.fcname));
////////            })
////////        }
////////        ,
////////        error: function (response) {
////////            ///alert(response.responseText);
////////            $.notify("BOOM!", "error");
////////        }

////////    });

////////    $.ajax({
////////        type: "POST", url: "inventoryuploadandsavecsvfiletodb.aspx/GetModelName",
////////        dataType: "json",
////////        contentType: "application/json", 
////////        success: function (res) {
////////            $.each(res.d, function (data, value) {

////////                $("#ddlUOM").append($("<option></option>").val(value.id).html(value.MakenModel));
////////            })
////////        }
////////        ,
////////        error: function (response) {
////////            ///alert(response.responseText);
////////            $.notify("BOOM!", "error");
////////        }

////////    });



////////    $('#txtProduct').datepicker({
////////        format: "mm/dd/yyyy",
////////        autoclose: true,
////////    });

////////    $('#txtOutDate').datepicker({
////////        format: "mm/dd/yyyy",
////////        autoclose: true,
////////        //////endDate: "today"
////////    });
    

})  

 
 

$(function () {
    //$("#Showoverlay").show();
    //GetData();
    BindDataTable();
});




function BindDataTable() {


 $("#tblRecords").dataTable().fnDestroy();

 $("#tblRecords").dataTable().fnDestroy();


            $('#tblRecords').DataTable({
           /////// "order": [[ 0, 'desc' ]],
           


            "columnDefs": [
    { "visible": false, "targets": [] }
    ],

                bServerSide: true,
                sAjaxSource: 'inventoryUploadPriceListDataHandler.ashx/GetAllList',
                sServerMethod: 'post',
                "processing": true,

                "columns": [
                
                    {  "data": "id" ,
////                     {
////                     bSortable: false,
////                      render: function (data, type, row, meta) {
////                     return meta.row + meta.settings._iDisplayStart + 1;
////                    }

 render: function (data, type, row, meta) {
            return meta.row + meta.settings._iDisplayStart + 1;
       }
                    },
                    { "data": "umrp"
//////                    ,
//////                        render: function ( data, type, row )
//////                        {
//////                         return row.ocustname + '<hr style="border-top: 2px solid #000; margin-top:3px;margin-botton:-2px;" />(' + row.ocontactno + ')';
//////                        }
                     },
            ////        { "data": "product" },
                    { "data": "partno" },
                    { "data": "partdesc" },
                 //////  { "data": "purchaseprice"    },
                     { "data": "taxslab"

//                        ,
//                        render: function ( data, type, row )
//                        {
//                            if(row.outdt=="01-Jan-1900")
//                            row.outdt="";

//                         return row.outdt  + '';
//                        }

                     
                      },
                       { "data": "uom" },



                        { "data": "hsncode"
////////                        ,
////////                        render: function ( data, type, row )
////////                        {
////////////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
////////////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

////////                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
////////                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')


////////                         return "<div class='text-nowrap'>" + row.createdby + '(' + cdate + ')  <br/>' + row.updatedby + '(' + udate + ')' + "</div>";
////////                        }
                        },

                         { "data": "discountcode" },

             /////   { "data": "discount" },
                   {
                       "data": "id",
                       "render": function (id, type, full, meta) {
                           debugger
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





function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    

    //var id = table.rows()[0].length + 1;

   
   ////debugger;

    var umrp = $('[id*=txtUMRP]').val();
    ////var product = $('[id*=txtProduct]').val();
    var partno = $('[id*=txtPartNo]').val();
    var partdesc = $('[id*=txtPartDesc]').val();
    /////var purchaseprice = $('[id*=txtPurchasePrice]').val();
    var taxslab = $('[id*=txtTaxSlab]').val();

    var uom = $("#ddlUOM :selected").text();
    var hsncode = $('[id*=txtHSNCode]').val();
   ////// var discount = $('[id*=txtDiscount]').val();


   // name = sentenceCase(name);
    var model = {};
    model.umrp = umrp;
    /////model.product = product;
    model.partno = partno;
    model.partdesc = partdesc;
    model.purchaseprice = 0;
    model.taxslab = taxslab;
    model.uom = uom;
    model.hsncode = hsncode;
    model.discount = 0;

           
    $.ajax({
        type: "POST",
        url: "inventoryuploadandsavecsvfiletodb.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
        if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtUMRP]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30 ) {
                    if (r.d == 20) {
                        $.notify("Error!! partno no already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        $('[id*=txtUMRP]').focus();
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
                $.notify("Error!! Vehicle No already exists!", "error");
            }
            else {
                //alert("Error while saving data!!");
                $.notify("Error while saving data!", "error");
            }
        }
    });
}


function EditRecordbyID(id) {
    /////alert(id);
    
    $('#recordID').val("0");
   
    $.ajax({
        type: "POST",
        url: "inventoryuploadandsavecsvfiletodb.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                ////var custname = json[0].custname;
               //// alert(result.d);
                $('#recordID').val(json[0].id);


                $('#txtUMRP').val(json[0].umrp);
               //// $('#txtProduct').val(json[0].product);

                $('#txtPartNo').val(json[0].partno);
                $('#txtPartDesc').val(json[0].partdesc);
              //////  $('#txtPurchasePrice').val(json[0].purchaseprice);
                $('#txtTaxSlab').val(json[0].taxslab);
               ///// $('#ddlUOM').text(json[0].uom);

                $("#ddlUOM option:selected").text(json[0].uom);

                $('#txtHSNCode').val(json[0].hsncode);
               ////// $('#txtDiscount').val(json[0].discount);

               

                $('#myModal').modal('show');
                $('#myModal').on('shown.bs.modal', function () {
                    $('#txtUMRP').focus();
                });
                $('#btnUpdate').show();
                $('#btnAdd').hide();
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetching data!", "error");
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

      var umrp = $('[id*=txtUMRP]').val();
     ////// var product = $('[id*=txtProduct]').val();
      var partno = $('[id*=txtPartNo]').val();
      var partdesc = $('[id*=txtPartDesc]').val();
      //////var purchaseprice = $('[id*=txtPurchasePrice]').val();
      var taxslab = $('[id*=txtTaxSlab]').val();

      var uom = $("#ddlUOM :selected").text();
      var hsncode = $('[id*=txtHSNCode]').val();
      ///////var discount = $('[id*=txtDiscount]').val();


    

    if (id > 0) {
        var model = {};
        model.id = id;
        model.umrp = umrp;
       /////// model.product = product;
        model.partno = partno;
        model.partdesc = partdesc;
        model.purchaseprice = 0;
        model.taxslab = taxslab;
        model.uom = uom;
        model.hsncode = hsncode;
        model.discount = 0;

        

        $.ajax({
            type: "POST",
            url: "inventoryuploadandsavecsvfiletodb.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not updated!", "error");
                $('[id*=txtUMRP]').focus();
                return;
            }
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! veh./chasis no already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        return;
                    }
                   if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtUMRP]').focus();
                        return;
                    }
                     if (r.d == 60) {
                        $.notify("Error!! out date cannot be less than entry date!!", "error");
                        $('[id*=txtName]').focus();
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAdd').hide();
                    BindDataTable();
                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! Vehicle No already exists!", "error");
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
            url: "inventoryuploadandsavecsvfiletodb.aspx/DeleteRecord",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not deleted!", "error");
                $('[id*=txtUMRP]').focus();
                return;
            }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
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
 
 
 $('#recordID').val('0');

    $('#txtUMRP').val("");
   
    $('#ddlUOM').prop("selectedIndex", 0);
     
     
       //// $('#txtProduct').val("");
        $('#txtPartNo').val("");
        $('#txtPartDesc').val("");
       /////// $('#txtPurchasePrice').val("");
        $('#txtTaxSlab').val("");
        $('#txtHSNCode').val("");
      /////  $('#txtDiscount').val("");
      $('#ddlUOM').css('border-color', 'lightgrey');


    $('#btnUpdate').hide();
    $('#btnAdd').show();

    //////$('#txtProduct').css('border-color', 'lightgrey');
    $('#txtPartNo').css('border-color', 'lightgrey');
    $('#txtPartDesc').css('border-color', 'lightgrey');
  /////  $('#txtPurchasePrice').css('border-color', 'lightgrey');
    $('#txtTaxSlab').css('border-color', 'lightgrey');
    $('#txtHSNCode').css('border-color', 'lightgrey');
  ///////  $('#txtDiscount').css('border-color', 'lightgrey');
    

    $('#myModal').modal('show');
    $('#myModal').on('shown.bs.modal', function () {
        $('#txtUMRP').focus();
    });

}
//Valdidation using jquery  
function validate() {
    var isValid = true;
    
    if ($('#txtUMRP').val().trim() == "") {
        $('#txtUMRP').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtUMRP').css('border-color', 'green');
    }


//////    if ($('#txtProduct').val().trim() == "") {
//////        $('#txtProduct').css('border-color', 'Red');
//////        isValid = false;
//////    }
//////    else {
//////        $('#txtProduct').css('border-color', 'green');
//////    }


    if ($('#txtPartNo').val().trim() == "") {
        $('#txtPartNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtPartNo').css('border-color', 'green');
    }

    if ($('#txtPartDesc').val().trim() == "") {
        $('#txtPartDesc').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtPartDesc').css('border-color', 'green');
    }

////    if ($('#txtPurchasePrice').val().trim() == "") {
////        $('#txtPurchasePrice').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtPurchasePrice').css('border-color', 'green');
////    }

    if ($('#txtTaxSlab').val().trim() == "") {
        $('#txtTaxSlab').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtTaxSlab').css('border-color', 'green');
    }
    if ($('#ddlUOM :selected').val().trim() == "0") {
        $('#ddlUOM').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlUOM').css('border-color', 'green');
    }

    if ($('#txtHSNCode').val().trim() == "") {
        $('#txtHSNCode').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtHSNCode').css('border-color', 'green');
    }

////    if ($('#txtDiscount').val().trim() == "") {
////        $('#txtDiscount').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtDiscount').css('border-color', 'green');
////    }

    

//    if ($('#txtProduct').val().trim() == "") {
//        $('#txtProduct').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#txtProduct').css('border-color', 'green');
//    }

   

    

    return isValid;
}




