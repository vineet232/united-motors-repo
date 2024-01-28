<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="ChangePassword, App_Web_gdx0w2k3" viewstateencryptionmode="Always" enableviewstatemac="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script language="javascript" src="js/md5.js" type="text/javascript"></script>
    <script language="Javascript" type="text/javascript">
        function validate() {
            var newpassword = document.getElementById('ContentPlaceHolder1_tbnewpass').value;

            var rexp1 = /(?=^.{8,}$)(?=.*\d)(?=.*\W+)(?![.\n]).*$/;

            if (newpassword.search(rexp1) == -1) {
                alert("Please enter valid Password");
                document.getElementById('ContentPlaceHolder1_HiddenField1').value = "notvalid";
                return false;
            }
            else {
                return true;
            }
        }

        function md5auth(seed) {
            if ((document.getElementById('ContentPlaceHolder1_tbcurrentpass').value == '') || (document.getElementById('ContentPlaceHolder1_tbnewpass').value == '') || (document.getElementById('ContentPlaceHolder1_tbcpass').value == '')) {
                alert("*Fields are mandatory!");
                return -1;
            }

            var is_bool = validate();

            if (is_bool == true) {
                var oldpassword = document.getElementById('ContentPlaceHolder1_tbcurrentpass').value;
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

                var hash = hex_md5(seed + hex_md5(oldpassword));

                document.getElementById('ContentPlaceHolder1_tbcurrentpass').value = hash;
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
    <script src="loadingjs/jquery.min.js" type="text/javascript"></script>
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
    <link href="cssLoadingimg/showloadingimg.css" rel="stylesheet" type="text/css" />
    <%--End display loading image during postback--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="loading" align="center">
        Loading. Please wait.<br />
        <br />
        <img src="img/4.gif" alt="" />
    </div>
    <table class="table table-bordered table-responsive">
        <tr>
            <td align="center" bgcolor="#006B96" style="color: White;" class="text">
                Change Password
            </td>
        </tr>
    </table>
    <table class="table table-bordered table-responsive">
        <tr>
            <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:Label ID="ErrLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbnewpass"
                    ValidationExpression="(?=^.{8,}$)(?=.*\d)(?=.*\W+)(?![.\n]).*$" Display="Dynamic"
                    ErrorMessage="Must have at least 1 number, 1 special character, and up to 8 characters."
                    ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td align="right">
                Current Password : &nbsp;
            </td>
            <td>
                <asp:TextBox ID="tbcurrentpass" MaxLength="30" CssClass="form-control" placeholder="Current Password"
                    runat="server" TextMode="Password" autocomplete="off" AutoCompleteType="Disabled"></asp:TextBox>
                <font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td align="right">
                New Password : &nbsp;
            </td>
            <td>
                <asp:TextBox ID="tbnewpass" MaxLength="30" runat="server" CssClass="form-control"
                    placeholder="New Password" TextMode="Password" autocomplete="off" AutoCompleteType="Disabled"></asp:TextBox>
                <font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td align="right">
                Confirm Password : &nbsp;
            </td>
            <td>
                <asp:TextBox ID="tbcpass" MaxLength="30" runat="server" CssClass="form-control" placeholder="Confirm Password"
                    TextMode="Password" autocomplete="off" AutoCompleteType="Disabled"></asp:TextBox>
                <font color="red">*</font>
            </td>
        </tr>
        <%--<tr>
                        <td align="left">
                            <label for="captcha">
                                <font color="#000000">Enter Security Code as Shown: </font>
                            </label>
                        </td>
                        <td height="20" align="left">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/CImage.aspx" /><br />
                            <br />
                            <asp:TextBox ID="txtimgcode" runat="server"></asp:TextBox>
                            <div>
                            </div>
                            <div id='cpt'>
                            </div>
                        </td>
                    </tr>--%>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnSave" Style="display: inline;" runat="server" CssClass="btn btn-primary"
                    Text="Save" OnClick="btnSave_Click" CausesValidation="false" />
            </td>
        </tr>
    </table>
</asp:Content>
