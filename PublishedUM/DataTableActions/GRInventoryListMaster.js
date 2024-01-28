
$(document).ready(function () {





    $('#txtLastIssueDt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

    $('#txtLastReceivedDt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
        //////endDate: "today"
    });
    

})  

 

 function GetPartDetailsbyPartNo()
 {
    var partNo= $('#txtPartNo').val();
   //// alert(partNo);

    var model = {};
        model.partno = partNo;


    $("#Showoverlay").show();
     $.ajax({
         type: "POST",
         url: "inventorylistgr.aspx/GetPartDescByPartNo",
         ///////data: '{ partno :' + partNo + '}',
          data: '{ model :' + JSON.stringify(model) + '}',
         dataType: "json",
         contentType: "application/json",
         success: function (res) {
       ////alert( JSON.stringify(res.d));
        
          /////$("#txtPartDesc").val(JSON.parse(res.d));

          var json = JSON.parse(res.d);
          ////alert(json[0].partdesc);
          $("#txtPartDesc").val(json[0].partdesc);

         }
        ,
         error: function (response) {
             ///alert(response.responseText);
             $.notify("BOOM!", "error");
         }

     });
     $("#Showoverlay").hide();
 }

 

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
                sAjaxSource: 'inventorylistgrHandler.ashx/GetAllList',
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

                    { "data": "PartNo" },
                      { "data": "description1"   },
//                    { "data": "hsncode"  },

//                    {"data": "cvbusaleprice" },
                    { "data": "location1" },
                    

                        { "data": "lastreceived"
                        ,
                        render: function ( data, type, row )
                        {
////////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
////////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                         var lastreceived = moment(row.lastreceived).format('DD-MMM-YYYY hh:mm A')

                         return "<div class='text-nowrap1'>" + lastreceived + "</div>";
                        }
                        },
                          { "data": "lastissued"
                          
                              ,
                            render: function ( data, type, row )
                            {
                             var lastissued = moment(row.lastissued).format('DD-MMM-YYYY hh:mm A')

                             return "<div class='text-nowrap1'>" + lastissued + "</div>";
                             }
                       },

                        { "data": "umrp"
                        
                        ,
                    render: function ( data, type, row )
                        {
                     return  " <span ><i class='fa fa-rupee '></i></span> &nbsp;" + row.umrp;
                     }

                         },
//                        { "data": "openingbal" },
                        

                         { "data": "openingbal" },
                { "data": "qty" },
                
                 { "data": "days" },


                 { "data": "createdby",
                        render: function ( data, type, row )
                        {
////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')


                         return "<div class='text-nowrap'>" + row.createdby + '(' + cdate + ')  <br/>' + row.updatedby + '(' + udate + ')' + "</div>";
                        }
                     }
                     
                     ,
                     
                   {
                       "data": "id",
                       "render": function (id, type, full, meta) {
                           //debugger
                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
                       }
                   }
                   ,
                    {
                        "data": "id",
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ],
                stateSave: true,
                "bDestroy": true,
                 dom: 'Bfrtip',
        buttons: [
             'excel'
        ]
        ,
            });


            }





function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    

    //var id = table.rows()[0].length + 1;

   
   ////debugger;

////    var hsncode = $('[id*=txtHsnCode]').val();
////    var cvbusaleprice = $('[id*=txtCVBUSalePrice]').val();
    var PartNo = $('[id*=txtPartNo]').val();
    var description1 = $('[id*=txtPartDesc]').val();
////    var lastissued = $('[id*=txtLastIssueDt]').val();
////    var lastreceived = $('[id*=txtLastReceivedDt]').val();

    var qty = $('[id*=txtQty]').val();
    var location1 = $('[id*=txtLocation]').val();

   
   // name = sentenceCase(name);
    var model = {};
////    model.hsncode = hsncode;
////    model.cvbusaleprice = cvbusaleprice;
    model.PartNo = PartNo;
    model.description1 = description1;
