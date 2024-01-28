<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="AllEnteriesSaleTrnCustomer, App_Web_y0qsyvj2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/allenteriescustomers.js" type="text/javascript"></script>

    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
   <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
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
                       All Customers Sales List
                    </div>
                    
                </div>
            <div>
              
              
                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div class="c1">
                        <div id="Showoverlay" class="overlayWindow">
                           
                                <br /> <br />
                                <i class="fa fa-spinner fa-pulse fa-3x fa-fw" style="font-size:72px;color:black;"></i>
                                <br />
                                 <h2>
                                Loading .. Please wait</h2>
                        </div>
                         <table id="tblRecords" class="table table-bordered  table-responsive">
                            <thead>
                                <tr>
                                   <%-- <th>
                                        Sr#
                                    </th>--%>
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        Payment Transaction / Date
                                       
                                    </th>
                                    <th>
                                        Account Type / Customer Name
                                       
                                    </th>
                                    <th>
                                        Invoice Type / Invoice No / Mode / Amount / Discount / Veh No
                                    </th>
                                   <th>
                                       Old Inv. Dt / Cust. Name / Invoice Type / Invoice No
                                    </th>
                                     <th>
                                        Old Pay. Mode / Amount / Discount / Veh No
                                    </th>
                                     <th>
                                        Entered Details
                                    </th>
                                     <th>
                                        Updated Details
                                    </th>
                                     <th>
                                        Deleted Details
                                    </th>
                                   <%-- <th>
                                        Edit
                                    </th>
                                    <th>
                                        Delete
                                    </th>--%>
                                </tr>
                            </thead>

                            <tbody>
                            </tbody>

                          <%--  <tfoot class="show-column-footer">
   <tr>
    <th colspan="4"><a class="show-column" href="#">Some columns hidden - click to show all</a></th>
  </tr>
</tfoot>--%>
                        </table>

                    </div>
                </div>
            </div>

           
             <script src="datatableCSSJS2/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/jszip.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/pdfmake.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/vfs_fonts.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/buttons.html5.min.js" type="text/javascript"></script>
    <link href="datatableCSSJS2/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="datatableCSSJS2/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

