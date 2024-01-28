

$(function () {
    ////$("#Showoverlay").show();
    BindDataTable();
});


function BindDataTable() {

 $("#tblRecords").dataTable().fnDestroy();

 var i = 1;

            $('#tblRecords').DataTable({
               ////// "order": [[2, 'desc']],
               
             bServerSide: true,
             sAjaxSource: 'DeletedSaleTransactionInsuranceDetailsHandler.ashx/GetSaleTransactionDetailsData',
                sServerMethod: 'post',
                "processing": true,
                "columns": [
                 { "data": "id" ,
      "render": function(data, type, full, meta) {
        return i++;
      }},

////                    { "data": "accounttype" },
                    { "data": "invoicedt" },
                    { "data": "invoiceno" },
                    { "data": "vehchasisno" },
                    { "data": "salesexecutive" },
                    { "data": "vendorname" },
                    { "data": "venpaymentamt" },
                    { "data": "payout" },
                    { "data": "payoutpaymentamt" },
                    { "data": "customername" },
                    { "data": "custpaymentmode" },
                    { "data": "custpaymentamt" },
                    { "data": "ocreatedby",
                        render: function ( data, type, row )
                        {
                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                         return "<div class='text-nowrap'>" + row.ocreatedby + '(' + cdate + ')  <br/>' + row.oupdatedby + '(' + udate + ')' + "</div>";
                        }
                     },
                   {
                       "data": "deletedby",
                       render: function ( data, type, row )
                        {
                         var deldate = new Date(row.deletedon).format('dd-MMM-yyyy HH:mm:ss')

                         return "<div class='text-nowrap'>" + row.deletedby + ' <br />' + deldate +  "</div>";
                        }
                   },
                    {
                        "data": "id",
////                        "render": function (id, type, full, meta) {
////                            //debugger
////                            ///return '<a href="#" onclick="RestoreRecord(' + id + ')"><i class="glyphicon glyphicon-send text-success" style="font-size:x-large;"></i></a>'

////                            
////                            ////'<a href="#" class="btn btn-info" onclick="OpenStockModal(\'' + item.dressname + ',' + item.id + '\'\)">' + "Stock Details"
////                        }

                        "render": function ( data, type, row )
                        {
                         return '<a href="#" onclick="RestoreRecord(\'' + row.invoiceno  + '\'\)"><i class="glyphicon glyphicon-send text-success" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ],
                 "columnDefs": [
                                { "visible": false, "targets": [] }
                              ],

                                responsive: true,

            });


            }




function RestoreRecord(invno) {
//////alert(invno);

    if (confirm('Are you sure to restore this record?')) {
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "DeletedEnteriesSaleTrnInsurance.aspx/RestoreRecord",
            data: '{ invoiceno :' + JSON.stringify(invno) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
            
            if (r.d == 0) {
                $.notify("Error!! Record not restored!", "error");
                $('[id*=txtMobile]').focus();
                return;
            }
               
                else {
                    $("#Showoverlay").hide();
                    BindDataTable();
                    $.notify("Record restored!", "success");
                }
            },
            error: function (errormessage) {
                $.notify("Error while restoring data!", "error");
            }

        });
        $("#Showoverlay").hide();
    }
 }