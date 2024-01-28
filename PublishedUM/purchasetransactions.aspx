<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="purchasetransactions, App_Web_y0qsyvj2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/PurchaseTransactionDetails.js" type="text/javascript"></script>
    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
    <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

      <script src="pagination/select.js" type="text/javascript"></script>
    <script src="pagination/input.js" type="text/javascript"></script>
    <script src="pagination/full_numbers_no_ellipses.js" type="text/javascript"></script>
    <script src="pagination/scrolling.js" type="text/javascript"></script>


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
                        Purchase Transactions
                    </div>
                    <div class="col-md-8" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Purchase</button>
                    </div>
                </div>
                <%-- <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 70px; width:50%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add Payments
                                    </h4>
                                </div>--%>
                <div class="modal-body">
                    <br />
                    <form>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                            <div class="form-group">
                                <input type="hidden" name="recordID" id="recordID" value="">
                                <input type="hidden" name="purchaseID" id="purchaseID" value="">
                                <input type="hidden" name="recordoldpurchasedt" id="recordoldpurchasedt" value="" />
                                <input type="hidden" name="recordOldVenID" id="recordOldVenID" value="" />
                                <input type="hidden" name="recordOldVendorName" id="recordOldVendorName" value="" />
                                <input type="hidden" name="recordOldInvTypID" id="recordOldInvTypID" value="" />
                                <input type="hidden" name="recordoldInvoiceType" id="recordoldInvoiceType" value="" />
                                <input type="hidden" name="recordoldInvSlipNo" id="recordoldInvSlipNo" value="" />
                                <input type="hidden" name="recordPModeID" id="recordPModeID" value="" />
                                <input type="hidden" name="recordPaymentMode" id="recordPaymentMode" value="" />
                                <input type="hidden" name="recordoldAmt" id="recordoldAmt" value="" />
                                <input type="hidden" name="recordoldPTypeid" id="recordoldPTypeid" value="" />
                                <input type="hidden" name="recordoldPurchaseTypeName" id="recordoldPurchaseTypeName"
                                    value="" />
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtDate" maxlength="10" placeholder="Purchase Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Select Type:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlPurchaseType" class="form-control" onchange="ddlPurchaseType_SelectedIndexChanged()">
                                            <option value="1" selected="selected">Vendors</option>
                                            <%--<option value="2">Employees</option>--%>
                                            <option value="3">Customers</option>
                                            <%-- <option value="4">Banks</option>
                                            <option value="5" >Credit</option>
                                            <option value="5">General Ledger</option>--%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="purchaseto" id="purchaseto" class="labelclass">
                                        Select Vendor :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlVendors" class="form-control">
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="paymentto" id="paymentto" class="labelclass">
                                        Invoice Type :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlInvoiceType" class="form-control">
                                            <option value="0" selected="selected">Please Select</option>
                                            <%--<option value="1">Insurance</option>--%>
                                            <option value="2">Labour</option>
                                            <option value="3">Slip</option>
                                            <option value="4">Tax Invoice</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Invoice/Slip No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtInvoiceSlipNo" maxlength="100" placeholder="Invoice/Slip No"
                                            autocomplete="off" />
                                        <%-- onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Paymnet Mode :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlPaymentMode" class="form-control">
                                            <%-- <option value="0" selected="selected">Please Select</option>
                                             <option value="1" >Cash</option>--%>
                                            <option value="2">Credit</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Amount:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtAmount" maxlength="30" placeholder="Amount"
                                            autocomplete="off" required onkeypress="return /[0-9 .-]/i.test(event.key)" onkeyup="myFunc(this);"
                                            ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                <%-- <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                      Status:</label>
                                                    <br />
                                                   
                                                     <div class="input-group margin-bottom-sm">
                                                        
                                                    <input type="checkbox" id="chkStatus" name="chkStatus" value="Active" checked />
                                                        </div>
                                                   
                                                </div>--%>


                                                 <div class="col-md-6" id="divuploadfiles" style="display: none;">
                                                        <br />
                                                        <div class="col-md-6">
                                                            <input type="file" id="postedFile" name="postedFile" />
                                                            <asp:HiddenField ID="hiddenFileName" runat="server" ClientIDMode="Static" />
                                                            <span id="lblMessage" style="color: Green"></span>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input type="button" id="btnUpload" class="btn btn-danger" value="Upload" onclick="btnUploadFile();" />
                                                            <progress id="fileProgress" style="display: none"></progress>
                                                        </div>

                                                         <div class="col-md-3">
                                                            <input type="hidden" id="hdnviewfileid" name="hdnviewfileid" />
                                                            <input type="button" id="btnviewfile" class="btn btn-warning" value="View File" onclick="DownloadFile()"; />
                                                            
                                                        </div>
                                                    </div>

                            </div>
                        </div>
                        <div class="modal-footer123" align="center" style="background-color: #F7F7F7;">
                            <button type="button" class="btn btn-danger" id="btnAdd" onclick="return AddRecord();">
                                Save
                            </button>
                            <button type="button" class="btn btn-primary" id="btnUpdate" style="display: none;"
                                onclick="UpdateRecord();">
                                Update</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%-- <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>--%>
                            <button type="button" class="btn btn-default" onclick="Reset()">
                                Reset</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" id="btnSearch" onclick="BindDataTable();">
                                Search
                            </button>
                        </div>
                    </div>
                    </form>
                </div>
                <%-- </div>
                        </div>
                    </div>
                </div>--%>
                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <%--  /////////////For Searchparameter /////////--%>
                    <div align="center" class="row well well-sm">
                        <div class="col-md-3">
                            <b>Search by: </b>
                        </div>
                        <div class="col-md-3">
                            <select id="ddlSearchField" class="form-control">
                                <option value="0">Please Select</option>
                                <option value="createdon">Entry Date</option>
                                <option value="amount">Amount</option>
                                <option value="vendorname">Vendor Name</option>
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
                    <%--  /////////////End for Searchparameter /////////--%>
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
                                    <th>
                                        Purchase Date
                                    </th>
                                    <th>
                                        Invoice/Slip No
                                    </th>
                                    <th>
                                        Vendor Name
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
                                        Add Parts
                                    </th>
                                    <th>
                                       Bill Status
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
            <div class="container">
                <asp:HiddenField ID="printrecordID" ClientIDMode="Static" runat="server" />
                <asp:HiddenField ID="hdnOldQty" ClientIDMode="Static" runat="server" />
                <div class="modal fade" id="myPartsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                    aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" style="padding-top: 50px; width: 85%;">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00CACA;">
                                <button type="button" class="close" data-dismiss="modal">
                                    ×</button>
                                <h4 class="modal-title" id="myModalLabel">
                                    Add Details
                                </h4>
                            </div>
                            <div class="col-md-12" style="padding-top: 6px; display: none;">
                                <div class="col-md-3">
                                    <div class="col-md-4" nowarp>
                                        Challan#:
                                    </div>
                                    <div class="col-md-8">
                                        <div id="txtDSlipNo" style="color: Red; font-weight: bold;">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="col-md-5">
                                        Vehicle No:
                                    </div>
                                    <div class="col-md-7">
                                        <div id="txtDVehNo" style="color: Red; font-weight: bold;">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-4">
                                        Customer Name:
                                    </div>
                                    <div class="col-md-8">
                                        <div id="txtDCustomerName" style="color: Red; font-weight: bold;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="modal-body">
                                <form>
                                <div class="panel panel-primary">
                                    <div class="panel-body">
                                        <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                        <div class="form-group">
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Part#:</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtPartNo" onfocusout="GetPartDetailsbyPartNo()"
                                                        maxlength="50" placeholder="PartNo" />
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <label for="modelname" class="labelclass">
                                                    Particulars:</label>
                                                <input type="hidden" name="addDetailsSlipNo" id="addDetailsSlipNo" value="">
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtParticulars" maxlength="200" placeholder="Particulars" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    UOM:</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <select id="ddlUom" class="form-control">
                                                        <%-- <option value="0">Please Select</option>--%>
                                                        <option value="1">Each</option>
                                                        <option value="2">Ltr</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Qty :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtQuantity" maxlength="10" placeholder="Quantity"
                                                        autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)" onkeyup="myFunc(this);"
                                                        ondrop="return false;" onpaste="return false;" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Rate :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtRate" maxlength="10" placeholder="Rate" readonly
                                                        autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)" onkeyup="myFunc(this);"
                                                        ondrop="return false;" onpaste="return false;" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Purchase Price :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtPurchasePrice" maxlength="15" placeholder="Purchase Price"
                                                        autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)" onkeyup="myFunc(this);"
                                                        ondrop="return false;" onpaste="return false;" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Discount Code :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtDiscountCode" maxlength="5" placeholder="Discount Code"
                                                        autocomplete="off" onkeypress="return /[0-9A-Za-z.]/i.test(event.key)" ondrop="return false;"
                                                        onpaste="return false;" />
                                                </div>
                                            </div>

                                             <div class="col-md-4">
                                                <label for="modelname" class="labelclass">
                                                    Remarks :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtremarks" maxlength="200" placeholder="Remarks"
                                                        autocomplete="off" onkeypress="return /[0-9A-Za-z.()-#&]/i.test(event.key)"  />  <%--ondrop="return false;"  onpaste="return false;"--%>
                                                </div>
                                            </div>


                                            <div class="col-md-4" style="display: none;">
                                                <label for="modelname" class="labelclass">
                                                    Discount (in %) :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtDiscountPercentage" maxlength="5"
                                                        placeholder="Discount%" autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)"
                                                        onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                                </div>
                                            </div>
                                            <div class="col-md-4" style="display: none;">
                                                <label for="modelname" class="labelclass">
                                                    Total Amount :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtTotalAmount" maxlength="10" placeholder="Total Amount"
                                                        autocomplete="off" readonly onkeypress="return /[0-9.]/i.test(event.key)" onkeyup="myFunc(this);"
                                                        ondrop="return false;" onpaste="return false;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                                <input type="text" id="txtitemoldprice" name="txtitemoldprice" readonly="readonly" class="form-control" style="color: Red;">
                                <input type="text" id="txtlastvendorname" name="txtlastvendorname" readonly="readonly" class="form-control" style="color: Red;">
                                <input type="text" id="txtlastinvoiceno" name="txtlastinvoiceno" readonly="readonly" class="form-control" style="color: Red;">
                            </div>
                            <div class="modal-footer">
                                <div class="col-md-2 well well-sm" align="center">
                                    Total Amount: &nbsp;
                                    <input type="text" id="txtTotalAmt" name="txtTotalAmt"  readonly="readonly" style="color: Red;">
                                </div>
                                <div class="col-md-2 well well-sm" align="center">
                                    Total Purchase Price: &nbsp;
                                    <input type="text" id="txtTotalPurchasePrice" name="txtTotalPurchasePrice" readonly="readonly"
                                        style="color: Red;">
                                </div>
                                <div class="col-md-2 well well-sm" align="center">
                                    Total Quantity: &nbsp;
                                    <input type="text" id="txttotalpurchasedqty" name="txttotalpurchasedqty" readonly="readonly"
                                        style="color: Red;">
                                </div>

                                <button type="button" class="btn btn-danger" id="btnAddNewDetails" onclick="return AddRecordDetails();">
                                    Add</button>
                                <button type="button" class="btn btn-primary" id="btnUpdateDetails" onclick="UpdateRecordDetails();">
                                    Update</button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    Close</button>
                            </div>
                            <div class="col-md-12" align="center" style="background-color: White !important;">
                                <div class="c1">
                                    <div id="Showoverlay2" class="overlayWindow">
                                        <h2>
                                            Loading .. Please wait</h2>
                                    </div>
                                    <table id="tblRecordDetails" class="table table-bordered  table-responsive">
                                        <thead>
                                            <tr>
                                                <th>
                                                    Sr#
                                                </th>
                                                <th>
                                                    Part#
                                                </th>
                                                <th>
                                                    Particulars
                                                </th>
                                                <th>
                                                    UOM
                                                </th>
                                                <th>
                                                    Qty
                                                </th>
                                                <th>
                                                    Purchase Price
                                                </th>
                                                <th>
                                                    Rate
                                                </th>
                                                <th>
                                                    Discount %
                                                </th>
                                                <th>
                                                    Discount Code
                                                </th>

                                                <th>
                                                    Total Amount
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
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {

                    // Initialize select2
                    $("#ddlVendors").select2();

                });
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
