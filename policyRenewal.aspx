<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="policyRenewal, App_Web_xgwfkdro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/PolicyRenewalAdminData.js" type="text/javascript"></script>

    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
   <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />


    <%--<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.colVis.min.js" type="text/javascript"></script>

    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>--%>
    


   <%--  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.5/r-2.2.9/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.5/r-2.2.9/datatables.min.js"></script>
    

    
    <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />--%>

    <%--<link href="css/ExporttoExcelStyleSheet.css" rel="stylesheet" type="text/css" />--%>

    <%--<script src="js/jspdf.umd.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>

    <script src="jspdf/jspdf.plugin.autotable.min.js" type="text/javascript"></script>--%>

<%--
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>--%>


  <script src="jspdf/jspdf.umd.js" type="text/javascript"></script>
    <script src="jspdf/jspdf.plugin.autotable.js" type="text/javascript"></script>



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
            <table id="tabledata"></table>

            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Policy Renewal Master
                    </div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New Policy</button>
                    </div>
                    <div class="col-md-2" style="display: none;">
                        <button type="button" class="btn btn-primary" data-target="#myModal" onclick="ShowAllRecords();">
                            Show All</button>
                    </div>
                </div>
               <%-- <div id="divShowExport" class="col-md-12" align="right" style="background-color:White !important;">
                    <div class="col-md-6">
                        &nbsp;</div>
                    <div class="col-md-6" style="background-color:White !important;">
                        <div class="col-md-6">
                            <asp:LinkButton ID="lnkSelectedDataToExcel" runat="server" OnClick="lnkExcel_Click">Export Filtered <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>
                        </div>
                        <div class="col-md-6">
                            <asp:LinkButton ID="lnkExcel" runat="server" OnClick="lnkExcel_Click"> Export All <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>
                        </div>
                    </div>
                </div>--%>
                <div>
                    <br />
                    <br />
                    <div class="row well well-sm">
                        <div class="col-md-12">
                            <div class="col-md-3">
                                From Date (MM/dd/yyyy):
                                <br />
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" class="form-control" id="txtFromDate" maxlength="10" placeholder="From Date"
                                        onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                To Date (MM/dd/yyyy):
                                <br />
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" class="form-control" id="txtToDate" maxlength="10" placeholder="To Date"
                                        onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                Insurance By:
                                <br />
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-home fa-fw" aria-hidden="true"></i>
                                    </span>
                                    <select id="ddlSearchLastRenewalFrom" class="form-control">
                                        <option value="0" selected="selected">Please Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                            <br />
                                <button type="button" class="btn btn-danger" onclick="ShowFilteredData()">
                                    Show Filtered Data</button>
                            </div>
                            <div class="col-md-1">
                            <br />
                                <button type="button" class="btn btn-primary" onclick="ShowAllData()">
                                    Show All</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="myModal"  role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 40px; width: 70%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add New Policy
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Cust Name:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtName" maxlength="100" placeholder="Customer Name"
                                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Last Renewal From:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlLastRenewalFrom" class="form-control">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Veh./Chasis No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtVehChasisNo" maxlength="40" placeholder="Veh./Chasis No"
                                                            onkeypress="return /[0-9A-Z]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Due Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDueDate" maxlength="10" placeholder="Due Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Mobile No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtMobileNo" maxlength="10" placeholder="Mobile No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Alternate No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtAlternateNo" maxlength="10" placeholder="Alternate No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
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
                                            <div class="row col-md-12">
                                             <div class="col-md-6" align="left">
                                                    <label for="modelname" class="labelclass">
                                                        Policy Number:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtpolicyno" maxlength="40" placeholder="Policy No" />
                                                    </div>
                                                </div>
                                             <div class="col-md-6">
                                                <label for="modelname" class="labelclass">
                                                        Remarks:</label>
                                                <br />
                                                 <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtRemarks" maxlength="200" placeholder="Remarks"
                                                            onkeypress="return /[A-Za-z 0-9,.]/i.test(event.key)"  />
                                                    </div>
                                             </div>
                                             </div>
                                        </div>
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
                                    </form>
                                </div>
                                <div class="col-md-12" align="center" style="background-color: White !important;">
                                    <div class="c1">
                                        <%-- <div id="Showoverlay1" class="overlayWindow">
                            <h2>
                                Loading .. Please wait</h2>
                        </div>--%>
                                        <table id="tblUploadedFiles"  class="table table-bordered  table-responsive">  <%--class="table table-bordered  table-responsive"--%>
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
                                                    <th>
                                                        Download
                                                    </th>
                                                    <th>
                                                        Action
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                        <br />
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                        <table id="tblRecords" class="table table-bordered  table-responsive">
                            <thead>
                                <tr>
                                    <th>
                                        changeson
                                    </th>
                                    <th>
                                        Sr#
                                    </th>
                                   
                                    <th>
                                        Customer Name
                                    </th>
                                    <th>
                                        Veh./Chasis No
                                    </th>
                                    <th>
                                        Due Date
                                    </th>
                                    <th>
                                        Mobile No
                                    </th>
                                    <th>
                                        Alternate No
                                    </th>
                                    <th>
                                        Model Name
                                    </th>
                                    <th>
                                        Last Renewal From
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
                                        Send File
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <script src="datatableCSSJS/1jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/2dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/3jszip.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/4pdfmake.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/5vfs_fonts.js" type="text/javascript"></script>
            <script src="datatableCSSJS/6buttons.html5.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/7buttons.colVis.min.js" type="text/javascript"></script>
           
         
        

         


        </ContentTemplate>

      <%--  <Triggers >
            <asp:PostBackTrigger ControlID="lnkExcel" />
        </Triggers>--%>

    </asp:UpdatePanel>
</asp:Content>
