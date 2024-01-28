<%@ page title="" language="C#" masterpagefile="~/SuperAdminMasterPage.master" autoeventwireup="true" inherits="CreateUser, App_Web_h5d101sg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script language="javascript" src="js/md5.js" type="text/javascript"></script>
    <script language="Javascript" type="text/javascript">
        function validate() {
            var newpassword = document.getElementById('ContentPlaceHolder1_tbnewpass').value;

            var rexp1 = /(?=^.{8,}$)(?=.*\d)(?=.*\W+)(?![.\n]).*$/;

            if (newpassword.search(rexp1) == -1) {
                alert("Please enter valid Password test");
                document.getElementById('ContentPlaceHolder1_HiddenField1').value = "notvalid";

                return false;
            }
            else {
                return true;
            }
        }

        function md5auth(seed) {
            if ((document.getElementById('ContentPlaceHolder1_UserNameTextBox').value == '') || (document.getElementById('ContentPlaceHolder1_tbnewpass').value == '') || (document.getElementById('ContentPlaceHolder1_tbcpass').value == '')) {
                alert("*Fields are mandatory!");
                return -1;
            }

            var is_bool = validate();
            //////////alert(is_bool);
            if (is_bool == true) {
                var newpassword = document.getElementById('ContentPlaceHolder1_tbnewpass').value;
                var conpassword = document.getElementById('ContentPlaceHolder1_tbcpass').value;

                if (newpassword != conpassword) {
                    alert("New Password and Confirm Password should be same!");
                    return -1;
                }

                if (newpassword.length == 0 || newpassword.length < 6 || newpassword.length > 15) {
                    alert("Password length should be greater than 5 and less than 16!");
                    document.getElementById('ContentPlaceHolder1_tbnewpass').focus();
                    return -1;
                }

                var rexp1 = /^(?=[\w$#@]{6,15})[\w$#@]{6,15}$/;

                if (newpassword.search(rexp1) == -1) {
                    alert("Please enter valid Password");
                    return -1;
                }

                document.getElementById('ContentPlaceHolder1_tbnewpass').value = hex_md5(newpassword);
                document.getElementById('ContentPlaceHolder1_tbcpass').value = hex_md5(conpassword);

                return true;
            }
            else {
                return false;
            }
        }       
    </script>
    <%--display loading image during postback--%>
    <%--   <script src="loadingjs/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.blockUI.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modalSpinner");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 200);
        }
        $('form').live("submit", function () {
            ShowProgress();
        });
    </script>
    --%>
    <link href="cssLoadingimg/showloadingimg.css" rel="stylesheet" type="text/css" />
    <%--End display loading image during postback--%>
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
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="row">
                            <div align="center" class="topHeaderStyle">
                                Create User
                            </div>
                        </div>
                        <div class="col-md-12 well well-sm">
                            <div class="col-md-3">
                                User Name : <font color="red">*</font>
                                 <span id="error" style="color: Red; display: none">()*&^%$#@!<>/\ Characters are not allowed.</span>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <asp:TextBox ID="UserNameTextBox" autocomplete="off" MaxLength="50" CssClass="form-control"
                                        placeholder="User Name" runat="server" onkeypress="return IsSpecialKeys(event);" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                Password : <font color="red">*</font>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-eye-open"></i></span>
                                    <asp:TextBox ID="tbnewpass" autocomplete="off" MaxLength="30" CssClass="form-control"
                                        placeholder="Password" runat="server" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                Confirm Password : <font color="red">*</font>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-eye-open"></i></span>
                                    <asp:TextBox ID="tbcpass" autocomplete="off" MaxLength="30" CssClass="form-control"
                                        placeholder="Confirm Password" runat="server" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                Location : <font color="red">*</font>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-3">
                                Mobile No : <font color="red">*</font>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtMobileNo"
                                                    ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                    <asp:TextBox ID="txtMobileNo" CssClass="form-control" placeholder="Mobile No"
                                                        autocomplete="off" MaxLength="10" onKeyPress="return checkIt(event)" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                Email : 
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                   <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email"
                                                        autocomplete="off" MaxLength="50" runat="server"></asp:TextBox>
                                </div>
                            </div>
                           

                            <div class="col-md-6" align="center">
                                <br />
                                <asp:Button ID="btnSave" Style="display: inline;" runat="server" CssClass="btn btn-success"
                                    Text="Save" OnClick="btnSave_Click" CausesValidation="false" />
                                    &nbsp;&nbsp;

                                    <asp:Button ID="btnUpdateMobile" Style="display: inline;" runat="server" CssClass="btn btn-primary"
                                    Text="Update Details" OnClick="btnUpdateMobile_Click" CausesValidation="false" />
                                    &nbsp;&nbsp;

                                    <asp:Button ID="btnReset" Style="display: inline;" runat="server" CssClass="btn btn-info"
                                    Text="Reset" OnClick="btnReset_Click" CausesValidation="false" />

                                <br />
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:Label ID="lblError" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                <asp:Label ID="ErrLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbnewpass"
                                    ValidationExpression="(?=^.{8,}$)(?=.*\d)(?=.*\W+)(?![.\n]).*$" Display="Dynamic"
                                    ErrorMessage="Must have at least 1 number, 1 special character, and up to 8 characters."
                                    ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div align="center" class="topHeaderStyle">
                            Users List
                        </div>
                    </div>
                    <div class="col-md-12">
                        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false"
                            OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <HeaderStyle BackColor="#344261" ForeColor="White" />
                            <%-- <SelectedRowStyle BackColor="Silver" />--%>
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                  <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                            ItemStyle-Width="20px" />
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
                                <asp:TemplateField HeaderText="User Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblname" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Mobile No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmobile" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblemail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active?">
                                    <ItemTemplate>
                                        <asp:Label ID="lblisactive" Visible="false" runat="server" Text='<%# Bind("ac_active") %>'></asp:Label>
                                        <asp:Label ID="lbldisplayisactive" runat="server" Text='<%# Eval("ac_active").ToString() == "True" ? "Yes": "No" %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="btn btn-danger"
                                            OnClientClick="return confirm('Are you sure you want to reset password!!')" OnClick="btnResetPassword_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEnableDisable" runat="server" CssClass="btn btn-primary" OnClientClick="return confirm('Are you sure you want to enable/disable user!!')"
                                            OnClick="btnEnableDisable_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
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
            var rowscount = $("#<%=GridView1.ClientID %> tr").length;
            if (rowscount > 1) {
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
