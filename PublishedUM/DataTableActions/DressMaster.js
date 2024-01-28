
$(document).ready(function () {
    
    $('#txtDOS').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

    });

$(function () {
    $("#Showoverlay").show();
    GetData();
});


function GetData() {
    $("#Showoverlay").show();
    $.ajax({
        type: "POST",
        url: "masterdress.aspx/GetAllData",
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
////                var id = item.id;
////                var designation = item.designation;
                rows += "<tr>" +
                "<td>" + item.id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + item.dressname + ' ' + "</td>" +
                 "<td>" + item.availqty + "</td>" +
                  "<td>" + '<a href="#" class="btn btn-info" onclick="OpenStockModal(\'' + item.dressname + ',' + item.id + '\'\)">' + "Stock Details" + "</td>" +
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
                 stateSave: true,
                "bDestroy": true,
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
    var dressname = $('[id*=txtName]').val();
    // name = sentenceCase(name);
    var model = {};
    model.dressname = dressname;
    $.ajax({
        type: "POST",
        url: "masterdress.aspx/SaveRecord",
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
                        $.notify("Error!! dress already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! dress cannot be blank!", "error");
                        $('[id*=txtName]').focus();
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
                $.notify("Error!! dress already exists!", "error");
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
        url: "masterdress.aspx/GetRecordbyID",
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
                $('#txtName').val(json[0].dressname);

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

    var dressname = $('[id*=txtName]').val();
    ////name = sentenceCase(name);
    if (id > 0) {
        var model = {};
        model.id = id;
        model.dressname = dressname;

        $.ajax({
            type: "POST",
            url: "masterdress.aspx/UpdateRecord",
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
                        $.notify("Error!! dress already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! dress cannot be blank!", "error");
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
                    $.notify("Error!! dress name already exists!", "error");
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
            url: "masterdress.aspx/DeleteRecord",
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

    return isValid;
}


function OpenStockModal(stockData) {
////alert(stockData);
    const myArray = stockData.split(",");
    let id = myArray[1];
    let dressname = myArray[0];
   // alert(dressname);

     $('#recordStockID').val('0');
     $('#myStockModal').modal('show');
     $('#recordStockID').val(id);   
      $('#txtStockDress').val(dressname);
     BindStockDataTable(id);
}

function btnAddDressStock()
{
    ///alert("123");
    var id = $('[id*=recordStockID]').val();
   /// alert(id);
     if(id > 0)
     {
         var dressid = id;
        var dressname = $('[id*=txtStockDress]').val();
        var qty = $('[id*=txtStockQty]').val();
        var stockDate = $('[id*=txtDOS]').val();
        
    var model = {};
    model.id = id;
    model.dressid=dressid;
    model.dressname=dressname;
    model.qty=qty;
    model.billdate=stockDate;
//    if(model.dressdate=="")
//    {
//         $.notify("Error!! Required field missing!", "error");
//         return false;
//    }

    $.ajax({
            type: "POST",
            url: "masterdress.aspx/AddDressStock",
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
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        return;
                    }
                }
                else {
                    ///$('#empIDforDress').val('0');
                    //$('#EmpDressModel').modal('hide');
                   
                    BindStockDataTable(id);
                    GetData();
                    $('#myStockModal').modal('show');
                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                    $.notify("Error while updating data!", "error");
            }
        });

     }
     else {
        alert("invalid id!!");
        return;
    }
}
function BindStockDataTable(id)
{
    ////alert(id);
   // debugger;
      $.ajax({
        type: "POST",
        url: "masterdress.aspx/GetAllDressStockDetailsByDressID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
         
            $("#tblDressStockDetails").dataTable().fnDestroy();
            var json = JSON.parse(data.d)
           //////alert(data.d);
            var rows = '';
            $('#tblDressStockDetails tbody').empty();
            var srno = 0;
            $.each(json, function (key, item) {
                srno += 1;
                ///var id = item.id;
                ////var modelname = item.dressname;

                var billdate = new Date(item.updatedon).format('dd-MMM-yyyy')
                var dressid=item.dressid;
                rows += "<tr>" +
                "<td>" + item.id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + item.qty + ' ' +
                    "</td>" +
                    "<td>" + billdate + ' ' +
                    "</td>" +

                     "<td>" + item.trnsname + ' <br/>' + item.empname  + ' ' +
                    "</td>" +

                    "<td> " +
                   
                    ' <input type="button" id="btnDelete" value="Delete" class="btn btn-danger" onclick="DeleteStockDressRecord(\'' + item.id +  ',' + item.qty  +  ',' + dressid + '\'\)"  />' 

//            '<a href="#" class="btn btn-danger" onclick="alert(\'' + item.dressname + ',' + item.id + '\'\)">' + row.dress + '</a>'

              +  "</td>"
                    + "</tr>";
            });
            $('#tblDressStockDetails tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblDressStockDetails]').DataTable({
                "order": [[1, "asc"]],
                "columnDefs": [
                                { "visible": false, "targets": [0] }
                              ],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "paging": true,
                "info": true,
                'processing': true
                
            });

           
        },
        failure: function (response) {
            ///// alert(response.responseText);
            $.notify("BOOM!", "error");
        },
        error: function (response) {
          /////alert(response.responseText);

            $.notify("BOOM!", "error");
        }
    });
}

function DeleteStockDressRecord(dressdata)
{

  const myArray = dressdata.split(",");
    let id = myArray[0];
    let qty = myArray[1];
    let dressid=myArray[2];

    
      if (confirm('Are you sure delete this record?')) {
      
        var model = {};
        model.id = id;
        model.dressid = dressid;
        model.qty=qty;

    ////alert(JSON.stringify(model));

        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "masterdress.aspx/DeleteStockRecordByID",
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
                else {
                    $("#Showoverlay").hide();
                      var dressid = $('[id*=recordStockID]').val();
                   BindStockDataTable(dressid);
                    GetData();
                    $('#myStockModal').modal('show');
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

