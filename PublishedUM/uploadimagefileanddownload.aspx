<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="uploadimagefileanddownload, App_Web_xgwfkdro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


   <div align="center">
    <asp:Label ID="lblErrorInfo" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
   </div>
    <table class="table table-bordered table-responsive">
        <tr>
            <td>Latitute:</td>
            <td>
                <asp:TextBox ID="txtlatitute" runat="server" Text="29.171486"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>Long:</td>
            <td>
                <asp:TextBox ID="txtlongitute" runat="server" Text="75.77281"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>Date:</td>
            <td>
                <asp:TextBox ID="txtdate" runat="server" Text=""></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>Time:</td>
            <td>
                <asp:TextBox ID="txttime" runat="server" Text=""></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Choose File:
            </td>
            <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td> Upload File: </td>
            <td>
                 <asp:Button ID="btnFileUpload1" Text="Upload" runat="server" OnClick="Upload" />
            </td>
        </tr>
    </table>


</asp:Content>

