
$(document).ready(function () {



})  

 
 

$(function () {
    //$("#Showoverlay").show();
    //GetData();
    BindDataTable();
});



function BindDataTable() {

   
    $("#tblRecords").dataTable().fnDestroy();
   

    
        $('#tblRecords').DataTable({
            /////// "order": [[ 0, 'desc' ]],



            "columnDefs": [
    { "visible": false, "targets": [] }
    ],

            bServerSide: true,
            sAjaxSource: 'BackOrderDetailsHandler.ashx',
            sServerMethod: 'post',
            "processing": true,

            "columns": [

                    { "data": "id",
                       
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        }
                    },
                   
                    {"data": "partno" },
                    { "data": "partdesc" },
                     {"data": "taxslab" },

                        { "data": "purchaseqty" },
                        { "data": "stockqty" },

                         { "data": "saleqty" },
                         { "data": "purchaseprice" },
                        { "data": "discountcode" },

               
                 { "data": "challanno" },
                 { "data": "discount" },

                  

                ],
            stateSave: true,
            "bDestroy": true
        });

   

}

