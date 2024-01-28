<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="premiumcalculator, App_Web_xgwfkdro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <script src="DataTableActions/PremiumCalculator.js" type="text/javascript"></script>--%>
    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
    <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script type="text/javascript">  
<!--
        function printPartOfPage(elementId) {
            var printContent = document.getElementById(elementId);
            var windowUrl = 'about:blank';
            var uniqueName = new Date();
            var windowName = 'Print' + uniqueName.getTime();
            var printWindow = window.open(windowUrl, windowName, 'left=50000,top=50000,width=0,height=0');
            printWindow.document.write(printContent.innerHTML);
            printWindow.document.close();
            printWindow.focus();
            printWindow.print();
            printWindow.close();
        }  
// -->  
    </script>

    <%--<script>
        $(document).ready(function () {
            var currentYear = new Date().getFullYear()
            max = currentYear + 1
            var option = "";
            for (var year = currentYear - 15; year <= max; year++) {

                var option = document.createElement("option");
                option.text = year;
                option.value = year;

                document.getElementById("ddlModelYear").appendChild(option)

            }
            document.getElementById("ddlModelYear").value = currentYear;
        });
    </script>--%>
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
                        Premium Calculator
                    </div>
                    <div class="col-md-2" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New</button>
                    </div>
                    <div align="center" class="col-md-6">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true" />
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
                            <div class="form-group" />
                            <input type="hidden" name="recordID" id="recordID" value="">
                            <div class="col-md-12">
                                <%-- <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtDate" name="txtDate" maxlength="10" placeholder="Payment Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                    </div>
                                </div>--%>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Select Company :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                       <%-- <select id="ddlcompany" class="form-control" runat="server" clientidmode="Static">
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>--%>

                                         <asp:DropDownList ID="ddlcompany" runat="server" ClientIDMode="Static" CssClass="form-control">
                                         
                                        </asp:DropDownList>

                                    </div>
                                </div>

                                 <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Model Year:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <asp:DropDownList ID="ddlModelYear" runat="server" ClientIDMode="Static" CssClass="form-control">
                                         
                                        </asp:DropDownList>
                                      <%--  <select id="ddlModelYear" class="form-control" runat="server" clientidmode="Static">
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>--%>
                                    </div>
                                    
                                </div>

                               <%-- <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Date of Sale:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtDate" clientidmode="Static"
                                            maxlength="10" placeholder="Date of Sale" onkeydown="return false;" ondrop="return false;"
                                            onpaste="return false;" autocomplete="off" />
                                    </div>
                                    
                                </div>--%>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        IDV:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtidv" clientidmode="Static"
                                            maxlength="30" placeholder="IDV" autocomplete="off" required onkeypress="return /[0-9]/i.test(event.key)"
                                            onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        IDV Trolly:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtIDVTrolly" value="0"
                                            clientidmode="Static" maxlength="30" placeholder="IDV Trolly" autocomplete="off"
                                            required onkeypress="return /[0-9]/i.test(event.key)" onkeyup="myFunc(this);"
                                            ondrop="return false;" onpaste="return false;" />
                                    </div>
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        IDV Electrical Accessories:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtidvelectricalaccess"
                                            value="0" clientidmode="Static" maxlength="30" placeholder="IDV Elect. Access."
                                            autocomplete="off" required onkeypress="return /[0-9]/i.test(event.key)" onkeyup="myFunc(this);"
                                            ondrop="return false;" onpaste="return false;" />
                                    </div>
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>
                                <div class="col-md-3">
                                    <label for="paymentto" id="paymentto" class="labelclass">
                                        GVW:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtGVW" clientidmode="Static"
                                            maxlength="30" placeholder="GVW" autocomplete="off" required onkeypress="return /[0-9]/i.test(event.key)"
                                            onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        OD Disc.:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtoddisc" runat="server" value="0" clientidmode="Static"
                                            maxlength="30" placeholder="OD Disc" autocomplete="off" required onkeypress="return /[0-9 .-]/i.test(event.key)"
                                            onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        NCB:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                       <%-- <select id="ddlncb" class="form-control" runat="server" clientidmode="Static">
                                            <option value="0" selected="selected">Please Select</option>
                                            <option value="1">0</option>
                                            <option value="2">20</option>
                                            <option value="3">25</option>
                                            <option value="4">35</option>
                                            <option value="5">45</option>
                                            <option value="6">50</option>
                                        </select>--%>

                                          <asp:DropDownList ID="ddlncb" runat="server" ClientIDMode="Static" CssClass="form-control">
                                            <asp:ListItem Value="0">Select NCB</asp:ListItem>
                                             <asp:ListItem Value="1">0</asp:ListItem>
                                              <asp:ListItem Value="2">20</asp:ListItem>
                                               <asp:ListItem Value="3">25</asp:ListItem>
                                                <asp:ListItem Value="4">35</asp:ListItem>
                                                 <asp:ListItem Value="5">45</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Towing :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                      <%--  <select id="ddltowing" class="form-control" runat="server" clientidmode="Static">
                                            <option value="0" selected="selected">Please Select</option>
                                            <option value="1">0</option>
                                            <option value="2">10000</option>
                                            <option value="3">20000</option>
                                        </select>--%>
                                         <asp:DropDownList ID="ddltowing" runat="server" ClientIDMode="Static" CssClass="form-control">
                                          <asp:ListItem Value="0">Select Towing</asp:ListItem>
                                             <asp:ListItem Value="1">0</asp:ListItem>
                                              <asp:ListItem Value="2">10000</asp:ListItem>
                                               <asp:ListItem Value="3">20000</asp:ListItem>
                                         </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkimt23" runat="server" clientidmode="Static" name="chkimt23"
                                            value="" checked />
                                        <label for="modelname" class="labelclass">
                                            IMT-23</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chknildep" runat="server" clientidmode="Static" name="chknildep"
                                            value="" checked />
                                        <label for="modelname" class="labelclass">
                                            Nil Dep</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkisgeographical" name="chkisgeographical" runat="server"
                                            clientidmode="Static" value="" checked />
                                        <label for="modelname" class="labelclass">
                                            Is Geographical</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkcng" name="chkcng" value="" runat="server" clientidmode="Static"
                                            checked />
                                        <label for="modelname" class="labelclass">
                                            CNG</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkPA" name="chkPA" runat="server" clientidmode="Static"
                                            value="" checked />
                                        <label for="modelname" class="labelclass">
                                            PA</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkPADriver" name="chkPADriver" runat="server" clientidmode="Static"
                                            value="" checked />
                                        <label for="modelname" class="labelclass">
                                            PA Driver</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkPACleaner" name="chkPACleaner" runat="server" clientidmode="Static"
                                            value="" checked />
                                        <label for="modelname" class="labelclass">
                                            PA Cleaner
                                        </label>
                                    </div>
                                </div>
                                <%-- <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Select TP Rate :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddltprate" class="form-control" runat="server" clientidmode="Static" >
                                            <option value="0" selected="selected">Please Select</option>
                                            
                                        </select>
                                    </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer123" align="center" style="background-color: #F7F7F7;">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" CssClass="btn btn-danger"
                        OnClick="btncalculate_click" />
                    <%-- <button type="button" class="btn btn-danger" id="btnAdd" onclick="return AddRecord();">
                                Save
                            </button>
                            <button type="button" class="btn btn-primary" id="btnUpdate" style="display: none;"
                                onc /li /ck="UpdateRecord();">
                                Update</button>--%>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%-- <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>--%>
                    <%-- <button type="button" class="btn btn-default" onclick="Reset()">
                                Reset</button>--%>
                    <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-success" id="btnSearch" onclick="BindDataTable();">
                                Search
                            </button>
                             &nbsp;&nbsp;
                              <asp:LinkButton id="lnkExcel" runat="server" OnClick="lnkExcel_Click" > <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>--%>
                </div>
            </div>
            <div id="divPrint">
                <table class="table table-bordered table-condensed">
                    <tr>
                        <td>
                            Basic OD:
                        </td>
                        <td>
                            <asp:Label ID="lblbasicod" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Basic TP Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblBasicTPPremium" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            GVW Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblgvwpremium" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                          PA  Owner Driver Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblownerpremium"  Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Cleaner Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblCleanerPremium" Text="50" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Driver Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblDriverpremium" Text="50" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Total Basic OD:
                        </td>
                        <td>
                            <asp:Label ID="lbltotalbasicod" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Total TP Premium:
                        </td>
                        <td>
                            <asp:Label ID="lbltotaltppremium" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            OD Discount:
                        </td>
                        <td>
                            <asp:Label ID="lblODDiscount" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            GST @18%:
                        </td>
                        <td>
                            <asp:Label ID="lbl18gst" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Premium after Zero Dep.
                        </td>
                        <td>
                            <asp:Label ID="lblpremiumafterODDiscout" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            GST @12%:
                        </td>
                        <td>
                            <asp:Label ID="lbl12gst" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td>
                            Premium for Electrical Accessories:
                        </td>
                        <td>
                            <asp:Label ID="lblPremiumforElectricalAccess"  Font-Bold="true" runat="server"></asp:Label>
                        </td>                        
                    </tr>

                    <tr>
                        <td>
                            Discount for Electrical Access. Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblDiscountforElectAccPremium"  Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        
                    </tr>

                     <tr>
                        <td>
                            Net Premium for Elect. Access.:
                        </td>
                        <td>
                            <asp:Label ID="lblNetPremforElectAccess"  Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        
                    </tr>



                    <tr>
                        <td>
                            IMT 23 Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblimt23premium" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Net Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblNetPremium" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Premium after IMT & OD Discount:
                        </td>
                        <td>
                            <asp:Label ID="lblPremiumafterIMTandODDiscount" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Total GST:
                        </td>
                        <td>
                            <asp:Label ID="lblTotalGSTAmt" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nil Dep. Premium before Discount:
                        </td>
                        <td>
                            <asp:Label ID="lblnildeppremiumbeforediscount" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Total Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblTotalPremiumAmt" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Discount on Nil Dep. Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblDiscountonNilDepPremium" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nil Dep. Premium after discount:
                        </td>
                        <td>
                            <asp:Label ID="lblnildeppremiumafterdiscount" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            Net OD Premium before NCB:
                        </td>
                        <td>
                            <asp:Label ID="lblNetODPremium" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td>
                             <asp:Label ID="lblNoClaimBonusText" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNoClaimBonus" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>


                     <tr>
                        <td>
                            Premium for Towing:
                        </td>
                        <td>
                            <asp:Label ID="lblTowingPremium"  Font-Bold="true" runat="server"></asp:Label>
                        </td>                        
                    </tr>

                    <tr>
                        <td>
                            NCB Discount in Towing:
                        </td>
                        <td>
                            <asp:Label ID="lblTowingDiscount"  Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        
                    </tr>

                     <tr>
                        <td>
                            Net Premium of Towing:
                        </td>
                        <td>
                            <asp:Label ID="lblTowingNetPremium"  Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        
                    </tr>



                    <tr>
                        <td>
                            Net OD Premium after NCB:
                        </td>
                        <td>
                            <asp:Label ID="lblNetODPremiumafterNCB" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <%--   <tr>
                        <td>
                            Elec/Non Elec Premium:
                        </td>
                        <td>
                            <asp:Label ID="lblelecnonelecpremium" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Rate:
                        </td>
                        <td>
                            <asp:Label ID="lblrate" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>


                             <tr>
                                <td>
                               Towing Charges:
                                </td>
                                <td>
                                    <asp:Label id="lbltowingcharges" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                                <td>
                                Anti Theft Discount:
                                </td>
                                <td> 
                                 <asp:Label id="lblantitheftdiscount" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                OD Premium Before NCB:
                                </td>
                                <td>
                                    <asp:Label id="lblodpremiumbeforencb" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                                <td>
                                NCB:
                                </td>
                                <td> 
                                 <asp:Label id="lblncb" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                Enhancement Rate:
                                </td>
                                <td>
                                    <asp:Label id="lblenhancementrate" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                                <td>
                                Enhancement Premium:
                                </td>
                                <td> 
                                 <asp:Label id="lblenhancementpremium" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                Total OD Premium:
                                </td>
                                <td>
                                    <asp:Label id="lbltotalodpremium" Text="0" ForeColor="Red" font-bold="true" runat="server"></asp:Label>
                                </td>
                                
                               <td>
                                PA Cover:
                               </td>
                               <td>
                                    <asp:Label id="lblPACover" Text="0"  runat="server"></asp:Label>
                                </td>
                            </tr>




                            <tr>
                               
                                <td>
                               Bifuel Tp Prem:
                                </td>
                                <td> 
                                 <asp:Label id="lblbifueltppremium"  Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                            </tr>

                             <tr>
                                
                                <td>
                                Legal Liability Premium:
                                </td>
                                <td> 
                                 <asp:Label id="lbllegalliabilitypremium" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                            </tr>

                             <tr>
                                <td>
                                NFPP Premium:
                                </td>
                                <td>
                                    <asp:Label id="lblnfpppremium" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>

                             <tr>
                                <td>
                                Gross Premium:
                                </td>
                                <td>
                                    <asp:Label id="lblgrosspremium" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                                <td>
                                GST:
                                </td>
                                <td> 
                                 <asp:Label id="lblgst" font-bold="true"  Text="0" runat="server"></asp:Label>
                                </td>
                            </tr>

                             <tr>
                                <td>
                                Total Premium:
                                </td>
                                <td>
                                    <asp:Label id="lbltotalpremium" ForeColor="Red" Text="0" font-bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                    --%>
                </table>
            </div>
            <div align="center">
                <input type="button" class="btn btn-danger" value="Print" onclick="JavaScript:printPartOfPage('divPrint');" />
            </div>
            </form> </div>
            <%-- </div>
                        </div>
                    </div>
                </div>--%>
            <div class="col-md-12" style="background-color: White !important;">
                <div class="c1">
                    <div id="Showoverlay" class="overlayWindow">
                        <h2>
                            Loading .. Please wait</h2>
                    </div>
                </div>
            </div>
            </div>
            <%-- <div class="row col-md-12">
            <div class="col-md-4">&nbsp;</div>
                <div class="col-md-4" align="center">
                <div class="col-md-2">
                Date:
                </div>
                <div class="col-md-2">
                    <input type="text" id="txtSearchbyDate" name="txtSearchbyDate" />
                </div>
            </div>
            </div>--%>
            <div class="col-md-12" style="display: none;">
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
                                Year of Mfg.
                            </th>
                            <th>
                                IDV
                            </th>
                            <th>
                                GVW
                            </th>
                            <th>
                                OD Disc
                            </th>
                            <th>
                                NCB
                            </th>
                            <th>
                                Towing
                            </th>
                            <%-- <th>
                                        Discount
                                    </th>
                                     <th>
                                        Remarks
                                    </th>--%>
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
        </ContentTemplate>
        <Triggers>
            <%-- <asp:PostBackTrigger ControlID="lnkExcel" />--%>
            <%-- <asp:PostBackTrigger ControlID="lnkPdf" />--%>
        </Triggers>
    </asp:UpdatePanel>
    <script type="text/javascript">
                  $(document).ready(function () {

////                      // Initialize select2
////                      $("#ddlPaymentTo").select2();
                      ////                      $("#ddlPaymentToBank2").select2();

                        });


                         $(function () {
            showCalendar(); // bind data table on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(showCalendar); // bind data table on every UpdatePanel refresh
        });

        function showCalendar()
        {
 $('#txtDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
    }

                
    </script>
</asp:Content>
