﻿<%@ page language="C#" autoeventwireup="true" inherits="Errorpage_AccountFreeze, App_Web_weocsvet" %>

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
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Your Account has been freezed for 10 min...
    </div>
    </form>
</body>
</html>
