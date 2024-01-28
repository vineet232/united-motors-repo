<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="policyassignedtouser, App_Web_1ssuryoo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <link href="CSSJSResponsiveGridView/1bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="CSSJSResponsiveGridView/2footable.min.css" rel="stylesheet" type="text/css" />
    <script src="CSSJSResponsiveGridView/3jquery.min.js" type="text/javascript"></script>
    <script src="CSSJSResponsiveGridView/4footable.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        /* Applied Responsive For Grid View using footable js*/
        $(function () {
            $('[id*=ContentPlaceHolder1_GridView1]').footable();
        });   
    </script>--%>
    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/css-spinning-spinners/1.1.1/load1.css"></script>--%>
    <%--<title>jQuery Multiple File Upload</title>
    <script src="jQueryPackageUploadFiles/jquery-2.1.4.js"></script>
    <link href="jQueryPackageUploadFiles/jquery-ui.css" rel="stylesheet" />
    <script src="jQueryPackageUploadFiles/jquery-ui.js"></script>
    <link href="jQueryPackageUploadFiles/jquery-ui.structure.css" rel="stylesheet" />
    <link href="jQueryPackageUploadFiles/jquery-ui.theme.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnUpload').click(function (event) {
                var uploadedFiles = $('#uploader')[0].files;
                if (uploadedFiles.length > 0) {
                    var formData = new FormData();
                    for (var i = 0; i < uploadedFiles.length; i++) {
                        formData.append(uploadedFiles[i].name, uploadedFiles[i]);
                    }
                }
                var progressbarLabel = $('#progressbar-label');
                var progressbarDiv = $('#progress-bar');
                $.ajax
                    ({
                        url: 'UploadsHandler.ashx',
                        method: 'post',
                        contentType: false,
                        processData: false,
                        data: formData,
                        success: function () {
                            progressbarLabel.text('Uploaded Successfully');
                            progressbarDiv.fadeOut(2000);
                        },
                        error: function (err) {
                            alert(err.statusText);
                        }
                    });
                progressbarLabel.text('Uploading...');
                progressbarDiv.progressbar({
                    value: false
                }).fadeIn(1000);
            });
        });
    </script>--%>
    <style type="text/css">
        .GridPager a, .GridPager span
        {
            display: inline-block;
            padding: 0px 9px;
            margin-right: 4px;
            border-radius: 3px;
            border: solid 1px #c0c0c0;
            background: #e9e9e9;
            box-shadow: inset 0px 1px 0px rgba(255,255,255, .8), 0px 1px 3px rgba(0,0,0, .1);
            font-size: .975em;
            font-weight: bold;
            text-decoration: none;
            color: #717171;
            text-shadow: 0px 1px 0px rgba(255,255,255, 1);
        }
        
        .GridPager a
        {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }
        
        .GridPager span
        {
            background: #616161;
            box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);
            color: #f0f0f0;
            text-shadow: 0px 0px 3px rgba(0,0,0, .5);
            border: 1px solid #3AC0F2;
        }
    </style>
    <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="quicksearch.js"></script>
<script type="text/javascript">
    $(function () {
        $('.search_textbox').each(function (i) {
            $(this).quicksearch("[id*=GridView1] tr:not(:has(th))", {
                'testQuery': function (query, txt, row) {
                    return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                }
            });
        });
    });
