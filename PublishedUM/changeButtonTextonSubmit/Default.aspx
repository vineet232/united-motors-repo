<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_a1r1n4bc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Disable the Submit Button on Click - without validation control</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>        
             <tr>
                <td></td>
                <td>                 
                     <asp:button id="btnOne" tabIndex="0" Runat="server" Text="Submit"
                        onclick="btnOne_Click" 
                        OnClientClick="disableBtn(this.id, 'Submitting...')" 
                        UseSubmitBehavior="false" />               
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    
         
                
           
    </div>
    </form>
    
    <script type="text/javascript" src="JScript.js"></script>
    
</body>
</html>
