<%@ page language="C#" autoeventwireup="true" inherits="testcolsearch, App_Web_mdgle5ws" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>  
    <%--<script src="jquery-1.11.2.js"></script>

    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" />
    <script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js">    </script>--%>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <link rel="Stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            var searchDt = 0;
            $.ajax({
                url: 'SaleTransactionDetailsCustomersHandlertest.ashx/GetSaleTransactionDetailsCustomersData?searchdt=' + searchDt,
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    alert(data.d);
                    var datatableInstance = $('#datatable').DataTable({
                        paging: true,
                        sort: true,
                        searching: true,
                        data: data,
                        columns: [
                            { 'data': 'id' },
                            { 'data': 'invoiceno' }
                        //                            { 'data': 'LastName' },
                        //                            { 'data': 'Gender' },
                        //                            { 'data': 'JobTitle' },
                        //                            {
                        //                                'data': 'WebSite',
                        //                                'sortable': false,
                        //                                'searchable': true,
                        //                                'render': function (webSite) {
                        //                                    if (!webSite) {
                        //                                        return 'N/A';
                        //                                    }
                        //                                    else {
                        //                                        return '<a href=' + webSite + '>'
                        //                                            + webSite.substr(0, 10) + '...' + '</a>';
                        //                                    }
                        //                                }
                        //                            },
                        //                            {
                        //                                'data': 'Salary',
                        //                                'render': function (salary) {
                        //                                    return "$" + salary;
                        //                                }
                        //                            },
                        //                            {
                        //                                'data': 'HireDate',
                        //                                'render': function (jsonDate) {
                        //                                    var date = new Date(parseInt(jsonDate.substr(6)));
                        //                                    var month = date.getMonth() + 1;
                        //                                    return month + "/" + date.getDate() + "/" + date.getFullYear();
                        //                                }
                        //                            }
                        ]
                    });


                    $('#datatable tfoot th').each(function () {
                        var title = $('#datatable thead th').eq($(this).index()).text();
                        $(this).html('<input type="text" placeholder="Search ' + title + '" />');
                    });

                    datatableInstance.columns().every(function () {
                        var dataTableColumn = this;

                        $(this.footer()).find('input').on('keyup change', function () {
                            dataTableColumn.search(this.value).draw();
                        });
                    });
                }
            });
        });
    </script>
</head>
<body style="font-family: Arial">
    <form id="form1" runat="server">
        <div style="width: 1000px; border: 1px solid black; padding: 3px">
            <table id="datatable">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Invoice No</th>
                       <%-- <th>Last Name</th>
                        <th>Gender</th>
                        <th>Job Title</th>
                        <th>Web Site</th>
                        <th>Salary</th>
                        <th>Hire Date</th>--%>
                    </tr>
                </thead>
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
    </form>
</body>
</html>
