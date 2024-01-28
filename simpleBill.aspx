<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="simpleBill, App_Web_gdx0w2k3" %>

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
                            Vehicle No.:
                            <asp:TextBox ID="txtVehNo" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Date (MM/dd/YYYY):
                            <asp:TextBox ID="txtDate" onfocus="showCalendarControl(this);" runat="server"></asp:TextBox>
                        </td>

                         <td>
                            Pre. Dates:
                                                <asp:DropDownList ID="ddlDt" Width="95px" AutoPostBack="true" OnSelectedIndexChanged="ddlDtIndexChanged"
                                                    AppendDataBoundItems="true" runat="server">
                                                </asp:DropDownList>
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
                    <%--<LocalReport ReportPath="SimpleBillsRPT.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>--%>
                </rsweb:ReportViewer>
                <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="SimplebillsDSTableAdapters.BILLMASTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="a" SessionField="a" 
                            Type="Decimal" />
                        <asp:ControlParameter ControlID="txtVehNo" DefaultValue="0" Name="vnum" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDate" DefaultValue="1/1/1900" Name="date" 
                            PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>--%>
            </td>
        </tr>
    </table>
</asp:Content>
