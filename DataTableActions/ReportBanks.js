
var runningTotal= 0;
var recordsTotal;

$(document).ready(function () {
   

    $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "reportbanks.aspx/GetAllBanksList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlBanks").append($("<option></option>").val(value.id).html(value.bankname));
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
    
});

function btnReset()
{
    $("#txtStartDate").val("");
    $("#txtEndDate").val("");


     $.ajax({
        type: "POST", url: "reportbanks.aspx/GetAllBanksList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlBanks").append($("<option></option>").val(value.id).html(value.bankname));
            })
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            ////$("#Showoverlay").show();
        }

    });

}


function BindDataTable() {
  
  /////var runningTotal=0;

var bankID = $("#ddlBanks :selected").val();
var bankName = $("#ddlBanks :selected").text();
var startDT = $("#txtStartDate").val();
var endDt = $("#txtEndDate").val();
 runningTotal= $("#hdnRunningTotal").val();


if(bankID<=0)
{
    $.notify("Please select bank first!", "error");
    return;
}

if((startDT != "" && endDt == "") || (startDT == "" && endDt != ""))
{
    $.notify("Please select start date and end date!", "error");
    return;
}

 ///alert(runningTotal);

$("#Showoverlay").show();
$("#tblRecords").dataTable().fnDestroy();


///// alert(runningTotal);
 var i = 1;

            $('#tblRecords').DataTable({


//            "footerCallback": function ( row, data, start, end, display ) {
//            var api = this.api(), data;
// 
//            // converting to interger to find total
//            var intVal = function ( i ) {
//                return typeof i === 'string' ?
//                    i.replace(/[\$,]/g, '')*1 :
//                    typeof i === 'number' ?
//                        i : 0;
//            };
// 
//            // computing column Total of the complete result 
////            var monTotal = api
////                .column( 1 )
////                .data()
////                .reduce( function (a, b) {
////                    return intVal(a) + intVal(b);
////                }, 0 );
////				
////	    var tueTotal = api
////                .column( 2 )
////                .data()
////                .reduce( function (a, b) {
////                    return intVal(a) + intVal(b);
////                }, 0 );
////				
////            var wedTotal = api
////                .column( 3 )
////                .data()
////                .reduce( function (a, b) {
////                    return intVal(a) + intVal(b);
////                }, 0 );
////				
////	     var thuTotal = api
////                .column( 4 )
////                .data()
////                .reduce( function (a, b) {
////                    return intVal(a) + intVal(b);
////                }, 0 );
////				
////	     var friTotal = api
////                .column( 5 )
////                .data()
////                .reduce( function (a, b) {
////                    return intVal(a) + intVal(b);
////                }, 0 );



//                 var myTotal = api
//                .column( 8 )
//                .data()
//                .reduce( function (a, b) {
//                    return intVal(a) + intVal(b);
//                }, 0 );

//			
//				
//            // Update footer by showing the total with the reference of the column index 
//	    $( api.column( 0 ).footer() ).html('Total');
//            $( api.column( 1 ).footer() ).html(monTotal);
//            $( api.column( 2 ).footer() ).html(tueTotal);
//            $( api.column( 3 ).footer() ).html(wedTotal);
//            $( api.column( 4 ).footer() ).html(thuTotal);
//            $( api.column( 5 ).footer() ).html(friTotal);

//             $( api.column( 8 ).footer() ).html(myTotal);
//        },


            



//                "order": [[6, 'asc']],
               "lengthMenu": [[10, 50, 100, 5000000], [10, 50, 100, "All"]],
                
             bServerSide: true,

             sAjaxSource: 'reportBankHandler.ashx?bankID=' + bankID +'&startDt='+ startDT +'&endDt='+ endDt +'&runningtotal='+ runningTotal,
                sServerMethod: 'post',
                "processing": true,


//                 dataSrc: function ( data ) {
//           recordsTotal = data.RunningBalance;
//           alert(recordsTotal);
//           return data.data;
//         } ,


////                dom: 'Bfrtip',
////                 buttons: [  
////                 {
////                 extend: 'excel',
////                        messageTop: 'Account- ' + bankName
////                    },
////                    {
////                 extend: 'pdf',
////                        messageTop: 'Account-' + bankName
////                    }

////                 ],
////                 'copy',, 'csv'
                "columns": [


{
"render": function (data, type, row, meta) {

        return meta.row + meta.settings._iDisplayStart + 1;
        }
        },


                    { "data": "bank" },
                    
                    { "data": "category"
                    //,
//                         render: function ( data, type, row )
//                        {
//                         return "<div class='text-nowrap'>"  + row.paymentto + '<br />' + row.paymenttobank +  "</div>";
//                        }
                     },
//                    { "data": "trnsdescription" },
                    
                    { "data": "remarksorchequeno" },
                    ///{ "data": "paymentmode" },

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


                    { "data": "trndate" },
                    { "data": "amountpaid" },
                     { "data": "amountreceived" },
                   { "data": "RunningBalance",
                   render: function ( data, type, row )
                        {
                       
                      runningTotal+= $("#hdnRunningTotal").val(row.RunningBalance)
                        $("#lblRunningDifference").val(row.RunningBalance)
                       

                        return "<div class='text-nowrap'>" + row.RunningBalance  + "</div>";
                        }
                    
                    }

                  

                  
                    
                ],

//                drawCallback: function( settings ) {
//        var api = this.api();
// 
//        $( api.column( 8 ).footer() ).html(
//          'Total Records: '+ $("#lblRunningDifference").val();
//            );
//        }



//                "initComplete": function (settings, json) {
//               
//               this.api().columns('.sum').every(function () {
//            var column = this;

//             var intVal = function (i) {
//                return typeof i === 'string' ?
//                i.replace(/[\$,]/g, '') * 1 :
//                    typeof i === 'number' ?
//                        i : 0;
//            };

//            var sum = column
//                .data()
//                .reduce(function (a, b) {
//                    return intVal(a) + intVal(b);
//                });


//               /// alert(sum);

//                $(column.footer()).html('Sum: ' + sum);

//            });
//                }


//                ,

//                "footerCallback": function ( row, data, start, end, display ) {
//            var api = this.api();
// 
//            // Remove the formatting to get integer data for summation
//            var intVal = function ( i ) {
//                return typeof i === 'string' ?
//                    i.replace(/[\$,]/g, '')*1 :
//                    typeof i === 'number' ?
//                        i : 0;
//            };
// 
//            // Total over all pages
//            total = api
//                .column( 8 )
//                .data()
//                .reduce( function (a, b) {
//                    return intVal(a) + intVal(b);
//                }, 0 );
// 
//            // Total over this page
//            pageTotal = api
//                .column( 8, { page: 'current'} )
//                .data()
//                .reduce( function (a, b) {
//                    return intVal(a) + intVal(b);
//                }, 0 );
// 
//            // Update footer
//            $( api.column( 8 ).footer() ).html(
//                '$'+pageTotal +' ( $'+ total +' total)'
//            );
//        }



// "createdRow": function ( row, data, index ) {
////            if ( data[5].replace(/[\$,]/g, '') * 1 > 150000 ) {
////                $('td', row).eq(5).addClass('highlight');
////            }
//        }






            });

             $("#Showoverlay").hide();
  }




