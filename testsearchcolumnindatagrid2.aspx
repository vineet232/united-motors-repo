<%@ page language="C#" autoeventwireup="true" inherits="testsearchcolumnindatagrid, App_Web_weocsvet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

   <%-- <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />--%>

   <%-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>--%>

    <script src="https://code.jquery.com/jquery-1.11.2.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <link rel="Stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />

   <%--  <script src="datatableCSSJS/1jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/2dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/3jszip.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/4pdfmake.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/5vfs_fonts.js" type="text/javascript"></script>
            <script src="datatableCSSJS/6buttons.html5.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/7buttons.colVis.min.js" type="text/javascript"></script>--%>


</head>
<body>
    <form id="form1" runat="server">
    <div>
    

   <%-- https://www.aspsnippets.com/questions/114685/Pass-Send-multiple-parameters-to-JavaScript-function-on-jQuery-DataTable-row-click-in-ASPNet/
   https://csharp-video-tutorials.blogspot.com/2015/08/jquery-datatables-individual-column.html
   https://stackoverflow.com/questions/8785209/case-statement-within-where-clause-in-sql-server-2008

   --%>

   
    <select id="ddlSearchField" class="form-control" >
                                                <option value="0">Please Select</option>
                                                <option value="invoiceno">Invoice No</option>
                                                <option value="vehchasisno">Vehicle/Chasis No</option>
                                            </select>

   <input type="text" id="searchValue" class="form-control" />

     <table id="tblRecords" class="table table-bordered  table-responsive">
                            <thead>
                                <tr>
                                 
                                    <th>
                                        ID
                                    </th>
                                   
                                    <th>
                                        Invoice no
                                        <br />
                                        </th>
                                         <th>
                                        Veh/chasis no
                                        <br />
                                        
                                    ]
                                    
                                </tr>
                            </thead>

                            <tbody>
                            </tbody>
                             <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Invoice No</th>
                        <%--<th>Last Name</th>
                        <th>Gender</th>
                        <th>Job Title</th>
                        <th>Web Site</th>
                        <th>Salary</th>
                        <th>Hire Date</th>--%>
                    </tr>
                </tfoot>

                        </table>

    </div>





   <%-- <script type="text/javascript">
        $(document).ready(function () {
            var searchDt = 0;
            $.ajax({
                url: 'SaleTransactionDetailsCustomersHandlertest.ashx/GetSaleTransactionDetailsCustomersData?searchdt=' + searchDt,
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    $('#datatable').dataTable({
                        paging: true,
                        sort: true,
                        pageLength: 3,
                        searching: true,
                        data: data,
                        columns: [
                    { 'data': 'Id' },
                    { 'data': 'Name' },
                    ]
                    });
                }, error: function (response) {
                    alert(response.responseText);
                }
            });
        });
