<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="SimpleEstimate, App_Web_gdx0w2k3" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="vabillimg/style-sheet.css" rel="stylesheet" type="text/css" />
    <script src="vabillimg/CalendarControl.js" type="text/javascript"></script>
    <link href="vabillimg/CalendarControl.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" >
    </asp:ScriptManager>

    <%--<script type="text/javascript" language="javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function EndRequestHandler(sender, args){
        if (args.get_error() != undefined) {
            alert(args.get_error().message);
            alert(args.get_error().message.substr(args.get_error().name.length + 2));
            args.set_errorHandled(true);
        }
    }
</script>--%>


   <%-- <asp:UpdatePanel runat="server" ID="updatePanel1">
        <ContentTemplate>--%>
        
      
    <table width="100%" class="table table-responsive">
        <tr class="well well-sm">
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
                            Date:
                            <asp:TextBox ID="txtDate" onfocus="showCalendarControl(this);" runat="server"></asp:TextBox>
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
            <td align="center">

             

                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                    InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
                    Width="100%" Height="800px">
                    <%-- <LocalReport ReportPath="SimpleEstimateRPT.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>--%>
                </rsweb:ReportViewer>
                <%--  <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="SimpleEstimateDSTableAdapters.ESTIMATEMASTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="SRNO" Type="Int32" />
                        <asp:Parameter Name="VNUM" Type="String" />
                        <asp:Parameter Name="VMAKE" Type="String" />
                        <asp:Parameter Name="VOWNER" Type="String" />
                        <asp:Parameter Name="VDATE" Type="DateTime" />
                        <asp:Parameter Name="PARTICULARS" Type="String" />
                        <asp:Parameter Name="PARTNO" Type="String" />
                        <asp:Parameter Name="QTY" Type="Int32" />
                        <asp:Parameter Name="AMOUNT" Type="Double" />
                        <asp:Parameter Name="TOTALAMOUNT" Type="Double" />
                        <asp:Parameter Name="labouramount" Type="Double" />
                        <asp:Parameter Name="Temp1" Type="String" />
                        <asp:Parameter Name="Temp2" Type="String" />
                        <asp:Parameter Name="Temp3" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="a" SessionField="a" 
                            Type="Decimal" />
                        <asp:ControlParameter ControlID="txtVehNo" DefaultValue="1" Name="vnum" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDate" DefaultValue="1/1/1900" Name="date" 
                            PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>--%>
            </td>
        </tr>
    </table>

      <%--</ContentTemplate>
      <Triggers>
        <asp:PostBackTrigger ControlID="btnShow" />
      </Triggers>
    </asp:UpdatePanel>--%>

    

</asp:Content>
