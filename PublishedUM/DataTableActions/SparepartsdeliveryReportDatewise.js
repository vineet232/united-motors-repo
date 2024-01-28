$(document).ready(function () {

    $('#txtfromdate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

    $('#txttodate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
})


function ShowReportDatewise()
{

    var fromdt = $('#txtfromdate').val();
    var todt = $('#txttodate').val();

    
    if(fromdt == "" || todt == "")
    {
        $.notify("please enter from and to date!!","error");
        return;
    }
    else{
       var model={};
       model.fromdt=fromdt;
       model.todt=todt;

       $.ajax({
        type: "POST",
        url : "sparepartsdeliveryreportdatewise.aspx/GetSparePartsOutwardDatewiseReport",
        data : "{model:" + JSON.stringify( model) + "}",
        dataType : "json",
        contentType : "application/json",

//        success : function (res)
//        {


//            BindDataTable(res);
//        },

            success: OnSuccess,
            failure: function (response) {
                alert(response.d);
            },

        error: function (response) {
             ///alert(response.responseText);
             $.notify("BOOM!", "error");
             }
       })


       // $.ajax({
//       type: "POST",
//        url: "sparepartsdeliveryreportdatewise.aspx/GetSparePartsOutwardDatewiseReport",
//         data: '{ model :' + JSON.stringify(model) + '}',
//        dataType: "json",
//        contentType: "application/json",
//        success: function (res) {
            /////alert(res.d);

    }   
}



function OnSuccess(response) {

   
   ////alert(response.d);

//   /////////////for export import ///////////////
// var show = false;
// var printPermission= $("#hdnPrintPermission").val();
// ////alert(printPermission);

// if(printPermission == "1")
// {
//    show = true;
// }

// 
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
//                // "action": newexportaction,
//				
//		}, 

//        {
//			extend: 'pdf',
//				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
//				titleAttr: 'Pdf',
//				title: 'Save as PDF',
//                // "action": newexportactiontoPDF,
//				
//		} 

//         ]) // end array

//  }

// /////////////end for export import ///////////////

 
    $("[id*=tblRecords]").DataTable(
        {
            bLengthChange: true,
            lengthMenu: [[10, 50, -1], [10, 50, "All"]],
            bFilter: true,
            bSort: true,
            bPaginate: true,

            //// "sPaginationType": "input",
            
            dom: 'Bfrtip',
            responsive: true,
            ///buttons: buttons,

            data: JSON.parse( response.d),


                      "columns": [
                    {  "data": "id" 
                    ,
                     
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "invoicechallanno" },
                    { "data": "vehicleno" },

                    { "data": "partno" },
                    { "data": "particulars" },

                        
                     { "data": "qty" },
                     { "data": "createdby",
                        render: function ( data, type, row )
                        {

                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')

                         return "<div class='text-nowrap'>" + row.createdby + '<br/>(' + cdate + ')  <br/>' + row.updatedby + '<br/>(' + udate + ')' + "</div>";
                        }
                     },
                  
                    
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




function BindDataTable(response)
{
   $("tblRecords").dataTable().fnDestroy();

  
   alert(response.d);
   $("tblRecords").dataTable({

   bLengthChange: true,
            lengthMenu: [[10, 50, -1], [10, 50, "All"]],
            bFilter: true,
            bSort: true,
            bPaginate: true,

             "sPaginationType": "input",
            
            dom: 'Bfrtip',
            responsive: true,
            ////buttons: buttons,

            data: response.d,

              "columns": [
                    {  "data": "id" 
                    ,
                     
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "partno" },
//                    { "data": "accounttype" },

//                    { "data": "vehno" },
//                    { "data": "contactno" },

                     ],
                 stateSave: true,
                "bDestroy": true


////    "columns": [
////                    {  "data": "id" 
////                    ,
////                     
////                     bSortable: false,
////                      render: function (data, type, row, meta) {
////                     return meta.row + meta.settings._iDisplayStart + 1;
////                    }
////                    },

////                     { "data": "partno" },

////                    { "data": "particulars" },
////////                    { "data": "challandate",
////////                    
////////                     render: function ( data, type, row )
////////                        {
////////                            if(row.statusid=="1")
////////                            {
////////                                return   row.challandate ;
////////                            }
////////                            if(row.statusid=="2")
////////                            {
////////                                return  "<div style='color:red;'>" + "CH/" +  row.challanno + "</div>" + "<br/>" + row.challandate ;
////////                            }
////////                     }

////////                     },

////                    { "data": "qty" },
////                    { "data": "invoicechallanno" },
////                     
////                      { "data": "vehicleno" },
////                   

////////                     { "data": "servicetype"},
////////                    { "data": "status"
////////                    
////////                    ,
////////                      render: function ( data, type, row )
////////                        {
////////                        
////////                             var status=row.statusid;
////////                               if (status == "1") 
////////                               {                               
////////                                    return '<a href="#" ><i class="glyphicon glyphicon-ok text-success" style="font-size:x-large;"></i></a>';
////////                                }
////////                                else
////////                                {
////////                                 return  '<a href="#" ><i class="glyphicon glyphicon-remove text-danger" style="font-size:x-large;"></i></a>';
////////                                }
////////                       }
////////                     },


////                   { "data": "createdby",
////                        render: function ( data, type, row )
////                        {

////                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
////                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')

////                         return "<div class='text-nowrap'>" + row.createdby + '<br/>(' + cdate + ')  <br/>' + row.updatedby + '<br/>(' + udate + ')' + "</div>";
////                        }
////                     },
////                    
////                ],




////                // stateSave: true,
////                "bDestroy": true, 
////                responsive: true,


   });
}