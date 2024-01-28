





$(function () {
    //$("#Showoverlay").show();
    //GetData();

    BindDataTable();
});

function BindDataTable() {


    $("#tblRecords").dataTable().fnDestroy();
    //var i = 1;

    $('#tblRecords').DataTable({
       /////// "order": [[0, 'asc']],
        "columnDefs": [
    { "visible": false, "targets": [1] }
    ],


        bServerSide: true,
        sAjaxSource: 'AllEnteriesFitnessHandler.ashx/GetFitnessList',
        sServerMethod: 'post',
        "processing": true,



        "columns": [
        //                {"data": "employeename"},
                    {"data": "id" ,
                         bSortable: false,
                         render: function (data, type, row, meta) {
                             return meta.row + meta.settings._iDisplayStart + 1;
                         }
                     },
                   { "data": "saletransactionid",
                       render: function (data, type, row) {
                           return row.saletransactionid + '<br /> -------- <br />(' + row.invoicedt + ')';
                       }
                   },

                    { "data": "accounttype",
                        render: function (data, type, row) {
                            return row.accounttype + '<br /> -------- <br />' + row.customername + '';
                        }
                    },
                    { "data": "invoicetype",
                        render: function (data, type, row) {

                            //                            if (row.paymenttobank == "") {
                            //                                row.paymenttobank = "None";
                            //                            }
                            //return row.paymenttobank + '<br /> -------- <br /> ' + row.paymentmode + '<br /> -------- <br />' + row.paymentreceipt + '<br /> -------- <br />  ' + row.amount + '';
                            return "<div class='text-nowrap'>" + '<b style="color:green;"> Bank- </b>' + row.invoicetype + '<br /> <b style="color:green;"> Inv#- </b> ' + row.invoiceno + '<br /> <b style="color:green;">Mode-</b> ' + row.paymentmode + '<br /> <b style="color:green;">Amount-</b> ' + row.amount + '<br /> <b style="color:green;">Discount-</b> ' + row.discount + '<br /> <b style="color:green;">Veh#-</b> ' + row.vehchasisno + '' + "</div>";
                        }
                    },



                     { "data": "oldinvoicedt",
                         render: function (data, type, row) {
                             return "<div class='text-nowrap'>" + '<b style="color:red;"> Dt- </b>' + row.oldinvoicedt + '<br /> <b style="color:red;"> Cust.- </b> ' + row.oldcustomername + '<br /> <b style="color:red;">Type-</b> ' + row.oldinvoicetype + '<br /> <b style="color:red;">Inv#-</b> ' + row.oldinvoiceno + '' + "</div>";
                         }
                     },
                    { "data": "oldpaymentmodeid",
                        render: function (data, type, row) {
                            return "<div class='text-nowrap'>" + '<b style="color:red;"> Mode- </b>' + row.oldpaymentmode + '<br /> <b style="color:red;"> Amt- </b> ' + row.oldamount + '<br /> <b style="color:red;">Discount-</b> ' + row.olddiscount + '<br /> <b style="color:red;">Veh#-</b> ' + row.oldvehchasisno + '<br /> <b style="color:blue;">Last Trn-</b> ' + row.remarks + '' + "</div>";
                        }
                    },
                    { "data": "createdon",
                        render: function (data, type, row) {
                            return "<div class='text-nowrap'>" + '<b style="color:red;"> On- </b>' + row.createdon + '<br /> <b style="color:red;"> By- </b> ' + row.createdby + '<br /> <b style="color:red;">IP-</b> ' + row.createdip + '' + "</div>";
                        }
                    },
                    { "data": "updatedon",
                        render: function (data, type, row) {
                            return "<div class='text-nowrap'>" + '<b style="color:red;"> On- </b>' + row.updatedon + '<br /> <b style="color:red;"> By- </b> ' + row.updatedby + '<br /> <b style="color:red;">IP-</b> ' + row.updatedip + '' + "</div>";
                        }
                    }
                    ,
                    { "data": "deletedon",
                        render: function (data, type, row) {
                            return "<div class='text-nowrap'>" + '<b style="color:red;"> On- </b>' + row.deletedon + '<br /> <b style="color:red;"> By- </b> ' + row.deletedby + '<br /> <b style="color:red;">IP-</b> ' + row.deletedip + '' + "</div>";
                        }
                    }

        //                    ,

        //                   {
        //                       "data": "id",
        //                       "render": function (id, type, full, meta) {
        //                           //debugger
        //                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
        //                       }
        //                   },
        //                    {
        //                        "data": "id",
        //                        "render": function (id, type, full, meta) {
        //                            //debugger
        //                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
        //                        }
        //                    }


                ],
                responsive: true,
    });


}




