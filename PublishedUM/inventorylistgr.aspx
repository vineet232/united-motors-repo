﻿<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="inventorylistgr, App_Web_y0qsyvj2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/GRInventoryListMaster.js" type="text/javascript"></script>
    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row col-md-12">
        <div class="col-md-4 topHeaderStyle" align="center">
            Inventory GR
        </div>
        <div class="col-md-4">
            <asp:Button ID="btnExporttoExcel" CssClass="btn btn-success" runat="server" Text="Export to Excel"
                OnClick="btnExporttoExcel_Click" />
        </div>
        <div class="col-md-4" style="display: none;">
            <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                Add New Entry</button>
        </div>
    </div>
    <div class="col-md-12 well well-sm" align="center" id="divUpload" runat="server"
        visible="false">
        <div class="col-md-4">
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </div>
        <div class="col-md-4">
            <asp:Button ID="btnUpload" Text="Upload" CssClass="btn btn-danger" OnClick="Upload"
                runat="server" />
        </div>
        <div class="col-md-4">
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        </div>
    </div>
    <div class="container">
        <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" style="padding-top: 70px; width: 60%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #00CACA;">
                        <button type="button" class="close" data-dismiss="modal">
                            ×</button>
                        <h4 class="modal-title" id="myModalLabel">
                            Entry Details
                        </h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="recordID" id="recordID" value="">
                        <input type="hidden" name="hdnoldOpBal" id="hdnoldOpBal" value="">
                        <form>
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <div class="row col-md-12">
                                    <div class="col-md-6">
                                        <label for="modelname" class="labelclass">
                                            Quantity:</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtQty" maxlength="30" placeholder="Qty."
                                                onkeypress="return /[0-9.-]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="display:none;">
                                        <label for="modelname" class="labelclass">
                                            Location:</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-home fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtLocation" maxlength="50" placeholder="Location" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="btnAdd" onclick="return AddRecord();">
                            Add</button>
                        <button type="button" class="btn btn-primary" id="btnUpdate" style="display: none;"
                            onclick="UpdateRecord();">
                            Update</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
            <div>
                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div class="c1">
                        <div id="Showoverlay" class="overlayWindow">
                            <br />
                            <br />
                            <i class="fa fa-spinner fa-pulse fa-3x fa-fw" style="font-size: 72px; color: black;">
                            </i>
                            <br />
                            <h2>
                                Loading .. Please wait</h2>
                        </div>
                    </div>
                    <table id="tblRecords" class="table table-bordered  table-responsive">
                        <thead>
                            <tr>
                                <th>
                                    Sr#
                                </th>
                                <th>
                                    Part Number
                                </th>
                                <th>
                                    Description
                                </th>
                               
                                <th>
                                    Location
                                </th>
                                <th>
                                    Last Received
                                </th>
                                <th>
                                    Last Issued
                                </th>
                                <th>
                                    MRP
                                </th>
                                <th>
                                    Purchase Quantity
                                </th>
                                <th>
                                   Available Quantity
                                </th>
                                <th>
                                    Days
                                </th>
                                <th>
                                    Created / Updated by
                                </th>
                                <th>
                                    Edit
                                </th>
                                <th>
                                    Delete
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
