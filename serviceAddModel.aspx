<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="serviceAddModel, App_Web_y0qsyvj2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/ServiceAddModel.js" type="text/javascript"></script>
    <%-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.5/r-2.2.9/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.5/r-2.2.9/datatables.min.js"></script>
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css" />
    --%>
    <%-- <script src="JSforModalwindowandDatatable/jquery-1.11.3.min.js" type="text/javascript"></script>
     <script src="JSforModalwindowandDatatable/bootstrap.min.js" type="text/javascript"></script>--%>
    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
    <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
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
                        Service Model Master
                    </div>
                    <div class="col-md-8">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Model</button>
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 30px; width: 70%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add Model
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
                                                        Name:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtName" maxlength="90" placeholder="Model Name"
                                                            onkeypress="return /[0-9a-zA-Z ,&]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                                </div>
                                                <%--<div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Service Type:</label>
                                                    <br />
                                                    <input type="text" id="modelID" style="display:none;" />
                                                    <input type="hidden" name="recordID" id="Hidden1" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlServiceType" name="ddlServiceType" class="form-control">
                                                           <option value="1" selected="selected">First Service</option>
                                                            <option value="2" >Second Service</option>
                                                             <option value="3" >Third Service</option>
                                                              <option value="4" >Fourth Service</option>
                                                               <option value="5" >Fifth Service</option>

                                                        </select>
                                                    </div>
                                                </div>--%>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-2">
                                                    <br />
                                                    <label for="modelname" class="labelclass">
                                                        Service:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    <br />
                                                    <label for="modelname" class="labelclass">
                                                        From KM:</label>
                                                </div>
                                                <div class="col-md-3">
                                                    <br />
                                                    <label for="modelname" class="labelclass">
                                                        To KM:</label></div>
                                                <div class="col-md-2">
                                                    <br />
                                                    <label for="modelname" class="labelclass">
                                                        From Days:
                                                    </label>
                                                </div>
                                                <div class="col-md-2">
                                                    <br />
                                                    <label for="modelname" class="labelclass">
                                                        To Days:</label></div>


                                                         <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype0" maxlength="20" placeholder="PDI"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="PDI" ondrop="return false;"
                                                            onpaste="return false;"  readonly="readonly" style="background-color:#E9E9E9;"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm0" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm0" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays0" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays0" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>



                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype1" maxlength="20" placeholder="First"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="First" ondrop="return false;"
                                                            onpaste="return false;"  readonly="readonly" style="background-color:#E9E9E9;"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm1" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm1" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays1" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays1" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype2" maxlength="20" placeholder="Service Type"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="Second" ondrop="return false;"
                                                            onpaste="return false;" readonly="readonly" style="background-color:#E9E9E9;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm2" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm2" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays2" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays2" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype3" maxlength="20" placeholder="Service Type"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="Third" ondrop="return false;"
                                                            onpaste="return false;" readonly="readonly" style="background-color:#E9E9E9;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm3" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm3" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays3" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays3" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype4" maxlength="20" placeholder="Service Type"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="Fourth" ondrop="return false;"
                                                            onpaste="return false;" readonly="readonly" style="background-color:#E9E9E9;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm4" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm4" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays4" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays4" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype5" maxlength="20" placeholder="Service Type"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="Fifth" ondrop="return false;"
                                                            onpaste="return false;" readonly="readonly" style="background-color:#E9E9E9;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm5" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm5" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays5" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays5" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype6" maxlength="20" placeholder="Service Type"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="Sixth" ondrop="return false;"
                                                            onpaste="return false;" readonly="readonly" style="background-color:#E9E9E9;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm6" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm6" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays6" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays6" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype7" maxlength="20" placeholder="Service Type"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="Seventh" ondrop="return false;"
                                                            onpaste="return false;" readonly="readonly" style="background-color:#E9E9E9;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm7" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm7" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays7" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays7" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype8" maxlength="20" placeholder="Service Type"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="Eighth" ondrop="return false;"
                                                            onpaste="return false;" readonly="readonly" style="background-color:#E9E9E9;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm8" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm8" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays8" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays8" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype9" maxlength="20" placeholder="Service Type"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="Nineth" ondrop="return false;"
                                                            onpaste="return false;" readonly="readonly" style="background-color:#E9E9E9;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm9" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm9" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays9" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays9" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtservicetype10" maxlength="20" placeholder="Service Type"
                                                            onkeypress="return /[A-Z a-z]/i.test(event.key)" value="Tenth" ondrop="return false;"
                                                            onpaste="return false;"  readonly="readonly" style="background-color:#E9E9E9;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromkm10" maxlength="20" placeholder="From KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttokm10" maxlength="20" placeholder="To KM"
                                                            onkeypress="return /[0-9.]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtfromdays10" maxlength="20" placeholder="From Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txttodays10" maxlength="20" placeholder="To Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" value="0" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                            </div>
                                            <%-- <div class="form-group">
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Days:</label>
                                                    <br />
                                                   
                                                    <input type="hidden" name="recordID" id="Hidden4" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtvdays" maxlength="7" placeholder="Days"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                            </div>--%>
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
                        <table id="tblRecords" class="table table-bordered  table-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        Sr#
                                    </th>
                                    <th>
                                        Model Name
                                    </th>
                                    <th>
                                        Service Type
                                    </th>
                                    <th>
                                        From / To KM
                                    </th>
                                    <th>
                                       From Days / To Days
                                    </th>
                                    
                                    <th>
                                        Service Type
                                    </th>
                                    <th>
                                        From / To KM
                                    </th>
                                    <th>
                                       From Days / To Days
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
