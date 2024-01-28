<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="paymenttransactionsVA, App_Web_h5d101sg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/PaymentTransactionDetailsVA.js" type="text/javascript"></script>

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
                        Payments
                    </div>
                    <div class="col-md-8" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Payments</button>
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
                                <input type="hidden" name="recordpaymenttransactionid" id="recordpaymenttransactionid"
                                    value="" />
                                <input type="hidden" name="recordOldPaymentDate" id="recordOldPaymentDate" value="" />
                                <input type="hidden" name="recordOldPmentACTypID" id="recordOldPmentACTypID" value="" />
                                <input type="hidden" name="recordOldPaymentAccountType" id="recordOldPaymentAccountType"
                                    value="" />
                                <input type="hidden" name="recordoldPtoID" id="recordoldPtoID" value="" />
                                <input type="hidden" name="recordoldPaymentTo" id="recordoldPaymentTo" value="" />
                                <input type="hidden" name="recordPModeID" id="recordPModeID" value="" />
                                <input type="hidden" name="recordPaymentMode" id="recordPaymentMode" value="" />
                                <input type="hidden" name="recordPTID" id="recordPTID" value="" />
                                <input type="hidden" name="recordPaymentType" id="recordPaymentType" value="" />
                                <input type="hidden" name="recordoldAmt" id="recordoldAmt" value="" />
                                <input type="hidden" name="recordoldRemarks" id="recordoldRemarks" value="" />
                                <input type="hidden" name="recordoldBnkID" id="recordoldBnkID" value="" />
                                <input type="hidden" name="recordoldBankName" id="recordoldBankName" value="" />
                                <input type="hidden" name="recordoldpmbnkid" id="recordoldpmbnkid" value="" />
                                <input type="hidden" name="recordoldpmodeBankName" id="recordoldpmodeBankName" value="" />
                                 <input type="hidden" name="recordolddiscount" id="recordolddiscount" value="" />

                                 <div class="col-md-12">
                                <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtDate" name="txtDate" maxlength="10" placeholder="Payment Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Select Mode:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlAccountType" class="form-control" onchange="ddlAccountType_SelectedIndexChanged()">
                                            <option value="0" selected="selected">Please Select</option>
                                            <option value="1">Vendors</option>
                                            <option value="2">Employees</option>
                                            <option value="3">Customers</option>
                                            <option value="4">Banks</option>
                                            <%-- <option value="5" >Credit</option>--%>
                                            <option value="5">General Ledger</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="paymentto" id="paymentto" class="labelclass">
                                        :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlPaymentTo" class="form-control">
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>
                                    </div>
                                    <div class="input-group margin-bottom-sm" id="divOtherBank" style="display: none;">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlPaymentToOtherBank" class="form-control">
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>
                                    </div>
                                </div>
                                </div>
                                <div class="col-md-12">
                                <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Payment Mode :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlPaymentMode" class="form-control" onchange="ddlPaymentMode_SelectedIndexChanged()">
                                            <option value="0" selected="selected">Please Select</option>
                                            <%--<option value="1">Cash</option>
                                            <option value="2">Credit</option>
                                            <option value="3">IMPS</option>
                                            <option value="4">RTGS</option>
                                            <option value="5">NEFT</option>
                                            <option value="6">Card Swipe</option>
                                            <option value="7">QR Code Scan</option>
                                             <option value="9">Cheque</option>
                                             <option value="8">Discount</option>--%>
                                        </select>
                                    </div>
                                    <div id="divBank" style="display: none;">
                                        <b>Select Bank:</b>
                                        <br />
                                        <div class="input-group margin-bottom-sm">
                                            <span class="input-group-addon"><i class="fa fa-home fa-fw" aria-hidden="true"></i>
                                            </span>
                                            <select id="ddlPaymentToBank2" class="form-control" style="width:250px;">
                                                <option value="0" selected="selected">Please Select</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Payment/Receipt :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlPaymentType" class="form-control">
                                            <option value="0" selected="selected">Please Select</option>
                                            <option value="1">Payment</option>
                                            <option value="2">Receipt</option>
                                        </select>
                                    </div>
                                </div>
                               <div class="col-md-4" >
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
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>

                                </div>
                                <div class="col-md-12">
                                 <div class="col-md-4" style="display:none;">
                                    <label for="modelname" class="labelclass">
                                        Discount:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtDiscount" maxlength="10" placeholder="Discount"
                                            autocomplete="off" required onkeypress="return /[0-9 .-]/i.test(event.key)" value="0" onkeyup="myFunc(this);"
                                            ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label for="modelname" class="labelclass">
                                        Remarks:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtRemarks" maxlength="300" placeholder="Remarks"
                                            autocomplete="off" required />
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

                             &nbsp;&nbsp;
                              <asp:LinkButton id="lnkExcel" runat="server" OnClick="lnkExcel_Click" > <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>

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
                       <b> Search by: </b>
                    </div>
                    <div class="col-md-3">
                        <select id="ddlSearchField" class="form-control" >
                                                <option value="0">Please Select</option>
                                                <option value="paymentreceipt">Payment Type</option>
                                                 <option value="paymentmode">Payment Mode</option>
                                                <option value="amount">Amount</option>
                                                <option value="createdondt">Entry Date</option>
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
                                  <%--  <th>
                                        ID
                                    </th>--%>
                                    <th>
                                        Sr#
                                    </th>
                                    <th>
                                        Payment Date
                                    </th>
                                    <th>
                                        Mode
                                    </th>
                                    <th>
                                        Party Name
                                    </th>
                                    <th>
                                        Payment Mode
                                    </th>
                                    <th>
                                        Payment Type
                                    </th>
                                    <th>
                                        Amount
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

             <script>
                 $(document).ready(function () {

                     // Initialize select2
                     $("#ddlPaymentTo").select2();
                     $("#ddlPaymentToBank2").select2();

                 });
        </script>

        </ContentTemplate>
         <Triggers >
            <asp:PostBackTrigger ControlID="lnkExcel" />
             <%-- <asp:PostBackTrigger ControlID="lnkPdf" />--%>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
