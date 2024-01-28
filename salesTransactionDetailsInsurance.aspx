<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="salesTransactionDetails, App_Web_y0qsyvj2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/InsSaleTransactionDetails.js" type="text/javascript"></script>

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
                        Insurance Sale Transactions
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
                                <%--<div class="col-md-12">
                                                <label for="modelname" class="labelclass">
                                                      Account Type :</label>
                                                    <br />
                                                   
                                                   
                                                     <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i></span>
                                                           <select id="ddlAccountType" class="form-control" onchange="ddlAccountType_OnChange()">
                                                            <option value="0" selected>Please Select</option>
                                                        <option value="1"> Insurance </option>
                                                        <option value="2"> Invoice </option>
                                                        <option value="3"> Labour </option>
                                                        <option value="4"> Slip </option>
                                                        <option value="5"> Finance </option>
                                                        </select>
                                                        </div>

                                             </div>--%>
                                <input type="hidden" name="recordID" id="recordID" value="">
                                <input type="hidden" name="recordOldVehNo" id="recordOldVehNo" value="">
                                <input type="hidden" name="recordOldSalesExID" id="recordOldSalesExID" value="">
                                <input type="hidden" name="recordOldSalesExName" id="recordOldSalesExName" value="">
                                <input type="hidden" name="recordOldVenID" id="recordOldVenID" value="">
                                <input type="hidden" name="recordOldVenName" id="recordOldVenName" value="">
                                <input type="hidden" name="recordOldVenPaymentModeID" id="recordOldVenPaymentModeID"
                                    value="">
                                <input type="hidden" name="recordOldVendorPaymentMode" id="recordOldVendorPaymentMode"
                                    value="">
                                <input type="hidden" name="recordOldVenAmt" id="recordOldVenAmt" value="">
                                <input type="hidden" name="recordOldPayoutID" id="recordOldPayoutID" value="">
                                <input type="hidden" name="recordOldPayoutName" id="recordOldPayoutName" value="">
                                <input type="hidden" name="recordOldPayoutPaymentModeID" id="recordOldPayoutPaymentModeID"
                                    value="">
                                <input type="hidden" name="recordPayoutPaymentModeOld" id="recordPayoutPaymentModeOld"
                                    value="">
                                <input type="hidden" name="recordOldPayoutAmt" id="recordOldPayoutAmt" value="">
                                <input type="hidden" name="recordOldCustID" id="recordOldCustID" value="">
                                <input type="hidden" name="recordOldCustName" id="recordOldCustName" value="">
                                <input type="hidden" name="recordOldCustPaymentModeID" id="recordOldCustPaymentModeID"
                                    value="">
                                <input type="hidden" name="recordCustPaymentModeOld" id="recordCustPaymentModeOld"
                                    value="">
                                <input type="hidden" name="recordOldCustAmt" id="recordOldCustAmt" value="">
                                <input type="hidden" name="recordCustoldBnkID" id="recordCustoldBnkID" value="">
                                <input type="hidden" name="recordCustoldBankName" id="recordCustoldBankName" value="">
                                <input type="hidden" name="recordSaleTrnTypeID" id="recordSaleTrnTypeID" value="">
                                <input type="hidden" name="recordpayoutaccounttypeid" id="recordpayoutaccounttypeid"
                                    value="">
                                <input type="hidden" name="recordpayoutactypename" id="recordpayoutactypename" value="">
                                <input type="hidden" name="recordcustaccounttypeid" id="recordcustaccounttypeid"
                                    value="">
                                <input type="hidden" name="recordcustactypename" id="recordcustactypename" value="">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <div class="col-md-6">
                                                <label for="modelname" class="labelclass">
                                                    Vehicle/Chasis No:</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control text-uppercase" id="txtVehicleChasisNo" maxlength="40"
                                                        placeholder="Veh/Chasis No" onkeypress="return /[0-9a-zA-Z]/i.test(event.key)"
                                                        ondrop="return false;" onpaste="return false;" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="modelname" class="labelclass">
                                                    Sales Executive :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <select id="ddlSalesExecutive" class="form-control">
                                                        <option value="0">Please Select</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Vendor Name :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <select id="ddlVendors" class="form-control">
                                                        <option value="0">Please Select</option>
                                                    </select>
                                                </div>
                                                <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Payout Type:</label>
                                                <br />
                                                <select id="ddlPayoutAccountType" class="form-control" onchange="ddlPayoutAccountType_SelectedIndexChanged()">
                                                    <option value="3" selected="selected">Customers</option>
                                                    <option value="1">Vendors</option>
                                                    <option value="2">Employees</option>
                                                    <%--  <option value="4">Banks</option>
                                            <option value="5">General Ledger</option>--%>
                                                </select>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Customer Type:</label>
                                                <br />
                                                <select id="ddlCustomerAccountType" class="form-control" onchange="ddlCustAccountType_SelectedIndexChanged()">
                                                    <option value="3" selected="selected">Customers</option>
                                                    <option value="1">Vendors</option>
                                                    <option value="2">Employees</option>
                                                    <%--  <option value="4">Banks</option>
                                            <option value="5">General Ledger</option>--%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <div class="col-md-12">
                                                <label for="modelname" class="labelclass">
                                                    Invoice No:</label>
                                                <br />
                                                <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtInvoiceNo" maxlength="25" placeholder="Invoice No"
                                                        onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" readonly ondrop="return false;"
                                                        onpaste="return false;" />
                                                </div>
                                            </div>
                                            <%-- <div class="col-md-6">
                                                        <label for="modelname" class="labelclass">
                                                     Discount:</label>
                                                    <br />
                                                    
                                                     <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDiscount" maxlength="25" placeholder="Discount"
                                                            onkeypress="return /[0-9 ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                    </div>--%>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="col-md-4">
                                                &nbsp;</div>
                                            <div class="col-md-4">
                                                <label for="payoutactype" id="paymentto" class="labelclass">
                                                    Payout :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <select id="ddlPayouts" class="form-control">
                                                        <option value="0">Please Select</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="custactype" id="Label1" class="labelclass">
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
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Invoice Date (MM/dd/yyyy):</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtInvoiceDate" readonly maxlength="10"
                                                        placeholder="Invoice Date" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                                    <%--onkeydown="return false;"--%>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Payment Mode :</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlVendorPaymentMode" class="form-control">
                                                            <%-- <option value="0">Please Select</option>
                                                            <option value="1">Cash</option>--%>
                                                            <option value="2">Credit</option>
                                                            <%--<option value="3">DD</option>
                                                            <option value="4">Cheque</option>
                                                            <option value="5">Bank Transfer</option>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Payment Mode:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlPayoutPaymentMode" class="form-control">
                                                            <%-- <option value="0">Please Select</option>
                                                            <option value="1">Cash</option>--%>
                                                            <option value="2">Credit</option>
                                                            <%--<option value="3">DD</option>
                                                            <option value="4">Cheque</option>
                                                            <option value="5">Bank Transfer</option>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Payment Mode :</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlCustomerPaymentMode" class="form-control" onchange="ddlCustomerPaymentMode_SelectedIndexChanged()">
                                                            <option value="0">Please Select</option>
                                                            <%--  <option value="1">Cash</option>
                                                        <option value="2">Credit</option>
                                                        <option value="3">DD</option>
                                                        <option value="4">Cheque</option>
                                                        <option value="5">Bank Transfer</option>
                                                        <option value="6">Direct by Customer</option>--%>
                                                        </select>
                                                    </div>
                                                    <div class="input-group margin-bottom-sm" id="divBank" style="display: none;">
                                                        <span class="input-group-addon"><i class="fa fa-home fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlPaymentToBank" class="form-control" style="width: 250px;">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        &nbsp;</div>
                                    <div class="col-md-8">
                                        <div class="col-md-4">
                                            Amount:</label>
                                            <br />
                                            <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtVendorAmount" maxlength="10" placeholder="Amount"
                                                    onkeypress="return /[0-9 -.]/i.test(event.key)" onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            Amount:</label>
                                            <br />
                                            <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtPayoutAmount" maxlength="10" placeholder="Amount"
                                                    onkeypress="return /[0-9 -.]/i.test(event.key)" onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="modelname" class="labelclass">
                                                Amount:</label>
                                            <br />
                                            <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                            <div class="input-group margin-bottom-sm">
                                                <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control" id="txtCustomerAmount" maxlength="10" placeholder="Amount"
                                                    onkeypress="return /[0-9 -.]/i.test(event.key)" onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                            </div>
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
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" id="btnReset" onclick="clearTextBox();">
                                Reset
                            </button>

                            

                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>--%>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <div class="row well well-sm">
                <div style="padding-left: 20px;">
                    <div class="col-md-2">
                        <label for="modelname" class="labelclass">
                            Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <input type="text" class="form-control" id="txtFromInvoiceDt" name="txtFromInvoiceDt" maxlength="10" placeholder="From Date"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="modelname" class="labelclass">
                            To Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <input type="text" class="form-control" id="txtToInvoiceDt" name="txtToInvoiceDt" maxlength="10" placeholder="To Date"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="modelname" class="labelclass">
                            From (Invoice No):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                            </span>
                            <input type="text" class="form-control" id="txtInvoiceFrom" name="txtInvoiceFrom" maxlength="40" placeholder="Invoice From"
                                autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="modelname" class="labelclass">
                            To (Invoice No):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                            </span>
                            <input type="text" class="form-control" id="txtInvoiceTo" name="txtInvoiceTo" maxlength="40" placeholder="Invoice To"
                                autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-1">
                        <br />
                        <button type="button" class="btn btn-success"  onclick="ShowFilteredData();">
                            Search
                        </button>
                    </div>
                    <div class="col-md-1">
                        <br />
                        <button type="button" class="btn btn-danger"  onclick="btnResetSearch();">
                            Reset
                        </button>
                    </div>

                    <div class="col-md-1">
                         <br />
                         <%--<button type="button" class="btn btn-primary"  onclick="btnResetSearch();">
                            Export to Excel
                        </button>--%>

                           <asp:LinkButton ID="lnkExportToExcel"  runat="server" onclick="lnkExportToExcel_Click"> <img src="img/btnexcel.jpg" / width="100" > </asp:LinkButton>
                    </div>
                </div>
            </div>
            <div>
                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div class="c1">
                        <div id="Showoverlay" class="overlayWindow">
                            <h2>
                                Loading .. Please wait</h2>
                        </div>
                        <table id="tblRecords" class="table table-bordered  table-responsive">
                            <thead>
                                <tr>
                                   <%-- <th>
                                        ID
                                    </th>--%>
                                    <th>
                                        Sr#
                                    </th>
                                    <%-- <th>
                                        Account Type
                                    </th>--%>
                                    <th>
                                        Invoice Date
                                    </th>
                                    <th>
                                        Invoice No
                                    </th>
                                    <th>
                                        Veh/Chasis No
                                        <br />
                                        Owner Name
                                    </th>
                                    <th>
                                        Sales Executive
                                    </th>
                                    <th>
                                        Vendor Name
                                    </th>
                                    <th>
                                        Amount
                                    </th>
                                    <th>
                                        Payout Name
                                    </th>
                                    <th>
                                        Amount
                                    </th>
                                    <th>
                                        Customer Name
                                    </th>
                                    <th>
                                        Payment Mode
                                    </th>
                                    <th>
                                        Amount
                                    </th>
                                    <th>
                                        Created
                                        <br />
                                        / Updated By
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
            <script>
                $(document).ready(function () {


                    $("#ddlVendors").select2();
                    $("#ddlPayouts").select2();
                    $("#ddlCustomers").select2();
                    $("#ddlPaymentToBank").select2();


                });
            </script>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="lnkExportToExcel" />
        </Triggers>
    </asp:UpdatePanel>

   <%-- <script language="javascript">
        function PrintPDF(id) {
            $("#printrecordID").val(id);
            /////document.getElementById("<%=lnkExporttoExcel.ClientID %>").click();
            document.getElementById("<%=lnkExporttoPDF.ClientID %>").click();

        }
   </script>--%>

</asp:Content>
