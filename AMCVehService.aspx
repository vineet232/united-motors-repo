<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="AMCVehService, App_Web_1ssuryoo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script src="DataTableActions/AMCServiceRenewalMaster.js" type="text/javascript"></script>

    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
     <script src="jspdf/jspdf.umd.js" type="text/javascript"></script>
    <script src="jspdf/jspdf.plugin.autotable.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
                        AMC Service  Master
                    </div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New Service</button>
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
                <div >
                    <br />
                    <br />
                    <div class="row well well-sm" style="display:none;">
                        <div class="col-md-12">
                            <div class="col-md-3">
                                Next Due From Date (MM/dd/yyyy):
                                <br />
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" class="form-control" id="txtFromDate" maxlength="10" placeholder="From Date"
                                        onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                </div>
                            </div>
                            <div class="col-md-3">
                              Next Due  To Date (MM/dd/yyyy):
                                <br />
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" class="form-control" id="txtToDate" maxlength="10" placeholder="To Date"
                                        onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                </div>
                            </div>
                            <div class="col-md-3" style="display:none;">
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
                        <div class="modal-dialog" style="padding-top: 20px; width: 70%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add New Service
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
                                                        Vehicle No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control text-uppercase" id="txtvehicleno" maxlength="40" placeholder="Vehicle No"
                                                            onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                            <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Model:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlModel" class="form-control"  style="width:100%;" >
                                                            <option value="0">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row col-md-12">
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Chasis No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control text-uppercase" id="txtChasisNo" maxlength="40" placeholder="Chasis No"
                                                            onkeypress="return /[0-9a-zA-Z]/i.test(event.key)"  /> <%-- ondrop="return false;" onpaste="return false;"--%>
                                                    </div>
                                                </div>

                                                <div class="col-md-6" style="padding-left:30px;">
                                                    <label for="modelname" class="labelclass">
                                                        Engine No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control text-uppercase" id="txtengineno" maxlength="40" placeholder="Engine No"
                                                            onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                </div>

                                                <%-- <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                     Veh. Sale Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtVehSaleDate" maxlength="10" placeholder="Sale Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                    Ins. Due Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtInsDueDt" maxlength="10" placeholder="Ins. Due Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                
                                                <div class="col-md-6" >
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
                                                </div>--%>

                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                       Model Year:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtmodelyear" maxlength="5" placeholder="Model Year"
                                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)"  /> <%--ondrop="return false;" onpaste="return false;"--%>
                                                    </div>
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                                </div>


                                                


                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                     GVV:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtgvv" maxlength="30" placeholder="GVV"
                                                             onkeypress="return /[0-9.]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                               
                                               <div class="col-md-6" >
                                                    <label for="modelname" class="labelclass">
                                                      Date of Registration (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDateofRegistration" maxlength="10" placeholder="Registration Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                                                                
                                               
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Body Type:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlBodyType" class="form-control">
                                                            <option value="0">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Bharat Stage:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlBharatStage" class="form-control">
                                                            <option value="0">Please Select</option>
                                                            <option value="1">BS-III</option>
                                                            <option value="2">BS-IV</option>
                                                            <option value="3">BS-V</option>
                                                            <option value="4">BS-VI</option>
                                                            <option value="5">Euro-II</option>
                                                            <option value="6">Euro-III</option>
                                                            <option value="7">Euro-IV</option>
                                                            <option value="8">Euro-V</option>
                                                            <option value="9">Euro-VI</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                


                                                 <div class="col-md-6" >
                                                    <label for="modelname" class="labelclass">
                                                     AMC Start Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtamcstartdt" maxlength="10" placeholder="AMC Start Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                     Battery No-1:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtbatteryno1" maxlength="30" placeholder="Battery No-1"         />
                                                    </div>
                                                </div>

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                     Battery No-2:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtbatteryno2" maxlength="30" placeholder="Battery No-2" />
                                                    </div>
                                                </div>


                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Battery Manufacture:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlbatterymanufacture" class="form-control">
                                                            <option value="0" selected="selected">Please Select</option>
                                                           
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6" >
                                                    <label for="modelname" class="labelclass">
                                                     Warrenty Expiry Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtwarrentyexpdate" maxlength="10" placeholder="Warrenty Expiry Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                      Status:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="Hidden3" value="">
                                                     <div class="input-group margin-bottom-sm">
                                                        
                                                    <input type="checkbox" id="chkStatus" name="chkStatus" value="Active" checked />
                                                        </div>
                                                   
                                                </div>
                                                 

                                             <%--   <div class="col-md-6">
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
                                                        Remarks:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtRemarks" maxlength="100" placeholder="Remarks"  />
                                                    </div>
                                                </div>
                                                
                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Invoice No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtinvoiceno" maxlength="40" placeholder="Invoice No"  />
                                                    </div>
                                                </div>--%>
                                               
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
                              <%--  <div class="col-md-12" align="center" style="background-color: White !important;">
                                    <div class="c1">
                                      
                                        <table id="tblUploadedFiles"  class="table table-bordered  table-responsive"> 
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
                                </div>--%>
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
                                        Sr#
                                    </th>
                                   
                                    <th>
                                       Vehicle No
                                    </th>

                                     <th>
                                      Model
                                    </th>
                                     <th>
                                      Chasis No
                                    </th>

                                    <th>
                                       Engine No
                                    </th>

                                     <th>
                                       Model Year
                                    </th>
                                    <th>
                                        GVW
                                    </th>
                                   
                                    <th>
                                        Date of Registration
                                    </th>
                                    <th>
                                      Body Type 
                                    </th>
                                   
                                   
                                     <th>
                                       Bharat Stage
                                    </th>
                                    <th>
                                        AMC Start Date
                                    </th>

                                    <th>
                                       Status
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
                                    <%--<th>
                                        Send File
                                    </th>--%>
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
           
         
          <script>
              $(document).ready(function () {
                  $("#ddlModel").select2();
              });
            </script>


        </ContentTemplate>

      <%--  <Triggers >
            <asp:PostBackTrigger ControlID="lnkExcel" />
        </Triggers>--%>

     
    </asp:UpdatePanel>


</asp:Content>

