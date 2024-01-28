<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_mdgle5ws" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    // Stop Caching in IE
    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    // Stop Caching in Firefox
    Response.Cache.SetNoStore();

    Response.Cache.SetExpires(DateTime.Now);
    Response.Buffer = true;

    Response.Expires = -1;
    Response.CacheControl = "no-cache";    
%>
<script type="text/javascript" language="Javascript">
    history.go(1); // disable the browser's back button
</script>
<script language="javascript" src="js/md5.js" type="text/javascript"></script>
<script language="Javascript" type="text/javascript">

    function validate() {
        var newpassword = document.getElementById('txtPassword').value;

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

        if ((document.getElementById('txtPassword').value == '') || (document.getElementById('txtUserName').value == '')) {
            alert("Please enter UserId and Password");
            return -1;
        }

        var password = document.getElementById('txtPassword').value;



        if (password.length == 0 || password.length < 6 || password.length > 15) {
            document.getElementById('txtPassword').focus();
            return -1;
        }

        var rexp1 = /^(?=[\w$#@]{6,15})[\w$#@]{6,15}$/;

        if (password.search(rexp1) == -1) {
            alert("Please enter valid UserId or password");
            //document.forms[0].txtpassword.focus();
            return -1;
        }

        var hash = hex_md5(seed + hex_md5(password));
        document.getElementById('txtPassword').value = hash;



        var username = document.getElementById('txtUserName').value;

        var rexp = /^\w+$/;

        if (username.length < 3 || username.length > 15) {
            alert("Please enter valid UserId or password");
            document.getElementById('txtUserName').focus();
            return -1;
        }

        if (username.search(rexp) == -1) {
            alert("Please enter valid UserId or password");
            //document.getElementById('txtUserId').focus();
            return -1;
        }

        return true;
    }

    function capLock(e) {

        var msg1, msg2;
        kc = e.keyCode ? e.keyCode : e.which;
        sk = e.shiftKey ? e.shiftKey : ((kc == 16) ? true : false);
        var isCtrlPressed = e.ctrlKey;

        if (((kc >= 65 && kc <= 90) && !sk) || ((kc >= 97 && kc <= 122) && sk)) {

            if ((isCtrlPressed)) {
                msg1 = '';
            }
            else {
                msg1 = 'Caps Lock';
            }
        }
        else {
            msg1 = '';
        }

        if ((e.keyCode == 144) && (kc >= 48 && kc <= 57)) {
            if (msg1 == "") {
                msg2 = 'Num Lock';
            }
            else {
                msg2 = ' and Num Lock';
            }

        }
        else {

            msg2 = '';
        }



        if ((msg1 == '') && (msg2 == ''))
        { document.getElementById('divMayus').style.visibility = 'hidden'; }
        else
        { document.getElementById('divMayus').style.visibility = 'visible'; }

    }


    function myFunction() {
        var x = document.getElementById("txtPassword");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }

    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href="cssdynamicmenu/responsiveloginform.css" rel="stylesheet" type="text/css" />
    <link href="css/defaultpageStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <%--<form class="login">
  <input type="text" placeholder="Username">
  <input type="password" placeholder="Password">
	  <button>Sign In</button>
</form>

https://www.codingnepalweb.com/transparent-login-form-html-css-javascript/

https://www.codingflicks.com/2020/11/transparent-login-form.html

https://www.hmablogs.com/make-a-transparent-login-form-in-html/

https://codepen.io/eren12331/pen/xxbJeaW

https://www.foolishdeveloper.com/2021/09/transparent-login-form-with-html-and.html



    --%>
    <form id="form1" runat="server" method="post" defaultfocus="txtUserName" defaultbutton="btnLogin">
    <%--<div id="sp-header" class="header-sticky" >
        United ERP
    </div>--%>
    <div class="bg-img">
        <div class="content">
            <header>Login Form</header>
            <div class="row">
                <div class="col-md-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <asp:TextBox ID="txtUserName" runat="server" MaxLength="10" required class="form-control field"
                            AutoPostBack="true" OnTextChanged="txtUserName_TextChanged" placeholder="Mobile No"
                            Width="100%"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUserName"
                        SetFocusOnError="true" Display="None" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <br />
                    <label>
                        <span class="text-danger" style="color: Red;">*</span></label>
                </div>
                <div>
                    <div class="col-md-10" style="margin-top: 16px;">
                        <div class="input-group ">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="40" class="form-control field "
                                placeholder="OTP"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword"
                            SetFocusOnError="true" Display="None" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <br />
                        <label>
                            <span class="text-danger" style="color: Red;">*</span></label>
                    </div>
                </div>
            </div>
            <div class="pass">
                <%-- <a href="#">Forgot Password?</a>--%>
                <br />
            </div>
            <div class="field">
                <%--<input type="submit" value="LOGIN">--%>
                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" class="btn  btn-danger"
                    BackColor="#3498DB" Text="Sign in" />
                <%--OnClientClick="disableBtn(this.id, 'Please wait...')"     UseSubmitBehavior="false"--%>
            </div>
            <%--<div class="login">Or login with</div>--%>
            <div class="links" style="padding-top: 16px;">
                <%-- <div class="facebook">
            <i class="fab fa-facebook-f"><span>Facebook</span></i>
          </div>
          <div class="instagram">
            <i class="fab fa-instagram"><span>Instagram</span></i>
          </div>--%>
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
            <%-- <div class="signup">Don't have account?
          <a href="#">Signup Now</a>
        </div>--%>
        </div>
    </div>
    <%--   to show please wait message--%>
    <%-- <script>
      const pass_field = document.querySelector('.pass-key');
      const showBtn = document.querySelector('.show');
      showBtn.addEventListener('click', function(){
       if(pass_field.type === "password"){
         pass_field.type = "text";
         showBtn.textContent = "HIDE";
         showBtn.style.color = "#3498db";
       }else{
         pass_field.type = "password";
         showBtn.textContent = "SHOW";
         showBtn.style.color = "#222";
       }
      });
    </script>--%>
    <%--  end to show please wait message--%>
    <%-- <div  >
        <div class="row" >--%>
    <%--  <div class="col-md-12" style="background-color:#2A3342; color:White;">
                <div  class="col-md-10">
              
               <h1> United Motors </h1>
               <h5>ERP</h5>
                </div>

            </div>--%>
    <%--<br />
            <br />
            <br />
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 " >
                <div class="panel panel-primary login">
                    <div class="well" style="background-color:#2A3342; color:White;">
                        <div class="row">
                      
                        <div class="col-md-10">
                         <p class="thin text-center" style="font-weight: bold; font-size: large; ">
                            Sign in to your account</p>
                        </div>
                    </div>
                    </div>
                    <div class="panel-body">
                        <div class="top-margin">
                            <label>
                                Mobile No:
                               
                           
                        </div>
                        <div class="top-margin">
                            <label>
                                OTP: <span class="text-danger">*</span></label>
                          
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                               
                            </div>
                            <div style="display: none;">
                                <input type="checkbox" onclick="myFunction()">Show Password
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-lg-8">
                                <b><a href="forgotPassword.aspx">Forgot password?</a></b>
                            </div>
                            <div class="col-lg-10 text-right">
                              
                            </div>
                            <div>
                                <asp:RegularExpressionValidator ID="revUseralphanum" runat="server" ControlToValidate="txtUserName"
                                    ValidationExpression="[a-zA-Z0-9]*" ErrorMessage="Either User ID or password is incorrect.."
                                    Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revpassword" runat="server" ControlToValidate="txtPassword"
                                    ValidationExpression="[aA-zZ0-9$#@]*" ErrorMessage="Either User ID or password is incorrect.."
                                    Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                <br />
                                <br />
                                <br />
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
    <%--  </div>
    </div>--%>
    <div class="panel-footer" style="border: 1px solid #666; bottom: 0; left: 0; position: fixed;
        width: 100%; margin-top: 100px; white-space: nowrap">
        <div class="modal-footer">
            website developed and hosted by <a style="color: Teal;" href="http://www.scubesoftwares.com"
                target="_blank">S Cube Softwares</a>
        </div>
    </div>
    </form>
    <script src="changeButtonTextonSubmit/JScript2.js" type="text/javascript"></script>
</body>
</html>
