





$(function () {
    //$("#Showoverlay").show();
    //GetData();
    
    BindDataTable();
});

function BindDataTable() {


    $("#tblRecords").dataTable().fnDestroy();
    //var i = 1;

    $('#tblRecords').DataTable({
       ///// "order": [[0, 'asc']],
        "columnDefs": [
    { "visible": false, "targets": [1] }
    ],
        //            "async": false,
        //                "processing": true,
        //                "serverSide": true,
        //                "ajax": {
        //                    url: "WebServiceDataTable.asmx/GetDataForDataTable", type: "post"
        //                },

        bServerSide: true,
        sAjaxSource: 'AllEnteriesInsuranceDetailsHandler.ashx/GetEmployeesList',
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
                             //return row.accounttype + '<br /> -------- <br />' + row.invoiceno + '';
                             return "<div class='text-nowrap'>" + '<b style="color:green;"> A/c Type- </b>' + row.accounttype + '<br /> <b style="color:green;"> Inv#- </b> ' + row.invoiceno + '<br /> <b style="color:green;">VehNo-</b> ' + row.vehchasisno + '<br /> <b style="color:green;">S.E-</b> ' + row.salesexecutive + '' + "</div>";

                         }
                     },
                    { "data": "vendorname",
                        render: function (data, type, row) {

                            //                            if (row.paymenttobank == "") {
                            //                                row.paymenttobank = "None";
                            //                            }
                            //return row.paymenttobank + '<br /> -------- <br /> ' + row.paymentmode + '<br /> -------- <br />' + row.paymentreceipt + '<br /> -------- <br />  ' + row.amount + '';
                            return "<div class='text-nowrap'>" + '<b style="color:green;"> Vendor- </b>' + row.vendorname + '<br /> <b style="color:green;"> Mode- </b> ' + row.venpaymentmode + '<br /> <b style="color:green;">Amount-</b> ' + row.venpaymentamt + '' + "</div>";
                        }
                    },



                     { "data": "payout",
                         render: function (data, type, row) {
                             return "<div class='text-nowrap'>" + '<b style="color:green;"> Payout- </b>' + row.payout + '<br /> <b style="color:green;"> Mode- </b> ' + row.payoutpaymentmode + '<br /> <b style="color:green;">Amount-</b> ' + row.payoutpaymentamt + '' + "</div>";
                         }
                     },
                    { "data": "customername",
                        render: function (data, type, row) {
                            return "<div class='text-nowrap'>" + '<b style="color:green;"> Sales- </b>' + row.customername + '<br /> <b style="color:green;"> Mode- </b> ' + row.custpaymentmode + '<br /> <b style="color:green;">Amount-</b> ' + row.custpaymentamt + '' + "</div>";
                        }
                    },


                     { "data": "oldinvoiceno",
                         render: function (data, type, row) {
                             //return row.accounttype + '<br /> -------- <br />' + row.invoiceno + '';
                             return "<div class='text-nowrap'>" + '<b style="color:red;"> Inv#- </b> ' + row.oldinvoiceno + '<br /> <b style="color:red;">VehNo-</b> ' + row.oldvehchasisno + '<br /> <b style="color:red;">S.E-</b> ' + row.oldsalesexecutive + '<br /> <b style="color:blue;">Last Trn.-</b> ' + row.remarks + '' + "</div>";

                         }
                     },
                    { "data": "oldvendorname",
                        render: function (data, type, row) {

                            //                            if (row.paymenttobank == "") {
                            //                                row.paymenttobank = "None";
                            //                            }
                            //return row.paymenttobank + '<br /> -------- <br /> ' + row.paymentmode + '<br /> -------- <br />' + row.paymentreceipt + '<br /> -------- <br />  ' + row.amount + '';
                            return "<div class='text-nowrap'>" + '<b style="color:red;"> Vendor- </b>' + row.oldvendorname + '<br /> <b style="color:red;"> Mode- </b> ' + row.oldvenpaymentmode + '<br /> <b style="color:red;">Amount-</b> ' + row.oldvenpaymentamt + '' + "</div>";
                        }
                    },



                     { "data": "oldpayout",
                         render: function (data, type, row) {
                             return "<div class='text-nowrap'>" + '<b style="color:red;"> Payout- </b>' + row.oldpayout + '<br /> <b style="color:red;"> Mode- </b> ' + row.oldpayoutpaymentmode + '<br /> <b style="color:red;">Amount-</b> ' + row.oldpayoutpaymentamt + '' + "</div>";
                         }
                     },
                    { "data": "oldcustomername",
                        render: function (data, type, row) {
                            return "<div class='text-nowrap'>" + '<b style="color:red;"> Sales- </b>' + row.oldcustomername + '<br /> <b style="color:red;"> Mode- </b> ' + row.oldcustpaymentmode + '<br /> <b style="color:red;">Amount-</b> ' + row.oldcustpaymentamt + '' + "</div>";
                        }
                    },


                    { "data": "createdon",
                        render: function (data, type, row) {
                            return "<div class='text-nowrap'>" + '<b style="color:green;"> On- </b>' + row.createdon + '<br /> <b style="color:green;"> By- </b> ' + row.createdby + '(' + row.createdip + ')' + '<br /> <b style="color:red;">up. on -</b> ' + row.updatedon + '<br /> <b style="color:red;"> By- </b> ' + row.updatedby + '(' + row.updatedip + ')' + '' + "</div>";
                        }
                    },
//                    { "data": "updatedon",
//                        render: function (data, type, row) {
//                            return "<div class='text-nowrap'>" + '<b style="color:red;"> On- </b>' + row.updatedon + '<br /> <b style="color:red;"> By- </b> ' + row.updatedby + '<br /> <b style="color:red;">IP-</b> ' + row.updatedip + '' + "</div>";
//                        }
//                    }
//                    ,
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



//function BindDataTable() {


// $("#tblRecords").dataTable().fnDestroy();
////var i = 1;
// 
// $('#tblRecords').DataTable({
////     "order": [[6, 'asc']],
////     "columnDefs": [
////    { "visible": false, "targets": [0] }
////    ],


//     bServerSide: true,
//     sAjaxSource: 'AllEnteriesPaymentDetailsHandler.ashx/GetAllPaymentData',
//     sServerMethod: 'post',
//     "processing": true,

//     "columns": [

//                    { "data": "id" },
//                     {
//                         bSortable: false,
//                         render: function (data, type, row, meta) {
//                             return meta.row + meta.settings._iDisplayStart + 1;
//                         }
//                     }
////                    { "data": "paymenttransactionid",
////                        render: function (data, type, row) 
////                        {
////                            alert(row.paymenttransactionid);
////                            return row.paymenttransactionid + '<hr style="border-top: 2px solid #000; margin-top:3px;margin-botton:-2px;" />(' + row.paymentdt + ')';
////                        }
////                    },






////                   {
////                       "data": "id",
////                       "render": function (id, type, full, meta) {
////                           //debugger
////                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
////                       }
////                   },
////                    {
////                        "data": "id",
////                        "render": function (id, type, full, meta) {
////                            //debugger
////                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
////                        }
////                    }


//                ]
// });


//            }


