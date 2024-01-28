<%@ page language="C#" autoeventwireup="true" inherits="forgotPassword, App_Web_weocsvet" enableviewstate="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <%--<script type="text/javascript">
        $(document).ready(function () {
            alert('hi');
            $("#txtAccount").mask("?9999/99999/99999");
        });
    </script>
    <script language="javascript" src="js/jquery-mask.js" type="text/javascript"></script>

    <script type="text/javascript">
        function mask(obj) {
            // alert(obj.value);
            obj.mask("?9999/99999/99999");
        }
    </script>--%>
    <link href="css/admin_style.css" rel="Stylesheet" type="text/css" />
    <script language="javascript" src="js/md5.js" type="text/javascript"></script>
    <script language="Javascript" type="text/javascript">
        function validate() {
            var newpassword = document.getElementById('tbnewpass').value;

            var rexp1 = /(?=^.{8,}$)(?=.*\d)(?=.*\W+)(?![.\n]).*$/;

            if (newpassword.search(rexp1) == -1) {
                alert("Please enter valid Password");
                document.getElementById('HiddenField1').value = "notvalid";
                return false;
            }
            else {
                return true;
            }
        }

        function md5auth(seed) {
            if ((document.getElementById('txtUName').value == '') || (document.getElementById('tbnewpass').value == '') || (document.getElementById('tbcpass').value == '')) {
                alert("*Fields are mandatory!");
                return -1;
            }

            var is_bool = validate();

            if (is_bool == true) {
                var newpassword = document.getElementById('tbnewpass').value;
                var conpassword = document.getElementById('tbcpass').value;

                if (newpassword != conpassword) {
                    alert("New Password and Confirm Password should be same!");
                    return -1;
                }

                if (newpassword.length == 0 || newpassword.length < 6 || newpassword.length > 15) {
                    alert("Password length should be greater than 5 and less than 16!");
                    document.getElementById('tbnewpass').focus();
                    return -1;
                }

                var rexp1 = /^(?=[\w$#@]{6,15})[\w$#@]{6,15}$/;

                if (newpassword.search(rexp1) == -1) {
                    alert("Please enter valid Password");
                    return -1;
                }

                document.getElementById('tbnewpass').value = hex_md5(newpassword);
                document.getElementById('tbcpass').value = hex_md5(conpassword);

                return true;
            }
            else {
                return false;
            }
        }       
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row">
        <div class=" text-center bg-info panel-heading">
            <h1>
                &nbsp;&nbsp; Forgot Password?</h1>
            &nbsp;&nbsp; <a href="Default.aspx">Login</a>
        </div>
        <br />
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="top-margin">
                        <label>
                            Username/Email <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtUserName" autocomplete="off" runat="server" MaxLength="40" class="form-control"
                            placeholder="User Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUserName"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </div>
                    <%--<div class="top-margin">
                            <label>
                                Mobile No: <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMobileNo" autocomplete="off" runat="server"  MaxLength="40" class="form-control"
                                placeholder="Mobile No"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtMobileNo"
                                SetFocusOnError="true" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>--%>
                    <hr />
                    <div class="row">
                        <div class="col-lg-10 text-right">
                            <asp:Button ID="btnLogin" runat="server" OnClick="btnSendPassword_Click" class="btn btn-action btn-danger"
                                Width="160px" Text="Send New Password" />
                        </div>
                        <div>
                            <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer" style="border: 1px solid #666; bottom: 0; left: 0; position: fixed;
            width: 100%; margin-top: 100px; white-space: nowrap">
            <div class="modal-footer">
                website developed and hosted by <a style="color: Teal;" href="http://www.scubesoftwares.com"
                    target="_blank">S Cube Softwares</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
