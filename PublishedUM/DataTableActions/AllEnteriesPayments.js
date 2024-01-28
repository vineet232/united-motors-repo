





$(function () {
    //$("#Showoverlay").show();
    //GetData();
    
    BindDataTable();
});

function BindDataTable() {


    $("#tblRecords").dataTable().fnDestroy();
    //var i = 1;

    $('#tblRecords').DataTable({
      /////  "order": [[0, 'asc']],
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
        sAjaxSource: 'allenteriespaymentdetailshandler.ashx/GetEmployeesList',
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
                   { "data": "paymenttransactionid",
                       render: function (data, type, row) {
                           return row.paymenttransactionid + '<br /> -------- <br />(' + row.paymentdt + ')';
                       }
                   },

                    { "data": "accounttype",
                        render: function (data, type, row) {
                            return row.accounttype + '<br /> -------- <br />' + row.paymentto + '';
                        }
                    },
                    { "data": "paymenttobank",
                        render: function (data, type, row) {

//                            if (row.paymenttobank == "") {
//                                row.paymenttobank = "None";
//                            }
                            //return row.paymenttobank + '<br /> -------- <br /> ' + row.paymentmode + '<br /> -------- <br />' + row.paymentreceipt + '<br /> -------- <br />  ' + row.amount + '';
                            return "<div class='text-nowrap'>" + '<b style="color:green;"> Bank- </b>' + row.paymenttobank + '<br /> <b style="color:green;"> Mode- </b> ' + row.paymentmode + '<br /> <b style="color:green;">Receipt-</b> ' + row.paymentreceipt + '<br /> <b style="color:green;">Amount-</b> ' + row.amount + '' + "</div>";
                        }
                    },

                   

                     { "data": "oldpaymenttobank",
                         render: function (data, type, row) {
                             return "<div class='text-nowrap'>" + '<b style="color:red;"> Bank- </b>' + row.oldpaymenttobank + '<br /> <b style="color:red;"> Mode- </b> ' + row.oldpaymentmode + '<br /> <b style="color:red;">Receipt-</b> ' + row.oldpaymentreceipt + '<br /> <b style="color:red;">Amount-</b> ' + row.oldamount + '' + "</div>";
                         }
                     },
                    { "data": "oldpaymentdt",
                        render: function (data, type, row) {
                            return "<div class='text-nowrap'>" + '<b style="color:red;"> Dt- </b>' + row.oldpaymentdt + '<br /> <b style="color:red;"> A/C Type- </b> ' + row.oldaccounttype + '<br /> <b style="color:red;">Payment To-</b> ' + row.oldpaymentto + '<br /> <b style="color:blue;">Last Trns.-</b> ' + row.trnremarks + '' + "</div>";
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


