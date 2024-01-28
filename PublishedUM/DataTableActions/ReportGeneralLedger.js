
$(document).ready(function () {
   

    $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "reportgeneralledger.aspx/GetAllGeneralLedgersList",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
        ////$('#ddlPaymentTo').find('option:not(:first)').remove();
            $.each(res.d, function (data, value) {

                $("#ddlGeneralLedger").append($("<option></option>").val(value.id).html(value.glname));
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


var ledgerID = $("#ddlGeneralLedger :selected").val();
var startDT = $("#txtStartDate").val();
var endDt = $("#txtEndDate").val();

if(ledgerID<=0)
{
    $.notify("Please select ledger first!", "error");
    return;
}

if((startDT != "" && endDt == "") || (startDT == "" && endDt != ""))
{
    $.notify("Please select start date and end date!", "error");
    return;
}

$("#Showoverlay").show();
 $("#tblRecords").dataTable().fnDestroy();

 var i = 1;

            $('#tblRecords').DataTable({
                "order": [[3, 'desc']],
               
             bServerSide: true,
             sAjaxSource: 'reportGeneralLedgerHandler.ashx?ledgerID=' + ledgerID +'&startDt='+ startDT +'&endDt='+ endDt,
                sServerMethod: 'post',
                "processing": true,
                "columns": [


{
"render": function (data, type, row, meta) {
        return meta.row + meta.settings._iDisplayStart + 1;
        }
        },


                    { "data": "trndate" },
                    
                    { "data": "mode"
                    //,
//                         render: function ( data, type, row )
//                        {
//                         return "<div class='text-nowrap'>"  + row.paymentto + '<br />' + row.paymenttobank +  "</div>";
//                        }
                     },
                    { "data": "remarks" },
                    
                   //// { "data": "paymentmode" },

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


                    { "data": "amountpaid" },
                   
                    { "data": "AmountReceived" },
                    
                   { "data": "RunningBalance" }

                  

                  
                    
                ],

            });

             $("#Showoverlay").hide();
  }




