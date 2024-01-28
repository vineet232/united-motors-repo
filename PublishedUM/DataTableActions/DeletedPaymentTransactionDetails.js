
$(function () {
    ////$("#Showoverlay").show();
    BindDataTable();
});


function BindDataTable() {

 $("#tblRecords").dataTable().fnDestroy();

 var i = 1;

            $('#tblRecords').DataTable({
               // "order": [[1, 'desc']],
               
             bServerSide: true,
             sAjaxSource: 'DeletedpaymenttransactionsHandler.ashx/GetPaymentTransactionData',
                sServerMethod: 'post',
                "processing": true,
                "columns": [
                 { "data": "id" ,
      "render": function(data, type, full, meta) {
        return i++;
      }},

////                    { "data": "accounttype" },
                    { "data": "paymentdt" },
                    { "data": "accounttype" },
                    { "data": "paymentto",
                         render: function ( data, type, row )
                        {
                        if( row.paymenttobank.toLowerCase()=="please select")
                          {
                          row.paymenttobank="";
                          }
                         return "<div class='text-nowrap'>"  + row.paymentto + '<br />' +   row.paymenttobank +  "</div>";
                        }
                     },
                    { "data": "paymentmode" },
                    { "data": "paymentreceipt" },
                    { "data": "amount" },
                    { "data": "ocreatedby",
                        render: function ( data, type, row )
                        {
                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

                         return "<div class='text-nowrap'>" + row.ocreatedby + '(' + cdate + ')  <br/>' + row.oupdatedby + '(' + udate + ')' + "</div>";
                        }
                     },
//                    { "data": "remarks" },
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
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#" onclick="RestoreRecord(' + id + ')"><i class="glyphicon glyphicon-send text-success" style="font-size:x-large;"></i></a>'
                        }
                    }
                    
                ],
                 "columnDefs": [
                                { "visible": false, "targets": [] }
                              ],

                                responsive: true,

            });


            }




function RestoreRecord(id) {
///////alert(id);
    if (confirm('Are you sure to restore this record?')) {
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "DeletedEnteriesPayment.aspx/RestoreRecord",
            data: '{ id :' + id + '}',
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
