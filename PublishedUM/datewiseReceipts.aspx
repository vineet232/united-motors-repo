<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="datewiseReceipts, App_Web_h5d101sg" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="vabillimg/style-sheet.css" rel="stylesheet" type="text/css" />
    <script src="vabillimg/CalendarControl.js" type="text/javascript"></script>
    <link href="vabillimg/CalendarControl.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="100%">
        <tr>
            <td>
                <table width="80%">
                    <tr>
                        <td>
                            From Date:
                            <asp:TextBox ID="txtFirstDate" MaxLength="10" onfocus="showCalendarControl(this);"
                                ToolTip="MM/DD/YYYY" Width="70px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rw1" runat="server" ControlToValidate="txtFirstDate"
                                SetFocusOnError="true" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp; To Date:
                            <asp:TextBox ID="txtSecondDate" MaxLength="10" onfocus="showCalendarControl(this);"
                                ToolTip="MM/DD/YYYY" Width="70px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSecondDate"
                                SetFocusOnError="true" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Button ID="btnShow" runat="server" OnClick="ShowReport" Text="Show Report.."
                                CssClass="button" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                    InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
                    Width="100%" Height="800px">
                    <LocalReport ReportPath="DatewiseReceiptsRPT.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="datewiseReceptsDSTableAdapters.RECPTMASTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="VOWNER" Type="String" />
                        <asp:Parameter Name="VNUM" Type="String" />
                        <asp:Parameter Name="VMAKE" Type="String" />
                        <asp:Parameter Name="VDATE" Type="DateTime" />
                        <asp:Parameter Name="AMTWRDS" Type="String" />
                        <asp:Parameter Name="AMTTYPE" Type="String" />
                        <asp:Parameter Name="ACTFOR" Type="String" />
                        <asp:Parameter Name="BILLNO" Type="String" />
                        <asp:Parameter Name="DDNO" Type="String" />
                        <asp:Parameter Name="BILLDATE" Type="String" />
                        <asp:Parameter Name="TotalAmount" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFirstDate" DefaultValue="1/1/1900" Name="vdate1"
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtSecondDate" DefaultValue="1/1/1900" Name="vdate2"
                            PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
