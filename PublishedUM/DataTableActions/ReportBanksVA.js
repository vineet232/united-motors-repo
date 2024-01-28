
$(document).ready(function () {
   

    $("#Showoverlay").show();
 
    $.ajax({
        type: "POST", url: "reportbanksVA.aspx/GetAllBanksList",
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
    
})


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


var bankID = $("#ddlBanks :selected").val();
var startDT = $("#txtStartDate").val();
var endDt = $("#txtEndDate").val();

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


$("#Showoverlay").show();
 $("#tblRecords").dataTable().fnDestroy();

 var i = 1;

            $('#tblRecords').DataTable({
                "order": [[1, 'asc']],
               "lengthMenu": [[5000000], ["All"]],
             bServerSide: true,
             sAjaxSource: 'reportBankHandlerVA.ashx?bankID=' + bankID +'&startDt='+ startDT +'&endDt='+ endDt,
                sServerMethod: 'post',
                "processing": true,
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
                    { "data": "trnsdescription" },
                    
                    { "data": "remarksorchequeno" },
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


                    { "data": "trndate" },
                    { "data": "amountpaid" },
                     { "data": "amountreceived" },
                   { "data": "RunningBalance" }

                  

                  
                    
                ],

            });

             $("#Showoverlay").hide();
  }




