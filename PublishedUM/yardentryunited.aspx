<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="yardentryunited, App_Web_gdx0w2k3" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <script src="DataTableActions/yardentryunited.js" type="text/javascript"></script>

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
                        Yard Entry (United)
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New Entry</button>
                    </div>
                    <div class="col-md-2">
                        
                            <asp:LinkButton ID="lnkExcel" runat="server" OnClick="lnkExcel_Click"> <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>
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

                                               <%-- <div class="col-md-6">
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
                                                </div>--%>


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


                     <%--upload vehicle photo--%>
                    <div class="modal" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 40px; width: 60%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="H1">
                                        Add Vehicle Photo
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form id="frmUploadVehPhoto">
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                            <div class="row col-md-12">
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <label for="Photo">
                                                            Vehicle Photo</label>
                                                        <input type="file" class="form-control" id="postedFile" name="postedFile" accept="image/jpg,image/png,image/jpeg" />
                                                        <asp:HiddenField ID="hiddenFileName" runat="server" ClientIDMode="Static" />
                                                        <span id="lblMessage" style="color: Green"></span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div style="width: 50%; height: 60%">
                                                            <div id="imgPreview" class="thumbnail" style="display: none">
                                                                <img class="img-responsive" id="targetImg" width="200px" height="250px" />
                                                                <div class="caption">
                                                                    <a href="#" onclick="ClearPreview()"><i class="glyphicon glyphicon-trash"></i></a>
                                                                    <span id="description"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--<br />
                                                        <input type="button" id="btnUpload" value="Upload" onclick="btnUploadFile();"  />--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" id="btnUploadLogo" onclick="btnUploadFile();">
                                        Upload</button>
                                   
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--end upload vehicle photo--%>
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
                                     <%-- <th>
                                        Finance Company
                                    </th>--%>
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
                                        Image
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
       <Triggers>
            <asp:PostBackTrigger ControlID="lnkExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


