
$(document).ready(function () {
   

    $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "reportvendors.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlVendors").append($("<option></option>").val(value.id).html(value.vendorname));
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


function btnReset()
{

    $("#txtStartDate").val("");
    $("#txtEndDate").val("");


      $.ajax({
        type: "POST", url: "reportvendors.aspx/GetAllVendorsList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlVendors").append($("<option></option>").val(value.id).html(value.vendorname));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
           
        }

    });

}

function BindDataTableNew()
{

var vendorID = $("#ddlVendors :selected").val();
var startDT = $("#txtStartDate").val();
var endDt = $("#txtEndDate").val();

if(vendorID<=0)
{
    $.notify("Please select vendor first!", "error");
    return;
}

if((startDT != "" && endDt == "") || (startDT == "" && endDt != ""))
{
    $.notify("Please select start date and end date!", "error");
    return;
}

  var model = {};
        obj.vendorid = vendorID;
        obj.startdate = startDT;
        obj.enddate = endDt;

////alert(vendorID + startDT + endDt);

 $("#Showoverlay").show();
    $.ajax({
            type: "POST",
            url: "reportvendors.aspx/GetVendorsTransactionsbyID",
            ///data: '{ vendid :'+ vendorID + ', startdt'+ startDT + ', enddt' + endDt + '}',
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

   
   ////alert(response.d.length);

    $("[id*=tblRecords]").DataTable(
        {
            bLengthChange: true,
            lengthMenu: [[10, 50, -1], [10, 50, "All"]],
            bFilter: true,
            bSort: true,
            bPaginate: true,
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
                    {  "data": "srno" 
                    ,
                     
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "trndate" },
                   { "data": "paymentmode" },

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

                    { "data": "remarks" },
                   
                    { "data": "AmountReceived" },
                     { "data": "Payments" },
                   { "data": "RunningBalance" }
                  
                    
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

    };






////function BindDataTable() {


////var vendorID = $("#ddlVendors :selected").val();
////var startDT = $("#txtStartDate").val();
////var endDt = $("#txtEndDate").val();

////if(vendorID<=0)
////{
////    $.notify("Please select vendor first!", "error");
////    return;
////}

////if((startDT != "" && endDt == "") || (startDT == "" && endDt != ""))
////{
////    $.notify("Please select start date and end date!", "error");
////    return;
////}

////$("#Showoverlay").show();
//// $("#tblRecords").dataTable().fnDestroy();

//// var i = 1;

////            $('#tblRecords').DataTable({
////                "order": [[3, 'desc']],
////                "lengthMenu": [[5000000], ["All"]],
////             bServerSide: true,
////             sAjaxSource: 'reportVendorHandler.ashx?VendorID=' + vendorID +'&startDt='+ startDT +'&endDt='+ endDt,
////                sServerMethod: 'post',
////                "processing": true,
////                "columns": [


////                    {
////                    "render": function (data, type, row, meta) {
////                     return meta.row + meta.settings._iDisplayStart + 1;
////                     }
////                    },


////                    { "data": "trndate" },
////                    
////                    { "data": "InvoiceNo"
////                    //,
//////                         render: function ( data, type, row )
//////                        {
//////                         return "<div class='text-nowrap'>"  + row.paymentto + '<br />' + row.paymenttobank +  "</div>";
//////                        }
////                     },
////                    { "data": "trnType" },
////                    
//////                    { "data": "paymentmode" },

////                    { "data": "paymentmode",
////                        render: function ( data, type, row )
////                        {
////                       ////// alert(row.custpaymentmodeid);   || row.paymentmodeid == "4" || row.paymentmodeid == "5"
////                         //// if(row.paymentmodeid == "3" || row.paymentmodeid == "4" || row.paymentmodeid == "5" || row.paymentmodeid == "6" || row.paymentmodeid == "7") 

////                          if(row.paymentmodeid >= 50) 
////                          {
////                         ////return "<div class='text-nowrap'>" + row.paymentmode +  "</div>";
////                            return "<div class='text-nowrap'>" + row.paymentmode + '<br/> <p style="font-size:x-small;"> ' + row.pmodebankname + '  </p>' + "</div>";
////                         }
////                         else
////                         {
////                          return "<div class='text-nowrap'>" + row.paymentmode +  "</div>";
////                         }

////                        }
////                     },

////                    { "data": "remarks" },
////                   
////                    { "data": "AmountReceived" },
////                     { "data": "Payments" },
////                   { "data": "RunningBalance" }

////                  

////                  
////                    
////                ],

////            });

////             $("#Showoverlay").hide();
////  }




