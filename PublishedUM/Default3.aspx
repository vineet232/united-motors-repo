<%@ page language="C#" autoeventwireup="true" inherits="Default3, App_Web_weocsvet" %>

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
     <form id="form1" runat="server" method="post" defaultfocus="txtUserName" defaultbutton="btnLogin" >
   
     <div class="bg-img">
      <div class="content">
        <header>Login Form</header>
       
       <div class="row">
        <div class="col-md-10">
         <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                               <asp:TextBox ID="txtUserName" runat="server" MaxLength="10" required class="form-control field" AutoPostBack="true" OnTextChanged="txtUserName_TextChanged"
                                    placeholder="Mobile No" Width="100%"></asp:TextBox>
                            </div>
        </div>
        <div class="col-md-2">
         
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUserName"
                                    SetFocusOnError="true" Display="None" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <br />
                                <label> <span class="text-danger" style="color:Red;">*</span></label>
                           
           
        </div>
        <div  >
         <div class="col-md-10" style="margin-top: 16px;">
         <div class="input-group ">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="40" class="form-control field "  placeholder="OTP"></asp:TextBox>
            </div>
         </div>
         <div class="col-md-2">
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword"
                                    SetFocusOnError="true" Display="None" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                               <br />
                                <label> <span class="text-danger" style="color:Red;">*</span></label>
         </div>
         </div>
       </div>
         
          <div class="pass">
           <br />
          </div>
          <div class="field">
              <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" class="btn  btn-danger"
                        BackColor="#3498DB" Text="Sign in"  />  
          </div>
       
        <div class="links" style="padding-top:16px;">
         
          
          <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>

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
    </form>
</body>
</html>
