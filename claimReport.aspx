<%@ page title="" language="C#" masterpagefile="~/VipinAutomobiles.master" autoeventwireup="true" inherits="claimReport, App_Web_xgwfkdro" %>

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
                    Vehicle No.: <asp:TextBox ID="txtVehNo"  runat="server"></asp:TextBox>
                    </td>
                     <td>
                    Date: <asp:TextBox ID="txtDt"  runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnShow" runat="server" OnClick="ShowReport" Text="Show Report.." CssClass="button" />
                    </td>
                </tr>
            </table>
        </td>

    </tr>
    <tr>
        <td>
           
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="798px">
                <LocalReport ReportPath="ClaimDetailsRPT.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="ClaimDetailsTableAdapters.CLAIMMASTableAdapter">
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
                    <asp:Parameter Name="PermitNo" Type="String" />
                    <asp:Parameter Name="Valid" Type="String" />
                    <asp:Parameter Name="FitnessValid" Type="String" />
                    <asp:Parameter Name="Temp1" Type="String" />
                    <asp:Parameter Name="Temp2" Type="String" />
                    <asp:Parameter Name="Temp3" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtVehNo" Name="vehNo" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtDt" DefaultValue="" Name="date" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>

</asp:Content>

