<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="receiptMas, App_Web_y0qsyvj2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery.min.js" type="text/javascript"></script>

     <script src="vabillimg/CalendarControl.js" type="text/javascript"></script>
    <link href="vabillimg/CalendarControl.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" style="vertical-align: top;" align="center" class="table table-responsive">
        <tr valign="top">
            <td valign="top">
                <b style="color: Blue;"><u>Receipts</u></b>
            </td>
        </tr>
        <tr runat="server" id="btnTr" class="well well-sm">
            <td nowrap>
                Veh No:
                <asp:TextBox ID="txtSeVehNo" runat="server" MaxLength="20"></asp:TextBox>
                &nbsp;
                <asp:Button ID="btnSearch" runat="server" OnClick="SearchRecord" Text="Show Detail"
                    CssClass="btn btn-info" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAdd" runat="server" Text="Add New.." OnClick="ShowSave" CssClass="btn btn-primary"
                    ValidationGroup="add" />
                &nbsp;&nbsp;
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="ShowSave2" CssClass="btn btn-success"
                    ValidationGroup="add" />
                &nbsp;
                <asp:Button ID="btnDel" runat="server" Text="Delete" OnClick="DeleteRecord" CssClass="btn btn-danger"
                    OnClientClick="return confirm  ('Are you sure you want to delete the selected record!!')" />
            </td>
        </tr>
        <tr class="updateHeaderImage" runat="server" id="txtTr">
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td align="right">
                                        Date:
                                    </td>
                                    <td align="left" nowrap>
                                        <asp:TextBox ID="txteVdate" MaxLength="10" onfocus="showCalendarControl(this);" ToolTip="MM/DD/YYYY"
                                            Width="70px" runat="server" Text='<%# Bind("vdate","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                        (MM/DD/YYYY)
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator122" runat="server" ErrorMessage="*"
                                            ControlToValidate="txteVdate" ValidationGroup="add" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Vehicle No:
                                    </td>
                                    <td align="left" nowrap>
                                        <asp:TextBox ID="txtVehNum" MaxLength="20" Width="120px" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtVehNum"
                                            ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                    <td align="right">
                                        Make:
                                    </td>
                                    <td align="left" nowrap>
                                        <asp:TextBox ID="txtMake" MaxLength="20" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtMake"
                                            ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        RECEIVED with thanks from:
                                    </td>
                                    <td colspan="3" align="left" nowrap>
                                        <asp:TextBox ID="txtOwner" MaxLength="100" Width="650px" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtOwner"
                                            ValidationGroup="add" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        the sum of Rupees
                                    </td>
                                    <td colspan="3" align="left" nowrap>
                                        <asp:TextBox ID="txtAmtWrds" MaxLength="100" Width="650px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        in
                                        <asp:RadioButton ID="rdCash" Checked="true" runat="server" GroupName="AmtType" Text="Cash" />/<asp:RadioButton
                                            ID="rdCheque" GroupName="AmtType" runat="server" Text="Cheque" />/<asp:RadioButton
                                                ID="rdDD" GroupName="AmtType" runat="server" Text="Draft P.O. No" />
                                        <asp:RadioButton ID="rdNEFT" GroupName="AmtType" runat="server" Text="NEFT" />
                                        <asp:RadioButton ID="rdRTGS" GroupName="AmtType" runat="server" Text="RTGS" />
                                        <asp:RadioButton ID="rdIMPS" GroupName="AmtType" runat="server" Text="IMPS" />
                                    </td>
                                    <td colspan="3" align="left" nowrap>
                                        <asp:TextBox ID="txtPODD" MaxLength="100" Width="650px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" nowrap>
                                        being
                                        <asp:RadioButton ID="rdFull" Checked="true" runat="server" GroupName="PType" Text="full" />
                                        /<asp:RadioButton ID="rdBal" runat="server" GroupName="PType" Text="Balance" />/<asp:RadioButton
                                            ID="rdAdvance" runat="server" GroupName="PType" Text="Advance" />
                                        payment of account for
                                    </td>
                                    <td colspan="3" align="left" nowrap>
                                        <asp:TextBox ID="txtAmtType" MaxLength="49" Width="300px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Bill No.
                                    </td>
                                    <td align="left" nowrap>
                                        <asp:TextBox ID="txtBillNo" MaxLength="15" runat="server"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        Dated:
                                    </td>
                                    <td align="left" nowrap>
                                        <asp:TextBox ID="TextBox1" MaxLength="10" onfocus="showCalendarControl(this);" ToolTip="MM/DD/YYYY"
                                            Width="70px" runat="server" Text='<%# Bind("vdate","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                        (MM/DD/YYYY)
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                            ControlToValidate="TextBox1" ValidationGroup="add" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Rs:
                                    </td>
                                    <td colspan="3" align="left" nowrap>
                                        <asp:TextBox ID="txtTOTAL" runat="server" Width="650px" MaxLength="100"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                            ControlToValidate="txtTOTAL" ValidationGroup="add" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b style="font-size: 12px;">(subject to encashment
                                            of cheque)</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        For Vipin Automobiles
                                        <br />
                                        <br />
                                        Auth. Signatory
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <asp:Button ID="btnsavenew" runat="server" Text="Save" OnClick="SaveNew" CssClass="button"
                                ValidationGroup="add" />&nbsp;
                            <asp:Button ID="btnupdaterec" runat="server" Text="Save" OnClick="SaveUpdate" CssClass="button"
                                ValidationGroup="add" />&nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="CancelSave" CausesValidation="false"
                                CssClass="button" ValidationGroup="add" />
                            <%-- &nbsp;&nbsp;
            <asp:Button ID="btnSearch" Visible="false" runat="server" Text="Search" OnClick="SearchRecord" CssClass="button" ValidationGroup="add" />--%>
                        </td>
                    </tr>
                </table>
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
                    CssClass="table table-responsive" OnPageIndexChanging="PageIndexChanging" AutoGenerateColumns="false"
                    OnSelectedIndexChanged="GridIndexChanged" OnRowDataBound="GridViewRowDataBound"
                    EmptyDataText="No Record Found">
                    <HeaderStyle BackColor="black" ForeColor="White" />
                    <SelectedRowStyle BackColor="Silver" />
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/vabillimg/check.gif"
                            ItemStyle-Width="20px" />
                        <asp:TemplateField Visible="false" HeaderText="AmtWrds">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="vnum" HeaderText="VehicleNo" />
                        <asp:BoundField DataField="vowner" HeaderText="Owner" />
                        <asp:BoundField DataField="vmake" HeaderText="Make" />
                        <asp:BoundField DataField="vdate" HtmlEncode="false" DataFormatString="{0:MM/dd/yyyy}"
                            HeaderText="Date" />
                        <%-- <asp:BoundField DataField="amtwrds" Visible="false" HeaderText="AmtWrds" />--%>
                        <asp:TemplateField Visible="false" HeaderText="AmtWrds">
                            <ItemTemplate>
                                <asp:Label ID="lblamtwrds" runat="server" Text='<%# Bind("amtwrds") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="amttype" HeaderText="AmtType" />
                        <%-- <asp:BoundField DataField="actfor" Visible="false" HeaderText="ActFor" />
                <asp:BoundField DataField="billno" Visible="false" HeaderText="BillNo" />--%>
                        <asp:TemplateField Visible="false" HeaderText="ActFor">
                            <ItemTemplate>
                                <asp:Label ID="lblactfor" runat="server" Text='<%# Bind("actfor") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false" HeaderText="Bill No">
                            <ItemTemplate>
                                <asp:Label ID="lblBillNo" runat="server" Text='<%# Bind("billno") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false" HeaderText="DDNo">
                            <ItemTemplate>
                                <asp:Label ID="lblDDNO" runat="server" Text='<%# Bind("DDNO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false" HeaderText="BillDate">
                            <ItemTemplate>
                                <asp:Label ID="lblBDate" runat="server" Text='<%# Bind("BILLDATE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false" HeaderText="TotalAmt">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalAMT" runat="server" Text='<%# Bind("TotalAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false" HeaderText="PType">
                            <ItemTemplate>
                                <asp:Label ID="lblPType" runat="server" Text='<%# Bind("PaymentType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
