<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="bills, App_Web_1ssuryoo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <link href="vabillimg/style-sheet.css" rel="stylesheet" type="text/css" />
    <script src="vabillimg/CalendarControl.js" type="text/javascript"></script>
    <link href="vabillimg/CalendarControl.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
  
    <%--<script type="text/javascript">
         var xPos, yPos;
         var prm = Sys.WebForms.PageRequestManager.getInstance();
         function BeginRequestHandler(sender, args) {
             if ($get('<%= pnlData.ClientID %>') != null) {
                 xPos = $get('<%= pnlData.ClientID %>').scrollLeft;
                 yPos = $get('<%= pnlData.ClientID %>').scrollTop;
             }
         }

         function EndRequestHandler(sender, args) {
             if ($get('<%= pnlData.ClientID %>') != null) {
                 $get('<%= pnlData.ClientID %>').scrollLeft = xPos;
                 $get('<%= pnlData.ClientID %>').scrollTop = yPos;
             }
         }
         prm.add_beginRequest(BeginRequestHandler);
         prm.add_endRequest(EndRequestHandler);

    
    </script>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" style="vertical-align: top;" align="center" class="table table-responsive">
                <tr valign="top">
                    <td valign="top">
                        <b style="color: Blue;"><u>Bills</u></b>
                    </td>
                    <td align="center" style="border-bottom: 1px solid black;">
                        <asp:Label ID="lblError" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:HiddenField ID="HiddenField2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="100%">
                            <tr>
                                <td>
                                    <table width="90%" cellspacing="0" class="well well-sm">
                                        <tr>
                                            <td align="right" nowrap>
                                                Vehicle Num:
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox ID="txtNewVeh" MaxLength="20" Width="120px" ValidationGroup="system"
                                                    runat="server" onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator181" runat="server" ErrorMessage="*"
                                                    ControlToValidate="txtNewVeh" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:Label ID="lblHVehNo" Visible="false" runat="server"></asp:Label>
                                            </td>
                                            <td align="right" nowrap>
                                                Make:
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox ID="txtNewvmake" MaxLength="38" Width="120px" ValidationGroup="system"
                                                    runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1291" runat="server" ErrorMessage="*"
                                                    ControlToValidate="txtNewvmake" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td align="right" nowrap>
                                                Owner:
                                            </td>
                                            <td nowrap colspan="3">
                                                <asp:TextBox ID="txtNewVOwner" MaxLength="150" Width="270px" ValidationGroup="system"
                                                    runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator191" runat="server" ErrorMessage="*"
                                                    ControlToValidate="txtNewVOwner" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap>
                                                Payment Method:
                                            </td>
                                            <td nowrap>
                                                <asp:DropDownList ID="ddlPaymentMethod" runat="server" Width="125px">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                    <asp:ListItem Value="Credit">Credit</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlPaymentMethod" runat="server"
                                                    ErrorMessage="*" ControlToValidate="ddlPaymentMethod" InitialValue="0" ValidationGroup="system"
                                                    SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td align="right" nowrap>
                                                Customer PAN/GST No:
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox ID="txtCustPANGSTNO" MaxLength="38" Width="120px" ValidationGroup="system"
                                                    runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtCustPANGSTNO" runat="server"
                                                    ErrorMessage="*" ControlToValidate="txtCustPANGSTNO" ValidationGroup="system"
                                                    SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td align="right" nowrap>
                                                Customer Aadhar No:
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox ID="txtCustAadharNo" Width="200px" MaxLength="48" ValidationGroup="system"
                                                    runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtCustAadharNo" runat="server"
                                                    ErrorMessage="*" ControlToValidate="txtCustAadharNo" ValidationGroup="system"
                                                    SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap>
                                                Contact No:
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox ID="txtContactNo" Width="120px" MaxLength="48" ValidationGroup="system"
                                                    runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2txtContactNo" runat="server"
                                                    ErrorMessage="*" ControlToValidate="txtContactNo" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td align="right" nowrap>
                                                Address:
                                            </td>
                                            <td nowrap rowspan="2">
                                                <asp:TextBox ID="txtAddress" Width="200px" TextMode="MultiLine" MaxLength="500" ValidationGroup="system"
                                                    runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3txtAddress" runat="server"
                                                    ErrorMessage="*" ControlToValidate="txtAddress" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td align="right" nowrap>
                                                Date:
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox ID="txtNewVDate" MaxLength="10" onfocus="showCalendarControl(this);"
                                                    ToolTip="MM/DD/YYYY" Width="70px" ValidationGroup="system" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator121" runat="server" ErrorMessage="*"
                                                    ControlToValidate="txtNewVDate" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtNewVDate"
                                                    Operator="DataTypeCheck" Type="Date" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:CompareValidator>
                                                <asp:Label ID="lblHDate" Visible="false" runat="server"></asp:Label>
                                                &nbsp; Pre. Dates:
                                                <asp:DropDownList ID="ddlDt" Width="95px" AutoPostBack="true" OnSelectedIndexChanged="ddlDtIndexChanged"
                                                    AppendDataBoundItems="true" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap>
                                                SGST/IGST:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlSGSTIGST" runat="server" Width="125px">
                                                    <asp:ListItem Value="SGST">SGST</asp:ListItem>
                                                    <asp:ListItem Value="IGST">IGST</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>

                                          <tr>
                                            <td   align="right" nowrap>
                                                Select Truck Companies:
                                                <asp:RequiredFieldValidator ID="RqTruckCompanies" runat="server" ControlToValidate="ddlTruckCompanies"
                                                    ErrorMessage="*" SetFocusOnError="true"  Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                              </td>
                                              <td >
                                                <asp:DropDownList ID="ddlTruckCompanies" runat="server" ValidationGroup="system"  CssClass="form-control" >
                                                    <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Tata</asp:ListItem>
                                                    <asp:ListItem Value="2">Mahindra & Mahindra</asp:ListItem>
                                                    <asp:ListItem Value="3">Eicher Motors</asp:ListItem>
                                                    <asp:ListItem Value="4">SML Isuzu</asp:ListItem>
                                                    <asp:ListItem Value="5">Ashok Leyland</asp:ListItem>
                                                    <asp:ListItem Value="6">Bharat Benz</asp:ListItem>
                                                    <asp:ListItem Value="7">Force Motors</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td nowrap colspan="4" align="center" style="border-top: 2px solid black;">
                                                <asp:Button ID="btnUpdateDate" runat="server" OnClientClick="return confirm('Are you sure you want to update the data for this Vehicle Number?')"
                                                    OnClick="UpdateDate" Text="Update Data" CssClass="btn btn-success"></asp:Button>
                                                &nbsp;
                                                <asp:Button ID="lnkShow" runat="server" OnClick="ShowDetails" Text="Show Detail"
                                                    CssClass="btn btn-primary"></asp:Button>
                                                &nbsp;
                                                <asp:Button ID="btnCreateFinalBill" Visible="false" runat="server" OnClick="btnCreateFinalBill_Click"
                                                    Text="Create Final Bill"  CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to create final bill??')">
                                                </asp:Button>
                                            </td>
                                            <td align="center" colspan="4" style="background-color: Red; color: White; font-weight: bold;
                                                border-top: 2px solid black;">
                                                <asp:Label ID="lblTot" runat="server" Text="Total:"></asp:Label>&nbsp;
                                                <asp:Label ID="lbltotal" runat="server" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%" valign="top" align="right">
                                    <asp:GridView ID="GridView1" runat="server" Width="100%" OnRowDataBound="GridViewRowDataBound"
                                        OnPageIndexChanging="PageIndexChanging" EmptyDataText="No Record Found" OnRowEditing="GridView1_RowEditing"
                                        OnRowCancelingEdit="GridView1_CancelingEdit" OnRowCommand="GridView1_RowCommand"
                                        OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="false">
                                        <HeaderStyle BackColor="#F0F0F0" ForeColor="Black" />
                                        <%-- <SelectedRowStyle BackColor="Silver" />
                                            <AlternatingRowStyle BackColor="#F0F0F0" />--%>
                                        <FooterStyle BackColor="PaleGreen" />
                                        <Columns>
                                            <%-- <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/check.gif"
                                        ItemStyle-Width="20px" />--%>
                                            <asp:TemplateField Visible="false" HeaderText="New" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkAddNewDist" runat="server" OnClick="lnkAddNewParti"><img src="vabillimg/addicon2.jpg" style="border:none" alt="New" /> </asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Edit" ItemStyle-Wrap="false" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="lnkUpdate" runat="server" ValidationGroup="system3" CausesValidation="True"
                                                        CommandName="Update"><img src="vabillimg/saveicon2.jpg" alt="Save" style="border:none" />  </asp:LinkButton>
                                                    &nbsp;
                                                    <asp:LinkButton ID="lnlCancel" runat="server" CausesValidation="False" CommandName="Cancel"><img src="vabillimg/cancelicon.jpg" alt="Cancel" style="border:none" /></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit"><img src="vabillimg/editicon3.jpg" style="border:none" alt="Edit" /></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Del" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDelete" ValidationGroup="system2" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')"
                                                        CommandName="Delete"><img src="vabillimg/deleteicon2.jpg" alt="Delete" style="border:none" /> </asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false" HeaderText="Veh.Number" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblvnum" runat="server" Text='<%# Bind("vnum") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                    <asp:Label ID="txtevnum" MaxLength="12" Width="80px" runat="server" Text='<%# Bind("vnum") %>'></asp:Label>
                                                    <%-- <asp:TextBox ID="txtevnum"  MaxLength="12" Width="80px"
                                                runat="server" Text='<%# Bind("vnum") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1112" runat="server" ErrorMessage="*"
                                                ControlToValidate="txtevnum" ValidationGroup="system3" SetFocusOnError="true"
                                                ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <%-- <FooterTemplate> Veh.Num: &nbsp;
                                    <asp:TextBox ID="txtNewVeh"  MaxLength="12" Width="80px" ValidationGroup="system" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator181" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtNewVeh" ValidationGroup="system" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>--%>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false" HeaderText="Make" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblvmake" runat="server" Text='<%# Bind("vmake") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtevmake" MaxLength="38" Width="120px" runat="server" Text='<%# Bind("vmake") %>'></asp:TextBox>
                                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1212" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txtevmake" ValidationGroup="system3" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <%--<FooterTemplate> Make: &nbsp;
                                    <asp:TextBox ID="txtNewvmake"  MaxLength="38" Width="120px" ValidationGroup="system" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1291" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtNewvmake" ValidationGroup="system" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>--%>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false" HeaderText="Owner" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblvOwner" runat="server" Text='<%# Bind("vowner") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txteVowner" MaxLength="48" runat="server" Text='<%# Bind("vowner") %>'></asp:TextBox>
                                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator112" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txteVowner" ValidationGroup="system3" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <%--<FooterTemplate> Owner: &nbsp;
                                    <asp:TextBox ID="txtNewVOwner"  MaxLength="48" ValidationGroup="system" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator191" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtNewVOwner" ValidationGroup="system" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>--%>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false" HeaderText="Date" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblvDate" runat="server" Text='<%# Bind("vdate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txteVdate" MaxLength="10" onfocus="showCalendarControl(this);" ToolTip="MM/DD/YYYY"
                                                        Width="70px" runat="server" Text='<%# Bind("vdate","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator122" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txteVdate" ValidationGroup="system3" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <%--<FooterTemplate> Date: &nbsp;
                                    <asp:TextBox ID="txtNewVDate" MaxLength="10" onfocus="showCalendarControl(this);" ToolTip="MM/DD/YYYY" Width="70px" ValidationGroup="system" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator121" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtNewVDate" ValidationGroup="system" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>--%>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Part#" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblvpartNo" runat="server" Text='<%# Bind("partNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                   Part#:
                                                    <br />
                                                    <asp:TextBox ID="txteVpartNo" MaxLength="15"  OnTextChanged="txteVpartNo_TextChanged" AutoPostBack="true" runat="server" Text='<%# Bind("partNo") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <HeaderTemplate>
                                                    Part#:
                                                    <br />
                                                    <asp:TextBox ID="txtNewVpartNo" MaxLength="15" OnTextChanged="txtNewVpartNo_TextChanged" AutoPostBack="true"  ValidationGroup="system"
                                                        runat="server"></asp:TextBox>
                                                </HeaderTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Particulars" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="IDItem" Visible="false" runat="server" Text='<%# Bind("ID2") %>'></asp:Label>
                                                    <asp:Label ID="lblPID" runat="server" Width="250px" Style="word-break: break-all;
                                                        word-wrap: break-word;" Text='<%# Bind("Particulars") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                 Particulars:
                                                    <br />
                                                    <asp:Label ID="IDEditItem" Visible="false" runat="server" Text='<%# Bind("ID2") %>'></asp:Label>
                                                    <asp:TextBox ID="txteParti" MaxLength="150" AutoPostBack="true" OnTextChanged="PartiCularAMount2"
                                                        runat="server" Text='<%# Bind("Particulars") %>'></asp:TextBox>
                                                    <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" TargetControlID="txteParti"
                                                        MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
                                                        ServiceMethod="GetNames">
                                                    </asp:AutoCompleteExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator142" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txteParti" ValidationGroup="system3" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="true" />
                                                <HeaderStyle Wrap="false" />
                                                <FooterStyle Wrap="false" />
                                                <HeaderTemplate>
                                                    Particulars:
                                                    <br />
                                                    <asp:TextBox ID="txtParticulars" AutoPostBack="true" OnTextChanged="PartiCularAMount"
                                                        MaxLength="150" ValidationGroup="system"  runat="server"></asp:TextBox>
                                                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtParticulars"
                                                        MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
                                                        ServiceMethod="GetNames">
                                                    </asp:AutoCompleteExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txtParticulars" ValidationGroup="system" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                </HeaderTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="HSN/SAC Code" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="HSNCodeItem" runat="server" Text='<%# Bind("HSNCODE") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                 HSN Code:
                                                    <br />
                                                    <asp:TextBox ID="txtEditHSNCOde" MaxLength="50" runat="server" Text='<%# Bind("HSNCODE") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEDITHSN142" runat="server"
                                                        ErrorMessage="*" ControlToValidate="txteParti" ValidationGroup="system3" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <HeaderStyle Wrap="false" />
                                                <FooterStyle Wrap="false" />
                                                <HeaderTemplate>
                                                    HSN Code:
                                                    <br />
                                                    <asp:TextBox ID="txtHSNCode" MaxLength="20" ValidationGroup="system" Width="60px"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13HSNCode" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txtHSNCode" ValidationGroup="system" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                </HeaderTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UOM" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="HSNUomItem" runat="server" Text='<%# Bind("UOM") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                  UOM:
                                                    <br />
                                                    <asp:DropDownList ID="ddlEditUOM" SelectedValue='<%# Bind("UOM") %>' Width="65px"
                                                        onchange="changeUOM(this)" AppendDataBoundItems="true" runat="server">
                                                        <asp:ListItem Value="Each">Each</asp:ListItem>
                                                        <asp:ListItem Value="Ltr">Ltr</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <%-- <asp:TextBox ID="txtEditUOM" MaxLength="50" 
                                                            runat="server" Text='<%# Bind("UOM") %>'></asp:TextBox>
                                                       
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUOMEDIT142" runat="server" ErrorMessage="*"
                                                            ControlToValidate="txtEditUOM" ValidationGroup="system3" SetFocusOnError="true"
                                                            ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <HeaderStyle Wrap="false" />
                                                <FooterStyle Wrap="false" />
                                                <HeaderTemplate>
                                                    UOM:
                                                    <br />
                                                    <%-- <asp:DropDownList ID="ddlUOM" Width="65px" onchange="changeUOM(this)" 
                                                    AppendDataBoundItems="true" runat="server">--%>
                                                    <asp:DropDownList ID="ddlUOM" Width="65px" AppendDataBoundItems="true" runat="server">
                                                        <asp:ListItem Value="Each">Each</asp:ListItem>
                                                        <asp:ListItem Value="Ltr">Ltr</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldVlaidatorddlUOM" runat="server" ErrorMessage="*"
                                                    ControlToValidate="ddlUOM" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                        
                                               
                                                <asp:TextBox ID="txtUOM"  Width="40px" MaxLength="20" Text="0"
                                                    runat="server"></asp:TextBox>
        
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2txtuom" runat="server" ErrorMessage="*"
                                                    ControlToValidate="txtUOM" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                </HeaderTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                   Qty:
                                                    <br />
                                                    <asp:TextBox ID="txtEQty" MaxLength="4" AutoPostBack="true" OnTextChanged="QtyAMount2"
                                                        onKeyPress="return checkIt(event)" Width="40px" runat="server" Text='<%# Bind("qty") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txtEQty" ValidationGroup="system3" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RangeValidator ID="RangeValidator121" ControlToValidate="txtEQty" runat="server"
                                                        ErrorMessage="*" ValidationGroup="system" MinimumValue="01" MaximumValue="99"
                                                        SetFocusOnError="true"></asp:RangeValidator>
                                                </EditItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <HeaderStyle Wrap="false" />
                                                <FooterStyle Wrap="false" />
                                                <HeaderTemplate>
                                                    Qty:
                                                    <br />
                                                    <asp:TextBox ID="txtNewQty" Text="1" runat="server" MaxLength="4" AutoPostBack="true"
                                                        OnTextChanged="QtyAMount" onKeyPress="return checkIt(event)" Width="40px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txtNewQty" ValidationGroup="system" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtNewQty" runat="server"
                                                        ErrorMessage="*" ValidationGroup="system" MinimumValue="1" MaximumValue="99"
                                                        SetFocusOnError="true"></asp:RangeValidator>
                                                </HeaderTemplate>
                                                <FooterStyle Wrap="false" />
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rate" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRTID" runat="server" Text='<%# Bind("rate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                Rate:
                                                    <br />
                                                    <asp:TextBox ID="txtEditRTID" AutoPostBack="true" OnTextChanged="RateChange2" onKeyPress="return checkIt(event)"
                                                        MaxLength="10" Width="60px" runat="server" Text='<%# Bind("rate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <HeaderStyle Wrap="false" />
                                                <FooterStyle Wrap="false" />
                                                <HeaderTemplate>
                                                    Rate:
                                                    <br />
                                                    <asp:TextBox ID="txtNewRate" AutoPostBack="true" OnTextChanged="RateChange" onKeyPress="return checkIt(event)"
                                                        MaxLength="10" Width="60px" ValidationGroup="system" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator53" ControlToValidate="txtNewQty"
                                                        runat="server" ErrorMessage="*" ValidationGroup="system" SetFocusOnError="true"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                </HeaderTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <FooterStyle Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1labouramount" runat="server" Text='<%# Bind("labouramount") %>'></asp:Label>
                                                    <asp:Label ID="lblTPID" runat="server" Text='<%# Bind("taxpaidamount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                  Total Amt:
                                                    <br />
                                                    <asp:TextBox ID="txtEditTPID" onKeyPress="return checkIt(event)" MaxLength="10" Width="60px"
                                                        runat="server" Text='<%# Bind("taxpaidamount") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <HeaderStyle Wrap="false" />
                                                <FooterStyle Wrap="false" />
                                                <HeaderTemplate>
                                                    Total Amt:
                                                    <br />
                                                    <asp:TextBox ID="txtNewTPAmt" onKeyPress="return checkIt(event)" MaxLength="10" Width="60px"
                                                        ValidationGroup="system" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2413" runat="server" ErrorMessage="*"
                                                        ValidationGroup="system" SetFocusOnError="true" ControlToValidate="txtNewQty"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                </HeaderTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <FooterStyle Wrap="false" />
                                            </asp:TemplateField>
                                            <%-- <asp:TemplateField HeaderText="Labour Amt" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLbrID" runat="server" Text='<%# Bind("labouramount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtEditLbrID" onKeyPress="return checkIt(event)" MaxLength="10"
                                                            Width="60px" runat="server" Text='<%# Bind("labouramount") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                    <FooterTemplate>
                                                        Labour Amt:
                                                        <asp:TextBox ID="txtNewLbrAmt" onKeyPress="return checkIt(event)" MaxLength="10"
                                                            Width="60px" ValidationGroup="system" runat="server"></asp:TextBox>
                                                        <asp:LinkButton ID="lnkNew" ValidationGroup="system" runat="server" CommandName="AddNew"><img src="saveicon2.jpg" alt="Save" style="border:none" /></asp:LinkButton>
                                                        &nbsp;&nbsp;
                                                        <asp:LinkButton ID="lnkCancelNew" CausesValidation="false" runat="server" OnClick="lnkCancelNew"><img src="cancelicon.jpg" alt="Cancel" style="border:none" /></asp:LinkButton>
                                                    </FooterTemplate>
                                                    <FooterStyle Wrap="false" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Tax Rate" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTaxRateID" runat="server" Text='<%# Bind("TaxRate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                <EditItemTemplate>
                                                 Tax Rate:
                                                    <br />
                                                    <asp:TextBox ID="txtEditTaxRateID" onKeyPress="return checkIt(event)" MaxLength="10"
                                                        Width="60px" runat="server" Text='<%# Bind("TaxRate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemStyle Wrap="false" />
                                                <HeaderStyle Wrap="false" />
                                                <FooterStyle Wrap="false" />
                                                <HeaderTemplate>
                                                    Tax Rate:
                                                    <br />
                                                    <asp:TextBox ID="txtNewTaxRateAmt" Text="28" onKeyPress="return checkIt(event)" MaxLength="10"
                                                        Width="60px" ValidationGroup="system" runat="server"></asp:TextBox>
                                                    <asp:LinkButton ID="lnkNew" ValidationGroup="system" runat="server" CommandName="AddNew"><img src="vabillimg/saveicon2.jpg" alt="Save" style="border:none" /></asp:LinkButton>
                                                    &nbsp;&nbsp;
                                                    <asp:LinkButton ID="lnkCancelNew" CausesValidation="false" runat="server" OnClick="lnkCancelNew"><img src="vabillimg/cancelicon.jpg" alt="Cancel" style="border:none" /></asp:LinkButton>
                                                </HeaderTemplate>
                                                <FooterStyle Wrap="false" />
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                </td>
                            </tr>
                            <%-- <tr>
                                <td style="background-color:Navy; color:White; font-weight:bold;" align="center">
                                
                                    <asp:Label ID="lblTot" runat="server" Text="Total:"></asp:Label>&nbsp;
                                    <asp:Label ID="lbltotal" runat="server" Text="0"></asp:Label>
                                </td>
                            </tr>--%>
                        </table>
                    </td>
                </tr>
            </table>
            <%--For Datatable--%>
            <%--<script src="datatableCSSJS2/jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/jszip.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/pdfmake.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/vfs_fonts.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/buttons.html5.min.js" type="text/javascript"></script>
            <link href="datatableCSSJS2/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
            <link href="datatableCSSJS2/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
            <link href="datatableCSSJS2/DataTableHeaderFooterStyleSheet.css" rel="stylesheet"
                type="text/css" />
            <script type="text/javascript">
                //    $(document).ready(function () {
                $(function () {
                    bindDataTable(); // bind data table on first page load
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
                });

                //        $(document).ready(function () {

                function bindDataTable() {

                    var t = $('#' + '<%=GridView1.ClientID%>').DataTable({
                        //                    "sDom": "Rlfrtip",

                        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                        "bAutoWidth": false,
                        "bFilter": true,
                        "bPagination": true,
                        "sPaginationType": "full_numbers",
                        "bStateSave": true,
                        "bPaginate": true,
                        "bInfo": true,

                        destroy: true,


                        // "order": [[0, 'asc']],

                        dom: 'Blfrtip',
                        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]

                    });
                }

                //            t.on('order.dt search.dt', function () {
                //                t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                //                    cell.innerHTML = i + 1;
                //                });
                //            }).draw();

                //        });


       
       

          
            </script>--%>
            <%-- end for datatable--%>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function changeUOM(obj) {
            ////////alert("hi");

            var ddl = document.getElementById("ContentPlaceHolder1_GridView1_ddlUOM");
            var ltrVal = document.getElementById("ContentPlaceHolder1_GridView1_txtUOM");
            var SelVal = ddl.options[ddl.selectedIndex].text;
            /////alert(obj.options[ddl.selectedIndex].text); //SelVal is the selected Value
            if (SelVal == "Each") {
                ltrVal.value = "0";
            }
            if (SelVal == "Ltr") {
                ltrVal.style.visibility = 'visible';
                ltrVal.value = "";
                ltrVal.focus();
            }

        }

       
    </script>
</asp:Content>
