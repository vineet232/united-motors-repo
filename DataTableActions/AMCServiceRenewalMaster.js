
$(document).ready(function () {

 

    $.ajax({
        type: "POST", url: "amcvehservice.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });

    $.ajax({
        type: "POST", url: "amcvehservice.aspx/GetBatteryManufacture",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlbatterymanufacture").append($("<option></option>").val(value.id).html(value.manufacturename));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });


     $.ajax({
        type: "POST", url: "amcvehservice.aspx/GetBodyType",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlBodyType").append($("<option></option>").val(value.id).html(value.bodytype));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });


    $('#txtDateofRegistration').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });


     $('#txtamcstartdt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

      $('#txtwarrentyexpdate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });


})  

function GetSelectedModelbyid(modelid)
 {
 $('#ddlModel').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
       type: "POST", url: "amcvehservice.aspx/GetModelName",
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
 
 

$(function () {
    //$("#Showoverlay").show();
    //GetData();
    BindDataTable();
});


function ShowFilteredData()
{
     var fromDt= $("#txtFromDate").val();
     var toDt= $("#txtToDate").val();

    var searchlastrenewalfromid = $("#ddlSearchLastRenewalFrom :selected").val();
    ///var olastrenewalfromval = $("#ddlSearchLastRenewalFrom :selected").text();

    if((fromDt != "" && toDt !="" ) || searchlastrenewalfromid != "0")
    {
        BindDataTable();
    }
    else
    {
         $.notify("Error!! Please enter search criteria!", "error");
         fromDt.focus();
         return;
    }
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

function ShowAllData()
{
$("#txtFromDate").val("");
$("#txtToDate").val("");
 $('#ddlSearchLastRenewalFrom').prop("selectedIndex", 0);

    BindDataTable()
}



function BindDataTable() {


 $("#tblRecords").dataTable().fnDestroy();

 var lrID = $("#ddlSearchLastRenewalFrom :selected").val();
var startDT = $("#txtFromDate").val();
var endDt = $("#txtToDate").val();

///////////////for export import ///////////////
// var show = false;
// var printPermission= $("#hdnPrintPermission").val();
// ////alert(printPermission);

// if(printPermission == "1")
// {
//    show = true;
// }

// var buttons = [''];
//  /////var buttons = ['colvis'];
//  ////var buttons = ['export'];
//  
//  if (show) {
//    /////buttons.push('copyHtml5', 'excelHtml5', 'pdfHtml5' );
//    ////buttons.push('excel',  'pdfHtml5' );

//    buttons.push( [ //begin array
//    
//    
//    {
//			extend: 'excelHtml5',
//				text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
//				titleAttr: 'Excel',
//				title: 'Save as Excel',
//                 "action": newexportaction,
//				
//		}, 

//        {
//			extend: 'pdf',
//				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
//				titleAttr: 'Pdf',
//				title: 'Save as PDF',
//                 "action": newexportactiontoPDF,
//				
//		} 

//         ]) // end array

//  }

// /////////////end for export import ///////////////


          $('#tblRecords').DataTable({


            "order": [[ 0, 'desc' ]],
            "columnDefs": [
    //{ "visible": false, "targets": [0] }
    ],

                bServerSide: true,
                sAjaxSource: 'AMCVehServiceHandler.ashx?startDt='+ startDT +'&endDt='+ endDt,
                sServerMethod: 'post',
                "processing": true,
             //   dom: 'Bfrtip',
                responsive: true,
               //// buttons: buttons,

                
                "columns": [
////                {"data": "lastchangeson"},
                    {  "data": "id" ,
                    
                   render: function (data, type, row, meta) {
            return meta.row + meta.settings._iDisplayStart + 1;
       }
          },


           { "data": "vehicleno"
////           ,
////            render: function ( data, type, row )
////                        {
////                             return "<div class=''>" + row.custname + ' <br/> <p style="color:red;"> ' +  row.invoiceno + "<p></div>";
////                        }
                    },
                     { "data": "modelname" },
                    { "data": "chasisno" },
                     { "data": "engineno" },
                    { "data": "modelyear"
                    ////,

////                        render: function ( data, type, row )
////                        {
////                             return "<div class=''>" + row.nextserviceduedate + ' to ' +  row.nextserviceduedate2 + "</div>";
////                        }

                    
                     },
                    { "data": "gvw"
                    
////                    ,
////                        
////                         render: function ( data, type, row )
////                        {
////                             return "<div class=''>" + row.mobileno +  '<br/>  ' + row.whatsappno + " </div>";
////                        }

                     },

                    { "data": "dateofregistration" },
                    { "data": "bodytype" },
                     
                     
                     { "data": "bharatstageval"
//                     ,
//                         render: function ( data, type, row )
//                        {
//                             return "<div class=''>" + row.nextserviceonkm +  '<br/> <p style="color:red;"> (' + parseInt( parseInt(row.servicetypeid) + 1 ) + " Service ) </p></div>";
//                        }
                      },
                   
                    { "data": "amcstartdt"
                        ,
                         render: function ( data, type, row )
                        {
                             var amcstartdt =  moment(row.amcstartdt).format('DD-MMM-YYYY')

                             return "<div class=''>" +  amcstartdt +  "</div>";
                        }
                      },
                    { "data": "isactive"
                    
                    ,
                      render: function ( data, type, row )
                        {
                        
                             var status=row.isactive;
                               if (status == "1") 
                               {                               
                                    return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
                                }
                                else
                                {
                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
                                }
                       }

                     },
                    
                   

                     { "data": "createdby",
                        render: function ( data, type, row )
                        {
////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                         var cdate =  moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate =  moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')


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
                ]

               ,
               stateSave: true,
                "bDestroy": true,
                responsive: true,

           

});

           

}




 function newexportaction()
 {

////     var fromDt= $("#txtFromDate").val();
////     var toDt= $("#txtToDate").val();

////    var searchlastrenewalfromid = $("#ddlSearchLastRenewalFrom :selected").val();
////    ///var olastrenewalfromval = $("#ddlSearchLastRenewalFrom :selected").text();

////    if(fromDt != "" && toDt !="" && searchlastrenewalfromid >=0)
////    {
////     var model = {};
////     model.fromdt = fromDt;
////     model.todt = toDt;
////     model.olastrenewalfromid = searchlastrenewalfromid;
////    

////    $("#Showoverlay").show(); 
////     $.ajax({
////        type: "POST",
////        url: "amcvehservice.aspx/GetFilteredDatainExcel",
////        data: '{ model :' + JSON.stringify(model) + '}',
////        contentType: "application/json; charset=utf-8",
////        dataType: "json",
////        success: function (data) {
////        ////alert(data);
////         var json = JSON.parse(data.d)
////        ////var data = $('#txt').val();
////        if(json == '')
////            return;
////        
////        JSONToCSVConvertor(json, "Policy Data", true);

////         $("#Showoverlay").hide(); 


////        }
////        });
////    }

////    else
////    {
       $("#Showoverlay").show(); 
       $.ajax({
        type: "POST",
        url: "amcvehservice.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Service Renewal Data", true);

         $("#Showoverlay").hide(); 


        }
        });
    ////}
            ////alert("export");          

   }


            function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    
    var CSV = '';    
    //Set Report title in first row or line
    
    CSV += ReportTitle + '\r\n\n';

    //This condition will generate the Label/Header
    if (ShowLabel) {
        var row = "";
        
        //This loop will extract the label from 1st index of on array
        for (var index in arrData[0]) {
            
            //Now convert each value to string and comma-seprated
            row += index + ',';
        }

        row = row.slice(0, -1);
        
        //append Label row with line break
        CSV += row + '\r\n';
    }
    
    //1st loop is to extract each row
    for (var i = 0; i < arrData.length; i++) {
        var row = "";
        
        //2nd loop will extract each column and convert it in string comma-seprated
        for (var index in arrData[i]) {
            row += '"' + arrData[i][index] + '",';
        }

        row.slice(0, row.length - 1);
        
        //add a line break after each row
        CSV += row + '\r\n';
    }

    if (CSV == '') {        
        alert("Invalid data");
        return;
    }   
    
    //Generate a file name
    var fileName = "MyReport_";
    //this will remove the blank-spaces from the title and replace it with an underscore
    fileName += ReportTitle.replace(/ /g,"_");   
    
    //Initialize file format you want csv or xls
    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
    
    // Now the little tricky part.
    // you can use either>> window.open(uri);
    // but this will not work in some browsers
    // or you will not get the correct file extension    
    
    //this trick will generate a temp <a /> tag
    var link = document.createElement("a");    
    link.href = uri;
    
    //set the visibility hidden so it will not effect on your web-layout
    link.style = "visibility:hidden";
    link.download = fileName + ".csv";
    
    //this part will append the anchor tag and remove it after automatic click
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

 

 function newexportactiontoPDF()
  {

//////     var fromDt= $("#txtFromDate").val();
//////     var toDt= $("#txtToDate").val();
//////     var searchlastrenewalfromid = $("#ddlSearchLastRenewalFrom :selected").val();

//////    if(fromDt != "" && toDt !=""  && searchlastrenewalfromid >=0)
//////    {
//////     var model = {};
//////     model.fromdt = fromDt;
//////     model.todt = toDt;
//////     model.olastrenewalfromid = searchlastrenewalfromid;

//////      $("#Showoverlay").show();
//////     $.ajax({
//////        type: "POST",
//////        url: "amcvehservice.aspx/GetFilteredDatainExcel",
//////       data: '{ model :' + JSON.stringify(model) + '}',
//////        contentType: "application/json; charset=utf-8",
//////        dataType: "json",
//////        success: function (data) {
//////       
//////         var json = JSON.parse(data.d)
//////         /////var count = Object.keys(json).length;
//////         
//////        if(json == '')
//////            return;        

//////       var doc = new jspdf.jsPDF()

//////        var head = [['ID', 'Customer Name', 'Last Renewal From', 'Veh./Chasis No', 'Due Date', 'Mobile No', 'Whatsapp No', 'Model Name']]
//////        var body = []
//////      $.each(json, function (key, item) {
//////        var data =  [item.id, item.custname, item.lastrenewalfromval, item.vehChasisno, item.duedate, item.mobileno, item.whatsappno, item.modelname];
//////            body.push(data);
//////         });

//////       doc.autoTable({ head: head, body: body })

//////        // Simple html example
//////        doc.autoTable({ html: '#tabledata' })

//////        doc.save('PolicyData.pdf')
//////         $("#Showoverlay").hide(); 

//////        }
//////       });

//////    }

//////    else
//////    {
      $("#Showoverlay").show();
           $.ajax({
        type: "POST",
        url: "amcvehservice.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
       
         var json = JSON.parse(data.d)

         var count = Object.keys(json).length;
         
        if(json == '')
            return;        

       var doc = new jspdf.jsPDF()

        var head = [['ID', 'Customer Name', 'Last Service From', 'Veh./Chasis No', 'Next Service Date', 'Mobile No', 'Whatsapp No', 'Model Name', 'Invoice No']]
        var body = []
      $.each(json, function (key, item) {

        var data =  [item.id, item.custname, item.lastservicefromval, item.vehChasisno, item.nextserviceduedate, item.mobileno, item.whatsappno, item.modelname,  item.invoiceno];
        body.push(data);
         });

       doc.autoTable({ head: head, body: body })

        // Simple html example
        doc.autoTable({ html: '#tabledata' })

        doc.save('ServiceRenewalData.pdf')
         $("#Showoverlay").hide(); 

        }
       });
   ////// }
    
 }    




function AddRecord() {
    var res = validate();
    
    if (res == false) {
        return false;
    }
    
   
//    var selectedVal = "";
//        selectedVal = $("input[name='rdSelectService']:checked").val();
    
     var vehicleno = $('[id*=txtvehicleno]').val();
      
    var modelid = $("#ddlModel :selected").val();
    var modelname = $("#ddlModel :selected").text();
    var chasisno = $('[id*=txtChasisNo]').val();
    var engineno = $('[id*=txtengineno]').val();
    var modelyear = $('[id*=txtmodelyear]').val();
    var gvw = $('[id*=txtgvv]').val();
    var dateofregistration = $('[id*=txtDateofRegistration]').val();
    var bodytypeid = $("#ddlBodyType :selected").val();
    var bodytype = $("#ddlBodyType :selected").text();
    var bharatstageid = $("#ddlBharatStage :selected").val();
    var bharatstageval = $("#ddlBharatStage :selected").text();

    var amcstartdt = $('[id*=txtamcstartdt]').val();
    var isactive = "";
    if ($('#chkStatus').prop('checked')) {
        isactive = "1";
    } else {
        isactive = "0";
    }


    var batteryno1 = $('[id*=txtbatteryno1]').val();
    var batteryno2 = $('[id*=txtbatteryno2]').val();
     var batterymanufactureid = $("#ddlbatterymanufacture :selected").val();
    var batterymanufacture = $("#ddlbatterymanufacture :selected").text();
    var warrentyexpirydate = $('[id*=txtwarrentyexpdate]').val();


     //var nextserviceduedate = $('[id*=txtNextServiceDueDate]').val();
    
////     var remarks = $('[id*=txtRemarks]').val();
////      var insduedt = $('[id*=txtInsDueDt]').val();
////     var invoiceno = $('[id*=txtinvoiceno]').val();
////    

////    var servicebasedonid = "0";
////    var servicebasedon = "";

////    var servicetypeid = $("#ddlServiceType :selected").val();
////    var servicetype =  $("#ddlServiceType :selected").text();
////    var serviceonkm = $('[id*=txtCurrentKM]').val();
   
   

   // name = sentenceCase(name);
    var model = {};
    model.vehicleno = vehicleno;
    model.modelid = modelid;
    model.modelname = modelname;
    model.chasisno = chasisno;
    model.engineno = engineno;
    model.modelyear = modelyear;
    model.gvw = gvw;
    model.dateofregistration = dateofregistration;
    model.bodytypeid = bodytypeid;
    model.bodytype=bodytype;
    model.bharatstageid=bharatstageid;
    model.bharatstageval=bharatstageval;
    model.amcstartdt=amcstartdt;
    model.isactive=isactive;

     model.batteryno1=batteryno1;
    model.batteryno2=batteryno2;
    model.batterymanufactureid=batterymanufactureid;
    model.batterymanufacture=batterymanufacture;
    model.warrentyexpirydate=warrentyexpirydate;

    //        debugger;
    $.ajax({
        type: "POST",
        url: "amcvehservice.aspx/SaveRecord",
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
                return;
            }
            else {
                if (r.d == 20 || r.d == 30 || r.d == 50) {
                    if (r.d == 20) {
                        $.notify("Error!! veh./chasis no already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
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
   ///// alert(id);
   
    ////$("#ddlModel").select2("val", "0");

   
    $('#recordID').val("0");
    $.ajax({
        type: "POST",
        url: "amcvehservice.aspx/GetRecordbyID",
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
                /////alert(result.d);
                $('#recordID').val(json[0].id);
                 GetSelectedModelbyid(json[0].modelid);

//                var vehsaledt = json[0].vehsaledt.substring(0, 10);
//                 var servicedt = json[0].servicedt.substring(0, 10);
//                  var nextserviceduedate = json[0].nextserviceduedate.substring(0, 10);
//                  var insduedt="01/01/1900";
//                  if(json[0].insduedt!=null)
//                  {
//                    insduedt = json[0].insduedt.substring(0, 10);
//                  }

        var regdt = json[0].dateofregistration.substring(0, 10);
                $('#txtvehicleno').val(json[0].vehicleno);
                 $('#txtChasisNo').val(json[0].chasisno);
               $('#txtengineno').val(json[0].engineno);
                $('#txtmodelyear').val(json[0].modelyear);
                 $('#txtgvv').val(json[0].gvw);
                  $('#txtDateofRegistration').val(regdt);
                   $('#ddlBodyType').val(json[0].bodytypeid);
                    $('#ddlBharatStage').val(json[0].bharatstageid);
                    
                     var amcstartdt = json[0].amcstartdt.substring(0, 10);

                     $('#txtamcstartdt').val(amcstartdt);
                     var isactive = json[0].isactive;
                if (isactive == "1") {
                    $('#chkStatus').prop('checked')
                } else {
                    $("#chkStatus").removeAttr("checked");
                }
               
                 var warrentyexpirydate = "";

                 if(json[0].warrentyexpirydate != null)
                 {
                  warrentyexpirydate = json[0].warrentyexpirydate.substring(0, 10);
                  }


                 $('#txtbatteryno1').val(json[0].batteryno1);
                  $('#txtbatteryno2').val(json[0].batteryno2);

                  if(json[0].batterymanufactureid == "" || json[0].batterymanufactureid == null)
                  {
                     $('#ddlbatterymanufacture').val("0");
                  }
                  else
                  {
                   $('#ddlbatterymanufacture').val(json[0].batterymanufactureid);
                   }
                   if(warrentyexpirydate!="" || warrentyexpirydate!="1900-01-01")
                   {
                    $('#txtwarrentyexpdate').val(warrentyexpirydate);
                    }
                    else
                    {
                    $('#txtwarrentyexpdate').val("1900-01-01")
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
    
////     var selectedVal = "";
////        selectedVal = $("input[name='rdSelectService']:checked").val();
////    
      
     var vehicleno = $('[id*=txtvehicleno]').val();
      
    var modelid = $("#ddlModel :selected").val();
    var modelname = $("#ddlModel :selected").text();
    var chasisno = $('[id*=txtChasisNo]').val();
    var engineno = $('[id*=txtengineno]').val();
    var modelyear = $('[id*=txtmodelyear]').val();
    var gvw = $('[id*=txtgvv]').val();
    var dateofregistration = $('[id*=txtDateofRegistration]').val();
    var bodytypeid = $("#ddlBodyType :selected").val();
    var bodytype = $("#ddlBodyType :selected").text();
    var bharatstageid = $("#ddlBharatStage :selected").val();
    var bharatstageval = $("#ddlBharatStage :selected").text();

     var amcstartdt = $('[id*=txtamcstartdt]').val();
    var isactive = "";
    if ($('#chkStatus').prop('checked')) {
        isactive = "1";
    } else {
        isactive = "0";
    }


    var batteryno1 = $('[id*=txtbatteryno1]').val();
    var batteryno2 = $('[id*=txtbatteryno2]').val();
     var batterymanufactureid = $("#ddlbatterymanufacture :selected").val();
    var batterymanufacture = $("#ddlbatterymanufacture :selected").text();
    var warrentyexpirydate = $('[id*=txtwarrentyexpdate]').val();


    ////name = sentenceCase(name);
    if (id > 0) {
         var model = {};
         model.id = id;
          model.vehicleno = vehicleno;
    model.modelid = modelid;
    model.modelname = modelname;
    model.chasisno = chasisno;
    model.engineno = engineno;
    model.modelyear = modelyear;
    model.gvw = gvw;
    model.dateofregistration = dateofregistration;
    model.bodytypeid = bodytypeid;
    model.bodytype=bodytype;
    model.bharatstageid=bharatstageid;
    model.bharatstageval=bharatstageval;
    model.amcstartdt=amcstartdt;
    model.isactive=isactive;
    model.batteryno1=batteryno1;
    model.batteryno2=batteryno2;
    model.batterymanufactureid=batterymanufactureid;
    model.batterymanufacture=batterymanufacture;
    model.warrentyexpirydate=warrentyexpirydate;


        $.ajax({
            type: "POST",
            url: "amcvehservice.aspx/UpdateRecord",
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
                        $('[id*=txtMobile]').focus();
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAdd').hide();
                    $("#lblMessage").html("");
                    $("#postedFile").val('');
                    BindDataTable();
                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! veh/chasis no already exists!", "error");
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
            url: "amcvehservice.aspx/DeleteRecord",
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

    $('#txtvehicleno').val("");
       $('#txtChasisNo').val("");
        $('#txtengineno').val("");
        $('#txtmodelyear').val("");
         $('#txtgvv').val("");
          $('#txtDateofRegistration').val("");
        
          $('#ddlBodyType').prop("selectedIndex", 0);
    $('#ddlBharatStage').prop("selectedIndex", 0);
    $("#ddlModel").select2("val", "0");

    
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    
    $('#myModal').modal('show');
    $('#myModal').on('shown.bs.modal', function () {
        $('#txtvehicleno').focus();
    });

}
//Valdidation using jquery  
function validate() {



    var isValid = true;

////    if ($('#ddlModel :selected').select2("val", "0")) {
////        $('#ddlModel').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#ddlModel').css('border-color', 'green');
////    }


    if ($('#txtvehicleno').val().trim() == "") {
        $('#txtvehicleno').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtvehicleno').css('border-color', 'green');
    }

if ($('#txtChasisNo').val().trim() == "") {
        $('#txtChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtChasisNo').css('border-color', 'green');
    }


if ($('#txtengineno').val().trim() == "") {
        $('#txtengineno').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtengineno').css('border-color', 'green');
    }


if ($('#txtmodelyear').val().trim() == "") {
        $('#txtmodelyear').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtmodelyear').css('border-color', 'green');
    }


if ($('#txtgvv').val().trim() == "") {
        $('#txtgvv').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtgvv').css('border-color', 'green');
    }

    if ($('#txtDateofRegistration').val().trim() == "") {
        $('#txtDateofRegistration').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDateofRegistration').css('border-color', 'green');
    }

    if ($('#ddlBodyType :selected').val().trim() == "0") {
        $('#ddlBodyType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlBodyType').css('border-color', 'green');
    }

   
 if ($('#ddlBharatStage :selected').val().trim() == "0") {
        $('#ddlBharatStage').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlBharatStage').css('border-color', 'green');
    }



    if ($('#ddlModel :selected').val().trim() == "0") {
        $('#ddlModel').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlModel').css('border-color', 'green');
    }

    return isValid;
}




