<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="slipdetails, App_Web_y0qsyvj2" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/SlipMaster.js" type="text/javascript"></script>
    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
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
            <asp:HiddenField ID="hdnPrintPermission" ClientIDMode="Static" runat="server" />
            <table id="tabledata">
            </table>
            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Slip Details
                    </div>
                    <div class="col-md-8" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Slip</button>
                    </div>
                </div>
                <div class="modal-body">
                    <br />
                    <form>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-4" style="display: none;">
                                    <label for="modelname" class="labelclass">
                                        Slip No:</label>
                                    <br />
                                    <input type="hidden" name="recordID" id="recordID" value="">
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-book fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtSlipNo" maxlength="50" placeholder="Slip No"
                                            autocomplete="off" readonly />
                                        <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                    </div>
                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                </div>
                                <div class="col-md-4" style="display: none;">
                                    <label for="modelname" class="labelclass">
                                        Slip Date (MM/dd/yyyy):</label>
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
                                        Customer Name:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtCustomerName" maxlength="100" placeholder="Customer Name" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Vehicle No:</label>
                                    <br />
                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtVehChasisNo" maxlength="25" placeholder="Veh./Chasis No"
                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;"  /> <%--onpaste="return false;"--%>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Contact No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtMobileNo" maxlength="10" placeholder="Mobile No"
                                            onkeypress="return /[0-9]/i.test(event.key)" />
                                        <%--ondrop="return false;" onpaste="return false;"--%>
                                    </div>
                                </div>
                                <div class="col-md-4" style="display: none;">
                                    <label for="modelname" class="labelclass">
                                        Payment Mode:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtPaymentMode" value="Credit" maxlength="40"
                                            placeholder="Payment Mode" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Make:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtModel" maxlength="50" placeholder="Make" />
                                    </div>
                                </div>
                                <div class="col-md-4">
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
                <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 70px; width: 80%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add Slip Details
                                    </h4>
                                </div>
                                <div class="col-md-12" style="padding-top: 6px;">
                                    <div class="col-md-3">
                                        <div class="col-md-4">
                                            Slip No:
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
                                            

                                              <input type="hidden" name="hdnpurchaseprice" id="hdnpurchaseprice" value="0">
                                              <input type="hidden" name="hdndiscountcode" id="hdndiscountcode" value="0">

                                             <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Type:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                       <input type="radio" id="rdPartno" name="rdtype" onclick="rdTypeChange_Click()" checked />Parts
                                                       &nbsp;
                                                        <input type="radio" id="rdLabour" name="rdtype" onclick="rdTypeChange_Click()"  />Labour
                                                    </div>
                                                </div>

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
                                                        <input type="text" class="form-control" id="txtRate" maxlength="10" placeholder="Rate"
                                                            autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)" "
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Discount % :</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtdiscount" value="0" maxlength="10" placeholder="Discount"
                                                            autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)" onkeyup="myFunc(this);"
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Type:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlPType" class="form-control">
                                                           <%-- <option value="0">Please Select</option>--%>
                                                            <option value="1" selected>Paid</option>
                                                            <option value="2">Warranty</option>
                                                            <option value="3">AMC</option>
                                                            <option value="4">FOC</option>
                                                        </select>
                                                    </div>
                                                </div>



                                                <div class="col-md-4" style="display:none;">
                                                    <label for="modelname" class="labelclass">
                                                        Type:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                       <input type="checkbox" id="chkAmc" name="chkamc" onchange="chkAmc_CheckChanged()"  />AMC
                                                      
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
                                </div>
                                <div class="modal-footer">
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
                                                        Rate
                                                    </th>
                                                    <th>
                                                        Total Amount
                                                    </th>
                                                      <th>
                                                       Discount
                                                    </th>
                                                    <th>
                                                        Details
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
                <div class="container">
                    <div class="modal fade" id="reopenDiv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 70px; width: 60%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="H1">
                                        Reopen Details
                                        <input type="hidden" name="reOpenSlipNo" id="reOpenSlipNo" value="">
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <div class="col-md-4">
                                                    Reason:
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" id="txtReOpenReason" name="txtReOpenReason" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" id="btnReopen" onclick="ReOpenSlip();">
                                        Reopen Slip</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>
                                </div>
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
                                <option value="slipno">Slip Number</option>
                                <option value="vehicleno">Vehicle Number</option>
                                
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="searchValue" placeholder="Search Value" class="form-control" />
                        </div>

                        <%-- <div class="col-md-2">
                            <input type="text" id="txtSearchtoDate" placeholder="To Date" class="form-control" />
                        </div>--%>

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
                        <%--  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                            OnRowDataBound="GridView1_RowDataBound" 
                            AllowPaging="false">
                          
                            <SelectedRowStyle BackColor="#CCDCA7" />
                            <Columns>
                               
                                <asp:TemplateField HeaderText="Sr#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Slip Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslipdate" runat="server" Text='<%# Bind("slipdate" , "{0:dd-MMM-yyyy }") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcustomername" runat="server" Text='<%# Bind("customername") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Vehicle No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblvehicleno" runat="server" Text='<%# Bind("vehicleno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmobileno" runat="server" Text='<%# Bind("mobileno") %>'></asp:Label>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Make" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblMake"   runat="server" Text='<%# Bind("modelname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Amount" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotalAmount" ForeColor="Red"  runat="server" Text='<%# Bind("lbltotalamount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" ForeColor="Green"  runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Add Parts & Labour" >
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkAddParts"   runat="server" ></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Created / Updated by" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreatedupdatedby"   runat="server" ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" >
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit"   runat="server" ></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" >
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblrunningbalance"   runat="server" ></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Print" >
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkPrint"   runat="server" ></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>--%>
                        <table id="tblRecords" class="table table-bordered  table-responsive">
                            <thead>
                                <tr>
                                    <th>
                                        Sr#
                                    </th>
                                    <th>
                                        Slip No. / Date
                                    </th>
                                    <th>
                                        Customer Name
                                    </th>
                                    <th>
                                        Vehicle No
                                    </th>
                                    <th>
                                        Mobile No
                                    </th>
                                    <th>
                                        Make
                                    </th>
                                    <th>
                                        Total Amount
                                    </th>
                                    <th>
                                        Status
                                    </th>
                                    <th>
                                        Add Parts and Labour
                                    </th>
                                     <th>
                                        Is Cancelled
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
                                    <th>
                                        Print
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
                    <div class="modal fade" id="myDisplayModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 30px; width: 80%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="H2">
                                        Show Slip Details
                                    </h4>
                                </div>
                                <br />
                                <div class="col-md-12" align="center" style="background-color: White !important;">
                                    <div class="c1">
                                        <div id="Showoverlay3" class="overlayWindow">
                                            <h2>
                                                Loading .. Please wait</h2>
                                        </div>
                                        <table id="tblDetailsDisplay" class="table table-bordered  table-responsive">
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
                                                        Rate
                                                    </th>
                                                    <th>
                                                        Total Amount
                                                    </th>
                                                    <th>
                                                        Details
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