</script>--%>
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
  <%--  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>--%>

    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>--%>

    <link href="bootstrapMultiSelect/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="bootstrapMultiSelect/bootstrap-multiselect.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $('[id*=lstLastRenewalFrom]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>

      <link href="CssSearchSelect/select2.css" rel="stylesheet" />
    <script src="CssSearchSelect/select2.js" type="text/javascript"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            <div class="container123">
                <div class="row">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Policy Assigned to User
                    </div>
                    <div class="col-md-8">
                        <asp:Button ID="btnAddNewRecord" runat="server" Text="Add New " OnClick="ShowAddModalPopup_Click"
                            CausesValidation="false" class="btn btn-success" Visible="false" />
                        <%-- <br />
                            <div class="form-group">
                                            <button id="login" type="submit" value="Login" data-loading-text="<i class='fa fa-spinner fa-spin'></i> Checking login..." class="btn btn-lg btn-success btn-block">Login</button>
                                            </div>--%>
                        <br />
                        <asp:Label ID="lblError" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row well well-sm">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <%-- &nbsp;&nbsp;
                           
                            &nbsp;&nbsp;
                            <asp:RadioButton ID="rdMonth" runat="server"  Checked="true" GroupName="search" Text="Due Month" />--%>
                            <%-- &nbsp;
                             <asp:RadioButton ID="rdotherColumns" runat="server" GroupName="search" Checked="true" Text="Customer Name/Veh/Chasis No/Contact No/Last Renewal/Alternate No/Model" />--%>
                            Due Month:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ddlMonth"
                                ValidationGroup="add" ForeColor="Red" InitialValue="0" SetFocusOnError="true"
                                runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                <asp:ListItem Value="1">January</asp:ListItem>
                                <asp:ListItem Value="2">February</asp:ListItem>
                                <asp:ListItem Value="3">March</asp:ListItem>
                                <asp:ListItem Value="4">April</asp:ListItem>
                                <asp:ListItem Value="5">May</asp:ListItem>
                                <asp:ListItem Value="6">June</asp:ListItem>
                                <asp:ListItem Value="7">July</asp:ListItem>
                                <asp:ListItem Value="8">August</asp:ListItem>
                                <asp:ListItem Value="9">September</asp:ListItem>
                                <asp:ListItem Value="10">October</asp:ListItem>
                                <asp:ListItem Value="11">November</asp:ListItem>
                                <asp:ListItem Value="12">December</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            Last Renewal From:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ddlLastRenewalTop"
                                ValidationGroup="add" ForeColor="Red" InitialValue="0" SetFocusOnError="true"
                                runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                                <asp:DropDownList ID="ddlLastRenewalTop" Visible="false" CssClass="form-control "
                                    runat="server">
                                </asp:DropDownList>
                                <asp:ListBox ID="lstLastRenewalFrom" runat="server" SelectionMode="Multiple">
                                    
                                </asp:ListBox>
                            </div>
                        </div>
                        <div class="col-md-6" style="display: none;">
                            <asp:RadioButton ID="rdotherColumns" runat="server" GroupName="search" Checked="true"
                                Text="Customer Name/Veh/Chasis No/Contact No/Last Renewal/Alternate No/Model" />
                            <br />
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            Select User:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="ddlUsers"
                                ValidationGroup="add" ForeColor="Red" InitialValue="0" SetFocusOnError="true"
                                runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:DropDownList ID="ddlUsers" ClientIDMode="Static" CssClass="select2-dropdown " runat="server">
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="col-md-1">
                            <br />
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-info" Text="Search" OnClick="btnSearch_Click" />
                        </div>
                        <div class="col-md-1" style="display: none;">
                            <br />
                            <asp:Button ID="btnShowAll" runat="server" CssClass="btn btn-danger" Text="Show All"
                                OnClick="btnShowAll_Click" />
                        </div>
                        <div class="col-md-1">
                            <br />
                            <asp:Button ID="btnAssigntoUser" runat="server" CssClass="btn btn-success" Text="Assign to User"
                                OnClick="btnAssigntoUser_Click" OnClientClick="return confirm('Are you sure you want to assign selected records to this user')" />
                        </div>
                    </div>
                </div>
                <div class="row col-md-12">
                    <div class="col-ms-6" style="display: none;">
                        &nbsp;&nbsp; Rows per Page: &nbsp;
                        <asp:DropDownList ID="ddlRowsperPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRowsperPage_SelectedIndexChanged">
                            <asp:ListItem Value="20">20</asp:ListItem>
                            <asp:ListItem Value="50">50</asp:ListItem>
                            <asp:ListItem Value="100">100</asp:ListItem>
                            <asp:ListItem Value="200">200</asp:ListItem>
                            <asp:ListItem Value="1000">1000</asp:ListItem>
                            <asp:ListItem Value="20000">20000</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-ms-6" align="right">
                        Total Records: &nbsp;
                        <asp:Label ID="lbltotalRecords" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <asp:GridView ID="GridView1" runat="server" CssClass="footable" AutoGenerateColumns="false"
                        Width="100%" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" Style="max-width: 100%"
                        GridLines="Horizontal" AllowSorting="true" OnSorting="GridView1_OnSorting">
                        <%--OnPageIndexChanging="GridView1_PageIndexChanging"  AllowPaging="true" PageSize="20"  PageSize="50" OnPageIndexChanging="GridView1_PageIndexChanging" --%>
                        <HeaderStyle Font-Bold="true" ForeColor="Black" Height="40px" BackColor="#EEEFF2" />
                        <RowStyle Height="40px" />
                        <PagerStyle HorizontalAlign="Right" CssClass="GridPager" />
                        <Columns>
                            <%--<asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                            ItemStyle-Width="20px" />--%>
                            <asp:TemplateField Visible="false" HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sr#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1%>
                                </ItemTemplate>
                                <ItemStyle Width="30px" />
                            </asp:TemplateField>
                            <%-- <asp:TemplateField HeaderText="">
                             <HeaderTemplate>
                                        <asp:CheckBox ID="chkboxSelectAll" runat="server" Text="Select" AutoPostBack="true"
                                            OnCheckedChanged="chkboxSelectAll_CheckedChanged"></asp:CheckBox>
                                    </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelectedID" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Customer Name" SortExpression="custname">
                                <ItemTemplate>
                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("custname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Veh./Chasis No" SortExpression="vehChasisno">
                                <ItemTemplate>
                                    <asp:Label ID="lblvehChasisno" runat="server" Text='<%# Bind("vehChasisno") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="duedate">
                                <ItemTemplate>
                                    <asp:Label ID="lblduedate" Visible="false" runat="server" Text='<%# Bind("duedate" , "{0:MM-dd-yyyy}") %>'></asp:Label>
                                    <asp:Label ID="lblduedateDisplay" runat="server" Text='<%# Bind("duedate", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile No" SortExpression="mobileno">
                                <ItemTemplate>
                                    <asp:Label ID="lblmobileno" runat="server" Text='<%# Bind("mobileno") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Alternate No" SortExpression="whatsappno">
                                <ItemTemplate>
                                    <asp:Label ID="lblwhatsappno" runat="server" Text='<%# Bind("whatsappno") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Model Name" SortExpression="modelname">
                                <ItemTemplate>
                                    <asp:Label ID="lblmodelid" Visible="false" runat="server" Text='<%# Bind("modelid") %>'></asp:Label>
                                    <asp:Label ID="lblmodelname" runat="server" Text='<%# Bind("modelname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Renewal From" SortExpression="lastrenewalfromval">
                                <ItemTemplate>
                                    <asp:Label ID="lbllastrenewalfromid" Visible="false" runat="server" Text='<%# Bind("lastrenewalfromid") %>'></asp:Label>
                                    <asp:Label ID="lbllastrenewalfromval" runat="server" Text='<%# Bind("lastrenewalfromval") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active?" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblisactive" Visible="false" runat="server" Text='<%# Bind("isactive") %>'></asp:Label>
                                    <asp:Label ID="lbldisplayisactive" runat="server" Text='<%# Eval("isactive").ToString() == "1" ? "Yes": "No" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbllocationid" runat="server" Text='<%# Bind("locationid") %>'></asp:Label>
                                    <asp:Label ID="lbllocation" runat="server" Text='<%# Bind("locationname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" OnClick="EditRow_Click" CommandArgument='<%# Eval("id") %>'
                                        Text="Edit" CssClass="btn btn-primary" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:Button ID="btnDelete" runat="server" OnClick="DeleteRow_Click" CommandArgument='<%# Eval("id") %>'
                                        Text="Delete" CssClass="btn btn-danger" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div id="modalpopups">
                    <%--lnkFake Link Button for mpeAddUpdateRecord ModalPopup as TargetControlID--%>
                    <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
                    <%--pnlAddUpdateDetails Panel With Design--%>
                    <asp:Panel ID="pnlAddUpdateDetails" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="col-md-12">
                            <div style="overflow-y: auto; overflow-x: hidden; max-height: 450px;">
                                <div class="modal-header" align="center">
                                    <asp:Label ID="lblHeading" ForeColor="Red" Font-Bold="true" runat="server" CssClass="modal-title"></asp:Label>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-4">
                                                Customer Name:
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtName"
                                                    ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-employee"></i></span>
                                                    <asp:TextBox ID="txtName" CssClass="form-control " placeholder="Customer Name" autocomplete="off"
                                                        MaxLength="50" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                Last Renewal From:
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlLastRenewalFrom"
                                                    ValidationGroup="add" ForeColor="Red" InitialValue="0" SetFocusOnError="true"
                                                    runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                                                    <asp:DropDownList ID="ddlLastRenewalFrom" CssClass="form-control " runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                Vehicle/Chasis No:
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtVehChasisNo"
                                                    ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                                                    <asp:TextBox ID="txtVehChasisNo" CssClass="form-control " placeholder="Veh./Chasis No"
                                                        autocomplete="off" MaxLength="40" onkeypress="return RestrictSpace()" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                Due Date:
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtDueDate"
                                                    ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                                                    <asp:TextBox ID="txtDueDate" CssClass="form-control " placeholder="Due Date" autocomplete="off"
                                                        MaxLength="10" runat="server"></asp:TextBox>
                                                    <uc:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDueDate"
                                                        Format="MM/dd/yyyy">
                                                    </uc:CalendarExtender>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                Mobile No:
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtMobileNo"
                                                    ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                                                    <asp:TextBox ID="txtMobileNo" CssClass="form-control " placeholder="Mobile No" autocomplete="off"
                                                        onKeyPress="return checkIt(event)" MaxLength="10" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                Alternate Mobile No:
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtWhatsappNo"
                                                    ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                                                    <asp:TextBox ID="txtWhatsappNo" CssClass="form-control " placeholder="Alternate Mobile No"
                                                        autocomplete="off" onKeyPress="return checkIt(event)" MaxLength="10" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                Model:
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="ddlModel"
                                                    ValidationGroup="add" ForeColor="Red" InitialValue="0" SetFocusOnError="true"
                                                    runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                                                    <asp:DropDownList ID="ddlModel" CssClass="form-control " runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <br />
                                                <div class="col-md-6">
                                                    <asp:FileUpload ID="FileuploadImage" multiple="multiple" runat="server" />
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:Button ID="btnFileUpload" Text="Upload Files" CssClass="btn btn-danger" runat="server"
                                                        OnClick="btnFileUpload_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row col-md-12">
                                            <asp:Label ID="lblUploadedFiles" runat="server" ForeColor="Red" Font-Bold="true"
                                                Text="Uploaded Files"></asp:Label>
                                            <br />
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" Width="100%"
                                                OnRowDataBound="GridView2_RowDataBound">
                                                <HeaderStyle BackColor="#344261" ForeColor="White" />
                                                <Columns>
                                                    <%--<asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                            ItemStyle-Width="20px" />--%>
                                                    <asp:TemplateField Visible="false" HeaderText="ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sr#">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="File">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbluploadedfilename" runat="server" Text='<%# Bind("uploadedfilename") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Download File">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDownload" CommandArgument='<%# Eval("uploadedfilename") %>'
                                                                runat="server" OnClick="lnkDownload_Click"><img src="img/downloadfile.png" width="30" /> </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="EditRow_Click" CommandArgument='<%# Eval("id") %>'
                                                                class="btn btn-primary" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="DeleteAttachmentRow_Click"
                                                                CommandArgument='<%# Eval("id") %>' class="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete this file!!')" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="form-group" style="display: none;">
                                        <div class="row">
                                            <div class="col-md-2">
                                                Status:
                                            </div>
                                            <div class="col-md-4">
                                                <asp:CheckBox ID="chkActive" runat="server" Checked="true" Text="Active" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div align="center" class="modal-footer">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:HiddenField ID="hfAddEditRecordId" runat="server" Value="0" />
                                        <asp:HiddenField ID="hfAddEdit" runat="server" Value="ADD" />
                                        <asp:Button ID="btnSave" runat="server" Text="ADD" OnClick="SaveRecord_Click" class="btn btn-success"
                                            ValidationGroup="add"></asp:Button>
                                        <button id="btnCancel" runat="server" class="btn btn-primary">
                                            Cancel
                                        </button>
                                    </div>
                                    <asp:Label ID="lblPanelInfo" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <%--mpeAddUpdateRecord Modal Popup Extender For pnlAddUpdateDetails--%>
                    <uc:ModalPopupExtender ID="mpeAddUpdateRecord" runat="server" PopupControlID="pnlAddUpdateDetails"
                        TargetControlID="lnkFake" BehaviorID="mpeAddUpdateRecord" CancelControlID="btnCancel"
                        BackgroundCssClass="modalBackground">
                    </uc:ModalPopupExtender>
                    <%--lnkFake1 Link Button for mpeDeleteRecord ModalPopup as TargetControlID--%>
                    <asp:LinkButton ID="lnkFake1" runat="server"></asp:LinkButton>
                    <%--pnlDeleteData Panel With Design--%>
                    <asp:Panel ID="pnlDeleteRecord" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div id="Div1" runat="server" class="header">
                        </div>
                        <div style="overflow-y: auto; overflow-x: hidden; max-height: 450px;">
                            <div class="form-group modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        Do you Want to delete this record ?
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div align="right" class="modal-footer">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:HiddenField ID="hfDeleteRecordId" runat="server" Value="0" />
                                    <asp:Button ID="btnYes" runat="server" Text="Yes" OnClick="ConfirmDelete_Click" class="btn btn-danger">
                                    </asp:Button>
                                    <button id="btnNo" runat="server" class="btn btn-default">
                                        Cancel
                                    </button>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <%-- mpeDeleteRecord Modal Popup Extender For pnlDeleteRecord--%>
                    <uc:ModalPopupExtender ID="mpeDeleteRecord" runat="server" PopupControlID="pnlDeleteRecord"
                        TargetControlID="lnkFake1" BehaviorID="mpeDeleteRecord" CancelControlID="btnNo"
                        BackgroundCssClass="modalBackground">
                    </uc:ModalPopupExtender>
                </div>
            </div>

             <script type="text/javascript">

                 $(function () {
                     $("#ddlUsers").select2();
                        bindListBox(); // bind data table on first page load
                        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindListBox); // bind data table on every UpdatePanel refresh
                    });

                    //        $(document).ready(function () {

                    function bindListBox() {
                        $("#ddlUsers").select2();
                        $('[id*=lstLastRenewalFrom]').multiselect({
                            includeSelectAllOption: true
                        });
                    }
                    </script>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnFileUpload" />
        </Triggers>
    </asp:UpdatePanel>
    <br />
    <br />
</asp:Content>
