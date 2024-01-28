

$(document).ready(function () {
// $('#txtDate').datepicker({
//        format: "mm/dd/yyyy",
//        autoclose: true,
//    });

    /////GetSlipNo();

     $("#ddlModel").select2();


    $("#ddlServiceAdvisor").select2();
      $("#ddlTechnician").select2();
    

//////    $.ajax({
//////        type: "POST", url: "vehicleTracker.aspx/GetModelName",
//////        dataType: "json",
//////        contentType: "application/json", 
//////        success: function (res) {
//////            $.each(res.d, function (data, value) {

//////                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
//////            })
//////        }
//////        ,
//////        error: function (response) {
//////            ///alert(response.responseText);
//////            $.notify("BOOM!", "error");
//////        }
//////     });




      $.ajax({
        type: "POST", url: "vehicleTracker.aspx/GetAllServiceAdvisor",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlServiceAdvisor").append($("<option></option>").val(value.id).html(value.employeename));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }
     });


       $.ajax({
        type: "POST", url: "vehicleTracker.aspx/GetAllTechnician",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlTechnician").append($("<option></option>").val(value.id).html(value.employeename));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }
     });



      $.ajax({
        type: "POST", url: "policyrenewal.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
            })

          ////// $("#ddlModel").select2();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });



})  


function GetSelectedModelbyid(modelid)
 {
 $('#ddlModel').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
       type: "POST", url: "policyrenewal.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
            })
         $('#ddlModel').val(modelid);
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



