<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="taxInvoice, App_Web_y0qsyvj2" %>



<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

   

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/TaxInvoiceMaster.js" type="text/javascript"></script>
     <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
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
            <asp:HiddenField ID="hdnPrintPermission" ClientIDMode="Static" runat="server" />
            <table id="tabledata">
            </table>
            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Tax Invoice Details
                       
                    </div>
                    
                    <div class="col-md-8" style="display:none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Tax Invoice</button>
                    </div>
                </div>
                <div class="modal-body">
                    <br />
                  
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="form-group">

                            <div class="col-md-12 well well-sm">
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        IRN:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtirn" maxlength="100" placeholder="IRN" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        IRN Ack No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtirnackno" maxlength="50" placeholder="IRN Ack No" />
                                    </div>
                                </div>
                                 <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        IRN Ack Date:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtirnackdt" maxlength="10" placeholder="IRN Ack Date"
                                           onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                <form id="frmirnupload">
                                     <div class="col-md-3" id="divuploadfiles" style="display: none;">
                                                        <br />
                                                        <div class="col-md-6">
                                                            <input type="file" id="postedfileirn" name="postedfileirn" />
                                                            <asp:HiddenField ID="hiddenIRNfileName" runat="server" ClientIDMode="Static" />
                                                            <span id="lblMessageirn" style="color: Green"></span>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input type="button" id="btnuploadfileirn" class="btn btn-danger" value="Upload" onclick="btnUploadFileIRN();" />
                                                            <progress id="fileProgressirn" style="display: none"></progress>
                                                        </div>

                                                         <div class="col-md-3">
                                                            <input type="hidden" id="hdnviewfileid" name="hdnviewfileid" />
                                                            <input type="button" id="btnviewfile" class="btn btn-warning" value="View File" onclick="DownloadFileIRN()"; />
                                                            
                                                        </div>

                                                    </div>
                               </form>
                               
                            </div>
                                <div class="col-md-6" >
                                    <label for="modelname" class="labelclass">
                                        Name1:</label>
                                    <br />
                                    <input type="hidden" name="recordID" id="recordID" value="">
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpname1" maxlength="50" placeholder="Name"
                                            autocomplete="off" />
                                        <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                    </div>
                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                </div>
                               <%-- <div class="col-md-4" style="display:none;">
                                    <label for="modelname" class="labelclass">
                                        Slip Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtDate" maxlength="10" placeholder="Slip Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>--%>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Invoice No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtinvno" maxlength="100" placeholder="Invoice No" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Name2:</label>
                                    <br />
                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpname2" maxlength="50" placeholder="Name"
                                            />   <%--onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Invoice Date:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtinvdt" maxlength="10" placeholder="Invoice Date"
                                           onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                        <%--ondrop="return false;" onpaste="return false;"--%>
                                    </div>
                                </div>
                                <div class="col-md-6" >
                                    <label for="modelname" class="labelclass">
                                        Address1:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-home fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpadd1"  maxlength="40" placeholder="Address" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Model:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpmodel" maxlength="50" placeholder="Model" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Address2:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">

                                     <span class="input-group-addon"><i class="fa fa-home fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpadd2"  maxlength="50" placeholder="Address" />

                                        <%--<span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlStatus" class="form-control">
                                            <option value="0">Please Select</option>
                                            <option value="1">Open</option>
                                            <option value="2">Closed</option>
                                        </select>--%>
                                    </div>
                                </div>

                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Chasis No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtchasisno" maxlength="50" placeholder="Chasis No" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Address3:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpadd3" maxlength="50" placeholder="Address" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Insurance Company:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtinscomp" maxlength="50" placeholder="Insurance Company" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        State:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpadd4" maxlength="50" placeholder="State" />
                                    </div>
                                </div>
                                <div class="col-md-6" style="visibility:hidden;">
                                     <label for="modelname" class="labelclass">
                                      State  </label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="Text1" maxlength="50" placeholder="State" />
                                    </div>

                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Phone No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpphone" maxlength="10" placeholder="Phone No" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Insurance Type:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtinstype" value="Comprehensive" maxlength="50" placeholder="Insurance Type" />
                                    </div>
                                </div>
                                 <div class="col-md-6" style="display:none;">
                                    <label for="modelname" class="labelclass">
                                        Country:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtCountry" maxlength="50" placeholder="Country" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Customer GSTN:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtcgstn" maxlength="50" placeholder="Customer GST" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Insurance Expiry Date:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtinsexpdt"  maxlength="10" placeholder="Ins. Expiry Date"
                                           onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        AC Code:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtaccode" maxlength="50" placeholder="AC Code" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        KMS:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtkms" maxlength="50" placeholder="KMS" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Add:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtradd1" maxlength="50" placeholder="Address" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Veh. Regn. No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtvehregno" maxlength="50" placeholder="Veh. Regn. No" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Address:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtradd2" maxlength="50" placeholder="Address" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Job Card No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtjobcardno" maxlength="50" placeholder="Job Card No" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Address:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtradd3" maxlength="50" placeholder="Address" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Job Card Date:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtjobcarddt" maxlength="10" placeholder="Job Card Date"
                                           onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Address:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtradd4" maxlength="50" placeholder="Address" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Service Request Type:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtservicerequesttype" value="Accident" maxlength="50" placeholder="Service Request Type" />
                                    </div>
                                </div>
                                 <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        State:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtrstate" maxlength="50" placeholder="State" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Customer PO:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtcustpono" maxlength="50" placeholder="Customer PO" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Country:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtrcountry" maxlength="50" placeholder="Country" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Payment Method:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpaymentmethod" value="CREDIT" maxlength="50" placeholder="Payment Method" />
                                    </div>
                                </div>
                               <%-- <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Payment Method:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtPaymentMethod2" maxlength="50" placeholder="Payment Method" />
                                    </div>
                                </div>--%>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Phone No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtphone2" maxlength="10" placeholder="Phone No" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Warrenty Expired?:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtwarrentyexp" value="N" maxlength="50" placeholder="Warrenty Expired" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Customer GSTN:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtcgstn2" maxlength="50" placeholder="GSTN" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Dealer PAN:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtdealerpan" value="AQUPS1443H" maxlength="50" placeholder="Dealer PAN" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        AC Code:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtaccode2" maxlength="50" placeholder="AC Code" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Dealer GST:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtdealergstn" value="06AQUPS1443H1ZH" maxlength="50" placeholder="Dealer GSTN" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        Place of Supply:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtplaceofsupply" maxlength="50" placeholder="Place of Supply" />
                                    </div>
                                </div>
                                <div class="col-md-6" style="display:none;">
                                    <label for="modelname" class="labelclass">
                                        Next Service Date:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtnextservicedt" maxlength="10" placeholder="Invoice Date"
                                           onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                             
                                <div class="col-md-6">
                                    <label for="modelname" class="labelclass">
                                        PAN No:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtpanno" maxlength="20" placeholder="PAN No" />
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div align="center" style="background-color: #F7F7F7;">
                            <button type="button" class="btn btn-danger" id="btnAddNewSlipMaster" name="btnAddNewSlipMaster" onclick="return AddRecord();">
                                Add</button>
                            <button type="button" class="btn btn-primary" id="btnUpdateSlipMaster" name="btnUpdateSlipMaster" style="display: none;"
                                onclick="UpdateRecord();">
                                Update</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" id="btnReset" onclick="clearTextBox();">
                                Reset
                            </button>
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>--%>
                        </div>
                    </div>
                   
                </div>

                 <asp:LinkButton ID="lnkExporttoExcel"  runat="server" Text="." ForeColor="White" OnClick="lnkExporttoExcel_Click" ></asp:LinkButton>

                  <asp:LinkButton ID="lnkExporttoPDF"  runat="server" Text="." ForeColor="White" OnClick="ExportToPdf_Click"></asp:LinkButton>

                 <%--<input type="hidden" runat="server" name="printrecordID" id="printrecordID" value="">--%>

                 <asp:HiddenField ID="printrecordID" ClientIDMode="Static" runat="server" />
                  <asp:HiddenField ID="hdnuploadexcel" ClientIDMode="Static" runat="server" />

                <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 30px; width: 80%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add  Details
                                    </h4>
                                </div>
                                <div class="col-md-12" style="padding-top:6px;">
                                    <div class="col-md-3">
                                        <div class="col-md-4">
                                            ID:
                                        </div>
                                        <div class="col-md-8">
                                            <div id="txtDTaxMasterID" style="color: Red; font-weight: bold;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="col-md-5">
                                            Invoice No:
                                        </div>
                                        <div class="col-md-7">
                                            <div id="txtInvNo" style="color: Red; font-weight: bold;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-4">
                                            Job Card No:
                                        </div>
                                        <div class="col-md-8">
                                            <div id="txtJobCardNo" style="color: Red; font-weight: bold;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="modal-body">
                                   
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                            <div class="form-group">
                                             <div class="col-md-6" style="display:none;">
                                                    <label for="modelname" class="labelclass">
                                                        Sr#:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <input type="text" class="form-control" id="txtSrNo" value="1"  maxlength="3" placeholder="Sr No"    />
                                                    </div>
                                                </div>
                                                

                                             <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Part#:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <input type="text" class="form-control" id="txtPartNo" onfocusout="GetPartDetailsbyPartNo()" maxlength="50" placeholder="PartNo"    />
                                                    </div>
                                                </div>

                                                 <div class="col-md-4" style="display:none;">
                                                    <label for="modelname" class="labelclass">
                                                        HSN Code:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <input type="text" class="form-control" id="txtHSNCode"  maxlength="50" placeholder="HSN Code"    />
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
                                                        <input type="text" class="form-control" id="txtQuantity" value="1" maxlength="10" placeholder="Quantity"
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
                                                            autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)" onkeyup="myFunc(this);"
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                                 <div class="col-md-12 well well-sm" >
                                                 <form>
            <div class="col-md-6">
             <input type="file" id="postedFile" name="postedFile" />
                                                        <asp:HiddenField ID="hiddenFileName" runat="server" ClientIDMode="Static" />
                                                        <span id="lblMessage" style="color: Green"></span>

                
                 
               <%-- <asp:FileUpload ID="FileUpload1" runat="server" />--%>
            </div>
            <%--<div class="col-md-3">
                <asp:LinkButton ID="btnUpload" Text="" OnClick="Upload" runat="server" />
                <br />
                     <button type="button" class="btn btn-danger" id="btnUpload2" onclick="btnUploadExcel();">
                                        Upload Excel</button>

            </div>--%>
            <div class="col-md-3">
            <input type="button" id="btnUpload" value="Upload" class="btn btn-success" onclick="btnUploadFile();" />
                  <progress id="fileProgress" style="display: none"></progress>
        </div>
        </form>
        </div>



                                                <div class="col-md-6" style="display:none;">
                                                    <label for="modelname" class="labelclass">
                                                        CGST Rate :</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtcgstrate" maxlength="10" placeholder="CGST Rate"
                                                            autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)" 
                                                            ondrop="return false;" onpaste="return false;" /> <%--onkeyup="myFunc(this);"--%>
                                                    </div>
                                                </div>

                                                <div class="col-md-3" style="display:none;">
                                                    <label for="modelname" class="labelclass">
                                                        CGST Amount :</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtcgstamount" maxlength="20" placeholder="CGST Amount"
                                                            autocomplete="off" readonly onkeypress="return /[0-9.]/i.test(event.key)" onkeyup="myFunc(this);"
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                <div class="col-md-6" style="display:none;">
                                                    <label for="modelname" class="labelclass">
                                                        SGST Rate :</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtsgstrate" maxlength="10" placeholder="SGST Rate"
                                                            autocomplete="off" onkeypress="return /[0-9.]/i.test(event.key)" 
                                                            ondrop="return false;" onpaste="return false;" /> <%--onkeyup="myFunc(this);"--%>
                                                    </div>
                                                </div>

                                                <div class="col-md-3" style="display:none;">
                                                    <label for="modelname" class="labelclass">
                                                        SGST Amount :</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtsgstamount" maxlength="20" placeholder="SGST Amount"
                                                            autocomplete="off" readonly onkeypress="return /[0-9.]/i.test(event.key)" onkeyup="myFunc(this);"
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>



                                                <div class="col-md-4" style="display:none;">
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
                                   
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" id="btnAddNewDetails" onclick="return AddRecordDetails();">
                                        Add</button>
                                    <button type="button" class="btn btn-primary" id="btnUpdateDetails" 
                                        onclick="UpdateRecordDetails();">
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
                                   <%-- <th>
                                        Sr#
                                    </th>--%>
                                     <th>
                                        Sr No
                                    </th>
                                    <th>
                                        HSN Code
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
                                        CGST%
                                    </th>
                                    <th>
                                        CGST Amt
                                    </th>
                                    <th>
                                        SGST %
                                    </th>
                                   <th>
                                        SGST Amt
                                    </th>
                                    <th>
                                        Edit
                                    </th>

                                    <th >
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

                <div align="center">
                    <asp:RadioButton ID="rdCGSTSGST" GroupName="ratetype" runat="server" Text="CGST/SGST" Checked="true" />
                    &nbsp; &nbsp;
                     <asp:RadioButton ID="rdIGST" GroupName="ratetype" runat="server" Text="ISGT" />
                </div>

                <div class="col-md-12" align="center" style="background-color: White !important;">
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
                                        Name
                                    </th>
                                    <th>
                                        Model
                                    </th>
                                    <th>
                                        Phone No
                                    </th>
                                    <th>
                                        Insurance Company
                                    </th>
                                   
                                    <th>
                                       Vehicle No
                                    </th>

                                    <th>
                                       Chasis No
                                    </th>
                                      <th>
                                        Invoice No
                                    </th>
                                    <th>
                                        Invoice Date
                                    </th>
                                    <th>
                                        Add Parts and Labour
                                    </th>

                                     <th>
                                        Created / Updated By
                                    </th>

                                    <th>
                                        Edit
                                    </th>
                                    <th >
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

             <br />
          
            <rsweb:ReportViewer ID="ReportViewer1" runat="server">
            </rsweb:ReportViewer>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="lnkExporttoExcel" />
            <asp:PostBackTrigger ControlID="lnkExporttoPDF" />
           <%-- <asp:PostBackTrigger ControlID="btnUpload" />--%>
        </Triggers>
    </asp:UpdatePanel>
   
   <script language="javascript">
       function PrintPDF(id) {
           $("#printrecordID").val(id);
           /////document.getElementById("<%=lnkExporttoExcel.ClientID %>").click();
           document.getElementById("<%=lnkExporttoPDF.ClientID %>").click();

       }


       function ExportToExcel(id) {
           $("#printrecordID").val(id);
           /////document.getElementById("<%=lnkExporttoExcel.ClientID %>").click();
           document.getElementById("<%=lnkExporttoExcel.ClientID %>").click();

       }

   </script>

</asp:Content>