<%@ page title="" language="C#" masterpagefile="~/VipinAutomobiles.master" autoeventwireup="true" inherits="slipinvoicebyvehicleno, App_Web_xgwfkdro" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="100%">
        <tr>
            <td>
                <table width="80%">
                    <tr>
                        <td>
                            Vehicle No.:
                            <asp:TextBox ID="txtvehNo" runat="server"></asp:TextBox>
                        </td>
                       
                        <td>
                            <asp:Button ID="btnShow" runat="server" OnClick="ShowReport" Text="Show Report.."
                                CssClass="button" />
                        </td>
                    </tr>
                     <tr>
            <td align="center">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </td>
        </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                    Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1000px" Height="600px">
                    <LocalReport ReportPath="slipinvoicebyvehiclenoReport.rdlc" >
                        <DataSources>
                          
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                          
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
               
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="InvoicebyVehicleNoDataSetTableAdapters.SlipInvoiceDetailsTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtvehNo" Name="vnum" PropertyName="Text" 
                            Type="String" DefaultValue="0" />
                    </SelectParameters>
                </asp:ObjectDataSource>
               
            </td>
        </tr>
    </table>


</asp:Content>

