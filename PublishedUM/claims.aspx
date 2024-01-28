<%@ page title="" language="C#" masterpagefile="~/VipinAutomobiles.master" autoeventwireup="true" inherits="claims, App_Web_gdx0w2k3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table width="100%" style="vertical-align: top;" align="center">
        <tr valign="top">
            <td valign="top">
                <b style="color: Blue;"><u>Claim Details</u></b>
            </td>
        </tr>
        <tr>
            <td align="center" style="border-bottom: 1px solid black;">
                <asp:Label ID="lblError" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                 Veh No: <asp:TextBox ID="txtSeVehNo" runat="server" MaxLength="20"></asp:TextBox>
            &nbsp;
            Date: &nbsp; <asp:TextBox ID="SearchDatedTextBox" Width="180px" MaxLength="20"   runat="server"   />
            <asp:Button ID="btnSearch" runat="server" OnClick="SearchRecord" Text="Show Detail" CssClass="button" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnNewRe" runat="server" Text="Add New" CssClass="button" OnClick="ShowNew" />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource2"
                                            OnDataBound="FormView1_DataBound">
                                            <EditItemTemplate>
                                                <table width="100%">
                                                    <tr>
                                                    
                                                        <td align="right" nowrap>
                                                            Claim No:
                                                        </td>
                                                        <td  align="left" norwrap>
                                                            <asp:TextBox ID="CLAINNOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("CLAINNO") %>' />
                                                           <%-- <asp:RequiredFieldValidator ID="rd1" runat="server" ControlToValidate="CLAINNOTextBox"
                                                                SetFocusOnError="true" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Veh. No:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="VEHNOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("VEHNO") %>' />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="VEHNOTextBox"
                                                                SetFocusOnError="true" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td align="right" nowrap>
                                                            Loaded:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="LSTATUSTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("LSTATUS") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Make:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="VMAKETextBox"  MaxLength="50" Width="180px" runat="server" Text='<%# Bind("VMAKE") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td align="right" nowrap>
                                                            DOA:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="DOATextBox" MaxLength="10"  Width="180px" runat="server" Text='<%# Bind("DOA") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Time:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="ATTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("AT") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Model:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="ModelTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("Model") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            On:
                                                        </td>
                                                        <td rowspan="3" align="left" norwrap>
                                                            <asp:TextBox ID="MonTextBox" Height="50px" Width="180px" TextMode="MultiLine" MaxLength="100" runat="server" Text='<%# Bind("Mon") %>' />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Owner Name:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="VOWNERTextBox" MaxLength="50" Width="180px" runat="server" Text='<%# Bind("VOWNER") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                       <%-- <td align="right" nowrap>
                                                            NEAR:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="NEARTextBox" MaxLength="50" runat="server" Text='<%# Bind("NEAR") %>' />
                                                        </td>--%>
                                                        <td align="right" nowrap>
                                                            Father Name:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="FATHERNAMETextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("FATHERNAME") %>' />
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Address:
                                                        </td>
                                                        <td rowspan="2" align="left" norwrap>
                                                            <asp:TextBox ID="ADDRESSTextBox" Width="180px" Height="50px" TextMode="MultiLine" MaxLength="300" runat="server" Text='<%# Bind("ADDRESS") %>' />
                                                        </td>
                                                         <td align="right" nowrap>
                                                            History:
                                                        </td>
                                                        <td align="left" rowspan="2" norwrap>
                                                            <asp:TextBox ID="HISTORYTextBox" Width="180px" Height="50px" TextMode="MultiLine" MaxLength="300" runat="server" Text='<%# Bind("HISTORY") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr><td>&nbsp;</td></tr>
                                                    <tr>
                                                       
                                                        <td align="right" nowrap>
                                                            Phone No:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="PHONENOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("PHONENO") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Spot:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="SPOTTextBox" Width="180px" MaxLength="35" runat="server" Text='<%# Bind("SPOT") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Policy No:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="POLICYNOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("POLICYNO") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Final:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="FINALTextBox" Width="180px" MaxLength="150" runat="server" Text='<%# Bind("FINAL") %>' />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Dated:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="DATEDTextBox" Width="180px" MaxLength="20"   runat="server" Text='<%# Bind("DATED") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            ReInspection:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="REINSPECTIONTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("REINSPECTION") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td align="right" nowrap>
                                                            Sum Insured:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="SUMASSUREDTextBox" runat="server" onKeyPress="return checkIt(event)"
                                                                MaxLength="10" Width="180px" Text='<%# Bind("SUMASSURED") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Issuing Office:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="ISSUINGOFFICETextBox" Width="180px" MaxLength="150" runat="server" Text='<%# Bind("ISSUINGOFFICE") %>' />
                                                        </td>
                                                    </tr>
                                                   <%-- <tr>
                                                        <td colspan="6" align="center" style="border-bottom: 1px solid black; border-top: 1px solid black;">
                                                            <b>Photocopy/Verified</b>
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td colspan="6" align="center">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td align="center">
                                                                                    <b>P/C</b>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <b>OE</b>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <b>VR</b>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Insurance:
                                                                                </td>
                                                                                <td align="center" align="left" norwrap>
                                                                                    <asp:TextBox ID="INSURANCETextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("INSURANCE") %>' />
                                                                                </td>
                                                                                <td align="center">
                                                                                    <asp:TextBox ID="INSURANCETextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("INSURANCEok") %>' />
                                                                                </td>
                                                                                <td align="center">
                                                                                    <asp:TextBox ID="INSURANCETextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("INSURANCEvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    RC:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RCTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RC") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RCTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RCok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RCTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RCvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    TAX:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TAXTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TAX") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TAXTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TAXok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TAXTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TAXvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Fitness:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FITNESSTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FITNESS") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FITNESSTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FITNESSok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FITNESSTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FITNESSvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit A:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITATextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITA") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITATextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITAok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITATextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITAvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit B:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITBTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITB") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITBTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITBok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITBTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITBvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit 47:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMIT47TextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMIT47") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMIT47TextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMIT47ok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMIT47TextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMIT47vr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    DL:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="DL2TextBox" Width="40px" MaxLength="5"  runat="server" Text='<%# Bind("DL2") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="DL2TextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("DL2ok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="DL2TextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("DL2vr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    FIR:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FIRTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FIR") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FIRTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FIRok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FIRTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FIRvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Bill/Bilty:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="BILLBILTYTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("BILLBILTY") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="BILLBILTYTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("BILLBILTYok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="BILLBILTYTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("BILLBILTYvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Claim Form:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CLAIMFORMTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CLAIMFORM") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CLAIMFORMTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CLAIMFORMok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CLAIMFORMTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CLAIMFORMvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Ration Card:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RATIONCARDTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RATIONCARD") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RATIONCARDTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RATIONCARDok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RATIONCARDTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RATIONCARDvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Photo:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PHOTOTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PHOTO") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PHOTOTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PHOTOok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PHOTOTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PHOTOvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Cheque:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CHEQUETextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CHEQUE") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CHEQUETextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CHEQUEok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CHEQUETextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CHEQUEvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    P/G Tax:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PTTAXTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PTTAX") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PTTAXTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PTTAXok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PTTAXTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PTTAXvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="visibility:hidden;">
                                                                                <td align="right" nowrap>
                                                                                    Token Tax:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TOKENTAXTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TOKENTAX") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TOKENTAXTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TOKENTAXok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TOKENTAXTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TOKENTAXvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Chasis No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="CHASISNOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("CHASISNO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Engine No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="ENGINENOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("ENGINENO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    GVW:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="GVWTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("GVW") %>' />
                                                                                </td>
                                                                            </tr>
                                                                             <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="PermitNoTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("PermitNo") %>' />
                                                                                </td>
                                                                            </tr>
                                                                             <tr>
                                                                                <td align="right" nowrap>
                                                                                    Valid:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="ValidTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("Valid") %>' />
                                                                                </td>
                                                                            </tr>
                                                                             <tr>
                                                                                <td align="right" nowrap>
                                                                                    Fitness Valid:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="FitnessValidTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("FitnessValid") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Driver:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="DLTextBox" MaxLength="40" Width="180px" runat="server" Text='<%# Bind("DL") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Father Name:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="FATHERNAME2TextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("FATHERNAME2") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Rest Add:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="RESIADDTextBox" Width="180px" MaxLength="500" runat="server" Text='<%# Bind("RESIADD") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    DL NO:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="DLNOTextBox" MaxLength="50" Width="180px" runat="server" Text='<%# Bind("DLNO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Valid upto:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="VALIPUPTOTextBox" MaxLength="10" Width="180px" runat="server" Text='<%# Bind("VALIPUPTO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Authorised:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="AUTHORISEDTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("AUTHORISED") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    DOB:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="DOBTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("DOB") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Lic. Auth:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="LICAUTHTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("LICAUTH") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    TP Loss:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="TPLOSSTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("TPLOSS") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    FIR:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="FIR2TextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("FIR2") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Injury:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="INQUIRYTextBox" Width="180px" MaxLength="100" runat="server" Text='<%# Bind("INQUIRY") %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" align="center">
                                                            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                                Text="Update" CssClass="button" />
                                                            &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CssClass="button" CausesValidation="False"
                                                                CommandName="Cancel" Text="Cancel" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <%-- ID:
                                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />--%>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <table width="100%">
                                                    <tr>
                                                    
                                                        <td align="right" nowrap>
                                                            Claim No:
                                                        </td>
                                                        <td  align="left" norwrap>
                                                            <asp:TextBox ID="CLAINNOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("CLAINNO") %>' />
                                                           <%-- <asp:RequiredFieldValidator ID="rd1" runat="server" ControlToValidate="CLAINNOTextBox"
                                                                SetFocusOnError="true" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Veh. No:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="VEHNOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("VEHNO") %>' />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="VEHNOTextBox"
                                                                SetFocusOnError="true" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td align="right" nowrap>
                                                            Loaded:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="LSTATUSTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("LSTATUS") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Make:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="VMAKETextBox"  MaxLength="50" Width="180px" runat="server" Text='<%# Bind("VMAKE") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td align="right" nowrap>
                                                            DOA:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="DOATextBox" MaxLength="10"
                                                                 Width="180px" runat="server" Text='<%# Bind("DOA") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Time:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="ATTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("AT") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Model:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="ModelTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("Model") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            On:
                                                        </td>
                                                        <td rowspan="3" align="left" norwrap>
                                                            <asp:TextBox ID="MonTextBox" Height="50px" Width="180px" TextMode="MultiLine" MaxLength="100" runat="server" Text='<%# Bind("Mon") %>' />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Owner Name:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="VOWNERTextBox" MaxLength="50" Width="180px" runat="server" Text='<%# Bind("VOWNER") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                       <%-- <td align="right" nowrap>
                                                            NEAR:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="NEARTextBox" MaxLength="50" runat="server" Text='<%# Bind("NEAR") %>' />
                                                        </td>--%>
                                                        <td align="right" nowrap>
                                                            Father Name:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="FATHERNAMETextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("FATHERNAME") %>' />
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Address:
                                                        </td>
                                                        <td rowspan="2" align="left" norwrap>
                                                            <asp:TextBox ID="ADDRESSTextBox" Width="180px" Height="50px" TextMode="MultiLine" MaxLength="300" runat="server" Text='<%# Bind("ADDRESS") %>' />
                                                        </td>
                                                         <td align="right" nowrap>
                                                            History:
                                                        </td>
                                                        <td align="left" rowspan="2" norwrap>
                                                            <asp:TextBox ID="HISTORYTextBox" Width="180px" Height="50px" TextMode="MultiLine" MaxLength="300" runat="server" Text='<%# Bind("HISTORY") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr><td>&nbsp;</td></tr>
                                                    <tr>
                                                       
                                                        <td align="right" nowrap>
                                                            Phone No:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="PHONENOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("PHONENO") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Spot:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="SPOTTextBox" Width="180px" MaxLength="35" runat="server" Text='<%# Bind("SPOT") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Policy No:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="POLICYNOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("POLICYNO") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Final:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="FINALTextBox" Width="180px" MaxLength="150" runat="server" Text='<%# Bind("FINAL") %>' />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Dated:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="DATEDTextBox" Width="180px" MaxLength="20"   runat="server" Text='<%# Bind("DATED") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            ReInspection:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="REINSPECTIONTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("REINSPECTION") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td align="right" nowrap>
                                                            Sum Insured:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="SUMASSUREDTextBox" runat="server" onKeyPress="return checkIt(event)"
                                                                MaxLength="10" Width="180px" Text='<%# Bind("SUMASSURED") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Issuing Office:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:TextBox ID="ISSUINGOFFICETextBox" Width="180px" MaxLength="150" runat="server" Text='<%# Bind("ISSUINGOFFICE") %>' />
                                                        </td>
                                                    </tr>
                                                   <%-- <tr>
                                                        <td colspan="6" align="center" style="border-bottom: 1px solid black; border-top: 1px solid black;">
                                                            <b>Photocopy/Verified</b>
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td colspan="6" align="center">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td align="center">
                                                                                    <b>P/C</b>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <b>OE</b>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <b>VR</b>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Insurance:
                                                                                </td>
                                                                                <td align="center" align="left" norwrap>
                                                                                    <asp:TextBox ID="INSURANCETextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("INSURANCE") %>' />
                                                                                </td>
                                                                                <td align="center">
                                                                                    <asp:TextBox ID="INSURANCETextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("INSURANCEok") %>' />
                                                                                </td>
                                                                                <td align="center">
                                                                                    <asp:TextBox ID="INSURANCETextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("INSURANCEvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    RC:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RCTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RC") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RCTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RCok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RCTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RCvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    TAX:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TAXTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TAX") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TAXTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TAXok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TAXTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TAXvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Fitness:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FITNESSTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FITNESS") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FITNESSTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FITNESSok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FITNESSTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FITNESSvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit A:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITATextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITA") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITATextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITAok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITATextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITAvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit B:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITBTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITB") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITBTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITBok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMITBTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMITBvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit 47:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMIT47TextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMIT47") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMIT47TextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMIT47ok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PERMIT47TextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PERMIT47vr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    DL:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="DL2TextBox" Width="40px" MaxLength="5"  runat="server" Text='<%# Bind("DL2") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="DL2TextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("DL2ok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="DL2TextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("DL2vr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    FIR:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FIRTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FIR") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FIRTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FIRok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="FIRTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("FIRvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Bill/Bilty:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="BILLBILTYTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("BILLBILTY") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="BILLBILTYTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("BILLBILTYok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="BILLBILTYTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("BILLBILTYvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Claim Form:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CLAIMFORMTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CLAIMFORM") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CLAIMFORMTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CLAIMFORMok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CLAIMFORMTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CLAIMFORMvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Ration Card:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RATIONCARDTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RATIONCARD") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RATIONCARDTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RATIONCARDok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="RATIONCARDTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("RATIONCARDvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Photo:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PHOTOTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PHOTO") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PHOTOTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PHOTOok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PHOTOTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PHOTOvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Cheque:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CHEQUETextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CHEQUE") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CHEQUETextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CHEQUEok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="CHEQUETextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("CHEQUEvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    P/G Tax:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PTTAXTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PTTAX") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PTTAXTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PTTAXok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="PTTAXTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("PTTAXvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="visibility:hidden;">
                                                                                <td align="right" nowrap>
                                                                                    Token Tax:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TOKENTAXTextBox" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TOKENTAX") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TOKENTAXTextBoxok" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TOKENTAXok") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:TextBox ID="TOKENTAXTextBoxvr" Width="40px" MaxLength="5" runat="server" Text='<%# Bind("TOKENTAXvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Chasis No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="CHASISNOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("CHASISNO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Engine No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="ENGINENOTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("ENGINENO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    GVW:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="GVWTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("GVW") %>' />
                                                                                </td>
                                                                            </tr>
                                                                             <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="PermitNoTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("PermitNo") %>' />
                                                                                </td>
                                                                            </tr>
                                                                             <tr>
                                                                                <td align="right" nowrap>
                                                                                    Valid:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="ValidTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("Valid") %>' />
                                                                                </td>
                                                                            </tr>
                                                                             <tr>
                                                                                <td align="right" nowrap>
                                                                                    Fitness Valid:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="FitnessValidTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("FitnessValid") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Driver:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="DLTextBox" MaxLength="40" Width="180px" runat="server" Text='<%# Bind("DL") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Father Name:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="FATHERNAME2TextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("FATHERNAME2") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Rest Add:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="RESIADDTextBox" Width="180px" MaxLength="500" runat="server" Text='<%# Bind("RESIADD") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    DL NO:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="DLNOTextBox" MaxLength="50" Width="180px" runat="server" Text='<%# Bind("DLNO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Valid upto:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="VALIPUPTOTextBox" MaxLength="10" Width="180px" runat="server" Text='<%# Bind("VALIPUPTO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Authorised:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="AUTHORISEDTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("AUTHORISED") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    DOB:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="DOBTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("DOB") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Lic. Auth:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="LICAUTHTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("LICAUTH") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    TP Loss:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="TPLOSSTextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("TPLOSS") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    FIR:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="FIR2TextBox" Width="180px" MaxLength="50" runat="server" Text='<%# Bind("FIR2") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Injury:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:TextBox ID="INQUIRYTextBox" Width="180px" MaxLength="100" runat="server" Text='<%# Bind("INQUIRY") %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" align="center">
                                                            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                                Text="Insert" CssClass="button" />
                                                            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CssClass="button" CausesValidation="False"
                                                                CommandName="Cancel" Text="Cancel" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <table width="100%" align="center">
                                                <tr>
                                                        <td colspan="6" align="center">
                                                           <%-- <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                                                Text="New" CssClass="button" />&nbsp;--%>
                                                            <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                                                Text="Edit" CssClass="button" />
                                                            &nbsp;<asp:Button ID="DeleteButton" OnClientClick="return confirm('Are you sure you want to delete this record')"
                                                                runat="server" CausesValidation="False" CssClass="button" CommandName="Delete"
                                                                Text="Delete" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Claim No:
                                                        </td>
                                                        <td align="left" norwrap style="width: 200px">
                                                            <asp:Label ID="CLAINNOLabel" runat="server" Text='<%# Bind("CLAINNO") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Veh No:
                                                        </td>
                                                        <td align="left" norwrap style="width: 200px">
                                                            <asp:Label ID="VEHNOLabel" runat="server" Text='<%# Bind("VEHNO") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td align="right" nowrap>
                                                            Loaded:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="LSTATUSLabel" runat="server" Text='<%# Bind("LSTATUS") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Make:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="VMAKELabel" runat="server" Text='<%# Bind("VMAKE") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td align="right" nowrap>
                                                            DOA:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="DOALabel" runat="server" Text='<%# Bind("DOA","{0:dd/MM/yyyy}") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Time:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="ATLabel" runat="server" Text='<%# Bind("AT") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Model:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="ModelLabel" MaxLength="50" runat="server" Text='<%# Bind("Model") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            On:
                                                        </td>
                                                        <td rowspan="3" align="left" norwrap>
                                                            <asp:TextBox TextMode="MultiLine" Height="60px" ReadOnly="true" ID="MonLabel" MaxLength="50" runat="server" Text='<%# Bind("Mon") %>' />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Owner Name:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="VOWNERLabel" runat="server" Text='<%# Bind("VOWNER") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <%--<td align="right" nowrap>
                                                            NEAR:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="NEARLabel" runat="server" Text='<%# Bind("NEAR") %>' />
                                                        </td>--%>
                                                        <td align="right" nowrap>
                                                            Father Name:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="FATHERNAMELabel" runat="server" Text='<%# Bind("FATHERNAME") %>' />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Address:
                                                        </td>
                                                        <td rowspan="2" align="left" norwrap>
                                                            <asp:TextBox TextMode="MultiLine" Height="60px" ReadOnly="true" ID="ADDRESSLabel" runat="server" Text='<%# Bind("ADDRESS") %>' />
                                                        </td>
                                                    <%--</tr>
                                                    <tr>--%>
                                                        <td align="right" nowrap>
                                                            History:
                                                        </td>
                                                        <td align="left" rowspan="2" norwrap>
                                                            <asp:TextBox TextMode="MultiLine" Height="60px" ReadOnly="true" ID="HISTORYLabel" runat="server" Text='<%# Bind("HISTORY") %>' />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr><td>&nbsp;</td></tr>
                                                  
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Phone No:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="PHONENOLabel" runat="server" Text='<%# Bind("PHONENO") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Spot:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="SPOTLabel" runat="server" Text='<%# Bind("SPOT") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Policy No:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="POLICYNOLabel" runat="server" Text='<%# Bind("POLICYNO") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Final:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="FINALLabel" runat="server" Text='<%# Bind("FINAL") %>' />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="right" nowrap>
                                                            Dated:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="DATEDLabel" runat="server" Text='<%# Bind("DATED","{0:dd/MM/yyyy}") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            ReInspection:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="REINSPECTIONLabel" runat="server" Text='<%# Bind("REINSPECTION") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td align="right" nowrap>
                                                            Sum Assured:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="SUMASSUREDLabel" runat="server" Text='<%# Bind("SUMASSURED") %>' />
                                                        </td>
                                                        <td align="right" nowrap>
                                                            Issuing Office:
                                                        </td>
                                                        <td align="left" norwrap>
                                                            <asp:Label ID="ISSUINGOFFICELabel" runat="server" Text='<%# Bind("ISSUINGOFFICE") %>' />
                                                        </td>
                                                    </tr>
                                                   <%-- <tr>
                                                        <td colspan="6" align="center" style="border-bottom: 1px solid black; border-top: 1px solid black;">
                                                            <b>Photocopy/Verified</b>
                                                        </td>
                                                    </tr>--%>
                                                   <tr>
                                                        <td colspan="6" align="center">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td align="center">
                                                                                    <b>P/C</b>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <b>OK</b>
                                                                                </td>
                                                                                <td align="left" style="width:200px;">
                                                                                    <b>VR</b>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Insurance:
                                                                                </td>
                                                                                <td align="center" align="left" norwrap>
                                                                                    <asp:Label ID="INSURANCELabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("INSURANCE") %>' />
                                                                                </td>
                                                                                <td align="center">
                                                                                    <asp:Label ID="INSURANCELabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("INSURANCEok") %>' />
                                                                                </td>
                                                                                <td align="left" >
                                                                                    <asp:Label ID="INSURANCELabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("INSURANCEvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    RC:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="RCLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("RC") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="RCLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("RCok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="RCLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("RCvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Tax:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="TAXLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("TAX") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="TAXLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("TAXok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="TAXLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("TAXvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Fitness:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="FITNESSLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("FITNESS") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="FITNESSLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("FITNESSok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="FITNESSLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("FITNESSvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit A:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PERMITALabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PERMITA") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PERMITALabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PERMITAok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="PERMITALabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PERMITAvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit B:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PERMITBLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PERMITB") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PERMITBLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PERMITBok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="PERMITBLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PERMITBvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit 47:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PERMIT47Label" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PERMIT47") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PERMIT47Labelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PERMIT47ok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="PERMIT47Labelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PERMIT47vr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    DL:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="DL2Label" Width="40px" MaxLength="10"  runat="server" Text='<%# Bind("DL2") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="DL2Labelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("DL2ok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="DL2Labelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("DL2vr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    FIR:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="FIRLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("FIR") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="FIRLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("FIRok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="FIRLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("FIRvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Bill/Bilty:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="BILLBILTYLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("BILLBILTY") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="BILLBILTYLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("BILLBILTYok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="BILLBILTYLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("BILLBILTYvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Claim Form:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="CLAIMFORMLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("CLAIMFORM") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="CLAIMFORMLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("CLAIMFORMok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="CLAIMFORMLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("CLAIMFORMvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Ration Card:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="RATIONCARDLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("RATIONCARD") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="RATIONCARDLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("RATIONCARDok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="RATIONCARDLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("RATIONCARDvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Photo:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PHOTOLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PHOTO") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PHOTOLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PHOTOok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="PHOTOLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PHOTOvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Cheque:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="CHEQUELabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("CHEQUE") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="CHEQUELabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("CHEQUEok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="CHEQUELabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("CHEQUEvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    P/G Tax:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PTTAXLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PTTAX") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="PTTAXLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PTTAXok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="PTTAXLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("PTTAXvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="visibility:hidden;">
                                                                                <td align="right" nowrap>
                                                                                    Token Tax:
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="TOKENTAXLabel" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("TOKENTAX") %>' />
                                                                                </td>
                                                                                <td align="center" norwrap>
                                                                                    <asp:Label ID="TOKENTAXLabelok" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("TOKENTAXok") %>' />
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="TOKENTAXLabelvr" Width="40px" MaxLength="10" runat="server" Text='<%# Bind("TOKENTAXvr") %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Chasis No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="CHASISNOLabel" MaxLength="50" runat="server" Text='<%# Bind("CHASISNO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Engine No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="ENGINENOLabel" MaxLength="50" runat="server" Text='<%# Bind("ENGINENO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    GVW:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="GVWLabel" MaxLength="50" runat="server" Text='<%# Bind("GVW") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Permit No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="PermitNoLabel" MaxLength="50" runat="server" Text='<%# Bind("PermitNo") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Valid:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="ValidLabel" MaxLength="50" runat="server" Text='<%# Bind("Valid") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Fitness Valid:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="FitnessValidLabel" MaxLength="50" runat="server" Text='<%# Bind("FitnessValid") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Driver:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="DLLabel" MaxLength="40" Width="80px" runat="server" Text='<%# Bind("DL") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Father Name:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="FATHERNAME2Label" MaxLength="50" runat="server" Text='<%# Bind("FATHERNAME2") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Resi. Add.:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="RESIADDLabel" MaxLength="500" runat="server" Text='<%# Bind("RESIADD") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    DL No:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="DLNOLabel" MaxLength="50" Width="80px" runat="server" Text='<%# Bind("DLNO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Valid upto:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="VALIPUPTOLabel" MaxLength="10" Width="80px" runat="server" Text='<%# Bind("VALIPUPTO") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Authorised:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="AUTHORISEDLabel" MaxLength="50" runat="server" Text='<%# Bind("AUTHORISED") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    DOB:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="DOBLabel" MaxLength="50" runat="server" Text='<%# Bind("DOB") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Lic. Auth:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="LICAUTHLabel" MaxLength="50" runat="server" Text='<%# Bind("LICAUTH") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    TP Loss:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="TPLOSSLabel" MaxLength="50" runat="server" Text='<%# Bind("TPLOSS") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    FIR:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="FIR2Label" MaxLength="50" runat="server" Text='<%# Bind("FIR2") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" nowrap>
                                                                                    Injury:
                                                                                </td>
                                                                                <td align="left" norwrap>
                                                                                    <asp:Label ID="INQUIRYLabel" Width="300px" MaxLength="500" runat="server" Text='<%# Bind("INQUIRY") %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    
                                                </table>
                                                <%-- ID:
                                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />--%>
                                            </ItemTemplate>
                                        </asp:FormView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"
                                            ConnectionString="<%$ ConnectionStrings:VipinAutoMobilesConnection %>" 
                                            DeleteCommand="DELETE FROM [CLAIMMAS] WHERE [ID] = @original_ID AND (([CLAINNO] = @original_CLAINNO) OR ([CLAINNO] IS NULL AND @original_CLAINNO IS NULL)) AND (([VEHNO] = @original_VEHNO) OR ([VEHNO] IS NULL AND @original_VEHNO IS NULL)) AND (([LSTATUS] = @original_LSTATUS) OR ([LSTATUS] IS NULL AND @original_LSTATUS IS NULL)) AND (([VMAKE] = @original_VMAKE) OR ([VMAKE] IS NULL AND @original_VMAKE IS NULL)) AND (([DOA] = @original_DOA) OR ([DOA] IS NULL AND @original_DOA IS NULL)) AND (([AT] = @original_AT) OR ([AT] IS NULL AND @original_AT IS NULL)) AND (([MODEL] = @original_MODEL) OR ([MODEL] IS NULL AND @original_MODEL IS NULL)) AND (([MON] = @original_MON) OR ([MON] IS NULL AND @original_MON IS NULL)) AND (([VOWNER] = @original_VOWNER) OR ([VOWNER] IS NULL AND @original_VOWNER IS NULL)) AND (([NEAR] = @original_NEAR) OR ([NEAR] IS NULL AND @original_NEAR IS NULL)) AND (([FATHERNAME] = @original_FATHERNAME) OR ([FATHERNAME] IS NULL AND @original_FATHERNAME IS NULL)) AND (([ADDRESS] = @original_ADDRESS) OR ([ADDRESS] IS NULL AND @original_ADDRESS IS NULL)) AND (([HISTORY] = @original_HISTORY) OR ([HISTORY] IS NULL AND @original_HISTORY IS NULL)) AND (([PHONENO] = @original_PHONENO) OR ([PHONENO] IS NULL AND @original_PHONENO IS NULL)) AND (([SPOT] = @original_SPOT) OR ([SPOT] IS NULL AND @original_SPOT IS NULL)) AND (([POLICYNO] = @original_POLICYNO) OR ([POLICYNO] IS NULL AND @original_POLICYNO IS NULL)) AND (([FINAL] = @original_FINAL) OR ([FINAL] IS NULL AND @original_FINAL IS NULL)) AND (([DATED] = @original_DATED) OR ([DATED] IS NULL AND @original_DATED IS NULL)) AND (([REINSPECTION] = @original_REINSPECTION) OR ([REINSPECTION] IS NULL AND @original_REINSPECTION IS NULL)) AND (([SUMASSURED] = @original_SUMASSURED) OR ([SUMASSURED] IS NULL AND @original_SUMASSURED IS NULL)) AND (([ISSUINGOFFICE] = @original_ISSUINGOFFICE) OR ([ISSUINGOFFICE] IS NULL AND @original_ISSUINGOFFICE IS NULL)) AND (([INSURANCE] = @original_INSURANCE) OR ([INSURANCE] IS NULL AND @original_INSURANCE IS NULL)) AND (([INSURANCEok] = @original_INSURANCEok) OR ([INSURANCEok] IS NULL AND @original_INSURANCEok IS NULL)) AND (([INSURANCEvr] = @original_INSURANCEvr) OR ([INSURANCEvr] IS NULL AND @original_INSURANCEvr IS NULL)) AND (([CHASISNO] = @original_CHASISNO) OR ([CHASISNO] IS NULL AND @original_CHASISNO IS NULL)) AND (([RC] = @original_RC) OR ([RC] IS NULL AND @original_RC IS NULL)) AND (([RCok] = @original_RCok) OR ([RCok] IS NULL AND @original_RCok IS NULL)) AND (([RCvr] = @original_RCvr) OR ([RCvr] IS NULL AND @original_RCvr IS NULL)) AND (([ENGINENO] = @original_ENGINENO) OR ([ENGINENO] IS NULL AND @original_ENGINENO IS NULL)) AND (([TAX] = @original_TAX) OR ([TAX] IS NULL AND @original_TAX IS NULL)) AND (([TAXok] = @original_TAXok) OR ([TAXok] IS NULL AND @original_TAXok IS NULL)) AND (([TAXvr] = @original_TAXvr) OR ([TAXvr] IS NULL AND @original_TAXvr IS NULL)) AND (([GVW] = @original_GVW) OR ([GVW] IS NULL AND @original_GVW IS NULL)) AND (([PermitNo] = @original_PermitNo) OR ([PermitNo] IS NULL AND @original_PermitNo IS NULL)) AND (([Valid] = @original_Valid) OR ([Valid] IS NULL AND @original_Valid IS NULL)) AND (([FitnessValid] = @original_FitnessValid) OR ([FitnessValid] IS NULL AND @original_FitnessValid IS NULL)) AND (([FITNESS] = @original_FITNESS) OR ([FITNESS] IS NULL AND @original_FITNESS IS NULL)) AND (([FITNESSok] = @original_FITNESSok) OR ([FITNESSok] IS NULL AND @original_FITNESSok IS NULL)) AND (([FITNESSvr] = @original_FITNESSvr) OR ([FITNESSvr] IS NULL AND @original_FITNESSvr IS NULL)) AND (([DL] = @original_DL) OR ([DL] IS NULL AND @original_DL IS NULL)) AND (([PERMITA] = @original_PERMITA) OR ([PERMITA] IS NULL AND @original_PERMITA IS NULL)) AND (([PERMITAok] = @original_PERMITAok) OR ([PERMITAok] IS NULL AND @original_PERMITAok IS NULL)) AND (([PERMITAvr] = @original_PERMITAvr) OR ([PERMITAvr] IS NULL AND @original_PERMITAvr IS NULL)) AND (([FATHERNAME2] = @original_FATHERNAME2) OR ([FATHERNAME2] IS NULL AND @original_FATHERNAME2 IS NULL)) AND (([PERMITB] = @original_PERMITB) OR ([PERMITB] IS NULL AND @original_PERMITB IS NULL)) AND (([PERMITBok] = @original_PERMITBok) OR ([PERMITBok] IS NULL AND @original_PERMITBok IS NULL)) AND (([PERMITBvr] = @original_PERMITBvr) OR ([PERMITBvr] IS NULL AND @original_PERMITBvr IS NULL)) AND (([RESIADD] = @original_RESIADD) OR ([RESIADD] IS NULL AND @original_RESIADD IS NULL)) AND (([PERMIT47] = @original_PERMIT47) OR ([PERMIT47] IS NULL AND @original_PERMIT47 IS NULL)) AND (([PERMIT47ok] = @original_PERMIT47ok) OR ([PERMIT47ok] IS NULL AND @original_PERMIT47ok IS NULL)) AND (([PERMIT47vr] = @original_PERMIT47vr) OR ([PERMIT47vr] IS NULL AND @original_PERMIT47vr IS NULL)) AND (([DLNO] = @original_DLNO) OR ([DLNO] IS NULL AND @original_DLNO IS NULL)) AND (([DL2] = @original_DL2) OR ([DL2] IS NULL AND @original_DL2 IS NULL)) AND (([DL2ok] = @original_DL2ok) OR ([DL2ok] IS NULL AND @original_DL2ok IS NULL)) AND (([DL2vr] = @original_DL2vr) OR ([DL2vr] IS NULL AND @original_DL2vr IS NULL)) AND (([VALIPUPTO] = @original_VALIPUPTO) OR ([VALIPUPTO] IS NULL AND @original_VALIPUPTO IS NULL)) AND (([FIR] = @original_FIR) OR ([FIR] IS NULL AND @original_FIR IS NULL)) AND (([FIRok] = @original_FIRok) OR ([FIRok] IS NULL AND @original_FIRok IS NULL)) AND (([FIRvr] = @original_FIRvr) OR ([FIRvr] IS NULL AND @original_FIRvr IS NULL)) AND (([AUTHORISED] = @original_AUTHORISED) OR ([AUTHORISED] IS NULL AND @original_AUTHORISED IS NULL)) AND (([BILLBILTY] = @original_BILLBILTY) OR ([BILLBILTY] IS NULL AND @original_BILLBILTY IS NULL)) AND (([BILLBILTYok] = @original_BILLBILTYok) OR ([BILLBILTYok] IS NULL AND @original_BILLBILTYok IS NULL)) AND (([BILLBILTYvr] = @original_BILLBILTYvr) OR ([BILLBILTYvr] IS NULL AND @original_BILLBILTYvr IS NULL)) AND (([DOB] = @original_DOB) OR ([DOB] IS NULL AND @original_DOB IS NULL)) AND (([CLAIMFORM] = @original_CLAIMFORM) OR ([CLAIMFORM] IS NULL AND @original_CLAIMFORM IS NULL)) AND (([CLAIMFORMok] = @original_CLAIMFORMok) OR ([CLAIMFORMok] IS NULL AND @original_CLAIMFORMok IS NULL)) AND (([CLAIMFORMvr] = @original_CLAIMFORMvr) OR ([CLAIMFORMvr] IS NULL AND @original_CLAIMFORMvr IS NULL)) AND (([LICAUTH] = @original_LICAUTH) OR ([LICAUTH] IS NULL AND @original_LICAUTH IS NULL)) AND (([RATIONCARD] = @original_RATIONCARD) OR ([RATIONCARD] IS NULL AND @original_RATIONCARD IS NULL)) AND (([RATIONCARDok] = @original_RATIONCARDok) OR ([RATIONCARDok] IS NULL AND @original_RATIONCARDok IS NULL)) AND (([RATIONCARDvr] = @original_RATIONCARDvr) OR ([RATIONCARDvr] IS NULL AND @original_RATIONCARDvr IS NULL)) AND (([TPLOSS] = @original_TPLOSS) OR ([TPLOSS] IS NULL AND @original_TPLOSS IS NULL)) AND (([PHOTO] = @original_PHOTO) OR ([PHOTO] IS NULL AND @original_PHOTO IS NULL)) AND (([PHOTOok] = @original_PHOTOok) OR ([PHOTOok] IS NULL AND @original_PHOTOok IS NULL)) AND (([PHOTOvr] = @original_PHOTOvr) OR ([PHOTOvr] IS NULL AND @original_PHOTOvr IS NULL)) AND (([FIR2] = @original_FIR2) OR ([FIR2] IS NULL AND @original_FIR2 IS NULL)) AND (([CHEQUE] = @original_CHEQUE) OR ([CHEQUE] IS NULL AND @original_CHEQUE IS NULL)) AND (([CHEQUEok] = @original_CHEQUEok) OR ([CHEQUEok] IS NULL AND @original_CHEQUEok IS NULL)) AND (([CHEQUEvr] = @original_CHEQUEvr) OR ([CHEQUEvr] IS NULL AND @original_CHEQUEvr IS NULL)) AND (([INQUIRY] = @original_INQUIRY) OR ([INQUIRY] IS NULL AND @original_INQUIRY IS NULL)) AND (([PTTAX] = @original_PTTAX) OR ([PTTAX] IS NULL AND @original_PTTAX IS NULL)) AND (([PTTAXok] = @original_PTTAXok) OR ([PTTAXok] IS NULL AND @original_PTTAXok IS NULL)) AND (([PTTAXvr] = @original_PTTAXvr) OR ([PTTAXvr] IS NULL AND @original_PTTAXvr IS NULL)) AND (([TOKENTAX] = @original_TOKENTAX) OR ([TOKENTAX] IS NULL AND @original_TOKENTAX IS NULL)) AND (([TOKENTAXok] = @original_TOKENTAXok) OR ([TOKENTAXok] IS NULL AND @original_TOKENTAXok IS NULL)) AND (([TOKENTAXvr] = @original_TOKENTAXvr) OR ([TOKENTAXvr] IS NULL AND @original_TOKENTAXvr IS NULL))"
                                            InsertCommand="INSERT INTO [CLAIMMAS] ([CLAINNO], [VEHNO], [LSTATUS], [VMAKE], [DOA], [AT], [MODEL], [MON], [VOWNER], [NEAR], [FATHERNAME], [ADDRESS], [HISTORY], [PHONENO], [SPOT], [POLICYNO], [FINAL], [DATED], [REINSPECTION], [SUMASSURED], [ISSUINGOFFICE], [INSURANCE], [INSURANCEok], [INSURANCEvr], [CHASISNO], [RC], [RCok], [RCvr], [ENGINENO], [TAX], [TAXok], [TAXvr], [GVW],[PermitNo],[Valid],[FitnessValid], [FITNESS], [FITNESSok], [FITNESSvr], [DL], [PERMITA], [PERMITAok], [PERMITAvr], [FATHERNAME2], [PERMITB], [PERMITBok], [PERMITBvr], [RESIADD], [PERMIT47], [PERMIT47ok], [PERMIT47vr], [DLNO], [DL2], [DL2ok], [DL2vr], [VALIPUPTO], [FIR], [FIRok], [FIRvr], [AUTHORISED], [BILLBILTY], [BILLBILTYok], [BILLBILTYvr], [DOB], [CLAIMFORM], [CLAIMFORMok], [CLAIMFORMvr], [LICAUTH], [RATIONCARD], [RATIONCARDok], [RATIONCARDvr], [TPLOSS], [PHOTO], [PHOTOok], [PHOTOvr], [FIR2], [CHEQUE], [CHEQUEok], [CHEQUEvr], [INQUIRY], [PTTAX], [PTTAXok], [PTTAXvr], [TOKENTAX], [TOKENTAXok], [TOKENTAXvr]) VALUES (@CLAINNO, @VEHNO, @LSTATUS, @VMAKE, @DOA, @AT, @MODEL, @MON, @VOWNER, @NEAR, @FATHERNAME, @ADDRESS, @HISTORY, @PHONENO, @SPOT, @POLICYNO, @FINAL, @DATED, @REINSPECTION, @SUMASSURED, @ISSUINGOFFICE, @INSURANCE, @INSURANCEok, @INSURANCEvr, @CHASISNO, @RC, @RCok, @RCvr, @ENGINENO, @TAX, @TAXok, @TAXvr, @GVW,@PermitNo, @Valid, @FitnessValid, @FITNESS, @FITNESSok, @FITNESSvr, @DL, @PERMITA, @PERMITAok, @PERMITAvr, @FATHERNAME2, @PERMITB, @PERMITBok, @PERMITBvr, @RESIADD, @PERMIT47, @PERMIT47ok, @PERMIT47vr, @DLNO, @DL2, @DL2ok, @DL2vr, @VALIPUPTO, @FIR, @FIRok, @FIRvr, @AUTHORISED, @BILLBILTY, @BILLBILTYok, @BILLBILTYvr, @DOB, @CLAIMFORM, @CLAIMFORMok, @CLAIMFORMvr, @LICAUTH, @RATIONCARD, @RATIONCARDok, @RATIONCARDvr, @TPLOSS, @PHOTO, @PHOTOok, @PHOTOvr, @FIR2, @CHEQUE, @CHEQUEok, @CHEQUEvr, @INQUIRY, @PTTAX, @PTTAXok, @PTTAXvr, @TOKENTAX, @TOKENTAXok, @TOKENTAXvr)"
                                            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CLAIMMAS] WHERE ([ID] = @ID)"
                                            
                                            UpdateCommand="UPDATE [CLAIMMAS] SET [CLAINNO] = @CLAINNO, [VEHNO] = @VEHNO, [LSTATUS] = @LSTATUS, [VMAKE] = @VMAKE, [DOA] = @DOA, [AT] = @AT, [MODEL] = @MODEL, [MON] = @MON, [VOWNER] = @VOWNER, [NEAR] = @NEAR, [FATHERNAME] = @FATHERNAME, [ADDRESS] = @ADDRESS, [HISTORY] = @HISTORY, [PHONENO] = @PHONENO, [SPOT] = @SPOT, [POLICYNO] = @POLICYNO, [FINAL] = @FINAL, [DATED] = @DATED, [REINSPECTION] = @REINSPECTION, [SUMASSURED] = @SUMASSURED, [ISSUINGOFFICE] = @ISSUINGOFFICE, [INSURANCE] = @INSURANCE, [INSURANCEok] = @INSURANCEok, [INSURANCEvr] = @INSURANCEvr, [CHASISNO] = @CHASISNO, [RC] = @RC, [RCok] = @RCok, [RCvr] = @RCvr, [ENGINENO] = @ENGINENO, [TAX] = @TAX, [TAXok] = @TAXok, [TAXvr] = @TAXvr, [GVW] = @GVW,PermitNo=@PermitNo, Valid=@Valid, FitnessValid=@FitnessValid, [FITNESS] = @FITNESS, [FITNESSok] = @FITNESSok, [FITNESSvr] = @FITNESSvr, [DL] = @DL, [PERMITA] = @PERMITA, [PERMITAok] = @PERMITAok, [PERMITAvr] = @PERMITAvr, [FATHERNAME2] = @FATHERNAME2, [PERMITB] = @PERMITB, [PERMITBok] = @PERMITBok, [PERMITBvr] = @PERMITBvr, [RESIADD] = @RESIADD, [PERMIT47] = @PERMIT47, [PERMIT47ok] = @PERMIT47ok, [PERMIT47vr] = @PERMIT47vr, [DLNO] = @DLNO, [DL2] = @DL2, [DL2ok] = @DL2ok, [DL2vr] = @DL2vr, [VALIPUPTO] = @VALIPUPTO, [FIR] = @FIR, [FIRok] = @FIRok, [FIRvr] = @FIRvr, [AUTHORISED] = @AUTHORISED, [BILLBILTY] = @BILLBILTY, [BILLBILTYok] = @BILLBILTYok, [BILLBILTYvr] = @BILLBILTYvr, [DOB] = @DOB, [CLAIMFORM] = @CLAIMFORM, [CLAIMFORMok] = @CLAIMFORMok, [CLAIMFORMvr] = @CLAIMFORMvr, [LICAUTH] = @LICAUTH, [RATIONCARD] = @RATIONCARD, [RATIONCARDok] = @RATIONCARDok, [RATIONCARDvr] = @RATIONCARDvr, [TPLOSS] = @TPLOSS, [PHOTO] = @PHOTO, [PHOTOok] = @PHOTOok, [PHOTOvr] = @PHOTOvr, [FIR2] = @FIR2, [CHEQUE] = @CHEQUE, [CHEQUEok] = @CHEQUEok, [CHEQUEvr] = @CHEQUEvr, [INQUIRY] = @INQUIRY, [PTTAX] = @PTTAX, [PTTAXok] = @PTTAXok, [PTTAXvr] = @PTTAXvr, [TOKENTAX] = @TOKENTAX, [TOKENTAXok] = @TOKENTAXok, [TOKENTAXvr] = @TOKENTAXvr WHERE [ID] = @original_ID AND (([CLAINNO] = @original_CLAINNO) OR ([CLAINNO] IS NULL AND @original_CLAINNO IS NULL)) AND (([VEHNO] = @original_VEHNO) OR ([VEHNO] IS NULL AND @original_VEHNO IS NULL)) AND (([LSTATUS] = @original_LSTATUS) OR ([LSTATUS] IS NULL AND @original_LSTATUS IS NULL)) AND (([VMAKE] = @original_VMAKE) OR ([VMAKE] IS NULL AND @original_VMAKE IS NULL)) AND (([DOA] = @original_DOA) OR ([DOA] IS NULL AND @original_DOA IS NULL)) AND (([AT] = @original_AT) OR ([AT] IS NULL AND @original_AT IS NULL)) AND (([MODEL] = @original_MODEL) OR ([MODEL] IS NULL AND @original_MODEL IS NULL)) AND (([MON] = @original_MON) OR ([MON] IS NULL AND @original_MON IS NULL)) AND (([VOWNER] = @original_VOWNER) OR ([VOWNER] IS NULL AND @original_VOWNER IS NULL)) AND (([NEAR] = @original_NEAR) OR ([NEAR] IS NULL AND @original_NEAR IS NULL)) AND (([FATHERNAME] = @original_FATHERNAME) OR ([FATHERNAME] IS NULL AND @original_FATHERNAME IS NULL)) AND (([ADDRESS] = @original_ADDRESS) OR ([ADDRESS] IS NULL AND @original_ADDRESS IS NULL)) AND (([HISTORY] = @original_HISTORY) OR ([HISTORY] IS NULL AND @original_HISTORY IS NULL)) AND (([PHONENO] = @original_PHONENO) OR ([PHONENO] IS NULL AND @original_PHONENO IS NULL)) AND (([SPOT] = @original_SPOT) OR ([SPOT] IS NULL AND @original_SPOT IS NULL)) AND (([POLICYNO] = @original_POLICYNO) OR ([POLICYNO] IS NULL AND @original_POLICYNO IS NULL)) AND (([FINAL] = @original_FINAL) OR ([FINAL] IS NULL AND @original_FINAL IS NULL)) AND (([DATED] = @original_DATED) OR ([DATED] IS NULL AND @original_DATED IS NULL)) AND (([REINSPECTION] = @original_REINSPECTION) OR ([REINSPECTION] IS NULL AND @original_REINSPECTION IS NULL)) AND (([SUMASSURED] = @original_SUMASSURED) OR ([SUMASSURED] IS NULL AND @original_SUMASSURED IS NULL)) AND (([ISSUINGOFFICE] = @original_ISSUINGOFFICE) OR ([ISSUINGOFFICE] IS NULL AND @original_ISSUINGOFFICE IS NULL)) AND (([INSURANCE] = @original_INSURANCE) OR ([INSURANCE] IS NULL AND @original_INSURANCE IS NULL)) AND (([INSURANCEok] = @original_INSURANCEok) OR ([INSURANCEok] IS NULL AND @original_INSURANCEok IS NULL)) AND (([INSURANCEvr] = @original_INSURANCEvr) OR ([INSURANCEvr] IS NULL AND @original_INSURANCEvr IS NULL)) AND (([CHASISNO] = @original_CHASISNO) OR ([CHASISNO] IS NULL AND @original_CHASISNO IS NULL)) AND (([RC] = @original_RC) OR ([RC] IS NULL AND @original_RC IS NULL)) AND (([RCok] = @original_RCok) OR ([RCok] IS NULL AND @original_RCok IS NULL)) AND (([RCvr] = @original_RCvr) OR ([RCvr] IS NULL AND @original_RCvr IS NULL)) AND (([ENGINENO] = @original_ENGINENO) OR ([ENGINENO] IS NULL AND @original_ENGINENO IS NULL)) AND (([TAX] = @original_TAX) OR ([TAX] IS NULL AND @original_TAX IS NULL)) AND (([TAXok] = @original_TAXok) OR ([TAXok] IS NULL AND @original_TAXok IS NULL)) AND (([TAXvr] = @original_TAXvr) OR ([TAXvr] IS NULL AND @original_TAXvr IS NULL)) AND (([GVW] = @original_GVW) OR ([GVW] IS NULL AND @original_GVW IS NULL)) AND (([PermitNo] = @original_PermitNo) OR ([PermitNo] IS NULL AND @original_PermitNo IS NULL)) AND (([Valid] = @original_Valid) OR ([Valid] IS NULL AND @original_Valid IS NULL)) AND (([FitnessValid] = @original_FitnessValid) OR ([FitnessValid] IS NULL AND @original_FitnessValid IS NULL)) AND (([FITNESS] = @original_FITNESS) OR ([FITNESS] IS NULL AND @original_FITNESS IS NULL)) AND (([FITNESSok] = @original_FITNESSok) OR ([FITNESSok] IS NULL AND @original_FITNESSok IS NULL)) AND (([FITNESSvr] = @original_FITNESSvr) OR ([FITNESSvr] IS NULL AND @original_FITNESSvr IS NULL)) AND (([DL] = @original_DL) OR ([DL] IS NULL AND @original_DL IS NULL)) AND (([PERMITA] = @original_PERMITA) OR ([PERMITA] IS NULL AND @original_PERMITA IS NULL)) AND (([PERMITAok] = @original_PERMITAok) OR ([PERMITAok] IS NULL AND @original_PERMITAok IS NULL)) AND (([PERMITAvr] = @original_PERMITAvr) OR ([PERMITAvr] IS NULL AND @original_PERMITAvr IS NULL)) AND (([FATHERNAME2] = @original_FATHERNAME2) OR ([FATHERNAME2] IS NULL AND @original_FATHERNAME2 IS NULL)) AND (([PERMITB] = @original_PERMITB) OR ([PERMITB] IS NULL AND @original_PERMITB IS NULL)) AND (([PERMITBok] = @original_PERMITBok) OR ([PERMITBok] IS NULL AND @original_PERMITBok IS NULL)) AND (([PERMITBvr] = @original_PERMITBvr) OR ([PERMITBvr] IS NULL AND @original_PERMITBvr IS NULL)) AND (([RESIADD] = @original_RESIADD) OR ([RESIADD] IS NULL AND @original_RESIADD IS NULL)) AND (([PERMIT47] = @original_PERMIT47) OR ([PERMIT47] IS NULL AND @original_PERMIT47 IS NULL)) AND (([PERMIT47ok] = @original_PERMIT47ok) OR ([PERMIT47ok] IS NULL AND @original_PERMIT47ok IS NULL)) AND (([PERMIT47vr] = @original_PERMIT47vr) OR ([PERMIT47vr] IS NULL AND @original_PERMIT47vr IS NULL)) AND (([DLNO] = @original_DLNO) OR ([DLNO] IS NULL AND @original_DLNO IS NULL)) AND (([DL2] = @original_DL2) OR ([DL2] IS NULL AND @original_DL2 IS NULL)) AND (([DL2ok] = @original_DL2ok) OR ([DL2ok] IS NULL AND @original_DL2ok IS NULL)) AND (([DL2vr] = @original_DL2vr) OR ([DL2vr] IS NULL AND @original_DL2vr IS NULL)) AND (([VALIPUPTO] = @original_VALIPUPTO) OR ([VALIPUPTO] IS NULL AND @original_VALIPUPTO IS NULL)) AND (([FIR] = @original_FIR) OR ([FIR] IS NULL AND @original_FIR IS NULL)) AND (([FIRok] = @original_FIRok) OR ([FIRok] IS NULL AND @original_FIRok IS NULL)) AND (([FIRvr] = @original_FIRvr) OR ([FIRvr] IS NULL AND @original_FIRvr IS NULL)) AND (([AUTHORISED] = @original_AUTHORISED) OR ([AUTHORISED] IS NULL AND @original_AUTHORISED IS NULL)) AND (([BILLBILTY] = @original_BILLBILTY) OR ([BILLBILTY] IS NULL AND @original_BILLBILTY IS NULL)) AND (([BILLBILTYok] = @original_BILLBILTYok) OR ([BILLBILTYok] IS NULL AND @original_BILLBILTYok IS NULL)) AND (([BILLBILTYvr] = @original_BILLBILTYvr) OR ([BILLBILTYvr] IS NULL AND @original_BILLBILTYvr IS NULL)) AND (([DOB] = @original_DOB) OR ([DOB] IS NULL AND @original_DOB IS NULL)) AND (([CLAIMFORM] = @original_CLAIMFORM) OR ([CLAIMFORM] IS NULL AND @original_CLAIMFORM IS NULL)) AND (([CLAIMFORMok] = @original_CLAIMFORMok) OR ([CLAIMFORMok] IS NULL AND @original_CLAIMFORMok IS NULL)) AND (([CLAIMFORMvr] = @original_CLAIMFORMvr) OR ([CLAIMFORMvr] IS NULL AND @original_CLAIMFORMvr IS NULL)) AND (([LICAUTH] = @original_LICAUTH) OR ([LICAUTH] IS NULL AND @original_LICAUTH IS NULL)) AND (([RATIONCARD] = @original_RATIONCARD) OR ([RATIONCARD] IS NULL AND @original_RATIONCARD IS NULL)) AND (([RATIONCARDok] = @original_RATIONCARDok) OR ([RATIONCARDok] IS NULL AND @original_RATIONCARDok IS NULL)) AND (([RATIONCARDvr] = @original_RATIONCARDvr) OR ([RATIONCARDvr] IS NULL AND @original_RATIONCARDvr IS NULL)) AND (([TPLOSS] = @original_TPLOSS) OR ([TPLOSS] IS NULL AND @original_TPLOSS IS NULL)) AND (([PHOTO] = @original_PHOTO) OR ([PHOTO] IS NULL AND @original_PHOTO IS NULL)) AND (([PHOTOok] = @original_PHOTOok) OR ([PHOTOok] IS NULL AND @original_PHOTOok IS NULL)) AND (([PHOTOvr] = @original_PHOTOvr) OR ([PHOTOvr] IS NULL AND @original_PHOTOvr IS NULL)) AND (([FIR2] = @original_FIR2) OR ([FIR2] IS NULL AND @original_FIR2 IS NULL)) AND (([CHEQUE] = @original_CHEQUE) OR ([CHEQUE] IS NULL AND @original_CHEQUE IS NULL)) AND (([CHEQUEok] = @original_CHEQUEok) OR ([CHEQUEok] IS NULL AND @original_CHEQUEok IS NULL)) AND (([CHEQUEvr] = @original_CHEQUEvr) OR ([CHEQUEvr] IS NULL AND @original_CHEQUEvr IS NULL)) AND (([INQUIRY] = @original_INQUIRY) OR ([INQUIRY] IS NULL AND @original_INQUIRY IS NULL)) AND (([PTTAX] = @original_PTTAX) OR ([PTTAX] IS NULL AND @original_PTTAX IS NULL)) AND (([PTTAXok] = @original_PTTAXok) OR ([PTTAXok] IS NULL AND @original_PTTAXok IS NULL)) AND (([PTTAXvr] = @original_PTTAXvr) OR ([PTTAXvr] IS NULL AND @original_PTTAXvr IS NULL)) AND (([TOKENTAX] = @original_TOKENTAX) OR ([TOKENTAX] IS NULL AND @original_TOKENTAX IS NULL)) AND (([TOKENTAXok] = @original_TOKENTAXok) OR ([TOKENTAXok] IS NULL AND @original_TOKENTAXok IS NULL)) AND (([TOKENTAXvr] = @original_TOKENTAXvr) OR ([TOKENTAXvr] IS NULL AND @original_TOKENTAXvr IS NULL))">
                                            <DeleteParameters>
                                                <asp:Parameter Name="original_ID" Type="Int32" />
                                                <asp:Parameter Name="original_CLAINNO" Type="String" />
                                                <asp:Parameter Name="original_VEHNO" Type="String" />
                                                <asp:Parameter Name="original_LSTATUS" Type="String" />
                                                <asp:Parameter Name="original_VMAKE" Type="String" />
                                                <asp:Parameter Name="original_DOA" Type="String" />
                                                <asp:Parameter Name="original_AT" Type="String" />
                                                <asp:Parameter Name="original_MODEL" Type="String" />
                                                <asp:Parameter Name="original_MON" Type="String" />
                                                <asp:Parameter Name="original_VOWNER" Type="String" />
                                                <asp:Parameter Name="original_NEAR" Type="String" />
                                                <asp:Parameter Name="original_FATHERNAME" Type="String" />
                                                <asp:Parameter Name="original_ADDRESS" Type="String" />
                                                <asp:Parameter Name="original_HISTORY" Type="String" />
                                                <asp:Parameter Name="original_PHONENO" Type="String" />
                                                <asp:Parameter Name="original_SPOT" Type="String" />
                                                <asp:Parameter Name="original_POLICYNO" Type="String" />
                                                <asp:Parameter Name="original_FINAL" Type="String" />
                                                <asp:Parameter Name="original_DATED" Type="String" />
                                                <asp:Parameter Name="original_REINSPECTION" Type="String" />
                                                <asp:Parameter Name="original_SUMASSURED" Type="Double" />
                                                <asp:Parameter Name="original_ISSUINGOFFICE" Type="String" />
                                                <asp:Parameter Name="original_INSURANCE" Type="String" />
                                                <asp:Parameter Name="original_INSURANCEok" Type="String" />
                                                <asp:Parameter Name="original_INSURANCEvr" Type="String" />
                                                <asp:Parameter Name="original_CHASISNO" Type="String" />
                                                <asp:Parameter Name="original_RC" Type="String" />
                                                <asp:Parameter Name="original_RCok" Type="String" />
                                                <asp:Parameter Name="original_RCvr" Type="String" />
                                                <asp:Parameter Name="original_ENGINENO" Type="String" />
                                                <asp:Parameter Name="original_TAX" Type="String" />
                                                <asp:Parameter Name="original_TAXok" Type="String" />
                                                <asp:Parameter Name="original_TAXvr" Type="String" />
                                                <asp:Parameter Name="original_GVW" Type="String" />
                                                <asp:Parameter Name="original_PermitNo" Type="String" />
                                                <asp:Parameter Name="original_Valid" Type="String" />
                                                <asp:Parameter Name="original_FitnessValid" Type="String" />
                                                <asp:Parameter Name="original_FITNESS" Type="String" />
                                                <asp:Parameter Name="original_FITNESSok" Type="String" />
                                                <asp:Parameter Name="original_FITNESSvr" Type="String" />
                                                <asp:Parameter Name="original_DL" Type="String" />
                                                <asp:Parameter Name="original_PERMITA" Type="String" />
                                                <asp:Parameter Name="original_PERMITAok" Type="String" />
                                                <asp:Parameter Name="original_PERMITAvr" Type="String" />
                                                <asp:Parameter Name="original_FATHERNAME2" Type="String" />
                                                <asp:Parameter Name="original_PERMITB" Type="String" />
                                                <asp:Parameter Name="original_PERMITBok" Type="String" />
                                                <asp:Parameter Name="original_PERMITBvr" Type="String" />
                                                <asp:Parameter Name="original_RESIADD" Type="String" />
                                                <asp:Parameter Name="original_PERMIT47" Type="String" />
                                                <asp:Parameter Name="original_PERMIT47ok" Type="String" />
                                                <asp:Parameter Name="original_PERMIT47vr" Type="String" />
                                                <asp:Parameter Name="original_DLNO" Type="String" />
                                                <asp:Parameter Name="original_DL2" Type="String" />
                                                <asp:Parameter Name="original_DL2ok" Type="String" />
                                                <asp:Parameter Name="original_DL2vr" Type="String" />
                                                <asp:Parameter Name="original_VALIPUPTO" Type="String" />
                                                <asp:Parameter Name="original_FIR" Type="String" />
                                                <asp:Parameter Name="original_FIRok" Type="String" />
                                                <asp:Parameter Name="original_FIRvr" Type="String" />
                                                <asp:Parameter Name="original_AUTHORISED" Type="String" />
                                                <asp:Parameter Name="original_BILLBILTY" Type="String" />
                                                <asp:Parameter Name="original_BILLBILTYok" Type="String" />
                                                <asp:Parameter Name="original_BILLBILTYvr" Type="String" />
                                                <asp:Parameter Name="original_DOB" Type="String" />
                                                <asp:Parameter Name="original_CLAIMFORM" Type="String" />
                                                <asp:Parameter Name="original_CLAIMFORMok" Type="String" />
                                                <asp:Parameter Name="original_CLAIMFORMvr" Type="String" />
                                                <asp:Parameter Name="original_LICAUTH" Type="String" />
                                                <asp:Parameter Name="original_RATIONCARD" Type="String" />
                                                <asp:Parameter Name="original_RATIONCARDok" Type="String" />
                                                <asp:Parameter Name="original_RATIONCARDvr" Type="String" />
                                                <asp:Parameter Name="original_TPLOSS" Type="String" />
                                                <asp:Parameter Name="original_PHOTO" Type="String" />
                                                <asp:Parameter Name="original_PHOTOok" Type="String" />
                                                <asp:Parameter Name="original_PHOTOvr" Type="String" />
                                                <asp:Parameter Name="original_FIR2" Type="String" />
                                                <asp:Parameter Name="original_CHEQUE" Type="String" />
                                                <asp:Parameter Name="original_CHEQUEok" Type="String" />
                                                <asp:Parameter Name="original_CHEQUEvr" Type="String" />
                                                <asp:Parameter Name="original_INQUIRY" Type="String" />
                                                <asp:Parameter Name="original_PTTAX" Type="String" />
                                                <asp:Parameter Name="original_PTTAXok" Type="String" />
                                                <asp:Parameter Name="original_PTTAXvr" Type="String" />
                                                <asp:Parameter Name="original_TOKENTAX" Type="String" />
                                                <asp:Parameter Name="original_TOKENTAXok" Type="String" />
                                                <asp:Parameter Name="original_TOKENTAXvr" Type="String" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="CLAINNO" Type="String" />
                                                <asp:Parameter Name="VEHNO" Type="String" />
                                                <asp:Parameter Name="LSTATUS" Type="String" />
                                                <asp:Parameter Name="VMAKE" Type="String" />
                                                <asp:Parameter Name="DOA" Type="String" />
                                                <asp:Parameter Name="AT" Type="String" />
                                                <asp:Parameter Name="MODEL" Type="String" />
                                                <asp:Parameter Name="MON" Type="String" />
                                                <asp:Parameter Name="VOWNER" Type="String" />
                                                <asp:Parameter Name="NEAR" Type="String" />
                                                <asp:Parameter Name="FATHERNAME" Type="String" />
                                                <asp:Parameter Name="ADDRESS" Type="String" />
                                                <asp:Parameter Name="HISTORY" Type="String" />
                                                <asp:Parameter Name="PHONENO" Type="String" />
                                                <asp:Parameter Name="SPOT" Type="String" />
                                                <asp:Parameter Name="POLICYNO" Type="String" />
                                                <asp:Parameter Name="FINAL" Type="String" />
                                                <asp:Parameter Name="DATED" Type="String" />
                                                <asp:Parameter Name="REINSPECTION" Type="String" />
                                                <asp:Parameter Name="SUMASSURED" Type="Double" />
                                                <asp:Parameter Name="ISSUINGOFFICE" Type="String" />
                                                <asp:Parameter Name="INSURANCE" Type="String" />
                                                <asp:Parameter Name="INSURANCEok" Type="String" />
                                                <asp:Parameter Name="INSURANCEvr" Type="String" />
                                                <asp:Parameter Name="CHASISNO" Type="String" />
                                                <asp:Parameter Name="RC" Type="String" />
                                                <asp:Parameter Name="RCok" Type="String" />
                                                <asp:Parameter Name="RCvr" Type="String" />
                                                <asp:Parameter Name="ENGINENO" Type="String" />
                                                <asp:Parameter Name="TAX" Type="String" />
                                                <asp:Parameter Name="TAXok" Type="String" />
                                                <asp:Parameter Name="TAXvr" Type="String" />
                                                <asp:Parameter Name="GVW" Type="String" />
                                                <asp:Parameter Name="PermitNo" Type="String" />
                                                <asp:Parameter Name="Valid" Type="String" />
                                                <asp:Parameter Name="FitnessValid" Type="String" />
                                                <asp:Parameter Name="FITNESS" Type="String" />
                                                <asp:Parameter Name="FITNESSok" Type="String" />
                                                <asp:Parameter Name="FITNESSvr" Type="String" />
                                                <asp:Parameter Name="DL" Type="String" />
                                                <asp:Parameter Name="PERMITA" Type="String" />
                                                <asp:Parameter Name="PERMITAok" Type="String" />
                                                <asp:Parameter Name="PERMITAvr" Type="String" />
                                                <asp:Parameter Name="FATHERNAME2" Type="String" />
                                                <asp:Parameter Name="PERMITB" Type="String" />
                                                <asp:Parameter Name="PERMITBok" Type="String" />
                                                <asp:Parameter Name="PERMITBvr" Type="String" />
                                                <asp:Parameter Name="RESIADD" Type="String" />
                                                <asp:Parameter Name="PERMIT47" Type="String" />
                                                <asp:Parameter Name="PERMIT47ok" Type="String" />
                                                <asp:Parameter Name="PERMIT47vr" Type="String" />
                                                <asp:Parameter Name="DLNO" Type="String" />
                                                <asp:Parameter Name="DL2" Type="String" />
                                                <asp:Parameter Name="DL2ok" Type="String" />
                                                <asp:Parameter Name="DL2vr" Type="String" />
                                                <asp:Parameter Name="VALIPUPTO" Type="String" />
                                                <asp:Parameter Name="FIR" Type="String" />
                                                <asp:Parameter Name="FIRok" Type="String" />
                                                <asp:Parameter Name="FIRvr" Type="String" />
                                                <asp:Parameter Name="AUTHORISED" Type="String" />
                                                <asp:Parameter Name="BILLBILTY" Type="String" />
                                                <asp:Parameter Name="BILLBILTYok" Type="String" />
                                                <asp:Parameter Name="BILLBILTYvr" Type="String" />
                                                <asp:Parameter Name="DOB" Type="String" />
                                                <asp:Parameter Name="CLAIMFORM" Type="String" />
                                                <asp:Parameter Name="CLAIMFORMok" Type="String" />
                                                <asp:Parameter Name="CLAIMFORMvr" Type="String" />
                                                <asp:Parameter Name="LICAUTH" Type="String" />
                                                <asp:Parameter Name="RATIONCARD" Type="String" />
                                                <asp:Parameter Name="RATIONCARDok" Type="String" />
                                                <asp:Parameter Name="RATIONCARDvr" Type="String" />
                                                <asp:Parameter Name="TPLOSS" Type="String" />
                                                <asp:Parameter Name="PHOTO" Type="String" />
                                                <asp:Parameter Name="PHOTOok" Type="String" />
                                                <asp:Parameter Name="PHOTOvr" Type="String" />
                                                <asp:Parameter Name="FIR2" Type="String" />
                                                <asp:Parameter Name="CHEQUE" Type="String" />
                                                <asp:Parameter Name="CHEQUEok" Type="String" />
                                                <asp:Parameter Name="CHEQUEvr" Type="String" />
                                                <asp:Parameter Name="INQUIRY" Type="String" />
                                                <asp:Parameter Name="PTTAX" Type="String" />
                                                <asp:Parameter Name="PTTAXok" Type="String" />
                                                <asp:Parameter Name="PTTAXvr" Type="String" />
                                                <asp:Parameter Name="TOKENTAX" Type="String" />
                                                <asp:Parameter Name="TOKENTAXok" Type="String" />
                                                <asp:Parameter Name="TOKENTAXvr" Type="String" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue"
                                                    Type="Int32" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="CLAINNO" Type="String" />
                                                <asp:Parameter Name="VEHNO" Type="String" />
                                                <asp:Parameter Name="LSTATUS" Type="String" />
                                                <asp:Parameter Name="VMAKE" Type="String" />
                                                <asp:Parameter Name="DOA" Type="String" />
                                                <asp:Parameter Name="AT" Type="String" />
                                                <asp:Parameter Name="MODEL" Type="String" />
                                                <asp:Parameter Name="MON" Type="String" />
                                                <asp:Parameter Name="VOWNER" Type="String" />
                                                <asp:Parameter Name="NEAR" Type="String" />
                                                <asp:Parameter Name="FATHERNAME" Type="String" />
                                                <asp:Parameter Name="ADDRESS" Type="String" />
                                                <asp:Parameter Name="HISTORY" Type="String" />
                                                <asp:Parameter Name="PHONENO" Type="String" />
                                                <asp:Parameter Name="SPOT" Type="String" />
                                                <asp:Parameter Name="POLICYNO" Type="String" />
                                                <asp:Parameter Name="FINAL" Type="String" />
                                                <asp:Parameter Name="DATED" Type="String" />
                                                <asp:Parameter Name="REINSPECTION" Type="String" />
                                                <asp:Parameter Name="SUMASSURED" Type="Double" />
                                                <asp:Parameter Name="ISSUINGOFFICE" Type="String" />
                                                <asp:Parameter Name="INSURANCE" Type="String" />
                                                <asp:Parameter Name="INSURANCEok" Type="String" />
                                                <asp:Parameter Name="INSURANCEvr" Type="String" />
                                                <asp:Parameter Name="CHASISNO" Type="String" />
                                                <asp:Parameter Name="RC" Type="String" />
                                                <asp:Parameter Name="RCok" Type="String" />
                                                <asp:Parameter Name="RCvr" Type="String" />
                                                <asp:Parameter Name="ENGINENO" Type="String" />
                                                <asp:Parameter Name="TAX" Type="String" />
                                                <asp:Parameter Name="TAXok" Type="String" />
                                                <asp:Parameter Name="TAXvr" Type="String" />
                                                <asp:Parameter Name="GVW" Type="String" />
                                                <asp:Parameter Name="PermitNo" Type="String" />
                                                <asp:Parameter Name="Valid" Type="String" />
                                                <asp:Parameter Name="FitnessValid" Type="String" />
                                                <asp:Parameter Name="FITNESS" Type="String" />
                                                <asp:Parameter Name="FITNESSok" Type="String" />
                                                <asp:Parameter Name="FITNESSvr" Type="String" />
                                                <asp:Parameter Name="DL" Type="String" />
                                                <asp:Parameter Name="PERMITA" Type="String" />
                                                <asp:Parameter Name="PERMITAok" Type="String" />
                                                <asp:Parameter Name="PERMITAvr" Type="String" />
                                                <asp:Parameter Name="FATHERNAME2" Type="String" />
                                                <asp:Parameter Name="PERMITB" Type="String" />
                                                <asp:Parameter Name="PERMITBok" Type="String" />
                                                <asp:Parameter Name="PERMITBvr" Type="String" />
                                                <asp:Parameter Name="RESIADD" Type="String" />
                                                <asp:Parameter Name="PERMIT47" Type="String" />
                                                <asp:Parameter Name="PERMIT47ok" Type="String" />
                                                <asp:Parameter Name="PERMIT47vr" Type="String" />
                                                <asp:Parameter Name="DLNO" Type="String" />
                                                <asp:Parameter Name="DL2" Type="String" />
                                                <asp:Parameter Name="DL2ok" Type="String" />
                                                <asp:Parameter Name="DL2vr" Type="String" />
                                                <asp:Parameter Name="VALIPUPTO" Type="String" />
                                                <asp:Parameter Name="FIR" Type="String" />
                                                <asp:Parameter Name="FIRok" Type="String" />
                                                <asp:Parameter Name="FIRvr" Type="String" />
                                                <asp:Parameter Name="AUTHORISED" Type="String" />
                                                <asp:Parameter Name="BILLBILTY" Type="String" />
                                                <asp:Parameter Name="BILLBILTYok" Type="String" />
                                                <asp:Parameter Name="BILLBILTYvr" Type="String" />
                                                <asp:Parameter Name="DOB" Type="String" />
                                                <asp:Parameter Name="CLAIMFORM" Type="String" />
                                                <asp:Parameter Name="CLAIMFORMok" Type="String" />
                                                <asp:Parameter Name="CLAIMFORMvr" Type="String" />
                                                <asp:Parameter Name="LICAUTH" Type="String" />
                                                <asp:Parameter Name="RATIONCARD" Type="String" />
                                                <asp:Parameter Name="RATIONCARDok" Type="String" />
                                                <asp:Parameter Name="RATIONCARDvr" Type="String" />
                                                <asp:Parameter Name="TPLOSS" Type="String" />
                                                <asp:Parameter Name="PHOTO" Type="String" />
                                                <asp:Parameter Name="PHOTOok" Type="String" />
                                                <asp:Parameter Name="PHOTOvr" Type="String" />
                                                <asp:Parameter Name="FIR2" Type="String" />
                                                <asp:Parameter Name="CHEQUE" Type="String" />
                                                <asp:Parameter Name="CHEQUEok" Type="String" />
                                                <asp:Parameter Name="CHEQUEvr" Type="String" />
                                                <asp:Parameter Name="INQUIRY" Type="String" />
                                                <asp:Parameter Name="PTTAX" Type="String" />
                                                <asp:Parameter Name="PTTAXok" Type="String" />
                                                <asp:Parameter Name="PTTAXvr" Type="String" />
                                                <asp:Parameter Name="TOKENTAX" Type="String" />
                                                <asp:Parameter Name="TOKENTAXok" Type="String" />
                                                <asp:Parameter Name="TOKENTAXvr" Type="String" />
                                                <asp:Parameter Name="original_ID" Type="Int32" />
                                                <asp:Parameter Name="original_CLAINNO" Type="String" />
                                                <asp:Parameter Name="original_VEHNO" Type="String" />
                                                <asp:Parameter Name="original_LSTATUS" Type="String" />
                                                <asp:Parameter Name="original_VMAKE" Type="String" />
                                                <asp:Parameter Name="original_DOA" Type="String" />
                                                <asp:Parameter Name="original_AT" Type="String" />
                                                <asp:Parameter Name="original_MODEL" Type="String" />
                                                <asp:Parameter Name="original_MON" Type="String" />
                                                <asp:Parameter Name="original_VOWNER" Type="String" />
                                                <asp:Parameter Name="original_NEAR" Type="String" />
                                                <asp:Parameter Name="original_FATHERNAME" Type="String" />
                                                <asp:Parameter Name="original_ADDRESS" Type="String" />
                                                <asp:Parameter Name="original_HISTORY" Type="String" />
                                                <asp:Parameter Name="original_PHONENO" Type="String" />
                                                <asp:Parameter Name="original_SPOT" Type="String" />
                                                <asp:Parameter Name="original_POLICYNO" Type="String" />
                                                <asp:Parameter Name="original_FINAL" Type="String" />
                                                <asp:Parameter Name="original_DATED" Type="String" />
                                                <asp:Parameter Name="original_REINSPECTION" Type="String" />
                                                <asp:Parameter Name="original_SUMASSURED" Type="Double" />
                                                <asp:Parameter Name="original_ISSUINGOFFICE" Type="String" />
                                                <asp:Parameter Name="original_INSURANCE" Type="String" />
                                                <asp:Parameter Name="original_INSURANCEok" Type="String" />
                                                <asp:Parameter Name="original_INSURANCEvr" Type="String" />
                                                <asp:Parameter Name="original_CHASISNO" Type="String" />
                                                <asp:Parameter Name="original_RC" Type="String" />
                                                <asp:Parameter Name="original_RCok" Type="String" />
                                                <asp:Parameter Name="original_RCvr" Type="String" />
                                                <asp:Parameter Name="original_ENGINENO" Type="String" />
                                                <asp:Parameter Name="original_TAX" Type="String" />
                                                <asp:Parameter Name="original_TAXok" Type="String" />
                                                <asp:Parameter Name="original_TAXvr" Type="String" />
                                                <asp:Parameter Name="original_GVW" Type="String" />
                                                <asp:Parameter Name="original_PermitNo" Type="String" />
                                                <asp:Parameter Name="original_Valid" Type="String" />
                                                <asp:Parameter Name="original_FitnessValid" Type="String" />
                                                <asp:Parameter Name="original_FITNESS" Type="String" />
                                                <asp:Parameter Name="original_FITNESSok" Type="String" />
                                                <asp:Parameter Name="original_FITNESSvr" Type="String" />
                                                <asp:Parameter Name="original_DL" Type="String" />
                                                <asp:Parameter Name="original_PERMITA" Type="String" />
                                                <asp:Parameter Name="original_PERMITAok" Type="String" />
                                                <asp:Parameter Name="original_PERMITAvr" Type="String" />
                                                <asp:Parameter Name="original_FATHERNAME2" Type="String" />
                                                <asp:Parameter Name="original_PERMITB" Type="String" />
                                                <asp:Parameter Name="original_PERMITBok" Type="String" />
                                                <asp:Parameter Name="original_PERMITBvr" Type="String" />
                                                <asp:Parameter Name="original_RESIADD" Type="String" />
                                                <asp:Parameter Name="original_PERMIT47" Type="String" />
                                                <asp:Parameter Name="original_PERMIT47ok" Type="String" />
                                                <asp:Parameter Name="original_PERMIT47vr" Type="String" />
                                                <asp:Parameter Name="original_DLNO" Type="String" />
                                                <asp:Parameter Name="original_DL2" Type="String" />
                                                <asp:Parameter Name="original_DL2ok" Type="String" />
                                                <asp:Parameter Name="original_DL2vr" Type="String" />
                                                <asp:Parameter Name="original_VALIPUPTO" Type="String" />
                                                <asp:Parameter Name="original_FIR" Type="String" />
                                                <asp:Parameter Name="original_FIRok" Type="String" />
                                                <asp:Parameter Name="original_FIRvr" Type="String" />
                                                <asp:Parameter Name="original_AUTHORISED" Type="String" />
                                                <asp:Parameter Name="original_BILLBILTY" Type="String" />
                                                <asp:Parameter Name="original_BILLBILTYok" Type="String" />
                                                <asp:Parameter Name="original_BILLBILTYvr" Type="String" />
                                                <asp:Parameter Name="original_DOB" Type="String" />
                                                <asp:Parameter Name="original_CLAIMFORM" Type="String" />
                                                <asp:Parameter Name="original_CLAIMFORMok" Type="String" />
                                                <asp:Parameter Name="original_CLAIMFORMvr" Type="String" />
                                                <asp:Parameter Name="original_LICAUTH" Type="String" />
                                                <asp:Parameter Name="original_RATIONCARD" Type="String" />
                                                <asp:Parameter Name="original_RATIONCARDok" Type="String" />
                                                <asp:Parameter Name="original_RATIONCARDvr" Type="String" />
                                                <asp:Parameter Name="original_TPLOSS" Type="String" />
                                                <asp:Parameter Name="original_PHOTO" Type="String" />
                                                <asp:Parameter Name="original_PHOTOok" Type="String" />
                                                <asp:Parameter Name="original_PHOTOvr" Type="String" />
                                                <asp:Parameter Name="original_FIR2" Type="String" />
                                                <asp:Parameter Name="original_CHEQUE" Type="String" />
                                                <asp:Parameter Name="original_CHEQUEok" Type="String" />
                                                <asp:Parameter Name="original_CHEQUEvr" Type="String" />
                                                <asp:Parameter Name="original_INQUIRY" Type="String" />
                                                <asp:Parameter Name="original_PTTAX" Type="String" />
                                                <asp:Parameter Name="original_PTTAXok" Type="String" />
                                                <asp:Parameter Name="original_PTTAXvr" Type="String" />
                                                <asp:Parameter Name="original_TOKENTAX" Type="String" />
                                                <asp:Parameter Name="original_TOKENTAXok" Type="String" />
                                                <asp:Parameter Name="original_TOKENTAXvr" Type="String" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%" valign="top" align="right">
                            <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="true" PageSize="10"
                                EmptyDataText="No Record Found" OnRowDataBound="GridViewRowDataBound" AutoGenerateColumns="False"
                                DataKeyNames="ID" >
                                <HeaderStyle BackColor="black" ForeColor="White" />
                                <SelectedRowStyle BackColor="Silver" />
                                <AlternatingRowStyle BackColor="#F0F0F0" />
                                <FooterStyle BackColor="PaleGreen" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/check.gif"
                                        ItemStyle-Width="20px" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="CLAINNO" HeaderText="CLAINNO" SortExpression="CLAINNO"
                                        ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="VEHNO" HeaderText="VEHNO" SortExpression="VEHNO" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="VOWNER" HeaderText="VOWNER" SortExpression="VOWNER" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="PHONENO" HeaderText="PHONENO" SortExpression="PHONENO"
                                        ItemStyle-HorizontalAlign="Center" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VipinAutoMobilesConnection %>"
                                SelectCommand="SELECT * FROM [CLAIMMAS] ORDER BY [ID] DESC"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

