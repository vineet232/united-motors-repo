<%@ page language="C#" autoeventwireup="true" inherits="premiumcalculator2, App_Web_mdgle5ws" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
     <div align="center" class="col-md-6">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true" />
                    </div>

    
                                   
                                       
                                        <asp:DropDownList ID="ddlcompany" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                    
                               <asp:DropDownList ID="ddlComp" runat="server"></asp:DropDownList>

                                
                        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" CssClass="btn btn-danger"
                            OnClick="btncalculate_click" />
                       
                  


    </div>
    </form>
</body>
</html>
