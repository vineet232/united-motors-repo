<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="masterdesignation, App_Web_xgwfkdro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/DesignationMaster.js" type="text/javascript"></script>
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
            <div >
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Designation Master
                    </div>
                    <div class="col-md-8">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Designation</button>
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
                                        Add Designation
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
                                                        Designation:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                     <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i></span>
                                                    <input type="text" class="form-control" id="txtDesignation" maxlength="50" placeholder="Designation" 
                                                          /> <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                                        </div>
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
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
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        Sr#
                                    </th>
                                    <th>
                                        Designation
                                    </th>
                                    <th>
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

