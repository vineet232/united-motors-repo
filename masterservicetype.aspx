<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="masterservicetype, App_Web_h5d101sg" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/ServiceTypeMaster.js" type="text/javascript"></script>
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
                        Service Type Master
                    </div>
                    <div class="col-md-8">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New</button>
                    </div>
                </div>
                <div class="row well well-sm">
                    <div class="col-md-3">
                        <label for="modelname" class="labelclass">
                            Emission Type:</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                            </span>
                            <select id="ddlemissiontype" class="form-control" onchange="BindLineofBusiness()">
                                <option value="0" selected="selected">Please Select</option>
                            </select>
                        </div>
                        <span id="Span1" style="color: Red; display: none">* Special Characters not allowed.</span>
                    </div>
                    <div class="col-md-3">
                        <label for="modelname" class="labelclass">
                            Line of Business:</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                            </span>
                            <select id="ddllineofbusiness" class="form-control" onchange="BindParentProductLine()">
                                <option value="0" selected="selected">Please Select</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label for="modelname" class="labelclass">
                            Parent Product Line:</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                            </span>
                            <select id="ddlparentproductline" class="form-control" onchange="BindProductLine()">
                                <option value="0" selected="selected">Please Select</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label for="modelname" class="labelclass">
                            Product Line:</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                            </span>
                            <select id="ddlproductline" class="form-control" onchange="BindDataTable()">
                                <option value="0" selected="selected">Please Select</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 70px;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add Service Type
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label for="modelname" class="labelclass">
                                                        Service Type:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtname" maxlength="50" placeholder="Service Type" />
                                                        <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                                    </div>
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                                </div>
                                                <div class="col-md-12">
                                                    <label for="modelname" class="labelclass">
                                                        KMS/HRS:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtkmshrs" maxlength="50" placeholder="KMS/HRS" />
                                                        <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label for="modelname" class="labelclass">
                                                        Start KMS/HRS:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtstartkmshrs" maxlength="50" placeholder="Start KMS/HRS" />
                                                        <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label for="modelname" class="labelclass">
                                                        End KMS/HRS:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtendkmshrs" maxlength="50" placeholder="End KMS/HRS" />
                                                        <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label for="modelname" class="labelclass">
                                                        Days Limit:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtdayslimit" maxlength="50" placeholder="Days Limit" />
                                                        <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label for="modelname" class="labelclass">
                                                        Permissible Deviation (in days):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtpermissibledeviation" maxlength="50"
                                                            placeholder="Permissible Deviation" />
                                                        <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
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
                                        Service Type
                                    </th>
                                    <th>
                                        KMS/HRS
                                    </th>
                                    <th>
                                        Start KMS/HRS
                                    </th>
                                    <th>
                                        End KMS/HRS
                                    </th>
                                    <th>
                                        Days Limit
                                    </th>
                                    <th>
                                        Permissible Deviation (in days)
                                    </th>
                                    <th>
                                        Add Details
                                    </th>
                                     
                                    <th>
                                        Created/Updated Details
                                    </th>
                                    <th>
                                        Update
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
            <%--     ///////////////////details///////////////////--%>
            <div class="container">
                <div class="modal fade" id="myModal2" role="dialog" aria-labelledby="myModalLabel"
                    aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" style="padding-top: 70px; width: 80%;">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00CACA;">
                                <button type="button" class="close" data-dismiss="modal">
                                    ×</button>
                                <h4 class="modal-title" id="H1">
                                    Add Details
                                </h4>
                            </div>
                            <div class="col-md-12" style="padding-top: 6px;">
                                <div class="col-md-3" style="visibility: hidden;">
                                    <div class="col-md-4" nowarp>
                                        Challan#:
                                    </div>
                                    <div class="col-md-8">
                                        <div id="txtDSlipNo" style="color: Red; font-weight: bold;">
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
                                            <div class="col-md-3">
                                                <label for="modelname" class="labelclass">
                                                    Type:</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <input type="radio" id="rdPartno" name="rdtype" onclick="rdTypeChange_Click()" checked />Parts
                                                    &nbsp;
                                                    <input type="radio" id="rdLabour" name="rdtype" onclick="rdTypeChange_Click()" />Labour
                                                </div>
                                            </div>
                                            <div class="col-md-3">
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
                                            <div class="col-md-6">
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
                                            <div class="col-md-3">
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
                                            <div class="col-md-3">
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
                                            <div class="col-md-3">
                                                <label for="modelname" class="labelclass">
                                                    Rate :</label>
                                                <br />
                                                <div class="input-group margin-bottom-sm">
                                                    <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                    </span>
                                                    <input type="text" class="form-control" id="txtRate" maxlength="10" placeholder="Rate"
                                                        autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)" onkeyup="myFunc(this);"
                                                        ondrop="return false;" onpaste="return false;" />
                                                </div>
                                            </div>
                                            <div class="col-md-3" style="display: none;">
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
                            <div align="center">
                                <asp:LinkButton ID="lnkExporttoPDF" runat="server" Text="." ForeColor="White" OnClick="ExportToPdf_Click"></asp:LinkButton>
                                <button type="button" id="btnPrint" class="btn btn-success" onclick="btnprintDetails_click()">
                                    Print</button>
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
                                                    Created / Updated Details
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
            <br />

             <asp:HiddenField ID="printrecordID" ClientIDMode="Static" runat="server" />

            <rsweb:reportviewer id="ReportViewer1" runat="server" Visible="false">
            </rsweb:reportviewer>
            
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="lnkExporttoPDF" />
        </Triggers>
    </asp:UpdatePanel>
    <script language="javascript">
        function btnprintDetails_click(printid) {
            ////var servicetypeid = $('#txtDSlipNo').html();
            $("#printrecordID").val(printid);
            document.getElementById("<%=lnkExporttoPDF.ClientID %>").click();

        }
    </script>
</asp:Content>
