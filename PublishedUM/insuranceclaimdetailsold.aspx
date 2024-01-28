<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="insuranceclaimdetails, App_Web_gdx0w2k3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   


    <script src="datatableCSSJS/1jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/2dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/3jszip.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/4pdfmake.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/5vfs_fonts.js" type="text/javascript"></script>
            <script src="datatableCSSJS/6buttons.html5.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/7buttons.colVis.min.js" type="text/javascript"></script>


             <script src="DataTableActions/InsuranceClaimsMaster.js" type="text/javascript"></script>

    <%-- <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>--%>
   <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />



    <%-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.5/r-2.2.9/datatables.min.css"/>
 
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
            <table id="tabledata"></table>


            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Insurance Claims Master 
                        
                    </div>
                    <div class="col-md-8">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New Claim</button>
                    </div>
                      
                </div>
                <div class="container">
                    <div class="modal fade" id="myModal"  role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 20px; width:70%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add New Claim
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
                                                        Insurance Company:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlInsuranceCompany" class="form-control" style="width:100%;">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Repairer:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlRepair" class="form-control">
                                                            <option value="0" selected="selected">Please Select</option>
                                                             <option value="1" > United Motors </option>
                                                              <option value="2" > Vipin Automobiles </option>
                                                               <option value="3" > Others </option>
                                                        </select>
                                                    </div>
                                                </div>

                                               

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Insurance Type:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlInsuranceType" class="form-control">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Estimated Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtEstimatedDate" maxlength="10" placeholder="Estimated Date" onkeydown="return false;" 
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Vehicle No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtVehChasisNo" maxlength="25" placeholder="Veh./Chasis No"
                                                            onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                         Date of Loss (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDateofLoss" maxlength="10" placeholder="Date of Loss" onkeydown="return false;" 
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Cust Name:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtName" maxlength="50" placeholder="Customer Name"  />
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
                                                        Contact No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtMobileNo" maxlength="10" placeholder="Mobile No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>



                                                <div class="col-md-6" style="padding-left:30px;"> 
                                                    <label for="modelname" class="labelclass">
                                                        Claim Status:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                      <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <select id="ddlClaimStatus" class="form-control" style="width:100%;">
                                                            <option value="0" selected="selected">Please Select</option>
                                                             <%--<option value="1" > Paid </option>
                                                              <option value="2" > Under Repair </option>
                                                               <option value="3" > Total Loss </option>--%>
                                                        </select>
                                                    </div>
                                                </div>

                                                </div>
                                               <div class="row col-md-12">

                                                <%-- <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Survey Type:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <select id="ddlSurveyTypeSpot" class="form-control">                                                            
                                                             <option value="1" > Spot Survey </option>                                                             
                                                        </select>
                                                    </div>
                                                </div>--%>

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                     Spot Surveyor Name:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlSurveyorSpot" class="form-control" style="width:100%;">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>

                                              <%--  <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Survey Type:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <select id="ddlSurveyTypeFinal" class="form-control">                                                           
                                                              <option value="2" > Final Survey </option>
                                                        </select>
                                                    </div>
                                                </div>--%>
                                                 <div class="col-md-6" style="padding-left:30px;">
                                                    <label for="modelname" class="labelclass">
                                                      Final Surveyor Name:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlSurveyorFinal" class="form-control" style="width:100%;">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <%-- <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Survey Type:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                         <select id="ddlSurveyTypeReinspection" class="form-control">
                                                               <option value="3" > Re-Inspection </option>
                                                        </select>
                                                    </div>
                                                </div>--%>
                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                      Re-Inspection Surveyor Name:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlSurveyorReInspection" class="form-control" style="width:100%;">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                               

                                                <div class="col-md-6" >
                                                    <label for="modelname" class="labelclass">
                                                       Insurance Due Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtInsDueDate" maxlength="10" placeholder="Insurance Due Date" onkeydown="return false;" 
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Policy No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtPolicyNo" maxlength="45" placeholder="Policy No"
                                                            onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                         Invoice Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtInvoiceDate" maxlength="10" placeholder="Invoice Date" onkeydown="return false;" 
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                                 <div class="col-md-12" >
                                                    <label for="modelname" class="labelclass">
                                                      Remarks:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtRemarks" maxlength="200" placeholder="Remarks" />

                                                        

                                                    </div>
                                                </div>

                                                <div class="col-md-12" >
                                                    <label for="modelname" class="labelclass">
                                                      Whatspp Message:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                       <textarea class="form-control" id="txtMessage" name="txtMessage" cols="40" rows="5" placeholder="Message"></textarea>

                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>

                                   
                                      <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" id="btnAdd" onclick="return AddRecord();">
                                        Add</button>

                                         <button type="button" class="btn btn-success" id="btnSendWhtsAppMsg" style="display: none;"
                                        onclick="SendWhatsappMessage();">
                                        Send Whatsapp Msg</button>
                                        &nbsp;&nbsp;
                                    <button type="button" class="btn btn-primary" id="btnUpdate" style="display: none;"
                                        onclick="UpdateRecord();">
                                        Update</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close</button>
                                </div>
                                    </form>
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

                           <div id="divExportButtons" runat="server" style="margin-bottom:-40px; display:none;" >
                             <asp:LinkButton id="lnkExcel" runat="server" OnClick="lnkExcel_Click" > <img src="img/btnexcel.jpg" height="60" width="100px" alt="Excel" /> </asp:LinkButton>
                        &nbsp;
                         <asp:LinkButton id="lnkPdf" Visible="false" runat="server" OnClick="lnkPdf_Click" > <img src="img/pdf3.png" height="40" alt="PDF" /> </asp:LinkButton>
                        </div>

                        <table id="tblRecords" class="table table-bordered  table-responsive">
                            <thead>
                                <tr>
                                   
                                    <th>
                                        ID
                                    </th>

                                   <%-- <th>
                                        Sr#
                                    </th>--%>
                                      <th class="text-nowrap">
                                        Customer Name <br />
                                        (Mobile No)
                                    </th>
                                    <th class="">
                                       Veh. No
                                    </th>
                                    <th class="">
                                        Company Name
                                    </th>
                                    <%-- <th class="">
                                        Policy No
                                    </th>--%>
                                    
                                    <th class="">
                                        Repairer
                                    </th>
                                     <th class="">
                                        Estimated Date and  Invoice Date
                                    </th>
                                     <th class="">
                                        Days
                                    </th>
                                     <th class="">
                                        Model & Insurance Type
                                    </th>
                                    <th class="">
                                       Surveyor
                                    </th>
                                                                        
                                     <th class="">
                                       Claim Status
                                    </th>

                                     <th class="">
                                       Remarks
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

           
            


        </ContentTemplate>
       <Triggers>
        <asp:PostBackTrigger ControlID="lnkExcel" />
       </Triggers>
    </asp:UpdatePanel>
</asp:Content>


