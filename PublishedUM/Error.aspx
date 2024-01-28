<%@ page language="C#" autoeventwireup="true" inherits="Error, App_Web_mdgle5ws" %>

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
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class=" text-center panel-heading" style="background-color: Red; color: White;">
        <h1>
            &nbsp;&nbsp; Error!!!!
        </h1>
    </div>
    <br />
    <br />
    <div class="container text-center text-danger" style="font-size: large;">
        <h1>
            Ooopsss.......</h1>
        <br />
        Something wrong has happened!!
        <br />
        Please try again by clicking <a href="Default.aspx">here</a>
    </div>
    </form>
</body>
</html>
