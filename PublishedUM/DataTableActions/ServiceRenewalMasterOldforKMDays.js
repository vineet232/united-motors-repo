
$(document).ready(function () {

  

    $.ajax({
        type: "POST", url: "servicerenewalmaster.aspx/GetAllLastRenewalFromList",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlLastRenewalFrom").append($("<option></option>").val(value.id).html(value.renewalFrom));

                $("#ddlSearchLastRenewalFrom").append($("<option></option>").val(value.id).html(value.renewalFrom));
                

            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });

$('#rdKM').change(function(){
            GetServiceType();
        });

        $('#rdDays').change(function(){
            GetServiceType();
        });


    $.ajax({
        type: "POST", url: "servicerenewalmaster.aspx/GetModelName",
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


    $('#txtDueDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

    $('#txtFromDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
    $('#txtToDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
    
     $('#txtVehSaleDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

     $('#txtNextServiceDueDate').datepicker({
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
       type: "POST", url: "servicerenewalmaster.aspx/GetModelName",
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
 
 function GetServiceType()
 {
 
        $('#ddlServiceType').find('option:not(:first)').remove();

        var selectedVal = "";
        selectedVal = $("input[name='rdSelectService']:checked").val();
        
         var modelID = $("#ddlModel :selected").val();
      var modelName = $("#ddlModel :selected").text();
      var currentKM = $("#txtCurrentKM").val();
      var vehsaledt = $("#txtVehSaleDate").val();

      if(modelID<=0)
      {
        alert('Please select model first!!');
       $("#ddlModel").focus();
       $("input:radio").removeAttr("checked");
        return;
      }
      
      if(selectedVal=="1")
      {
        if(currentKM == "")
        {
            alert("Please enter km range!!");
            $("#txtCurrentKM").focus();
            $("input:radio").removeAttr("checked");
            return;
        } 
      }
      if(selectedVal=="2")
      {
        if(vehsaledt== "")
        {
            alert("Please enter sale date!!");
            $("#txtVehSaleDate").focus();
            $("input:radio").removeAttr("checked");
            return;
        } 
      }
      

      ////alert(currentKM);

       var model = {};
     model.servicetypeid = selectedVal;
     model.modelID = modelID;
     model.currentKM = currentKM;
     model.vehsaledt = vehsaledt;
     ////alert(JSON.stringify(model));

 $("#Showoverlay").show();
    $.ajax({
        type: "POST", 
        url: "servicerenewalmaster.aspx/GetServiceListByModelID",
        dataType: "json",
       ///// data:'{modelid:'+ modelID + ', servicetype:' + selectedVal + '}',
       data: '{ model :' + JSON.stringify(model) + '}',

        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                 $("#ddlServiceType").append($("<option></option>").val(value.id).html(value.Name));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM Error!", "error");
            $("#Showoverlay").hide();
        }

    });

 }

 function GetSelectedServiceType(modelid, servicetype, vehsaledt, selectedVal)
 {

  var currentKM = $("#txtCurrentKM").val();

    var model = {};
     model.servicetypeid = selectedVal;
     model.modelID = modelid;
     model.currentKM = currentKM;
     model.vehsaledt = vehsaledt;
    ///////alert(JSON.stringify(model));

 $("#Showoverlay").show();
    $.ajax({
        type: "POST", 
        url: "servicerenewalmaster.aspx/GetServiceListByModelID",
        dataType: "json",
       ///// data:'{modelid:'+ modelID + ', servicetype:' + selectedVal + '}',
       data: '{ model :' + JSON.stringify(model) + '}',

        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                 $("#ddlServiceType").append($("<option></option>").val(value.id).html(value.Name));
            })
            $("#ddlServiceType").val(servicetype);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM Error!", "error");
            $("#Showoverlay").hide();
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
                 "action": newexportaction,
				
		}, 

        {
			extend: 'pdf',
				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
				titleAttr: 'Pdf',
				title: 'Save as PDF',
                 "action": newexportactiontoPDF,
				
		} 

         ]) // end array

  }

 /////////////end for export import ///////////////


          $('#tblRecords').DataTable({


            "order": [[ 0, 'desc' ]],
            "columnDefs": [
    { "visible": false, "targets": [0] }
    ],

                bServerSide: true,
                sAjaxSource: 'ServiceRenewalMasterHandler.ashx?startDt='+ startDT +'&endDt='+ endDt,
                sServerMethod: 'post',
                "processing": true,
                dom: 'Bfrtip',
                responsive: true,
                buttons: buttons,

                
                "columns": [
                {"data": "lastchangeson"},
                    {  "data": "id" ,
                    
                   render: function (data, type, row, meta) {
            return meta.row + meta.settings._iDisplayStart + 1;
       }
          },


           { "data": "custname"
////                    ,
////                       createdCell: function(td, cellData, rowData, row, col){
//////                        var color = (cellData === 'Surender Singh') ? '#F0F0F0' : 'white';
////                        var color = (cellData != "") ? '#F0F0F0' : 'white';      
////                        $(td).css('background-color', color );
////                        $(td).css('font-weight', 'bold' );
////                      }
                    },
                    { "data": "vehChasisno" },
                     { "data": "vehsaledt" },
                    { "data": "nextserviceduedate" },
                    { "data": "mobileno" },

                    { "data": "modelName" },
                    { "data": "serviceonkm" },
                     
                     
                     { "data": "nextserviceonkm",
                         render: function ( data, type, row )
                        {
                             return "<div class=''>" + row.nextserviceonkm +  '<br/> <p style="color:red;"> (' + parseInt( parseInt(row.servicetypeid) + 1 ) + " Service ) </p></div>";
                        }
                      },
                   
                    { "data": "lastservicefromval" },
//                    { "data": "whatsappno" },
                    
                   

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
//                    ,
//                    {
//                        "data": "id",
//                        "render": function (id, type, full, meta) {
//                            //debugger
//                            return '<a href="#"  onclick="SendFilebyWhatsapp(' + id + ')"><i class="fa fa-whatsapp text-success" style="font-size:x-large;"></i></a>'
//                        }
//                    }
                  
                    
                ]

               ,
               stateSave: true,
                "bDestroy": true,

//                "fnCreatedRow": function (row, data, index) {
//                $('td', row).eq(0).html(index + 1);
//            }



////                dom: 'Bfrtip',

////                 "lengthMenu": [[10, 50, 75, 100, 150, -1], [10, 50, 75, 100, 150, 'All']],
////            "dom": '<"top"Bifpl<"clear">>rt<"bottom"ip<"clear">>',

//      responsive: true,
//        buttons: buttons,


//                , fnRowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
//                            if (aData.olastrenewalfromval == "Others") {
//                                $('td', nRow).css('background-color', '#FEEDF2');
//                            } else {
//                                $('td', nRow).css('background-color', 'white');
//                            }
//                        }

            });

           

}




 function newexportaction()
 {

     var fromDt= $("#txtFromDate").val();
     var toDt= $("#txtToDate").val();

    var searchlastrenewalfromid = $("#ddlSearchLastRenewalFrom :selected").val();
    ///var olastrenewalfromval = $("#ddlSearchLastRenewalFrom :selected").text();

    if(fromDt != "" && toDt !="" && searchlastrenewalfromid >=0)
    {
     var model = {};
     model.fromdt = fromDt;
     model.todt = toDt;
     model.olastrenewalfromid = searchlastrenewalfromid;
    

    $("#Showoverlay").show(); 
     $.ajax({
        type: "POST",
        url: "servicerenewalmaster.aspx/GetFilteredDatainExcel",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Policy Data", true);

         $("#Showoverlay").hide(); 


        }
        });
    }

    else
    {
       $("#Showoverlay").show(); 
       $.ajax({
        type: "POST",
        url: "servicerenewalmaster.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Policy Data", true);

         $("#Showoverlay").hide(); 


        }
        });
    }
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

     var fromDt= $("#txtFromDate").val();
     var toDt= $("#txtToDate").val();
     var searchlastrenewalfromid = $("#ddlSearchLastRenewalFrom :selected").val();

    if(fromDt != "" && toDt !=""  && searchlastrenewalfromid >=0)
    {
     var model = {};
     model.fromdt = fromDt;
     model.todt = toDt;
     model.olastrenewalfromid = searchlastrenewalfromid;

      $("#Showoverlay").show();
     $.ajax({
        type: "POST",
        url: "servicerenewalmaster.aspx/GetFilteredDatainExcel",
       data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
       
         var json = JSON.parse(data.d)
         /////var count = Object.keys(json).length;
         
        if(json == '')
            return;        

       var doc = new jspdf.jsPDF()

        var head = [['ID', 'Customer Name', 'Last Renewal From', 'Veh./Chasis No', 'Due Date', 'Mobile No', 'Whatsapp No', 'Model Name']]
        var body = []
      $.each(json, function (key, item) {
        var data =  [item.id, item.custname, item.lastrenewalfromval, item.vehChasisno, item.duedate, item.mobileno, item.whatsappno, item.modelname];
            body.push(data);
         });

       doc.autoTable({ head: head, body: body })

        // Simple html example
        doc.autoTable({ html: '#tabledata' })

        doc.save('PolicyData.pdf')
         $("#Showoverlay").hide(); 

        }
       });

    }

    else
    {
      $("#Showoverlay").show();
           $.ajax({
        type: "POST",
        url: "servicerenewalmaster.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
       
         var json = JSON.parse(data.d)

         var count = Object.keys(json).length;
         
        if(json == '')
            return;        

       var doc = new jspdf.jsPDF()

        var head = [['ID', 'Customer Name', 'Last Renewal From', 'Veh./Chasis No', 'Due Date', 'Mobile No', 'Whatsapp No', 'Model Name']]
        var body = []
      $.each(json, function (key, item) {

        var data =  [item.id, item.custname, item.lastrenewalfromval, item.vehChasisno, item.duedate, item.mobileno, item.whatsappno, item.modelname];
        body.push(data);
         });

       doc.autoTable({ head: head, body: body })

        // Simple html example
        doc.autoTable({ html: '#tabledata' })

        doc.save('PolicyData.pdf')
         $("#Showoverlay").hide(); 

        }
       });
    }
    
 }    




