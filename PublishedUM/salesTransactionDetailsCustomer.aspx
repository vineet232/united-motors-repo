<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="salesTransactionDetailsCustomer, App_Web_h5d101sg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/CustSaleTransactionDetails.js" type="text/javascript"></script>
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
                        Workshop Sale
                    </div>
                    <%--<div class="col-md-8">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Sale Transaction</button>
                    </div>--%>
                </div>
                <div class="modal-body">
                    <br />
                    <form>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                            <div class="form-group">
                                <input type="hidden" name="recordID" id="recordID" value="" />
                                <input type="hidden" name="recordOldInvDt" id="recordOldInvDt" value="" />
                                <input type="hidden" name="recordOldPmentACTypID" id="recordOldPmentACTypID" value="" />
                                <input type="hidden" name="recordOldPaymentAccountType" id="recordOldPaymentAccountType"
                                    value="" />
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
                                <input type="hidden" name="hdnSlipNofromSlipMaster" id="hdnSlipNofromSlipMaster" value="" />
                                 <input type="hidden" name="hdnSaleTrnTypeID" id="hdnSaleTrnTypeID" value="" />
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Date (MM/DD/YYYY):</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtInvoiceDate" name="txtInvoiceDate"
                                                maxlength="10" placeholder="Invoice Date" onkeydown="return false;" ondrop="return false;"
                                                onpaste="return false;" autocomplete="off" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Select Mode:</label>
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
                                            Invoice Type:</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <select id="ddlInvoiceType" class="form-control" onchange="ddlInvoiceType_Change()">
                                                <option value="0" selected>Please Select</option>
                                                <option value="1">Estimate</option>
                                                <option value="2">Siebel Tax Invoice</option>
                                                <option value="3">SAP Tax Invoice</option>
                                                <option value="4">Tally Tax Invoice </option>
                                                <option value="5">Insurance Tax Invoice</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Invoice/Slip Number:</label>
                                        <br />
                                        <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtInvoiceNo" maxlength="25" placeholder="Invoice Number"
                                                ondrop="return false;" onpaste="return false;" />
                                            <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)"--%>

                                           <%-- <input type="text" class="form-control" id="txtinvnoforslip" style="display:none;" maxlength="25" placeholder="Invoice Number"
                                                ondrop="return false;" onpaste="return false;" />--%>

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
                                            Amount:</label>
                                        <br />
                                        <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtAmount" maxlength="15" placeholder="Amount"
                                                onkeypress="return /[0-9 -.]/i.test(event.key)" onkeyup="myFunc(this);" ondrop="return false;"
                                                onpaste="return false;" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Discount:</label>
                                        <br />
                                        <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtDiscount" value="0" maxlength="10"
                                                placeholder="Discount" onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;"
                                                onpaste="return false;" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="modelname" class="labelclass">
                                            Vehicle/Chassis Number:</label>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <input type="text" class="form-control" id="txtVehicleChasisNo" maxlength="40" placeholder="Vehicle/Chassis Number"
                                                onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" />
                                            <%--ondrop="return false;" onpaste="return false;"--%>
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
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-primary" id="btnSearch" onclick="BindDataTable();">
                                Search
                            </button>
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="lnkExcel" runat="server" OnClick="lnkExcel_Click"> <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <%--   for searching........--%>
                    <div align="center" class="row well well-sm">
                        <div class="col-md-3">
                            <b>Search by: </b>
                        </div>
                        <div class="col-md-3">
                            <select id="ddlSearchField" class="form-control">
                                <option value="0">Please Select</option>
                                <option value="invoiceno">Invoice Number</option>
                                <option value="amount">Amount</option>
                                <option value="vehchasisno">Vehicle/Chassis Number</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <input type="text" id="searchValue" placeholder="Search Value" class="form-control" />
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
                                    <%--  <th>
                                        ID
                                    </th>--%>
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
                                        Invoice Number
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
                                        Vehicle / Chasis Number
                                    </th>
                                    <th>
                                        Created Updated By
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
                            <tfoot>
                                <%-- <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
                  <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
                  <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
                <th>Salary</th>
            </tr>--%>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {

                    // Initialize select2
                    $("#ddlCustomers").select2();

                    //                     // Read selected option
                    //                     $('#but_read').click(function () {
                    //                         var username = $('#selUser option:selected').text();
                    //                         var userid = $('#selUser').val();

                    //                         $('#result').html("id : " + userid + ", name : " + username);
                    //                     });
                });
            </script>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="lnkExcel" />
            <%-- <asp:PostBackTrigger ControlID="lnkPdf" />--%>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
