<%@ page title="" language="C#" masterpagefile="~/VipinAutomobiles.master" enableeventvalidation="true" autoeventwireup="true" inherits="slipInvoice, App_Web_1ssuryoo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
                   /*z-index: 999;*/
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 400px;
        height: 300px;
        display: none;
        position: fixed;
        background-color: white;
        z-index: 999;
    }
</style>


   

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

     <asp:UpdateProgress ID="showProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modalSpinner">
                <div class="center">
                    <img alt="" src="images/4.gif" />
                    <br />
                    Please wait.....
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>


  <%--  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
   <%-- <script type="text/javascript">
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

    <table width="100%">
     <tr valign="top">
                    <td valign="top">
                        <b style="color: Blue;"><u>Slip Invoice </u></b>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="border-bottom: 1px solid black;">
                        <asp:Label ID="lblError" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:HiddenField ID="HiddenField2" runat="server" />
                    </td>
                </tr>

         <tr>
                                <td>
                                    <table width="90%" align="center">
                                        <tr>
                                        <td align="right" nowrap>
                                                Name:
                                            </td>
                                            <td align="right" nowrap >
                                                <asp:TextBox ID="txtNewVOwner" Width="250px" MaxLength="150" ValidationGroup="system"
                                                    runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator191" runat="server" ErrorMessage="*"
                                                    ControlToValidate="txtNewVOwner" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>

                                            <td align="right" nowrap>
                                                Vehicle No:
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox ID="txtNewVeh" MaxLength="20" Width="120px" ValidationGroup="system"
                                                    runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator181" runat="server" ErrorMessage="*"
                                                    ControlToValidate="txtNewVeh" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:Label ID="lblHVehNo" Visible="false" runat="server"></asp:Label>
                                            </td>
                                            
                                            
                                            <td align="right" nowrap>
                                                Contact No:
                                                
                                            </td>
                                            <td nowrap>
                                             <asp:TextBox ID="txtContactNo" Width="120px" MaxLength="48" ValidationGroup="system"
                                                    runat="server"></asp:TextBox>

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2txtContactNo" runat="server" ErrorMessage="*"
                                                    ControlToValidate="txtContactNo" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                    
                                                   

                                            </td>
                                            
                                        </tr>

                                           
                                        <tr  >
                                        <td align="right" nowrap>
                                            Make/Model:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMakenModel" runat="server" ValidationGroup="system" MaxLength="50"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                                    ControlToValidate="txtMakenModel" ValidationGroup="system" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>

                                           <td nowrap colspan="4" align="center" >
                                               <asp:Button ID="btnUpdateDate" Visible="false" runat="server" OnClick="UpdateDate" OnClientClick="return confirm('Are you sure you want to update the data for this Vehicle Number?')"
                                                    Text="Update Data" CssClass="button"></asp:Button>&nbsp;
                                                <asp:Button ID="lnkSlipInvoice" runat="server" OnClick="SaveSlipInvoiceDetails" Text="Save"
                                                    CssClass="button" ValidationGroup="system"></asp:Button>

                                                     <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset"
                                                    CssClass="button" CausesValidation="false" ValidationGroup="system"></asp:Button>

                                                
                                            </td>
                                             <td align="center" colspan="3" style="background-color: Red; color: White; font-weight: bold; border-top:2px solid black; display:none;">
                                                <asp:Label ID="lblTot" runat="server" Text="Total:"></asp:Label>&nbsp;
                                                <asp:Label ID="lbltotal" runat="server" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr style="border:2px solid black;">
                                        
                                           <%-- <td align="right" nowrap>
                                                Payment Method:
                                                
                                            </td>--%>
                                            <td nowrap>
                                             <asp:DropDownList Visible="false" ID="ddlPaymentMethod" ValidationGroup="closing" runat="server" Width="125px">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                    <asp:ListItem Value="Credit">Credit</asp:ListItem>
                                                </asp:DropDownList>

                                                  <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlPaymentMethod" runat="server" ErrorMessage="*"
                                                    ControlToValidate="ddlPaymentMethod" InitialValue="0" ValidationGroup="closing" SetFocusOnError="true"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    
                                                   
                                                   <asp:Button ID="btnCloseVehicle" ValidationGroup="closing" runat="server" OnClick="btnCloseVehicle_Click" OnClientClick="return confirm('Are you sure you want to Close the data for this Vehicle Number?')"
                                                    Text="Close Selected Vehicle Details" style="background-color:Red; color:White; font-weight:bold;"></asp:Button>&nbsp;


                                            </td>

                                            <td align="right">
                                                <asp:Label ID="lblJobCardNo" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 100%" valign="top" align="right">
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="200px">
                                        <asp:GridView ID="GridView2" runat="server" Width="100%" 
                                             EmptyDataText="No Record Found" OnRowDataBound="GridView2_RowDataBound" 
                                            OnSelectedIndexChanged="GridView2_SelectedIndexChanged"
                                             AutoGenerateColumns="false">
                                            <HeaderStyle BackColor="black" ForeColor="White" />
                                            <SelectedRowStyle BackColor="Silver" />
                                            <AlternatingRowStyle BackColor="#F0F0F0" />
                                            <FooterStyle BackColor="PaleGreen" />
                                            <Columns>
                                               <asp:CommandField ButtonType="Link" ShowSelectButton="true" HeaderText="Select" /> 
                                               
                                                <asp:TemplateField  HeaderText="Vehicle No" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                    <asp:Label ID="lblInvMasID" Visible="false" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                     <asp:Label ID="lblJobCardNo" Visible="false" runat="server" Text='<%# Bind("jobCardNo") %>'></asp:Label>
                                                     
                                                        <asp:Label ID="lblvnum" runat="server" Text='<%# Bind("vnum") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                   
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                    
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Make/Model" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblmakenmodel" runat="server" Text='<%# Bind("makenmodel") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                    
                                                </asp:TemplateField>

                                                <asp:TemplateField  HeaderText="Name" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblvOwner" runat="server" Text='<%# Bind("VOWNER") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                    
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Contact No" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblvContactNo" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                   
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Opening Date" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                    <asp:Label ID="lblHiddenJobCardDate" Visible="false" runat="server" Text='<%# Bind("JobCardOpeningDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                                        <asp:Label ID="lblvJobCardOpeningDate" runat="server" Text='<%# Bind("JobCardOpeningDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                    
                                                </asp:TemplateField>
                                             
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <br />
                                </td>
                            </tr>

    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" style="vertical-align: top;" align="center">
               
                <tr>
                    <td>
                        <table width="100%">
                           


                            <tr>
                                <td style="width: 100%" valign="top" align="right">
                                    <asp:Panel ID="pnlData" runat="server" ScrollBars="Vertical" Height="300px">
                                        <asp:GridView ID="GridView1" runat="server" Width="100%" OnRowDataBound="GridViewRowDataBound"
                                            OnPageIndexChanging="PageIndexChanging" EmptyDataText="No Record Found" OnRowEditing="GridView1_RowEditing"
                                            OnRowCancelingEdit="GridView1_CancelingEdit" ShowFooter="true" OnRowCommand="GridView1_RowCommand"
                                            OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="false">
                                            <HeaderStyle BackColor="black" ForeColor="White" />
                                            <SelectedRowStyle BackColor="Silver" />
                                            <AlternatingRowStyle BackColor="#F0F0F0" />
                                            <FooterStyle BackColor="PaleGreen" />
                                            <Columns>
                                                
                                                <asp:TemplateField Visible="false" HeaderText="New" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkAddNewDist" runat="server" OnClick="lnkAddNewParti"><img src="addicon2.jpg" style="border:none" alt="New" /> </asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Wrap="false" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="lnkUpdate" runat="server" ValidationGroup="system3" CausesValidation="True"
                                                            CommandName="Update"><img src="saveicon2.jpg" alt="Save" style="border:none" />  </asp:LinkButton>
                                                        &nbsp;
                                                        <asp:LinkButton ID="lnlCancel" runat="server" CausesValidation="False" CommandName="Cancel"><img src="cancelicon.jpg" alt="Cancel" style="border:none" /></asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit"><img src="editicon3.jpg" style="border:none" alt="Edit" /></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Del" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkDelete" ValidationGroup="system2" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?')"
                                                            CommandName="Delete"><img src="deleteicon2.jpg" alt="Delete" style="border:none" /> </asp:LinkButton>
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
                                                       
                                                    </EditItemTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                    
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:TemplateField>
                                               
                                                <asp:TemplateField Visible="false" HeaderText="Owner" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblvOwner" runat="server" Text='<%# Bind("vowner") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txteVowner" MaxLength="48" runat="server" Text='<%# Bind("vowner") %>'></asp:TextBox>
                                                       
                                                    </EditItemTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                   
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:TemplateField>
                                               
                                                <asp:TemplateField HeaderText="Particulars" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                    <asp:Label ID="IDItem" Visible="false" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                       <asp:Label ID="lblPID" runat="server" Width="250px" Style="word-break: break-all;
                                                            word-wrap: break-word;" Text='<%# Bind("Particulars") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    <EditItemTemplate>
                                                    <asp:Label ID="IDEditItem" Visible="false" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
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
                                                    <FooterTemplate>
                                                        Particulars:
                                                        <asp:TextBox ID="txtParticulars" AutoPostBack="true" OnTextChanged="PartiCularAMount"
                                                            MaxLength="150" ValidationGroup="system" runat="server"></asp:TextBox>
                                                        <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtParticulars"
                                                            MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
                                                            ServiceMethod="GetNames">
                                                        </asp:AutoCompleteExtender>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*"
                                                            ControlToValidate="txtParticulars" ValidationGroup="system" SetFocusOnError="true"
                                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:TemplateField>





                                                


                                                 <asp:TemplateField HeaderText="UOM" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="HSNUomItem"  runat="server" Text='<%# Bind("UOM") %>'></asp:Label>
                                                        
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    <EditItemTemplate>
                                                         <asp:DropDownList ID="ddlUOM" SelectedValue='<%# Bind("UOM") %>' Width="65px" onchange="changeUOM(this)" 
                                                    AppendDataBoundItems="true" runat="server">
                                                     
                                                    <asp:ListItem Value="Each">Each</asp:ListItem>
                                                    <asp:ListItem Value="Ltr">Ltr</asp:ListItem>
                                                </asp:DropDownList>

                                                    </EditItemTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                    <HeaderStyle Wrap="false" />
                                                    <FooterStyle Wrap="false" />
                                                    <FooterTemplate>
                                                    UOM:
                                                     

                                                     <asp:DropDownList ID="ddlUOM" Width="65px" 
                                                    AppendDataBoundItems="true" runat="server">
                                                    <asp:ListItem Value="Each">Each</asp:ListItem>
                                                    <asp:ListItem Value="Ltr">Ltr</asp:ListItem>
                                                </asp:DropDownList>

                                               
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:TemplateField>




                                                <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtEQty" MaxLength="5" AutoPostBack="true" OnTextChanged="QtyAMount2"
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
                                                    <FooterTemplate>
                                                        Qty:
                                                        <asp:TextBox ID="txtNewQty"  runat="server" MaxLength="5" AutoPostBack="true"
                                                            OnTextChanged="QtyAMount" onKeyPress="return checkIt(event)" Width="40px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                                            ControlToValidate="txtNewQty" ValidationGroup="system" SetFocusOnError="true"
                                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtNewQty" runat="server"
                                                            ErrorMessage="*" ValidationGroup="system" MinimumValue="1" MaximumValue="99"
                                                            SetFocusOnError="true"></asp:RangeValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle Wrap="false" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:TemplateField>
                                                
                                                 <asp:TemplateField HeaderText="Rate" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRTID" runat="server" Text='<%# Bind("Rate") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtEditRTID" AutoPostBack="true" OnTextChanged="RateChange2" onKeyPress="return checkIt(event)" MaxLength="10" Width="60px"
                                                            runat="server" Text='<%# Bind("Rate") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                    <FooterTemplate>
                                                        Rate:
                                                        <asp:TextBox ID="txtNewRate"  AutoPostBack="true" OnTextChanged="RateChange" onKeyPress="return checkIt(event)" MaxLength="10" Width="60px"
                                                            ValidationGroup="system" runat="server"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator213" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtNewRate" ValidationGroup="system" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <FooterStyle Wrap="false" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Total" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                    <asp:Label ID="lblTPID" runat="server" Text='<%# Bind("totalAmount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="false" HorizontalAlign="center" />
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtEditTPID" onKeyPress="return checkIt(event)" MaxLength="10" Width="60px"
                                                            runat="server" Text='<%# Bind("totalAmount") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemStyle Wrap="false" />
                                                    <FooterTemplate>
                                                        Total Amt:
                                                        <asp:TextBox ID="txtNewTPAmt" onKeyPress="return checkIt(event)" MaxLength="10" Width="60px"
                                                            ValidationGroup="system" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2413" runat="server" ErrorMessage="*"
                                                            ValidationGroup="system" SetFocusOnError="true" ControlToValidate="txtNewQty"
                                                            ForeColor="Red"></asp:RequiredFieldValidator>

                                                             <asp:LinkButton ID="lnkNew" ValidationGroup="system" runat="server" CommandName="AddNew"><img src="saveicon2.jpg" alt="Save" style="border:none" /></asp:LinkButton>
                                                        &nbsp;&nbsp;
                                                        <asp:LinkButton ID="lnkCancelNew" CausesValidation="false" runat="server" OnClick="lnkCancelNew"><img src="cancelicon.jpg" alt="Cancel" style="border:none" /></asp:LinkButton>

                                                    </FooterTemplate>
                                                    <FooterStyle Wrap="false" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:TemplateField>
                                              

                                                 

                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