function AddRecord() {
    var res = validate();
    
    if (res == false) {
        return false;
    }
    
   
    var selectedVal = "";
        selectedVal = $("input[name='rdSelectService']:checked").val();
    
      
    var modelid = $("#ddlModel :selected").val();
    var modelname = $("#ddlModel :selected").text();
    var vehChasisno = $('[id*=txtVehChasisNo]').val();
    var vehsaledt = $('[id*=txtVehSaleDate]').val();
    var custname = $('[id*=txtName]').val();
    var lastservicefromid = $("#ddlLastRenewalFrom :selected").val();
    var lastservicefromval = $("#ddlLastRenewalFrom :selected").text();
    
   
     //var nextserviceduedate = $('[id*=txtNextServiceDueDate]').val();
    var mobileno = $('[id*=txtMobileNo]').val();
    var whatsappno = $('[id*=txtAlternateNo]').val();

    var servicebasedonid = "0";
    var servicebasedon = "";
    if(selectedVal=="1")
    {
        servicebasedonid="1";
        servicebasedon="KM";
    }
    if(selectedVal=="2")
    {
        servicebasedonid="2";
        servicebasedon="Days";
    }
    var servicetypeid = $("#ddlServiceType :selected").val();
    var servicetype =  $("#ddlServiceType :selected").text();
    var serviceonkm = $('[id*=txtCurrentKM]').val();
   
   

   // name = sentenceCase(name);
    var model = {};
    model.modelid = modelid;
    model.modelName = modelname;
//////    model.olastrenewalfromid = olastrenewalfromid;
//////    model.olastrenewalfromval = olastrenewalfromval;
    model.vehChasisno = vehChasisno;
    model.vehsaledt = vehsaledt;
    model.custname = custname;
    model.lastservicefromid = lastservicefromid;
    model.lastservicefromval = lastservicefromval;
    model.mobileno = mobileno;
    model.whatsappno = whatsappno;
    model.servicebasedonid=servicebasedonid;
    model.servicebasedon=servicebasedon;
    model.servicetypeid=servicetypeid;
    model.servicetype=servicetype;
    model.serviceonkm=serviceonkm;

    //        debugger;
    $.ajax({
        type: "POST",
        url: "servicerenewalmaster.aspx/SaveRecord",
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
        url: "servicerenewalmaster.aspx/GetRecordbyID",
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
               
               
                //// $("#ddlModel").val(json[0].modelid);

                ////alert(json[0].modelid);
               
                 GetSelectedModelbyid(json[0].modelid);

               
////                 var vehsaledt = new Date(json[0].vehsaledt.substring(0, 10));
//////                 var servicedt = new Date(json[0].servicedt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
//////                 var nextserviceduedate = new Date(json[0].nextserviceduedate.substring(0, 10));


////                 var vehsaledt = moment(json[0].vehsaledt.substring(0, 10)).format('DD-MMM-YYYY hh:mm A')
////                 var servicedt = moment(json[0].servicedt.substring(0, 10)).format('DD-MMM-YYYY hh:mm A')
////                  var nextserviceduedate = moment(json[0].nextserviceduedate.substring(0, 10)).format('DD-MMM-YYYY hh:mm A')


                var vehsaledt = json[0].vehsaledt.substring(0, 10);
                 var servicedt = json[0].servicedt.substring(0, 10);
                  var nextserviceduedate = json[0].nextserviceduedate.substring(0, 10);

   //////alert(vehsaledt);
                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
                 $('#txtVehSaleDate').val(vehsaledt);
                  $('#txtName').val(json[0].custname);
                    $("#ddlLastRenewalFrom").val(json[0].lastservicefromid);
                $('#txtVehChasisNo').val(json[0].vehChasisno);
                $('#txtCurrentKM').val(json[0].serviceonkm);

                var servicebasedonid=json[0].servicebasedonid;
               
                $(':radio[value="' + servicebasedonid + '"]').attr('checked', 'checked');

               //// GetServiceType();

                GetSelectedServiceType(json[0].modelid, json[0].servicetypeid, vehsaledt, json[0].servicebasedonid);
                  $('#txtNextServiceDueDate').val(nextserviceduedate);
                  $('#txtMobileNo').val(json[0].mobileno);
                     $('#txtAlternateNo').val(json[0].whatsappno);
                   

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
    
     var selectedVal = "";
        selectedVal = $("input[name='rdSelectService']:checked").val();
    
      
    var modelid = $("#ddlModel :selected").val();
    var modelname = $("#ddlModel :selected").text();
    var vehChasisno = $('[id*=txtVehChasisNo]').val();
    var vehsaledt = $('[id*=txtVehSaleDate]').val();
    var custname = $('[id*=txtName]').val();
    var lastservicefromid = $("#ddlLastRenewalFrom :selected").val();
    var lastservicefromval = $("#ddlLastRenewalFrom :selected").text();
    
   
     //var nextserviceduedate = $('[id*=txtNextServiceDueDate]').val();
    var mobileno = $('[id*=txtMobileNo]').val();
    var whatsappno = $('[id*=txtAlternateNo]').val();

    var servicebasedonid = "0";
    var servicebasedon = "";
    if(selectedVal=="1")
    {
        servicebasedonid="1";
        servicebasedon="KM";
    }
    if(selectedVal=="2")
    {
        servicebasedonid="2";
        servicebasedon="Days";
    }
    var servicetypeid = $("#ddlServiceType :selected").val();
    var servicetype =  $("#ddlServiceType :selected").text();
    var serviceonkm = $('[id*=txtCurrentKM]').val();
    ////name = sentenceCase(name);
    if (id > 0) {
         var model = {};
         model.id = id;
          model.modelid = modelid;
    model.modelName = modelname;
//////    model.olastrenewalfromid = olastrenewalfromid;
//////    model.olastrenewalfromval = olastrenewalfromval;
    model.vehChasisno = vehChasisno;
    model.vehsaledt = vehsaledt;
    model.custname = custname;
    model.lastservicefromid = lastservicefromid;
    model.lastservicefromval = lastservicefromval;
    model.mobileno = mobileno;
    model.whatsappno = whatsappno;
    model.servicebasedonid=servicebasedonid;
    model.servicebasedon=servicebasedon;
    model.servicetypeid=servicetypeid;
    model.servicetype=servicetype;
    model.serviceonkm=serviceonkm;

        $.ajax({
            type: "POST",
            url: "servicerenewalmaster.aspx/UpdateRecord",
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
            url: "servicerenewalmaster.aspx/DeleteRecord",
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

 $("#tblUploadedFiles").dataTable().fnDestroy();
$('#tblUploadedFiles tbody').empty();
 $('#recordID').val('0');

    $('#txtName').val("");

    $('#ddlLastRenewalFrom').prop("selectedIndex", 0);
   //// $('#ddlModel').prop("selectedIndex", 0);
    $("#ddlModel").select2("val", "0");
   

////      $("#ddlLastRenewalFrom :selected").val("0");
////      $("#ddlLastRenewalFrom :selected").text("Please Select");
       $('#txtVehChasisNo').val("");
        $('#txtDueDate').val("");
        $('#txtMobileNo').val("");
         $('#txtAlternateNo').val("");
////         $("#ddlModel :selected").val("0");
////         $("#ddlModel :selected").text("Please Select");

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtName').css('border-color', 'lightgrey');
    $('#ddlLastRenewalFrom').css('border-color', 'lightgrey');
    $('#txtVehChasisNo').css('border-color', 'lightgrey');
    $('#txtDueDate').css('border-color', 'lightgrey');
    $('#txtMobileNo').css('border-color', 'lightgrey');
    $('#txtAlternateNo').css('border-color', 'lightgrey');
    $('#ddlModel').css('border-color', 'lightgrey');
   

    $("#lblMessage").html("");
    $("#postedFile").val('');

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

    if ($('#ddlLastRenewalFrom :selected').val().trim() == "0") {
        $('#ddlLastRenewalFrom').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlLastRenewalFrom').css('border-color', 'lightgrey');
    }

    if ($('#txtVehChasisNo').val().trim() == "") {
        $('#txtVehChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehChasisNo').css('border-color', 'lightgrey');
    }

////////    if ($('#txtNextServiceDueDate').val().trim() == "") {
////////        $('#txtNextServiceDueDate').css('border-color', 'Red');
////////        isValid = false;
////////    }
////////    else {
////////        $('#txtNextServiceDueDate').css('border-color', 'lightgrey');
////////    }

    if ($('#txtMobileNo').val().trim() == "") {
        $('#txtMobileNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobileNo').css('border-color', 'lightgrey');
    }

////    if ($('#txtAlternateNo').val().trim() == "") {
////        $('#txtAlternateNo').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtAlternateNo').css('border-color', 'lightgrey');
////    }

 if ($('#ddlServiceType :selected').val().trim() == "0") {
        $('#ddlServiceType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlServiceType').css('border-color', 'lightgrey');
    }



    if ($('#ddlModel :selected').val().trim() == "0") {
        $('#ddlModel').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlModel').css('border-color', 'lightgrey');
    }

    return isValid;
}




