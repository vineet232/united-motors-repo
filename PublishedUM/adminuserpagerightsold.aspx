<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="adminuserpagerights, App_Web_gdx0w2k3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        function CheckMenus_Click(objRef) {
            //Get the Row based on checkbox
            var row = objRef.parentNode.parentNode;
            if (objRef.checked) {
                //If checked change color to Aqua
                row.style.backgroundColor = "aqua";
            }
            else {
                //If not checked change back to original color
                if (row.rowIndex % 2 == 0) {
                    //Alternating Row Color
                    row.style.backgroundColor = "#C2D69B";
                }
                else {
                    row.style.backgroundColor = "white";
                }
            }

            //Get the reference of GridView
            var GridView = row.parentNode;
            //Get all input elements in Gridview
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];
                //Based on all or none checkboxes
                //are checked check/uncheck Header Checkbox
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {
                        checked = false;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;
        }
        
    </script>
    <script type="text/javascript">

        function checkAllMenus(objRef) {

            var GridView = objRef.parentNode.parentNode.parentNode;

            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //Get the Cell To find out ColumnIndex
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        //If the header checkbox is checked
                        //check all checkboxes
                        //and highlight all rows
                        row.style.backgroundColor = "aqua";
                        inputList[i].checked = true;
                    }
                    else {
                        //If the header checkbox is checked
                        //uncheck all checkboxes
                        //and change rowcolor back to original
                        if (row.rowIndex % 2 == 0) {
                            //Alternating Row Color
                            row.style.backgroundColor = "#DFEAF9";
                        }
                        else {
                            row.style.backgroundColor = "white";
                        }
                        inputList[i].checked = false;
                    }
                }
            }
        }
    </script>
    <script type="text/javascript">
        function MouseEvents(objRef, evt) {
            var checkbox = objRef.getElementsByTagName("input")[0];
            var originalcolor = "";
            if (evt.type == "mouseover") {
                objRef.style.backgroundColor = "#FFDB97";
                originalcolor = this.style.backgroundColor;
            }
            else {
                if (checkbox.checked) {
                    objRef.style.backgroundColor = "aqua";
                }
                else if (evt.type == "mouseout") {
                    if (objRef.rowIndex % 2 == 0) {
                        //Alternating Row Color
                        objRef.style.backgroundColor = "#DFEAF9";
                    }
                    else {
                        objRef.style.backgroundColor = "white";
                    }
                }
            }
        }


    </script>

     <link href="CssSearchSelect/select2.css" rel="stylesheet" />
    <script src="CssSearchSelect/select2.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<div class="loading" align="center">
        Loading. Please wait.<br />
        <br />
        <img src="img/4.gif" alt="" />
    </div>--%>
    <button onclick="topFunction()" id="myBtn" title="Go to top">
        Top</button>
    <div class="row">
        <div align="center" class="topHeaderStyle">
            Users Profile Preference
        </div>
    </div>
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
            <div align="center">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-12 well well-sm">
                    <div class="col-md-12">
                        <%-- <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AutoGenerateColumns="false"
                        Width="100%" OnRowDataBound="GridViewRowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <HeaderStyle BackColor="#006B96" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#DFEAF9" />
                        <SelectedRowStyle BackColor="#CCDCA7" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                                ItemStyle-Width="20px" />
                           
                            <asp:TemplateField HeaderText="Sr#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblusername" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                          
                        </Columns>
                    </asp:GridView>--%>
                        <div class="form-group">
                            <div class="col-md-3">
                                Change Position:
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ddlLocation"
                                    SetFocusOnError="true" Display="Dynamic" InitialValue="0" ForeColor="Red" runat="server"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <br />
                                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                           
                            <div class="col-md-3">
                                Select Module:
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlModules"
                                    SetFocusOnError="true" Display="Dynamic" InitialValue="0" ForeColor="Red" runat="server"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <br />
                                <asp:DropDownList ID="ddlModules" runat="server" CssClass="form-control" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlModule_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                             <div class="col-md-3">
                                Sub Module:
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddlSubModules"
                                    SetFocusOnError="true" Display="Dynamic" InitialValue="0" ForeColor="Red" runat="server"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                <br />
                                <asp:DropDownList ID="ddlSubModules" runat="server" CssClass="form-control" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlSubModules_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                             <div class="col-md-3">
                                Select User:
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlUsers"
                                    SetFocusOnError="true" Display="Dynamic" InitialValue="0" ForeColor="Red" runat="server"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <br />
                                <asp:DropDownList ID="ddlUsers" ClientIDMode="Static" runat="server" Width="100%"   AutoPostBack="true" OnSelectedIndexChanged="ddlUsers_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-12" style="background-color: #2A3342; color: White; height:30px; padding-top:7px;" align="center">
                        Menus List
                    </div>
                    <br />
                    <br />
                    <div class="col-md-12">
                        <asp:GridView ID="grdMainMenu" runat="server" AutoGenerateColumns="false" Width="100%"
                            OnRowDataBound="grdMainMenu_RowDataBound" AllowPaging="false">
                           <%-- <HeaderStyle BackColor="#344261" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#DFEAF9" />--%>
                            <SelectedRowStyle BackColor="#CCDCA7" />
                            <Columns>
                                <%-- <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                ItemStyle-Width="20px" />--%>
                                <%--<asp:TemplateField>
                               

                         <HeaderTemplate>
     <asp:CheckBox ID="chkboxSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkboxSelectAll_CheckedChanged" ></asp:CheckBox> 
    </HeaderTemplate>

                                <ItemTemplate>
                                    <asp:CheckBox ID="chkMenuRow" runat="server" />
                                  
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Sr#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID" Visible="false">
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
                                <asp:TemplateField HeaderText="URL" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMenuUrl" runat="server" Text='<%# Bind("Url") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Order" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMenuOrder" runat="server" Text='<%# Bind("MenuOrder") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkboxSelectViewAll" runat="server" Text="View" AutoPostBack="true"
                                            OnCheckedChanged="chkboxSelectViewAll_CheckedChanged"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkView" runat="server" />
                                         <asp:Label ID="lblviewpermission" Visible="false" runat="server" Text='<%# Bind("viewpermission") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Add">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkboxSelectAddAll" runat="server" Text="Add" AutoPostBack="true"
                                            OnCheckedChanged="chkboxSelectAddAll_CheckedChanged"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkAdd" runat="server" />
                                         <asp:Label ID="lbladdpermission" Visible="false" runat="server" Text='<%# Bind("addpermission") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Update">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkboxSelectUpdateAll" runat="server" Text="Update" AutoPostBack="true"
                                            OnCheckedChanged="chkboxSelectUpdateAll_CheckedChanged"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkUpdate" runat="server" />
                                         <asp:Label ID="lblupdatepermission" Visible="false" runat="server" Text='<%# Bind("updatepermission") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkboxSelectDeleteAll" runat="server" Text="Delete" AutoPostBack="true"
                                            OnCheckedChanged="chkboxSelectDeleteAll_CheckedChanged"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkDelete" runat="server" />
                                         <asp:Label ID="lbldeletepermission" Visible="false" runat="server" Text='<%# Bind("deletepermission") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Print">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkboxSelectPrintAll" runat="server" Text="Print" AutoPostBack="true"
                                            OnCheckedChanged="chkboxSelectPrintAll_CheckedChanged"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkPrint" runat="server" />
                                         <asp:Label ID="lblprintpermission" Visible="false" runat="server" Text='<%# Bind("printpermission") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12" align="center">
                    <br />
                    <asp:Button ID="btnAssignMenu" runat="server" Text="Assign User Profile Preference to to Selected User"
                        CssClass="btn btn-danger" OnClick="btnAssignMenu_Click" />
                </div>
            </div>
            <br />

             <%-- <script>
                  $(document).ready(function () { $("#ddlUsers").select2(); });
        </script>--%>

        </ContentTemplate>
    </asp:UpdatePanel>
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

            $("#ddlUsers").select2();


            var rowscount = $("#<%=grdMainMenu.ClientID %> tr").length;
            if (rowscount > 1) {
                var t = $('#' + '<%=grdMainMenu.ClientID%>').DataTable({
                    //                    "sDom": "Rlfrtip",

                    "lengthMenu": [[-1], ["All"]],
                    "bAutoWidth": false,
                    "bFilter": true,
                    "bPagination": true,
                    "sPaginationType": "full_numbers",
                    "bStateSave": true,
                    "bPaginate": true,
                    "bInfo": true,

                    destroy: true,

                    //                    "ordering": false,

                    //"aaSorting": [[0, 'asc']],

                    //"order": [[0, 'desc']],

                    dom: 'Blfrtip',
                    buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]

                });
            }
        }
        //            t.on('order.dt search.dt', function () {
        //                t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
        //                    cell.innerHTML = i + 1;
        //                });
        //            }).draw();

        //        });


       
       

          
    </script>

    <%-- end for datatable--%>
</asp:Content>
