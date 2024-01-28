<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="saleTransactionDetailsFitnessCertificate, App_Web_1ssuryoo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/FitnessSaleTransactionDetails.js" type="text/javascript"></script>
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
            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Fitness Sales 
                    </div>
                    <%--<div class="col-md-8">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Sale Transaction</button>
                    </div>--%>
                </div>
                <div class="modal-body">
                    <br />
                    <form2>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                            <div class="form-group">
                                <input type="hidden" name="recordID" id="recordID" value="" />
                                <input type="hidden" name="recordOldInvDt" id="recordOldInvDt" value="" />

                                 <input type="hidden" name="recordOldPmentACTypID" id="recordOldPmentACTypID" value="" />
                                             <input type="hidden" name="recordOldPaymentAccountType" id="recordOldPaymentAccountType" value="" />

                                <input type="hidden" name="recordOldCustID" id="recordOldCustID" value="" />
                                <input type="hidden" name="recordOldCustomerName" id="recordOldCustomerName" value="" />
                                <input type="hidden" name="recordOldInvTypID" id="recordOldInvTypID" value="" />
                                <input type="hidden" name="recordOldInvoiceType" id="recordOldInvoiceType" value="" />
                                <input type="hidden" name="recordOldInvoiceNo" id="recordOldInvoiceNo" value="" />
                                <input type="hidden" name="recordOldPayModeID" id="recordOldPayModeID" value="" />
                                <input type="hidden" name="recordOldPaymentMode" id="recordOldPaymentMode" value="" />
                                <input type="hidden" name="recordOldAmount" id="recordOldAmount" value="" />
                                <input type="hidden" name="recordOldDiscount" id="recordOldDiscount" value="" />
                                <input type="hidden" name="recordOldVehChasisNo" id="recordOldVehChasisNo" value="" />

                                  <input type="hidden" name="recordFitnessNo" id="recordFitnessNo" value="" />

                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Date (MM/DD/YYYY) :</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtInvoiceDate" maxlength="10" placeholder="Invoice Date"
                                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Select Mode :</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <select id="ddlAccountType" class="form-control" onchange="ddlAccountType_SelectedIndexChanged()">
                                                <option value="3" selected="selected">Customers</option>
                                                <option value="1">Vendors</option>
                                                <option value="2">Employees</option>
                                               
                                               <%-- <option value="4">Banks</option>--%>
                                                <%-- <option value="5" >Credit</option>--%>
                                                <option value="5">General Ledger</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                       <label for="paymentto" id="paymentto" class="labelclass">
                                                  Customer Name :</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <select id="ddlCustomers" class="form-control">
                                                <option value="0">Please Select</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Invoice Type :</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <select id="ddlInvoiceType" class="form-control" onchange="ddlInvoiceType_Change()">
                                                <%--<option value="0" selected>Please Select</option>--%>
                                                <option value="7">Certificate of Fitness </option>
                                                
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Receipt Number :</label>
                                        <br />
                                        <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" readonly id="txtInvoiceNo" maxlength="25" placeholder="Receipt Number"
                                                onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Payment Mode :</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <select id="ddlPaymentMode" class="form-control">
                                                <option value="0">Please Select</option>
                                                <option value="1">Cash</option>
                                                <option value="2">Credit</option>
                                                <%-- <option value="5">Bank Transfer</option>--%>
                                                <%--<option value="3">DD</option>
                                                            <option value="4">Cheque</option>
                                                --%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                            Amount :</label>
                                      
                                        <br />
                                        <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtAmount" maxlength="15" placeholder="Amount"
                                                onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                        </div>
                                    </div>
                                    <div class="col-md-3" style="display:none;">
                                        Discount :</label>
                                        <br />
                                        
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtDiscount" maxlength="10" placeholder="Discount"
                                                onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                        </div>
                                    </div>
                                     <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Vehicle Number & Chassis Number :</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control " id="txtVehicleChasisNo" maxlength="40"
                                                placeholder="Vehicle Number & Chassis Number" onkeypress="return /[0-9a-zA-Z]/i.test(event.key)"
                                                ondrop="return false;" onpaste="return false;" />
                                        </div>
                                    </div>
                                    <hr />
                                     <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Customer Name :</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtCustomerName" maxlength="40"
                                                placeholder="Customer Name" onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)"
                                                ondrop="return false;" onpaste="return false;" />
                                        </div>
                                    </div>
                                     <div class="col-md-3">
                                                    <label for="modelname" class="labelclass">
                                                        Mobile Number :</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtMobileNo" maxlength="10" placeholder="Mobile Number"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                     <div class="col-md-3">
                                                    <label for="modelname" class="labelclass">
                                                        Model :</label>
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
                                           Insurance Due Date :</label>
                                        <br />
                                         <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtinsduedate" maxlength="10" placeholder="Insurance Due Date"
                                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                        </div>
                                    </div>
                                     <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Fitness Due Date (MM/DD/YYYY) :</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtfitnessduedate" maxlength="10" placeholder="Fitness Due Date"
                                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                        </div>
                                    </div>
                                    
                                </div>
                                
                            </div>
                        </div>
                        <div align="center" style="background-color: #F7F7F7;">
                            <button type="button" class="btn btn-danger" id="btnAdd" onclick="return AddRecord();">
                                Add</button>
                            <button type="button" class="btn btn-primary" id="btnUpdate" style="display: none;"
                                onclick="UpdateRecord();">
                                Update</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" id="btnReset" onclick="clearTextBox();">
                                Reset
                            </button>

                             &nbsp;&nbsp;
                              <asp:LinkButton id="lnkExcel" runat="server" OnClick="lnkExcel_Click" > <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>

                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>--%>
                        </div>
                    </div>
                    </form2>
                </div>
                <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel"
                    aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" style="padding-top: 40px; width: 95%;">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00CACA;">
                                <button type="button" class="close" data-dismiss="modal">
                                    ×</button>
                                <h4 class="modal-title" id="myModalLabel">
                                    Upload PDF File
                                </h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                <div class="panel panel-primary">
                                    <div class="panel-body">
                                        <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <br />
                                                <div class="col-md-9">
                                                    <input type="file" id="postedFile" name="postedFile" />
                                                    <asp:HiddenField ID="hiddenFileName" runat="server" ClientIDMode="Static" />
                                                    <span id="lblMessage" style="color: Green"></span>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="button" id="btnUpload" value="Upload" onclick="btnUploadFile();" />
                                                    <progress id="fileProgress" style="display: none"></progress>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                                <table id="tblUploadedFiles" class="table table-bordered  table-responsive">
                                    <%--class="table table-bordered  table-responsive"--%>
                                    <thead>
                                        <tr>
                                            <th>
                                                Sr#
                                            </th>
                                            <th>
                                                File
                                            </th>
                                            <th>
                                                Last Updated
                                            </th>
                                            <%--<th>
                                                        Download
                                                    </th>
                                                    <th>
                                                        Action
                                                    </th>--%>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <%--   for searching........--%>
                    <div align="center" class="row well well-sm">
                        <div class="col-md-2">
                            <b>Search From: </b>
                        </div>
                        <div class="col-md-3">
                            <select id="ddlSearchField" class="form-control">
                                <option value="0">Please Select</option>
                                <option value="invoicedt">Invoice Date</option>
                                <option value="invoiceno">Receipt Number</option>
                                <option value="amount">Amount</option>
                                <option value="vehchasisno">Vehicle Number & Chassis Number</option>
                                <%--<option value="vehchasisno">Chassis Number</option>--%>
                                <option value="newmobileno">Mobile Number</option>
                                <option value="newfitnessdt">Fitness Due Date</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="searchValue" placeholder="Search Value" class="form-control" />
                        </div>

                         <div class="col-md-2">
                            <input type="text" id="txtSearchtoDate" placeholder="To Date" class="form-control" />
                        </div>

                        <div class="col-md-3">
                            <button type="button" class="btn btn-primary" id="btnSearchbyFieldName" onclick="BindDataTable();">
                                Search
                            </button>
                            &nbsp;&nbsp;
                            <button type="button" class="btn btn-danger" id="btnResetSearch" onclick="btnResetSearch_Click();">
                                Reset
                            </button>
                        </div>
                    </div>
                    <%-- end  for searching........--%>
                    <div class="c1">
                        <div id="Showoverlay" class="overlayWindow">
                            <h2>
                                Loading .. Please wait</h2>
                        </div>
                        <table id="tblRecords" class="table table-bordered  table-responsive">
                            <thead>
                                <tr>
                                    <th>
                                        Sr. Number
                                    </th>
                                    <%-- <th>
                                        Account Type
                                    </th>--%>
                                    <th>
                                        Invoice Date
                                    </th>
                                    <th>
                                        Mode
                                    </th>
                                    <th>
                                        Receipt Number
                                    </th>
                                    <th>
                                        Customer Name
                                    </th>
                                    <th>
                                        Invoice Type
                                    </th>
                                    <th>
                                        Payment Mode
                                    </th>
                                    <th>
                                        Amount
                                    </th>
                                    <th>
                                        Discount
                                    </th>
                                    <th>
                                       Vehicle Number & Chassis Number
                                    </th>
                                  
                                    <th>
                                        View Details
                                    </th>
                                    <th>
                                        Upload PDF
                                    </th>
                                    <th>
                                        Edit
                                    </th>
                                    <th>
                                        Delete
                                    </th>
                                     <th>
                                        Send File
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
            <script>
                $(document).ready(function () {

                    // Initialize select2
                    $("#ddlCustomers").select2();
                });
            </script>
            <div class="container">
                <div class="modal fade" id="myDisplayModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                    aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" style="padding-top: 30px; width: 80%;">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00CACA;">
                                <button type="button" class="close" data-dismiss="modal">
                                    ×</button>
                                <h4 class="modal-title" id="H2">
                                    Show Fitness Details
                                </h4>
                            </div>
                            <br />
                            <div class="panel-body">
                                <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Date (MM/dd/yyyy):</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtInvoiceDateDisplay" maxlength="10"
                                                    placeholder="Invoice Date" onkeydown="return false;" ondrop="return false;" onpaste="return false;"
                                                    autocomplete="off" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Select Mode:</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <select id="ddlAccountTypeDisplay" class="form-control" disabled="disabled">
                                                    <option value="3" selected="selected">Customers</option>
                                                    <option value="1">Vendors</option>
                                                    <option value="2">Employees</option>
                                                    <%-- <option value="4">Banks</option>--%>
                                                    <%-- <option value="5" >Credit</option>--%>
                                                    <option value="5">General Ledger</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="paymentto" id="paymenttoDisplay" class="labelclass">
                                                Customer Name :</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <select id="ddlCustomersDisplay" class="form-control" disabled="disabled">
                                                    <option value="0">Please Select</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Invoice Type:</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <select id="ddlInvoiceTypeDisplay" class="form-control" disabled="disabled">
                                                    <%--<option value="0" selected>Please Select</option>--%>
                                                    <option value="7">Certificate of Fitness </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Receipt No:</label>
                                            <br />
                                            <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" readonly id="txtInvoiceNoDisplay" maxlength="25"
                                                    placeholder="Invoice No" onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)"
                                                    ondrop="return false;" onpaste="return false;" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Payment Mode :</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <select id="ddlPaymentModeDisplay" class="form-control" disabled="disabled">
                                                    <option value="0">Please Select</option>
                                                    <option value="1">Cash</option>
                                                    <option value="2">Credit</option>
                                                    <%-- <option value="5">Bank Transfer</option>--%>
                                                    <%--<option value="3">DD</option>
                                                            <option value="4">Cheque</option>
                                                    --%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            Amount:</label>
                                            <br />
                                            <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtAmountDisplay" maxlength="15" placeholder="Amount"
                                                    onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;"
                                                    disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-3" style="display: none;">
                                            Discount:</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtDiscountDisplay" maxlength="10" placeholder="Discount"
                                                    onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;"
                                                    disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Vehicle/Chasis No:</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control text-uppercase" id="txtVehicleChasisNoDisplay"
                                                    maxlength="40" placeholder="Veh/Chasis No" onkeypress="return /[0-9a-zA-Z]/i.test(event.key)"
                                                    ondrop="return false;" onpaste="return false;" disabled="disabled" />
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Customer Name:</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtCustomerNameDisplay" maxlength="40"
                                                    placeholder="Customer Name" onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)"
                                                    ondrop="return false;" onpaste="return false;" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Mobile No:</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtMobileNoDisplay" maxlength="10" placeholder="Mobile No"
                                                    onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;"
                                                    disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Model:</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <select id="ddlModelDisplay" style="width: 100%;" class="form-control" disabled="disabled">
                                                    <option value="0">Please Select</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Insurance Due Date (MM/dd/yyyy):</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtinsduedateDisplay" maxlength="10"
                                                    placeholder="Insurance Due Date" onkeydown="return false;" ondrop="return false;"
                                                    onpaste="return false;" autocomplete="off" disabled="disabled" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="modelname" class="labelclass">
                                                Fitness Due Date (MM/dd/yyyy):</label>
                                            <br />
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtfitnessduedateDisplay" maxlength="10"
                                                    placeholder="Fitness Due Date" onkeydown="return false;" ondrop="return false;"
                                                    onpaste="return false;" autocomplete="off" disabled="disabled" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
         <Triggers >
            <asp:PostBackTrigger ControlID="lnkExcel" />
             <%-- <asp:PostBackTrigger ControlID="lnkPdf" />--%>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
