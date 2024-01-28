<%@ page language="C#" autoeventwireup="true" inherits="testgrid, App_Web_mdgle5ws" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <script src="JSforModalwindowandDatatable/jquery-1.11.3.min.js" type="text/javascript"></script>
    <%--<script src="JSforModalwindowandDatatable/bootstrap.min.js" type="text/javascript"></script>
    <link href="JSforModalwindowandDatatable/jquery.dataTables.min.css" rel="stylesheet"
        type="text/css" />
    <script src="JSforModalwindowandDatatable/jquery.dataTables.min.js" type="text/javascript"></script>

    <script src="datatableCSSJS/1jquery.dataTables.min.js" type="text/javascript"></script>
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
    
    <div class="col-md-12">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                            AllowPaging="true" >
                           <%-- <HeaderStyle BackColor="#344261" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#DFEAF9" />   OnRowDataBound="grdMainMenu_RowDataBound"  --%>
                            <SelectedRowStyle BackColor="#CCDCA7" />
                            <Columns>
                              
                                <asp:TemplateField HeaderText="Sr#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <%--  <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                              <asp:TemplateField HeaderText="Part#">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpartno" runat="server" Text='<%# Bind("partno") %>'></asp:Label>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Particulars">
                                    <ItemTemplate>
                                        <asp:Label ID="lblparticulars" runat="server" Text='<%# Bind("particulars") %>'></asp:Label>

                                       
                                         
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Stock">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcurrentStock" runat="server" Text='<%# Bind("currentStock" ) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Challan No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblchallanno" runat="server" Text='<%# Bind("challanno" ) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Created On">
                                    <ItemTemplate>
                                     <asp:Label ID="lblcreatedon" Text='<%# Bind("createdon" ) %>' runat="server"  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Created By">
                                    <ItemTemplate>
                                     <asp:Label ID="lblcreatedby" Text='<%# Bind("createdby" ) %>' runat="server"  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Invoice / Slip No">
                                    <ItemTemplate>
                                     <asp:Label ID="lblinvoiceslipno" Text='<%# Bind("invoiceslipno" ) %>' runat="server"  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  
                                                              
                               
                            </Columns>
                        </asp:GridView>
                    </div>

                      <%--For Datatable--%>
                <script src="datatableCSSJS2/jquery.dataTables.min.js" type="text/javascript"></script>
                <script src="datatableCSSJS2/dataTables.buttons.min.js" type="text/javascript"></script>
                <script src="datatableCSSJS2/jszip.min.js" type="text/javascript"></script>
                <script src="datatableCSSJS2/pdfmake.min.js" type="text/javascript"></script>
                <script src="datatableCSSJS2/vfs_fonts.js" type="text/javascript"></script>
                <script src="datatableCSSJS2/buttons.html5.min.js" type="text/javascript"></script>
                <link href="datatableCSSJS2/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
                <link href="datatableCSSJS2/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
                <link href="datatableCSSJS2/DataTableHeaderFooterStyleSheet.css" rel="stylesheet"
                    type="text/css" />
                <script type="text/javascript">
                    //    $(document).ready(function () {
                    $(function () {
                        bindDataTable(); // bind data table on first page load
                       ///// Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
                    });

                    //        $(document).ready(function () {

                    function bindDataTable() {
                        var t = $('#' + '<%=GridView1.ClientID%>').DataTable({
                            //                    "sDom": "Rlfrtip",

                            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                            "bAutoWidth": false,
                            "bFilter": true,
                            "bPagination": true,
                            "sPaginationType": "full_numbers",
                            "bStateSave": true,
                            "bPaginate": true,
                            "bInfo": true,

                            destroy: true,


                            // "order": [[0, 'asc']],

                            dom: 'Blfrtip',
                            buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]

                        });
                    }

                    //            t.on('order.dt search.dt', function () {
                    //                t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                    //                    cell.innerHTML = i + 1;
                    //                });
                    //            }).draw();

                    //        });


       
       

          
                </script>
                <%-- end for datatable--%>
            </div>


    </div>
    </form>
</body>
</html>
