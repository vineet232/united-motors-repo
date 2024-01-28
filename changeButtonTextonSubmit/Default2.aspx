<%@ page language="C#" autoeventwireup="true" inherits="WithValidationControl, App_Web_a1r1n4bc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Disable the Submit Button on Click - with validation control</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <table>
            <tr>
                <th colspan="2">Enter two Positive Numbers</th>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Input 1: "></asp:Label>
                   
                    
                   
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" Display="Dynamic">enter some number</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="TextBox1" Display="Dynamic" MaximumValue="999999" 
                        MinimumValue="0" Type="Integer">Number Only!</asp:RangeValidator>
                    </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Input 2: "></asp:Label></td>
                <td> <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" Display="Dynamic">enter some number</asp:RequiredFieldValidator>
                    
                    <asp:RangeValidator ID="RangeValidator2" runat="server" 
                        ControlToValidate="TextBox2" Display="Dynamic" MaximumValue="999999" 
                        MinimumValue="0" Type="Integer">Number Only!</asp:RangeValidator>
                    
                    </td>
            </tr>
            
             <tr>
                <td></td>
                <td>                 
                     <asp:button id="btnOne"  tabIndex="0" Runat="server" Text="Submit"
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
    
    <script type="text/javascript" src="JScript2.js"></script>
    
</body>
</html>