////    model.lastissued = lastissued;
////    model.lastreceived = lastreceived;
    model.qty = qty;
    model.location1 = location1;

           
    $.ajax({
        type: "POST",
        url: "inventorylistgr.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
        if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtPartNo]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30 || r.d == 60 ) {
                    if (r.d == 20) {
                        $.notify("Error!! partno no already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        $('[id*=txtPartNo]').focus();
                        return;
                    }
                     if (r.d == 60) {
                        $.notify("Error!! Quantity must be greater than 0!", "error");
                        $('[id*=txtPartNo]').focus();
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
                $.notify("Error!! Part No already exists!", "error");
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
        url: "inventorylistgr.aspx/GetRecordbyID",
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


////                $('#txtHsnCode').val(json[0].hsncode);
////                $('#txtCVBUSalePrice').val(json[0].cvbusaleprice);

//                $('#txtPartNo').val(json[0].PartNo);
//                $('#txtPartDesc').val(json[0].description1);
//////                $('#txtLastIssueDt').val(json[0].lastissued);
//////                $('#txtLastReceivedDt').val(json[0].lastreceived);

//                $('#txtQty').val(json[0].qty);
//                 $('#txtLocation').val(json[0].location1);

               
               $('#txtQty').val(json[0].qty);
              //////  $('#hdnoldOpBal').val(json[0].openingbal);
               $('#txtLocation').val(json[0].location1);

                $('#myModal').modal('show');
                $('#myModal').on('shown.bs.modal', function () {
                    $('#txtHsnCode').focus();
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
//    var res = validate();
//    if (res == false) {
//        return false;
//    }
      var id = $('[id*=recordID]').val();

////      var hsncode = $('[id*=txtHsnCode]').val();
////      var cvbusaleprice = $('[id*=txtCVBUSalePrice]').val();
//      var PartNo = $('[id*=txtPartNo]').val();
//      var description1 = $('[id*=txtPartDesc]').val();
//////      var lastissued = $('[id*=txtLastIssueDt]').val();
//////      var lastreceived = $('[id*=txtLastReceivedDt]').val();
//      var qty = $('[id*=txtQty]').val();
     var location1 = $('[id*=txtLocation]').val();

var qty = $('[id*=txtQty]').val();
    /////var oldopeningbal= $('#hdnoldOpBal').val();

    if (id > 0) {
        var model = {};
        model.id = id;
        model.qty=qty;
        ////model.oldopeningbal=oldopeningbal;
//////        model.hsncode = hsncode;
//////        model.cvbusaleprice = cvbusaleprice;
//        model.PartNo = PartNo;
//        model.description1 = description1;
//////        model.lastissued = lastissued;
//////        model.lastreceived = lastreceived;
//        model.qty = qty;
       //// model.location1 = location1;

        

        $.ajax({
            type: "POST",
            url: "inventorylistgr.aspx/UpdateRecord",
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
                if (r.d == 10 || r.d == 20 || r.d == 30  || r.d == 60) {
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
                      if (r.d == 60) {
                        $.notify("Error!! Quantity must be greater than 0!", "error");
                        $('[id*=txtPartNo]').focus();
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                     $('#hdnoldOpBal').val('0');
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
            url: "inventorylistgr.aspx/DeleteRecord",
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

//// $('#txtHsnCode').val("");
//// $('#txtCVBUSalePrice').val("");
 $('#txtPartNo').val("");
 $('#txtPartDesc').val("");
//// $('#txtLastIssueDt').val("");
//// $('#txtLastReceivedDt').val("");
 $('#txtQty').val("");
 $('#txtLocation').val("");


    $('#btnUpdate').hide();
    $('#btnAdd').show();    

    $('#myModal').modal('show');
    $('#myModal').on('shown.bs.modal', function () {
        $('#txtHsnCode').focus();
    });

}
//Valdidation using jquery  
function validate() {
    var isValid = true;

////    if ($('#txtHsnCode').val().trim() == "") {
////        $('#txtHsnCode').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtHsnCode').css('border-color', 'green');
////    }


////    if ($('#txtCVBUSalePrice').val().trim() == "") {
////        $('#txtCVBUSalePrice').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtCVBUSalePrice').css('border-color', 'green');
////    }


    if ($('#txtPartNo').val().trim() == "") {
        $('#txtPartNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtPartNo').css('border-color', 'green');
    }

////    if ($('#txtPartDesc').val().trim() == "") {
////        $('#txtPartDesc').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtPartDesc').css('border-color', 'green');
////    }

////    if ($('#txtPurchasePrice').val().trim() == "") {
////        $('#txtPurchasePrice').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtPurchasePrice').css('border-color', 'green');
////    }

////    if ($('#txtTaxSlab').val().trim() == "") {
////        $('#txtTaxSlab').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtTaxSlab').css('border-color', 'green');
////    }
////    if ($('#ddlUOM :selected').val().trim() == "0") {
////        $('#ddlUOM').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#ddlUOM').css('border-color', 'green');
////    }

////    if ($('#txtHSNCode').val().trim() == "") {
////        $('#txtHSNCode').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtHSNCode').css('border-color', 'green');
////    }

    if ($('#txtQty').val().trim() == "") {
        $('#txtQty').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtQty').css('border-color', 'green');
    }


    if ($('#txtLocation').val().trim() == "") {
        $('#txtLocation').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtLocation').css('border-color', 'green');
    }

   

    

    return isValid;
}