</script>--%>





    <script type="text/javascript">

        function binddatatable(invno) {

            var searchDt = 0;

            var searchfield = "";
            var searchvalue = "";

            var searchValue = $("#searchValue").val();
            var searchField = $("#ddlSearchField :selected").val();

            if (searchValue != "") {
                searchfield = searchField;
                searchvalue = searchValue;
                searchDt = 0;
            }

            ////alert(searchfield + "-" + searchvalue);

            $.ajax({
                success: function (data) {
                    

                    var datatableInstance = $('#tblRecords').dataTable({

                        columns: [
                    { 'data': 'id' },
                    { 'data': 'invoiceno' },
                     { 'data': 'vehchasisno' },

                ],
                        bServerSide: true,
                        sAjaxSource: 'SaleTransactionDetailsCustomersHandlertest.ashx/GetSaleTransactionDetailsCustomersData?searchdt=' + searchDt + '&searchfield=' + searchfield + '&searchvalue=' + searchvalue,
                        sServerMethod: 'post'


                    });



                    //                    $('#tblRecords thead th').each(function () {
                    //                        var title = $(this).text();
                    //                       
                    //                        $(this).html(title + ' <input type="text" class="col-search-input" placeholder="Search ' + title + '" />');
                    //                    });


                    //                    $('#tblRecords tfoot th').each(function () {
                    //                        var title = $('#tblRecords thead th').eq($(this).index()).text();
                    //                        $(this).html('<input type="text" placeholder="Search ' + title + '" />');
                    //                    });

                    //                    datatableInstance.api().columns().every(function () {
                    //                        var dataTableColumn = this;

                    //                        $(this.footer()).find('input').on('keyup change', function () {
                    //                            //dataTableColumn.search(this.value).draw();
                    //                            //$("#tblRecords").dataTable().fnDestroy();

                    //                            //////////////////////https://stackoverflow.com/questions/48689217/jquery-datatable-get-column-name-by-clicking-on-table-footer-cell#:~:text=Just%20use%20var%20col%20%3D%20table,dataSrc()%20.
                    //                            ////////var index = table.column($(this).index() + ':visible').index();

                    //                            var colindex = dataTableColumn.index();
                    //                            //alert(colindex);


                    //                            var col = dataTableColumn.index() ;
                    //                            alert(col + col.dataSrc());

                    //                            /// var columnName = dataTableColumn[colindex].dataSrc();

                    //                            // var column = columns(colindex).column;


                    //                            alert("col" + columnName);
                    //                            //get the index of the clickec cell
                    //                            //                            var colIndex = datatableInstance.cell(this).index().column;
                    //                            //                            alert(colIndex);

                    //                            //                                                        var columns = datatableInstance.api().columns();
                    //                            //                            ////                            
                    //                            //                                                       var colIndex = datatableInstance.cell(this).index().column;


                    //                            binddatatable2(columns[colIndex].name, this.value);
                    //                        });
                    //                    });



                }, error: function (response) {
                    alert(response.responseText);
                }
            });

        }

        function binddatatable2(field, value) {

            alert(field + "val" + value);
        }

        $(document).ready(function () {
            var searchfield = "";
            var searchvalue = "";
            ////binddatatable(searchfield, searchvalue);

            binddatatable();

        });


        //searchinvno

        $(document).on('change', '#searchValue', function () {
            ////alert($(this).val());
            //var invno = $(this).val();
            ////alert(invno);
            $("#tblRecords").dataTable().fnDestroy();
            binddatatable()

        });
    </script>


    <%--<script type="text/javascript">
        $(function () {
            var searchDt = 0;
        $.ajax({
            type: "POST",
            url: 'SaleTransactionDetailsCustomersHandlertest.ashx/GetSaleTransactionDetailsCustomersData?searchdt=' + searchDt,
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response.d);
            },
            error: function (response) {
                alert(response.d);
            }
        });
    });
    function OnSuccess(response) {
        alert(response.d);
    };
</script>--%>




  <%--  <script type="text/javascript">
        $(document).ready(function(){
         // BindDataTable();  
        })

        function BindDataTable() {

 $("#tblRecords").dataTable().fnDestroy();

  var searchDt = 0;
  

 var i = 1;


       var tab =    $('#tblRecords').DataTable({       
                "order": [[0, 'desc']],               
             bServerSide: true,
             sAjaxSource: 'SaleTransactionDetailsCustomersHandler.ashx/GetSaleTransactionDetailsCustomersData?searchdt=' + searchDt ,
                sServerMethod: 'post',
////                "processing": true,
////                "columns": [
////                 { "data": "id" ,
////      "render": function(data, type, full, meta) {
////        return i++;
////      }},
////                    { "data": "invoiceno" }                  
////                    
////                ],

////  columnDefs: [{
////                    targets: "_all",
////                    orderable: false
////                 }],
////                                responsive: true,

////  });


 "fnServerData": function ( sSource, aoData, fnCallback, oSettings ) {
      oSettings.jqXHR = $.ajax( {
        "dataType": 'json',
        "type": "POST",
        "url": sSource,
        "data": aoData,
        "success": fnCallback
      } );



          

           
    

            }
    </script>--%>
    </form>
</body>
</html>
