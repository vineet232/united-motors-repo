<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="sparepartsdeliveryreportdatewise, App_Web_1ssuryoo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/SparepartsdeliveryReportDatewise.js" type="text/javascript"></script>
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
            <asp:HiddenField ID="hdnPrintPermission" ClientIDMode="Static" runat="server" />
            <table id="tabledata">
            </table>
            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Spare Parts Delivery Report
                    </div>
                    <div class="col-md-8" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Details</button>
                    </div>
                </div>
                <div >
                    
                  
                    
                            <div class="row col-md-12 form-group well well-sm">
                                 <div class="col-md-4" >
                                    <label for="modelname" class="labelclass">
                                        From Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtfromdate" maxlength="10" placeholder="From Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                <div class="col-md-4" >
                                    <label for="modelname" class="labelclass">
                                        To Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txttodate" maxlength="10" placeholder="To Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                <br />
                                     <button type="button" class="btn btn-danger" id="btnShowReport" name="btnShowReport"
                                onclick="ShowReportDatewise();">
                                Show Report</button>
                                </div>
                            </div>
                      
                   
                    <div class="col-md-12" align="center" style="background-color: White !important;">
                        <div class="c1">
                            <div id="Showoverlay" class="overlayWindow">
                                <h2>
                                    Loading .. Please wait</h2>
                            </div>
                           
                            <table id="tblRecords" class="table table-bordered  table-responsive">
                                <thead>
                                    <tr>
                                        <th>
                                            Sr#
                                        </th>
                                        <th>
                                            Invoice No
                                        </th>
                                        <th>
                                            Vehicle No
                                        </th>
                                        <th>
                                           Part Number
                                        </th>
                                        <th>
                                            Description
                                        </th>
                                        <th>
                                            Quantity
                                        </th>
                                        
                                        <th>
                                            Created / Updated By
                                        </th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
 </asp:Content>
