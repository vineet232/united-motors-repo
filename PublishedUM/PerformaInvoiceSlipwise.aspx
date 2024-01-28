<%@ page title="" language="C#" masterpagefile="~/VipinAutomobiles.master" autoeventwireup="true" inherits="PerformaInvoiceSlipwise, App_Web_gdx0w2k3" %>

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
                            Slip No.:
                            <asp:TextBox ID="txtSlipNo" runat="server"></asp:TextBox>
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
                    <LocalReport ReportPath="PerformaInvoiceSlipwiseReport.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="PerformaInviceReportSlipwiseTableAdapters.SlipInvoiceDetailsTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                        <asp:Parameter Name="VNUM" Type="String" />
                        <asp:Parameter Name="VOWNER" Type="String" />
                        <asp:Parameter Name="ContactNo" Type="String" />
                        <asp:Parameter Name="JobCardOpeningDate" Type="DateTime" />
                        <asp:Parameter Name="JobCardClosingDate" Type="DateTime" />
                        <asp:Parameter Name="SlipInvID" Type="Int32" />
                        <asp:Parameter Name="PARTICULARS" Type="String" />
                        <asp:Parameter Name="UOM" Type="String" />
                        <asp:Parameter Name="QTY" Type="Int32" />
                        <asp:Parameter Name="Rate" Type="Double" />
                        <asp:Parameter Name="TOTALAMOUNT" Type="Double" />
                        <asp:Parameter Name="EnteredBy" Type="String" />
                        <asp:Parameter Name="EnteredOn" Type="DateTime" />
                        <asp:Parameter Name="SlipNo" Type="Int32" />
                        <asp:Parameter Name="PaymentMethod" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtSlipNo" DefaultValue="0" Name="slipInvID" 
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

