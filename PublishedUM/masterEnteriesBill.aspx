<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="masterEnteriesBill, App_Web_1ssuryoo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="vabillimg/GridViewPagerStyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" style="vertical-align: top;" align="center" class="table table-responsive">
                <tr valign="top">
                    <td valign="top">
                        <b style="color: Blue;"><u>MASTER ENTERIES (Invoice)</u></b>
                    </td>
                </tr>
                <tr class="well well-sm">
                    <td nowrap>
                        &nbsp;ItemName:
                        <asp:TextBox ID="txtVal" MaxLength="250" runat="server"></asp:TextBox>
                        <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" TargetControlID="txtVal"
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
                        &nbsp; HSN/SAC Code:
                        <asp:TextBox ID="txtHsnCode" Text="8708" Width="60px" MaxLength="6" onKeyPress="return checkIt(event)"
                            runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorHSNCode3" ControlToValidate="txtHsnCode"
                            ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        &nbsp; Tax Rate:
                        <asp:TextBox ID="txtTaxRate" Text="28" Width="60px" MaxLength="6" onKeyPress="return checkIt(event)"
                            runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtTaxRate" ControlToValidate="txtTaxRate"
                            ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        &nbsp;&nbsp;
                        <asp:Button ID="btnAdd" runat="server" Text="Add New.." OnClick="SaveNew" CssClass="btn btn-primary"
                            ValidationGroup="add" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="SearchRecord" CssClass="btn btn-info"
                            CausesValidation="false" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="SaveUpdate" CssClass="btn btn-success"
                            ValidationGroup="add" />
                        &nbsp;
                        <asp:Button ID="btnDel" runat="server" Text="Delete" OnClick="DeleteRecord" CssClass="btn btn-danger"
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
                        <%----%>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" OnSelectedIndexChanged="GridIndexChanged"
                            CssClass="table table-responsive" OnRowDataBound="GridViewRowDataBound" EmptyDataText="No Record Found"
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="PageIndexChanging">
                            <HeaderStyle BackColor="black" ForeColor="White" />
                            <%--<SelectedRowStyle BackColor="Silver" />
                            <AlternatingRowStyle BackColor="#F0F0F0" />--%>
                            <PagerStyle HorizontalAlign="Right" CssClass="GridPager" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/vabillimg/check.gif"
                                    ItemStyle-Width="20px" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
