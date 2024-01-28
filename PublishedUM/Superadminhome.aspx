<%@ page title="" language="C#" masterpagefile="~/SuperAdminMasterPage.master" enableeventvalidation="false" autoeventwireup="true" inherits="homeadmin, App_Web_h5d101sg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<div class="loading" align="center">
        Loading. Please wait.<br />
        <br />
        <img src="img/4.gif" alt="" />
    </div>
    --%>
    <button onclick="topFunction()" id="myBtn" title="Go to top">
        Top</button>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="showProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modalSpinner">
                <div class="center">
                    <img alt="" src="img/4.gif" />
                    <br />
                    Please wait.....
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="row">
                    <div class="col-md-12 col-sm-12 well well-sm">
                        <div class="row">
                            <div class="col-md-12 topHeaderStyle" align="center">
                                <asp:Label ID="lblMainMenu" Text="Main Menu" Font-Bold="true" runat="server" />
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <b>Location </b>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ErrorMessage="*"
                                        InitialValue="0" Display="Dynamic" ControlToValidate="ddlLocation" SetFocusOnError="true"
                                        runat="server" />--%>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-arrow-down"></i></span>
                                        <asp:DropDownList ID="ddlLocation" CssClass="form-control" placeholder="Select Location"
                                            runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <b>Parent </b>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ErrorMessage="*"
                                        InitialValue="-1" Display="Dynamic" ControlToValidate="ddlParent" SetFocusOnError="true"
                                        runat="server" />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-arrow-down"></i></span>
                                        <asp:DropDownList ID="ddlParent" CssClass="form-control" placeholder="Select Parent"
                                            runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlParent_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                 <div class="col-md-3">
                                    <b>Sub Parent </b>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ErrorMessage="*"
                                        InitialValue="-1" Display="Dynamic" ControlToValidate="ddlSubParent" SetFocusOnError="true"
                                        runat="server" />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-arrow-down"></i></span>
                                        <asp:DropDownList ID="ddlSubParent" CssClass="form-control" placeholder="Select Sub Parent"
                                            runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <b>Name</b>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ErrorMessage="*"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName" runat="server" />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                        <asp:TextBox CssClass="form-control" autocomplete="off" MaxLength="50" placeholder="Menu Name"
                                            required runat="server" ID="txtName" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <b>URL</b>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="*" SetFocusOnError="true"
                                        ControlToValidate="txtURL" ForeColor="Red" Display="Dynamic" runat="server" />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-link"></i></span>
                                        <asp:TextBox CssClass="form-control" MaxLength="50" autocomplete="off" placeholder="Menu URL"
                                            required runat="server" ID="txtURL" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <b>Order</b>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                                        <asp:TextBox CssClass="form-control" autocomplete="off" placeholder="Menu Order"
                                            onKeyPress="return checkIt(event)" runat="server" ID="txtMenuOrder" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <br />
                                    <asp:Button Text="Add Menu " OnClick="btnAddMainMenuItem_Click" ID="btnAddMainMenuItem"
                                        CssClass="btn btn-primary" runat="server" />
                                    <%-- OnClientClick="this.style.background='#000'; this.value = 'Please Wait...'; return true;"  or    OnClientClick="disableBtn(this.id, 'Please wait...')" UseSubmitBehavior="false"--%>
                                    &nbsp; &nbsp; &nbsp; &nbsp;
                                    <asp:Button Text="Update Menu " OnClick="btnEdit_Click" ID="btnEdit" CssClass="btn btn-success"
                                        runat="server" />
                                    &nbsp; &nbsp; &nbsp; &nbsp;
                                    <asp:Button Text="Delete Menu " OnClick="btnDelete_Click" ID="btnDelete" OnClientClick="return confirm('Are you sure you want to delet this record')"
                                        CssClass="btn btn-danger" runat="server" />
                                </div>
                                <div class="col-md-3" align="center">
                                    <br />
                                    <asp:Label ID="lblConfirmationMessage" ForeColor="Red" Font-Bold="true" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12">
                        <div class="topHeaderStyle" align="center">
                            <asp:Label ID="Label1" Text="Main Menu List" Font-Bold="true" runat="server" />
                        </div>
                        <asp:GridView ID="grdMainMenu" runat="server" AutoGenerateColumns="false" Width="100%"
                            OnRowDataBound="grdMainMenu_RowDataBound" OnSelectedIndexChanged="grdMainMenu_SelectedIndexChanged"
                            AllowPaging="false">
                            <HeaderStyle BackColor="#344261" ForeColor="White" />
                            <%--<AlternatingRowStyle BackColor="#DFEAF9" />--%>
                            <SelectedRowStyle BackColor="#CCDCA7" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                                    ItemStyle-Width="20px" />
                                <asp:TemplateField HeaderText="Sr#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Main Menu Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMenuName" runat="server" Text='<%# Bind("MenuName") %>'></asp:Label>
                                        <asp:Label ID="lblgrdparentID" Visible="false" runat="server" Text='<%# Bind("parentID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sub Menu Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsubmenu" runat="server" Text='<%# Bind("submenu") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="URL">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMenuUrl" runat="server" Text='<%# Bind("Url") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Order">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMenuOrder" runat="server" Text='<%# Bind("MenuOrder") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location" >
                                    <ItemTemplate>
                                        <asp:Label ID="lbllocationid"  Visible="false" runat="server" Text='<%# Bind("locationid") %>'></asp:Label>
                                        <asp:Label ID="lbllocationname" runat="server" Text='<%# Bind("locationtext") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
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
                        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
                    });

                    //        $(document).ready(function () {

                    function bindDataTable() {
                        var t = $('#' + '<%=grdMainMenu.ClientID%>').DataTable({
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>--%>
    <%-- <script src="js/jquery-1.8.2.js" type="text/javascript"></script>
    <style type="text/css">
        #overlay
        {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #000;
            filter: alpha(opacity=70);
            -moz-opacity: 0.7;
            -khtml-opacity: 0.7;
            opacity: 0.7;
            z-index: 100;
            display: none;
        }
        .cnt223 a
        {
            text-decoration: none;
        }
        .popup
        {
            width: 100%;
            margin: 0 auto;
            display: none;
            position: fixed;
            z-index: 101;
        }
        .cnt223
        {
            min-width: 600px;
            width: 600px;
            min-height: 150px;
            margin: 50px auto;
            background: #f3f3f3;
            position: relative;
            z-index: 103;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px #000;
        }
        .cnt223 p
        {
            clear: both;
            color: #555555;
            text-align: justify;
        }
        .cnt223 p a
        {
            color: #d91900;
            font-weight: bold;
        }
        .cnt223 .x
        {
            float: right;
            height: 35px;
            left: 22px;
            position: relative;
            top: -25px;
            width: 34px;
        }
        .cnt223 .x:hover
        {
            cursor: pointer;
        }
    </style>
    <script type='text/javascript'>
        $(function () {
            var overlay = $('<div id="overlay"></div>');
            overlay.show();
            overlay.appendTo(document.body);
            $('.popup').show();
            $('.close').click(function () {
                $('.popup').hide();
                overlay.appendTo(document.body).remove();
                return false;
            });


            $('.x').click(function () {
                $('.popup').hide();
                overlay.appendTo(document.body).remove();
                return false;
            });
        });
    </script>
    <div class='popup'>
        <div class='cnt223' align="center">
            <img src="img/x3.png" alt='quit' class='x' id='x' />
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="90%">
                    <HeaderStyle BackColor="Teal" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#DFEAF9" />
                    <Columns>
                        <asp:BoundField HeaderText="User Name" DataField="username" ItemStyle-Width="100px"
                            ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="LoggedIn Date/Time" DataField="loggedindatetime" ItemStyle-Width="100px"
                            ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="IP Address" DataField="ip_addr" ItemStyle-Width="80px"
                            ItemStyle-Wrap="false" />
                        <asp:BoundField HeaderText="Status" DataField="login_logout" ItemStyle-Width="100px"
                            ItemStyle-Wrap="false" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <a href='' class='close'>Close</a>
            </p>
        </div>
    </div>--%>
</asp:Content>
