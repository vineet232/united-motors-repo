<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="PrintbyOpenJobCard, App_Web_xgwfkdro" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="100%" class="table table-responsive">
        <tr>
            <td>
                <table width="80%">
                    <tr>
                        <td>
                            Job Card No.:
                            <asp:TextBox ID="txtJobCardNo" runat="server"></asp:TextBox>
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
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                    InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
                    Width="100%" Height="800px">
                    <LocalReport ReportPath="OpenJobCardReport.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OpenJobCardDataSetTableAdapters.SlipInvoiceMasTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                        <asp:Parameter Name="VNUM" Type="String" />
                        <asp:Parameter Name="VOWNER" Type="String" />
                        <asp:Parameter Name="ContactNo" Type="String" />
                        <asp:Parameter Name="JobCardOpeningDate" Type="DateTime" />
                        <asp:Parameter Name="JobCardClosingDate" Type="DateTime" />
                        <asp:Parameter Name="EnteredBy" Type="String" />
                        <asp:Parameter Name="EnteredOn" Type="DateTime" />
                        <asp:Parameter Name="BillCreated" Type="Byte" />
                        <asp:Parameter Name="jobCardNo" Type="Int32" />
                        <asp:Parameter Name="makenmodel" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtJobCardNo" Name="jobCardNo" PropertyName="Text"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
