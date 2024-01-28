<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="yardEntry, App_Web_h5d101sg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <script src="DataTableActions/yardentryankur.js" type="text/javascript"></script>

     <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
   <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    
    <script src="jspdf/jspdf.umd.js"></script>
    <script src="jspdf/jspdf.plugin.autotable.js"></script>

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
                        Yard Entry (Ankur )
                    </div>
                    <div class="col-md-8">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New Entry</button>
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="myModal"  role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 70px; width:60%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add New Entry
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            
                                            <div class="row col-md-12">
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Vehicle No:</label>
                                                    <br />
                                                   
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtVehNo" maxlength="50" placeholder="Vehicle No"
                                                             ondrop="return false;" onpaste="return false;" /> <%--onkeypress="return /[0-9a-zA-Z]/i.test(event.key)"--%>
                                                    </div>
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                                </div>

                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Model:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlModel" class="form-control" style="width:100%;">
                                                            <option value="0">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                </div>
                                                <div class="row col-md-12">

                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Finance Company:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlFC" class="form-control" style="width:100%;">
                                                            <option value="0">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>


                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                      Customer  Name:</label>
                                                    <br />
                                                   
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtCustName" maxlength="50" placeholder="Customer Name"
                                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 


                                                

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        In Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtInDate" maxlength="10" placeholder="Inward Date" onkeydown="return false;" 
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                               

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Out Date (MM/dd/yyyy):</label>    
                                                        <input type="checkbox" id="chkOut" name="chkOut" onchange="chkOut_CheckChange1();" checked />
                                                         
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtOutDate"  disabled="disabled" maxlength="10" placeholder="Outward Date" onkeydown="return false;" 
                                                            ondrop="return false;" onpaste="return false;" />
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
                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div class="c1">
                        <div id="Showoverlay" class="overlayWindow">
                           
                                <br /> <br />
                                <i class="fa fa-spinner fa-pulse fa-3x fa-fw" style="font-size:72px;color:black;"></i>
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
                                       Vehicle No
                                    </th>
                                      <th>
                                       Model
                                    </th>
                                      <th>
                                        Finance Company
                                    </th>
                                      <th>
                                        Customer Name
                                    </th>
                                     <th>
                                        Entry Date
                                    </th>
                                     <th>
                                       Exit Date
                                    </th>

                                     <th class="">
                                        Total Days
                                    </th>

                                    <th class="">
                                        Create Bill
                                    </th>

                                     <th class="">
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




                 <div class="container">
                    <div class="modal fade" id="myModal2"  role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 70px; width:60%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="H1">
                                        Create Bill
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>

                                    <input type="hidden" name="hdnyardid" id="hdnyardid" value="">
                                     <input type="hidden" name="hdnentrydt" id="hdnentrydt" value="">
                                      <input type="hidden" name="hdnmodelid" id="hdnmodelid" value="">
                                       <input type="hidden" name="hdnmodelname" id="hdnmodelname" value="">

                                        <input type="hidden" name="hdnparkingtoforbill" id="hdnparkingtoforbill" value="">
                                        <input type="hidden" name="hdntotalparkingdaysforbill" id="hdntotalparkingdaysforbill" value="">

                                        <%--<input type="hidden" name="hdnparkingfrom" id="hdnparkingfrom" value="">

                                         <input type="hidden" name="hdnparkingto" id="hdnparkingto" value="">
                                          <input type="hidden" name="hdnentrydt" id="Hidden5" value="">--%>

                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            
                                            <div class="row col-md-12">

                                            <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                      Customer  Name:</label>
                                                    <br />
                                                   
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtBillCustName" disabled="disabled" maxlength="50" placeholder="Customer Name"
                                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                       Invoice No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                       <input type="text" class="form-control" id="txtBillInvoiceNo" disabled="disabled" maxlength="50" placeholder="Invoice No"
                                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Payment Method:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-inr fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlBillPaymentmethod" class="form-control" style="width:100%;">
                                                            <option value="1">Cash</option>
                                                             <option value="2">Credit</option>
                                                        </select>
                                                    </div>
                                                </div>
                                               

                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Invoice Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtBillInvoiceDate" disabled="disabled" maxlength="10" placeholder="Invoice Date" onkeydown="return false;" 
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Vehicle No:</label>
                                                    <br />
                                                   
                                                   
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtBillVehNo" disabled="disabled" maxlength="50" placeholder="Vehicle No"
                                                             ondrop="return false;" onpaste="return false;" /> <%--onkeypress="return /[0-9a-zA-Z]/i.test(event.key)"--%>
                                                    </div>
                                                </div>

                                                
                                                

                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Contact No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <input type="text" class="form-control" id="txtBillContactNo" maxlength="10" placeholder="Contact No"
                                                             ondrop="return false;" onpaste="return false;" onkeypress="return /[0-9]/i.test(event.key)" /> <%--onkeypress="return /[0-9a-zA-Z]/i.test(event.key)"--%>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Aadhaar No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <input type="text" class="form-control" id="txtBillAadhaarNo" maxlength="12" placeholder="Aadhaar No"
                                                             ondrop="return false;" onpaste="return false;" /> <%--onkeypress="return /[0-9a-zA-Z]/i.test(event.key)"--%>
                                                    </div>
                                                </div>

                                                 
                                                 <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        GSTIN No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <input type="text" class="form-control" id="txtGstinNo" maxlength="15" placeholder="GSTIN No"
                                                             ondrop="return false;" onpaste="return false;" /> <%--onkeypress="return /[0-9a-zA-Z]/i.test(event.key)"--%>
                                                    </div>
                                                </div>                                               

                                                 <div class="col-md-4">
                                                    <label for="modelname" class="labelclass">
                                                        Rate (in Rs.):</label>                                                             
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtBillRate"   maxlength="10" placeholder="Rate" 
                                                            ondrop="return false;" onpaste="return false;" onkeypress="return /[0-9]/i.test(event.key)" />
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" id="btnSaveBill" onclick="return SaveBill();">
                                        Save Bill</button>
                                    <%--<button type="button" class="btn btn-primary" id="Button2" style="display: none;"
                                        onclick="UpdateRecord();">
                                        Update</button>--%>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>
                                </div>
                            </div>
                        </div>
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

