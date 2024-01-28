<%@ page title="" language="C#" masterpagefile="~/VipinAutomobiles.master" autoeventwireup="true" inherits="custInfo, App_Web_1ssuryoo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table width="100%">
        <tr>
            <td>
                <b><u>Customer Information</u></b>
            </td>
        </tr>
        <tr class="menuBackground">
            <td align="center">
                Name: &nbsp;
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Veh. No. &nbsp;
                <asp:TextBox ID="txtVehNo" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="button" OnClick="btnShowClick" />
                &nbsp;&nbsp;
                <asp:Button ID="btnNew" runat="server" Text="Add New" CssClass="button" OnClick="btnNewClick" />
                &nbsp;&nbsp;
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button" OnClick="btnUpdateClick" />
                 &nbsp;&nbsp;
                <asp:Button ID="btnDel" runat="server" Text="Delete" CssClass="button" OnClientClick="return confirm('Are you sure you want to delete the selected recrod')" OnClick="btnDeleteClick" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="true" PageSize="10"
                    OnSelectedIndexChanged="GridIndexChanged" EmptyDataText="No Record Found" AutoGenerateColumns="false"
                     OnRowDataBound="GridViewRowDataBound">
                    <HeaderStyle BackColor="black" ForeColor="White" />
                    <SelectedRowStyle BackColor="Silver" />
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/check.gif"
                            ItemStyle-Width="20px" />
                        <asp:BoundField DataField="ID" HeaderText="Id" />
                        <asp:BoundField DataField="VehNo" HeaderText="VehNo" />
                        <asp:BoundField DataField="Cname" HeaderText="Name" />
                        <asp:BoundField DataField="FatherName" HeaderText="Fat. Name" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <%-- <asp:BoundField DataField="VehNo" HeaderText="VehNo" />--%>
                        <asp:BoundField DataField="Make" HeaderText="Make" />
                        <asp:BoundField DataField="Model" HeaderText="Model" />
                        <asp:BoundField DataField="Color" HeaderText="Colour" />
                       
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" id="tableDetail" runat="server">
                    <tr>
                        <td align="right">
                            Name:
                        </td>
                        <td align="left" nowrap>
                            <asp:TextBox ID="txtAName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="save" ControlToValidate="txtAName"
                                SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td align="right">
                            Father Name:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                        </td>
                        <td align="right">
                            Address:
                        </td>
                        <td rowspan="2" align="left">
                            <asp:TextBox ID="txtAdd" TextMode="MultiLine" Width="150px" Height="40px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Phone:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                        </td>
                        <td align="right">
                            Veh. No.:
                        </td>
                        <td align="left" nowrap>
                            <asp:TextBox ID="txtNVeh" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="save" ControlToValidate="txtNVeh"
                                SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td align="right">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Make:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtMake" runat="server"></asp:TextBox>
                        </td>
                        <td align="right">
                            Model:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                        </td>
                        <td align="right">
                            Colour:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="save" CssClass="button"
                                OnClick="btnSaveClick" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button" OnClick="btnCancelClick" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

