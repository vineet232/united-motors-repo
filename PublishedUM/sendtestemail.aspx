<%@ page language="C#" autoeventwireup="true" inherits="sendtestemail, App_Web_weocsvet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>

    <asp:Button ID="Button1" Text="Send" OnClick="SendEmail" runat="server" />


    </div>
    </form>
</body>
</html>
