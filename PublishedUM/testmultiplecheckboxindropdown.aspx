<%@ page language="C#" autoeventwireup="true" inherits="testmultiplecheckboxindropdown, App_Web_mdgle5ws" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<script type="text/javascript">
    $(function () {
        $('[id*=lstFruits]').multiselect({
            includeSelectAllOption: true
        });
    });
</script>


</head>
<body>
    <form id="form1" runat="server">
    <div>
    




<asp:ListBox ID="lstFruits" runat="server" SelectionMode="Multiple">
    <asp:ListItem Text="Mango" Value="1" />
    <asp:ListItem Text="Apple" Value="2" />
    <asp:ListItem Text="Banana" Value="3" />
    <asp:ListItem Text="Guava" Value="4" />
    <asp:ListItem Text="Orange" Value="5" />
</asp:ListBox>

    </div>
    </form>
</body>
</html>
