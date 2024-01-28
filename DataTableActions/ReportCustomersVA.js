
$(document).ready(function () {
   

    $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "rptCustomersVA.aspx/GetAllCustomersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlCustomers").append($("<option></option>").val(value.id).html(value.custname));
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


        $('#txtStartDate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });

        $('#txtEndDate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });
    
})


function BindDataTable() {


var customerID = $("#ddlCustomers :selected").val();
var startDT = $("#txtStartDate").val();
var endDt = $("#txtEndDate").val();

if(customerID<=0)
{
    $.notify("Please select customer first!", "error");
    return;
}

if((startDT != "" && endDt == "") || (startDT == "" && endDt != ""))
{
    $.notify("Please select start date and end date!", "error");
    return;
}

$("#Showoverlay").show();
 $("#tblRecords").dataTable().fnDestroy();


 /////////////for export import ///////////////

  var show = false;
 var printPermission= $("#hdnPrintPermission").val();
 ///alert(printPermission);

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

  //////////////End for import export /////////////////////


 var i = 1;

            $('#tblRecords').DataTable({
                "order": [[3, 'desc']],
               "lengthMenu": [[5000000], ["All"]],
             bServerSide: true,
             sAjaxSource: 'reportCustomersHandlerva.ashx?CustomerID=' + customerID +'&startDt='+ startDT +'&endDt='+ endDt,
                sServerMethod: 'post',
                "processing": true,
                  dom: 'Bfrtip',
                responsive: true,
                buttons: buttons,

                "columns": [
//                 { "data": "srno" },

//                { 
//      "render": function(data, type, full, meta) {
//        return i++;
//      }},

{
"render": function (data, type, row, meta) {
        return meta.row + meta.settings._iDisplayStart + 1;
        }
        },

///                   { "data": "accounttype" },
                    { "data": "trndate" },
                    { "data": "vehicleno" },
                    { "data": "InvoiceNo"
                    //,
//                         render: function ( data, type, row )
//                        {
//                         return "<div class='text-nowrap'>"  + row.paymentto + '<br />' + row.paymenttobank +  "</div>";
//                        }
                     },
                    { "data": "trnType" },
                    
                   { "data": "paymentmode",
                        render: function ( data, type, row )
                        {
                       ////// alert(row.custpaymentmodeid);   || row.paymentmodeid == "4" || row.paymentmodeid == "5"
                         //// if(row.paymentmodeid == "3" || row.paymentmodeid == "4" || row.paymentmodeid == "5" || row.paymentmodeid == "6" || row.paymentmodeid == "7") 

                          if(row.paymentmodeid >= 50) 
                          {
                         ////return "<div class='text-nowrap'>" + row.paymentmode +  "</div>";
                            return "<div class='text-nowrap'>" + row.paymentmode + '<br/> <p style="font-size:x-small;"> ' + row.pmodebankname + '  </p>' + "</div>";
                         }
                         else
                         {
                          return "<div class='text-nowrap'>" + row.paymentmode +  "</div>";
                         }

                        }
                     },
                    { "data": "sales" },
                    { "data": "AmountReceived" },
                     { "data": "remarks" },
                   { "data": "RunningBalance" }

                  

                  
                    
                ],
//                 "columnDefs": [
//                                { "visible": false, "targets": [0] }
//                              ],
            });

             $("#Showoverlay").hide();
            }





function newexportaction()
 {

    var customerID = $("#ddlCustomers :selected").val();
var startDT = $("#txtStartDate").val();
var endDt = $("#txtEndDate").val();


    if(startDT != "" && endDt != "" && customerID != "0" )
    {
     var model = {};
     model.fromdt = startDT;
     model.todt = endDt;
     model.customerID = customerID;
    

    $("#Showoverlay").show(); 
     $.ajax({
        type: "POST",
        url: "rptCustomersVA.aspx/GetFilteredDatainExcel",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Customer Report", true);

         $("#Showoverlay").hide(); 


        }
        });
    }

    else
    {
       $("#Showoverlay").show(); 
       $.ajax({
        type: "POST",
        url: "rptCustomersVA.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Customer Report", true);

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
    var fileName = "CustomerReportVipin_";
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
        url: "rptCustomersVA.aspx/GetFilteredDatainExcel",
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
        url: "rptCustomersVA.aspx/GetDatainExcel",
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

        doc.save('CustomerVipinAutomobiles.pdf')
         $("#Showoverlay").hide(); 

        }
       });
    }
    
 }    






function Reset()
{
 $('#recordID').val('0');
 $('#ddlCustomers').prop("selectedIndex", 0);

 $('#txtStartDate').val("");
 $('#txtEndDate').val("");
}

//Function for clearing the textboxes  
function clearTextBox() {

 $('#recordID').val('0');
 

 $('#ddlCustomers').prop("selectedIndex", 0);
 $('#txtStartDate').val("");
 $('#txtEndDate').val("");
 
    $('#txtStartDate').css('border-color', 'lightgrey');
    $('#txtEndDate').css('border-color', 'lightgrey');

}
//Valdidation using jquery  
function validate() {
    var isValid = true;


    if ($('#ddlCustomers :selected').val().trim() == "0") {
        $('#ddlCustomers').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlCustomers').css('border-color', 'lightgrey');
    }

    
    if ($('#txtStartDate').val().trim() == "") {
        $('#txtStartDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtStartDate').css('border-color', 'lightgrey');
    }
    
    if ($('#txtEndDate').val().trim() == "") {
        $('#txtEndDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtEndDate').css('border-color', 'lightgrey');
    }
    
    return isValid;
}




