<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="vehicleTracker, App_Web_1ssuryoo" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/VehicleTracker.js" type="text/javascript"></script>
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
                        Vehicle Tracker
                    </div>
                    <div class="col-md-8" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Details</button>
                    </div>
                </div>
                <div class="modal-body">
                    <br />
                    <form>
                    <input type="hidden" name="recordID" id="recordID" value="">
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="form-group row">
                                <%--   <div class="col-md-4" style="display:none;">
                                    <label for="modelname" class="labelclass">
                                       Vehicle No:</label>
                                    <br />
                                    
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtVehNo" maxlength="50" placeholder="Vehicle No"
                                            autocomplete="off" readonly />
                                       
                                    </div>
                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                </div>
                               <div class="col-md-4" style="display:none;">
                                    <label for="modelname" class="labelclass">
                                        Challan Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtDate" maxlength="10" placeholder="Slip Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>

                                 <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Invoice No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtInvoiceNo" maxlength="50" placeholder="Invoice No" />
                                    </div>
                                </div>--%>
                                <%-- <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Customer Name:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtCustomerName" maxlength="100" placeholder="Customer Name" />
                                    </div>
                                </div>--%>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Vehicle No:</label>
                                    <br />
                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control text-uppercase" id="txtVehChasisNo" maxlength="25" placeholder="Veh./Chasis No"
                                            onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                               
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Company:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlCompany" class="form-control">
                                            <option value="0">Please Select</option>
                                            <option value="1">United Motors</option>
                                            <option value="2">Vipin Automobiles</option>
                                        </select>
                                    </div>
                                </div>
                              
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Service Advisor:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlServiceAdvisor" class="form-control" style="width: 100%;">
                                            <option value="0">Please Select</option>
                                        </select>
                                    </div>
                                </div>
                                 <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Technician:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlTechnician" class="form-control" style="width: 100%;">
                                            <option value="0">Please Select</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                               

                                 <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Gate Pass No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtGatePassNo" maxlength="50" placeholder="Gate Pass No"  disabled="disabled"   />
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Status:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlStatus" class="form-control" onchange="ddlStatus_SelectedIndexChanged()">
                                            <%-- <option value="0">Please Select</option>--%>
                                            <option value="1">Open</option>
                                            <option value="2">Closed</option>
                                        </select>
                                    </div>
                                </div>

                                
                                 <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Contact No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-mobile fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtMobileNo" maxlength="10" placeholder="Mobile No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>

                                <div class="col-md-3" style="display:none;">
                                    <label for="modelname" class="labelclass">
                                        Model:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                        </span>
                                         <select id="ddlModel" style="width:100%;" class="form-control">
                                                            <option value="0">Please Select</option>
                                                        </select>
                                    </div>
                                </div>
                                
                               <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Current K.M.:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtkms" maxlength="10" onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;"  placeholder="K.M"    />
                                    </div>
                                </div>
                                 </div>
                                <div class="row">

                                 <div class="col-md-9">
                                    <label for="modelname" class="labelclass">
                                        Remarks:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtRemarks" maxlength="200" placeholder="Remarks"    />
                                    </div>
                                </div>
                                </div>
                           
                    </div>
                    <div align="center" style="background-color: #F7F7F7;">
                        <button type="button" class="btn btn-danger" id="btnAddNewSlipMaster" name="btnAddNewSlipMaster"
                            onclick="return AddRecord();">
                            Add</button>
                        <button type="button" class="btn btn-primary" id="btnUpdateSlipMaster" name="btnUpdateSlipMaster"
                            style="display: none;" onclick="UpdateRecord();">
                            Update</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-success" id="btnReset" onclick="clearTextBox();">
                            Reset
                        </button>
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>--%>
                    </div>
                </div>
                </form>
            </div>
            <asp:LinkButton ID="lnkExporttoExcel" runat="server" Text="." ForeColor="White" OnClick="ExportToExcel_Click"></asp:LinkButton>
            <asp:LinkButton ID="lnkExporttoPDF" runat="server" Text="." ForeColor="White" OnClick="ExportToPdf_Click"></asp:LinkButton>
            <%--<input type="hidden" runat="server" name="printrecordID" id="printrecordID" value="">--%>
            <asp:HiddenField ID="printrecordID" ClientIDMode="Static" runat="server" />
            <asp:HiddenField ID="hdnOldQty" ClientIDMode="Static" runat="server" />
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
                                <th nowrap>
                                    Vehicle No <hr style="margin-top:0px !important; margin-bottom:0px !important;" /> Model <hr style="margin-top:0px !important; margin-bottom:0px !important;" /> K.M
                                </th>
                                 <th>
                                   Customer Name / Contact No
                                </th>
                                <th>
                                    Company
                                </th>
                                <th>
                                    Service Advisor
                                </th>
                                <th>
                                    Technician
                                </th>
                                <th>
                                    HRS / Days
                                </th>
                                <th>
                                    Status
                                </th>
                                <th>
                                    Gate Pass No
                                </th>
                                 <th>
                                    Remarks
                                </th>
                                <th>
                                    Created / Updated By
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
            <br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server">
            </rsweb:ReportViewer>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="lnkExporttoExcel" />
            <asp:PostBackTrigger ControlID="lnkExporttoPDF" />
        </Triggers>
    </asp:UpdatePanel>
    <script language="javascript">
        function PrintPDF(id) {
            $("#printrecordID").val(id);
            /////document.getElementById("<%=lnkExporttoExcel.ClientID %>").click();
            document.getElementById("<%=lnkExporttoPDF.ClientID %>").click();

        }
    </script>
</asp:Content>
