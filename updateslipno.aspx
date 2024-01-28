<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="updateslipno, App_Web_gdx0w2k3" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

   

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/SlipMaster.js" type="text/javascript"></script>
     <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="showProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modalSpinner">
                <div class="center">
                    <img alt="" src="img/4.gif" />
                    <br />
                    Please wait.....
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

        <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                       Update Slip No
                       
                    </div>
                    
                    
                </div>

                <div class="row col-md-12">
                    <div class="col-md-3">&nbsp;</div>
                     <div class="col-md-3">
                     <asp:RadioButton ID="rdUnited" runat="server" GroupName="companyname" Text="United Motors" />
                     </div>
                      <div class="col-md-3">
                     <asp:RadioButton ID="rdVipin" runat="server" GroupName="companyname" Text="Vipin Automobiles" />
                     </div>
                      <div class="col-md-3">&nbsp;</div>


                      <div class="col-md-6 well well-sm">
                        Old Slip No:
                        <br />
                        <asp:TextBox ID="txtOldSlipNo" runat="server" CssClass="form-control" placeholder="Old Slip No" MaxLength="50"></asp:TextBox>
                      </div>

                      <div class="col-md-6 well well-sm">
                        New Slip No:
                        <br />
                        <asp:TextBox ID="txtNewSlipNo" runat="server" CssClass="form-control" placeholder="New Slip No" MaxLength="50"></asp:TextBox>
                      </div>

                      <div class="col-md-12" align="center">
                        <asp:Button ID="btnUpdateSlipNo" runat="server" Text="Update Slip No" CssClass="btn btn-primary" OnClientClick="return confirm('Are you sure you want to change slip no!!')"
                         OnClick="btnUpdateSlipNo_Click" />
                      </div>
                </div>
                

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnUpdateSlipNo" />
                </Triggers>
                </asp:UpdatePanel>

                </asp:Content>