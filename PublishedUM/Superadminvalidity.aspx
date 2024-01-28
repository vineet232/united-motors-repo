<%@ page title="" language="C#" masterpagefile="~/SuperAdminMasterPage.master" autoeventwireup="true" inherits="validity, App_Web_h5d101sg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <script src="CalenderCSSJS/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <link href="CalenderCSSJS/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />--%>
    <%--display loading image during postback--%>
    <%--<script src="loadingjs/jquery.min.js" type="text/javascript"></script>
    <script src="loadingjs/jquery.blockUI.js" type="text/javascript"></script>
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
    </script>--%>
    <script type="text/javascript">
        $(function () {
            $('.date').datepicker({
                autoclose: true,
                startDate: new Date(),
                closeOnDateSelect: true,
                changeMonth: true,
                changeYear: true,
                format: "dd/mm/yyyy",
                language: "tr",
                todayHighlight: 'TRUE'
            });
        });

    </script>
    <link href="cssLoadingimg/showloadingimg.css" rel="stylesheet" type="text/css" />
    <%--End display loading image during postback--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <%-- <asp:UpdateProgress ID="showProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
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
        <ContentTemplate>--%>
    <div class="row">
        <div align="center" class="topHeaderStyle">
            Licence Validity
        </div>
    </div>
    <div class="col-md-12">
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
    </div>
    <div class="col-md-12">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" Width="100%"
            OnRowDataBound="GridView2RowDataBound">
            <HeaderStyle BackColor="#344261" ForeColor="White" />
            <AlternatingRowStyle BackColor="#DFEAF9" />
            <Columns>
                <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                    ItemStyle-Width="20px" />
                <asp:BoundField HeaderText="ID" DataField="Id" ItemStyle-Width="100px" ItemStyle-Wrap="false" />
                <asp:BoundField HeaderText="Valid UpTo" DataField="ValidUpTo" ItemStyle-Width="100px"
                    ItemStyle-Wrap="false" />
                <asp:BoundField HeaderText="Days Left" DataField="DaysLeft" ItemStyle-Width="80px"
                    ItemStyle-Wrap="false" />
                <asp:BoundField HeaderText="Valid From" DataField="ValidFrom" ItemStyle-Width="100px"
                    ItemStyle-Wrap="false" />
            </Columns>
        </asp:GridView>
    </div>
    <%--<tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Valid Upto:" ForeColor="Red" Font-Bold="true"></asp:Label>
                     <asp:Label ID="lblValidUpTo" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Label ID="Label3" runat="server" Text="Days Left:" ForeColor="Red" Font-Bold="true"></asp:Label>
                       <asp:Label ID="lbldaysLeft" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label5" runat="server" Text="Valid From:" ForeColor="Red" Font-Bold="true"></asp:Label>
                         <asp:Label ID="lblValidFrom" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                </td>
            </tr>--%>
    <div class="row">
        <div class="col-md-12">
            Valid From:
            <br />
            <asp:Label ID="lblValidFrom" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        </div>
        <div class="col-md-12">
            Days Left:
            <br />
            <asp:Label ID="lbldaysLeft" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        </div>
        <div class="col-md-12">
            Valid UpTo:<i style="color: Red;">(dd/mm/yyyy)</i>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator121" runat="server" ErrorMessage="*"
                ControlToValidate="txtValidUpto" ValidationGroup="system" SetFocusOnError="true"
                ForeColor="Red"></asp:RequiredFieldValidator>
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                <asp:TextBox ID="txtValidUpto" autocomplete="off" runat="server" onkeydown="return false;"
                    CssClass="form-control date" MaxLength="40" required placeholder="Validity"></asp:TextBox>
                </span>
            </div>
        </div>
        <div class="col-md-12" align="center">
            <br />
            <asp:Button ID="btnUpdateLicense" Text="Update License" OnClick="btnUpdateLicense_Click"
                runat="server" CssClass="btn btn-danger" />
        </div>
    </div>
    <%--  </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
