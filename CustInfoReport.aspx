<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="CustInforReport, App_Web_gdx0w2k3" %>

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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="button" OnClick="btnShowClick" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblError" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                    InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
                    Width="100%" Height="800px">
                    <LocalReport ReportPath="CustInfoRPT.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="CustInfoDSTableAdapters.CUSTINFOTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFirstDate" Name="date1" PropertyName="Text" Type="DateTime"
                            DefaultValue="2010/01/01" />
                        <asp:ControlParameter ControlID="txtSecondDate" Name="date2" PropertyName="Text"
                            Type="DateTime" DefaultValue="2000/01/01" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
