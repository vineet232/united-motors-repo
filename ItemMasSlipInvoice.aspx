<%@ page title="" language="C#" masterpagefile="~/VipinAutomobiles.master" autoeventwireup="true" inherits="ItemMasSlipInvoice, App_Web_gdx0w2k3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" style="vertical-align: top;" align="center">
                <tr valign="top">
                    <td valign="top">
                        <b style="color: Blue;"><u>MASTER ENTERIES (Performa Invoice)</u></b>
                    </td>
                </tr>
                <tr class="menuBackground">
                    <td nowrap>
                       
                        &nbsp;ItemName:
                        <asp:TextBox ID="txtVal" MaxLength="250" runat="server"></asp:TextBox>
                        <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtVal"
                            MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
                            ServiceMethod="GetNames">
                        </asp:AutoCompleteExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtVal"
                            ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        &nbsp; Rate:
                        <asp:TextBox ID="txtRate" Width="60px" MaxLength="6" onKeyPress="return checkIt(event)"
                            runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtRate"
                            ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>

                            
                       
                    </td>
                </tr>
                <tr>
                    
                    <td align="center">
                     &nbsp;&nbsp;
                        <asp:Button ID="btnAdd" runat="server" Text="Add New.." OnClick="SaveNew" CssClass="button"
                            ValidationGroup="add" />

                         &nbsp;&nbsp;
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="SearchRecord" CssClass="button"
                            CausesValidation="false" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="SaveUpdate" CssClass="button"
                            ValidationGroup="add" />
                        &nbsp;
                        <asp:Button ID="btnDel" runat="server" Text="Delete" OnClick="DeleteRecord" CssClass="button"
                            OnClientClick="return confirm  ('Are you sure you want to delete the selected record!!')" />
                        &nbsp;&nbsp; <b style="font-size: 11px;">(Please Select a Record to Update/Delete)</b>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="border-bottom: 1px solid black;">
                        <asp:Label ID="lblError" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="true" PageSize="10"
                            OnPageIndexChanging="PageIndexChanging" OnSelectedIndexChanged="GridIndexChanged"
                            OnRowDataBound="GridViewRowDataBound" EmptyDataText="No Record Found">
                            <HeaderStyle BackColor="black" ForeColor="White" />
                            <SelectedRowStyle BackColor="Silver" />
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/check.gif"
                                    ItemStyle-Width="20px" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