function ddlStatus_SelectedIndexChanged()
{
     var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);
}

  /////function GetSelectedServiceAdvisor(advid, compid)
  function GetSelectedServiceAdvisor(advid)
 {
 $('#ddlServiceAdvisor').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();

//// var model={};
//// model.id=advid;
//// model.olocationid=compid;

 $("#Showoverlay").show();
    $.ajax({
      type: "POST", 
////      url: "vehicleTracker.aspx/GetServiceAdvisorbyID",
////       data: '{ model :' + JSON.stringify(model) + '}',
        url: "vehicleTracker.aspx/GetAllServiceAdvisor",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlServiceAdvisor").append($("<option></option>").val(value.id).html(value.employeename));
            })
         $('#ddlServiceAdvisor').val(advid);
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


// function GetSelectedTechnician(techid, compid)
 function GetSelectedTechnician(techid)
 {
 $('#ddlTechnician').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
//// alert(compid);
//// var model={};
//// model.id=techid;
//// model.olocationid=compid;

 $("#Showoverlay").show();
    $.ajax({
      type: "POST", 
////      url: "vehicleTracker.aspx/GetTechnicianByID",
////       data: '{ model :' + JSON.stringify(model) + '}',

 url: "vehicleTracker.aspx/GetAllTechnician",

        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlTechnician").append($("<option></option>").val(value.id).html(value.employeename));
            })
         $('#ddlTechnician').val(techid);
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



$(function () {
//    $("#Showoverlay").show();

BindDataTable(1);

});






function BindDataTable(statusid) {

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

 $("#tblRecords").dataTable().fnDestroy();


            $('#tblRecords').DataTable({
            "order": [[ 7, 'asc' ]],
           


            "columnDefs": [
    { "visible": false, "targets": [] }
    ],

                bServerSide: true,
                sAjaxSource: 'VehicleTrackerHandler.ashx?statusid='+ statusid,
                sServerMethod: 'post',
                "processing": true,
               
                 
                "columns": [
                    {  "data": "id" 
                    ,
                     
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },

                     { "data": "vehno",
                         render: function ( data, type, row )
                        {
                            return row.vehno + "<hr style='margin-top:1px !important; margin-bottom:1px !important;' /> " + row.modelname + "<hr style='margin-top:1px !important; margin-bottom:1px !important;' /> " + row.kms ;
                        }
                      },
                     { "data": "vehowner",
                     
                         render: function ( data, type, row )
                        {
                            return row.vehowner + "<br /> " + row.mobileno;
                        }
                      },

//                    { "data": "slipno" },
                    { "data": "companyname"
////                    ,
////                    
////                     render: function ( data, type, row )
////                        {
////                            if(row.statusid=="1")
////                            {
////                                return   row.challandate ;
////                            }
////                            if(row.statusid=="2")
////                            {
////                                return  "<div style='color:red;'>" + "CH/" +  row.challanno + "</div>" + "<br/>" + row.challandate ;
////                            }
////                     }

                     },

                    { "data": "serviceadvname" },
                    { "data": "technicianname" },

                     
                     
                      { "data": "hrs" 
                        
                       ,
                      render: function ( data, type, row )
                        {
                        
                             var status=row.statusid;
                               if (status == "2") 
                               {                               
                                    return row.hrs;
                                }
                                else
                                {
                                    if(parseFloat(row.hrs) > 24)
                                    {
                                        var days=( parseFloat(row.hrs)/24);
                                     ///return  '<i class="fa fa-hourglass-half  fa-fw"; style="font-size:large; color:red;">'  + row.hrs + '</i>';
                                     return  '<i  style="font-size:large; color:red;">'  + days.toFixed(2) + '  days' + '</i>';
                                    }
                                    else
                                    { 
                                       // return '<i class="fa-solid fa-alarm-clock"; style="color:red;">'  + row.hrs + '</i>';

                                       return  row.hrs + ' hrs';
                                    }
                                }
                       }

                      },
                    { "data": "status",
                        
                         render: function ( data, type, row )
                        {
                        
                             var status=row.statusid;
                               if (status == "2") 
                               {                               
                                    return  '<i  style=" color:green;">' + row.status + '</i>';  
                                }
                                else
                                {
                                     return  '<i  style=" color:red;">' + row.status + '</i>';                                    
                                }
                       }
                     },
                    { "data": "gatepassno"},
                     { "data": "remarks"},

//////                   
//////                    
//////                    { "data": "status"
//////                    
//////                    ,
//////                      render: function ( data, type, row )
//////                        {
//////                        
//////                             var status=row.statusid;
//////                               if (status == "1") 
//////                               {                               
//////                                    return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
//////                                }
//////                                else
//////                                {
//////                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
//////                                }
//////                       }
//////                     },

                   

                   { "data": "createdby",
                        render: function ( data, type, row )
                        {

                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')

                         return "<div class='text-nowrap'>" + row.createdby + '<br/>(' + cdate + ')  <br/>' + row.updatedby + '<br/>(' + udate + ')' + "</div>";
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
                  
                    
                    
                ],




                // stateSave: true,
                "bDestroy": true, 
                responsive: true,
                buttons: buttons,


////////                "createdRow": function( row, data, index ) {
////////                alert(row.statusid);
////////    if ( row.statusid == "1" )
////////    {
////////    alert("12");
////////        $('td', row).css('background-color', 'Red');
////////    }
////////    else if ( row.statusid == "2" )
////////    {
////////        $('td', row).css('background-color', 'Orange');
////////    }
////////}



//                "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
//      if (aData[5] == "1") {
//        $('td', nRow).css('background-color', 'Red');
//      } else if (aData[5] == "2") {
//        $('td', nRow).css('background-color', 'Orange');
//      }
//    }



//                 fnRowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
//                            if (aData.statusid == "1") {
////                                $('td', nRow).css('background-color', '#BFFFEB');
//                                 $('td', nRow).css('color', 'green');
//                            } else {
////                                $('td', nRow).css('background-color', '#FEEDF2');
//                                $('td', nRow).css('color', 'red');
//                            }
//                        }


            });


   }






//function sentenceCase(str) {
//    if ((str === null) || (str === ''))
//        return false;
//    else
//        str = str.toString();

//    return str.replace(/\w\S*/g, function (txt) {
//        return txt.charAt(0).toUpperCase() +
//       txt.substr(1).toLowerCase();
//    });
//}



function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }

     

    //var id = table.rows()[0].length + 1;
   //// var slipno = $('[id*=txtSlipNo]').val();
    //var slipdate = $('[id*=txtDate]').val();
    var vehno = $('[id*=txtVehChasisNo]').val();
    var companyid   =  $("#ddlCompany :selected").val();
    var companyname = $("#ddlCompany :selected").text();

    var serviceadvid   =  $("#ddlServiceAdvisor :selected").val();
    var serviceadvname = $("#ddlServiceAdvisor :selected").text();

      var technicianid   =  $("#ddlTechnician :selected").val();
      var technicianname = $("#ddlTechnician :selected").text();
      var statusid = $("#ddlStatus :selected").val();
      var status = $("#ddlStatus :selected").text();
      var gatepassno = $('[id*=txtGatePassNo]').val();

      var remarks = $('[id*=txtRemarks]').val();


     var vehmodelid   =  $("#ddlModel :selected").val();
      var vehmodel = $("#ddlModel :selected").text();
       var mobileno = $('[id*=txtMobileNo]').val();
       var kms = $('[id*=txtkms]').val();

   // name = sentenceCase(name);
    var model = {};
    model.vehno = vehno;
    model.companyid = companyid;
    model.companyname = companyname;
    model.serviceadvid = serviceadvid;
    model.serviceadvname = serviceadvname;
    model.technicianid = technicianid;
    model.technicianname=technicianname;
    model.statusid=statusid;
    model.status=status;
    model.gatepassno=gatepassno;
    model.remarks=remarks;
    /////alert(gatepassno);
    model.modelid=vehmodelid;
    model.modelname=vehmodel;
    model.mobileno=mobileno;
    model.kms=kms;

    $.ajax({
        type: "POST",
        url: "vehicleTracker.aspx/SaveRecord",
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
            else {
                if (r.d == 20 || r.d == 30 || r.d == 50 || r.d == 60 || r.d == 70) {
                    if (r.d == 20) {
                        $.notify("Error!! mobile already exists!", "error");
                        //$('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! fields cannot be blank!", "error");
                        ////$('[id*=txtName]').focus();
                       // $('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtVehChasisNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                     if (r.d == 60) {
                        $.notify("Error!!  already opened!", "error");
                        /////$('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 70) {
                        $.notify("Error!!  vehicle number not found in service!!", "error");
                        /////$('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }

                }
                else {
                    
                  /////  $('#myModal').modal('hide');

                    $.notify("Record saved!", "success");
                    clearTextBox();
                    ////GetSlipNo();

                   // BindDataTable();
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


function EditRecordbyID(id) {
    ////alert(id);
    $.ajax({
        type: "POST",
        url: "vehicleTracker.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {

             var json = JSON.parse(result.d);
             //////alert(json);
//                if(json[0].statusid == "2")
//                {
//                    $.notify("Not allowed. Already closed!", "error");
//                    $('#btnUpdateSlipMaster').hide();
//                $('#btnAddNewSlipMaster').hide();
//                    return;

//                }

               

                ////var modelname = json[0].modelname;
                //alert(modelname);
                $('#recordID').val(json[0].id);
                 $('#txtVehChasisNo').val(json[0].vehno);

////////                 if(json[0].challandate != null)
////////                 {
////////                   ////slipdate = new Date(json[0].slipdate.substring(0, 10)).toLocaleDateString("en-US", { month: "2-digit", year: "numeric", day: "2-digit" });

////////                    var slipdate = moment(json[0].challandate).format('MM-DD-YYYY')

////////                 }

                  ///$('#txtDate').val(slipdate);
               

                $("#ddlCompany").val(json[0].companyid);
                // $("#ddlServiceAdvisor").val(json[0].serviceadvid);
                //   $("#ddlTechnician").val(json[0].technicianid);
                     $("#ddlStatus").val(json[0].statusid);
                
                 $('#txtGatePassNo').val(json[0].gatepassno);
                  $('#txtRemarks').val(json[0].remarks);
////                  GetSelectedServiceAdvisor(json[0].serviceadvid, json[0].companyid);
////                   GetSelectedTechnician(json[0].technicianid, json[0].companyid);

                GetSelectedServiceAdvisor(json[0].serviceadvid);
                   GetSelectedTechnician(json[0].technicianid);


                   var vehmodelid   =  GetSelectedModelbyid(json[0].vehmodelid);     
                   //////alert(json[0].mobileno); 
                $('#txtMobileNo').val(json[0].mobileno);
                $('#txtkms').val(json[0].kms);



//                $('#myModal').modal('show');
//                $('#myModal').on('shown.bs.modal', function () {
//                    $('#txtName').focus();
//                });
                $('#btnUpdateSlipMaster').show();
                $('#btnAddNewSlipMaster').hide();
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });
}

////function for updating record
function UpdateRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var id = $('[id*=recordID]').val();
    ////alert(id);
   var vehno = $('[id*=txtVehChasisNo]').val();
    var companyid   =  $("#ddlCompany :selected").val();
      var companyname = $("#ddlCompany :selected").text();

    var serviceadvid   =  $("#ddlServiceAdvisor :selected").val();
      var serviceadvname = $("#ddlServiceAdvisor :selected").text();

       var technicianid   =  $("#ddlTechnician :selected").val();
      var technicianname = $("#ddlTechnician :selected").text();
        var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
 var gatepassno = $('[id*=txtGatePassNo]').val();
 var remarks = $('[id*=txtRemarks]').val();
    ////name = sentenceCase(name);

    var vehmodelid   =  $("#ddlModel :selected").val();
      var vehmodel = $("#ddlModel :selected").text();
       var mobileno = $('[id*=txtMobileNo]').val();
        var kms = $('[id*=txtkms]').val();

    if (id > 0) {
   
        var model = {};
    model.id=id;
    model.vehno = vehno;
    model.companyid = companyid;
    model.companyname = companyname;
    model.serviceadvid = serviceadvid;
    model.serviceadvname = serviceadvname;
    model.technicianid = technicianid;
    model.technicianname=technicianname;
    model.statusid=statusid;
    model.status=status;
    model.gatepassno=gatepassno;
    model.remarks=remarks;
    
    model.modelid=vehmodelid;
    model.modelname=vehmodel;
    model.mobileno=mobileno;
    model.kms=kms;

        $.ajax({
            type: "POST",
            url: "vehicleTracker.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Record not updated!", "error");
                    $('[id*=txtVehChasisNo]').focus();
                    return;
                }
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 40 || r.d == 50 || r.d == 60 || r.d == 70) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!!  already exists!", "error");
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
                     if (r.d == 40) {
                        $.notify("Error!! first close spare part outward before closing!!", "error");
                        $('[id*=txtMobileNo]').focus();
                        return;
                    }
                    if (r.d == 60) {
                        $.notify("Error!!  already opened!", "error");
                        /////$('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                    if (r.d == 70) {
                        $.notify("Error!!  vehicle number not found in service!!", "error");
                        /////$('[id*=txtMobileNo]').focus();
                        // $('#myModal').modal('show');
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    /////$('#myModal').modal('hide');
                    $('#btnUpdateSlipMaster').hide();
                    $('#btnAddNewSlipMaster').show();
                   //// BindDataTable();
                    var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);
                    clearTextBox();
                    $.notify("Record updated!", "success");
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

function DeleteRecord(id) {
    if (confirm('Are you sure delete this record?')) {
//////        var data = table.row($(this).parents('tr')).data();
//////        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "vehicleTracker.aspx/DeleteRecord",
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
                     return;
                }
                 if (r.d == 90) {
                    $.notify("Error!! items exists under this record. Please delete all items under this record first!!", "error");
                     return;
                }
                else {
                    $("#Showoverlay").hide();
                   //// BindDataTable();

                    var statusid = $("#ddlStatus :selected").val();
    var status = $("#ddlStatus :selected").text();
   //// alert(status);
   BindDataTable(statusid);

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




//////Function for clearing the textboxes  
function clearTextBox() {
$('#txtVehChasisNo').val("");
    $('#txtGatePassNo').val("");
    $('#txtRemarks').val("");
     $('#txtMobileNo').val("");
     $('#txtkms').val("");

      $('#ddlCompany').prop("selectedIndex", 0);
     $('#ddlServiceAdvisor').prop("selectedIndex", 0).trigger('change');
      $('#ddlTechnician').prop("selectedIndex", 0).trigger('change');
       $('#ddlModel').prop("selectedIndex", 0).trigger('change');
    $('#ddlStatus').prop("selectedIndex", 0);


    $('#btnUpdate').hide();
    $('#btnAdd').show();

   
    $('#txtVehChasisNo').css('border-color', 'lightgrey');
    $('#txtGatePassNo').css('border-color', 'lightgrey');
  /////  $('#txtPaymentMode').css('border-color', 'lightgrey');
   //// $('#txtModel').css('border-color', 'lightgrey');
  
     

//////    $('#myModal').modal('show');
//////    $('#myModal').on('shown.bs.modal', function () {
//////        $('#txtName').focus();
//////    });

    

}

//////Valdidation using jquery  
function validate() {
    var isValid = true;

////     if ($('#txtInvoiceNo').val().trim() == "") {
////        $('#txtInvoiceNo').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtInvoiceNo').css('border-color', 'lightgrey');
////    }


    if ($('#txtVehChasisNo').val().trim() == "") {
        $('#txtVehChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehChasisNo').css('border-color', 'lightgrey');
    }

    if ($('#txtMobileNo').val().trim() == "") {
        $('#txtMobileNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobileNo').css('border-color', 'lightgrey');
    }


////    if ($('#txtMobileNo').val().trim() == "") {
////        $('#txtMobileNo').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtMobileNo').css('border-color', 'lightgrey');
////    }

//    if ($('#txtPaymentMode').val().trim() == "") {
//        $('#txtPaymentMode').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#txtPaymentMode').css('border-color', 'lightgrey');
//    }

//////    if ($('#txtModel').val().trim() == "") {
//////        $('#txtModel').css('border-color', 'Red');
//////        isValid = false;
//////    }
//////    else {
//////        $('#txtModel').css('border-color', 'lightgrey');
//////    }



 if ($('#ddlCompany :selected').val().trim() == "0") {
       //// $('#ddlModel').css('border-color', 'Red');
       alert("Please select company!!");
        isValid = false;
         return;
    }
    else {
        $('#ddlCompany').css('border-color', 'lightgrey');
    }


//////    if ($('#ddlModel :selected').val().trim() == "0") {
//////       //// $('#ddlModel').css('border-color', 'Red');
//////       alert("Please select model!!");
//////        isValid = false;
//////         return;
//////    }
//////    else {
//////        $('#ddlModel').css('border-color', 'lightgrey');
//////    }

    if ($('#txtkms').val().trim() == "") {
        $('#txtkms').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtkms').css('border-color', 'lightgrey');
    }


//   if ($('#ddlServiceAdvisor :selected').val().trim() == "0") {
//       // $('#ddlServiceAdvisor').css('border-color', 'Red');
//        alert("Please select service advisor!!");
//        isValid = false;
//         return;
//    }
//    else {
//        $('#ddlServiceAdvisor').css('border-color', 'lightgrey');
//    }

//    if ($('#ddlTechnician :selected').val().trim() == "0") {
//        ///$('#ddlTechnician').css('border-color', 'Red');
//         alert("Please select technician!!");
//        isValid = false;
//        return;
//    }
//    else {
//        $('#ddlTechnician').css('border-color', 'lightgrey');
//    }


//    if ($('#ddlStatus :selected').val().trim() == "0") {
//        $('#ddlStatus').css('border-color', 'Red');
//        isValid = false;
//    }
//    else {
//        $('#ddlStatus').css('border-color', 'lightgrey');
//    }

     

    return isValid;
}


