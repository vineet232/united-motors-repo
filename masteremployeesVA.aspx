<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="masteremployeesVA, App_Web_h5d101sg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/EmployeeMasterva.js" type="text/javascript"></script>

    <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />

    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
   <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

      <script src="pagination/select.js" type="text/javascript"></script>
    <script src="pagination/input.js" type="text/javascript"></script>
    <script src="pagination/full_numbers_no_ellipses.js" type="text/javascript"></script>
    <script src="pagination/scrolling.js" type="text/javascript"></script>

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
                        Employee Master
                         &nbsp; &nbsp; &nbsp; 
                         <asp:LinkButton id="lnkExcel" runat="server" OnClick="lnkExcel_Click" > <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>
                        &nbsp;
                    </div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New Employee
                        </button>
                        
                    </div>
                    <div class="col-md-4" style="display: none;">
                        &nbsp;
                         <asp:HiddenField ID="hdnExtraPermission" ClientIDMode="Static" runat="server" />
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 40px; width: 70%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add New Employee
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                            <div class="form-group">
                                             <div class="row">
                                                <div class="col-md-6" style="padding-left:25px;">
                                                    <label for="modelname" class="labelclass">
                                                        Employee Name:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtName" maxlength="50" placeholder="Employee Name"
                                                            autocomplete="off" />
                                                    </div>
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Designation:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlDesignation" class="form-control" style="width: 95%;">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
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
                                                            onkeypress="return /[0-9]/i.test(event.key)" autocomplete="off" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Date of Joining (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDOJ" maxlength="10" placeholder="D.O.J"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Date of Birth (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDOB" maxlength="10" placeholder="D.O.B." autocomplete="off"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Aadhaar No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-envelope fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtAadhaarNo" maxlength="12" placeholder="Aadhaar No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" autocomplete="off" 
                                                            onfocusout="return checkUID()" />
                                                    </div>
                                                    <div id="chkAadharStatus" style="color: Red;">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        UAN No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtUANNo" maxlength="20" placeholder="UAN No"
                                                            autocomplete="off" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        ESI No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtESINo" maxlength="12" placeholder="ESI No"
                                                            autocomplete="off" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6" style="display: none;">
                                                    <label for="modelname" class="labelclass">
                                                        Dress:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-suitcase fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlDress" class="form-control">
                                                            <option value="0">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6" style="display: none;">
                                                    <label for="modelname" class="labelclass">
                                                        Dress Given on (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDressDate" maxlength="10" placeholder="Dress Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6" style="display: none;">
                                                    <label for="modelname" class="labelclass">
                                                        Salary:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtSalary" maxlength="10" placeholder="Salary"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6" style="display: none;">
                                                    <label for="modelname" class="labelclass">
                                                        Salary Updated on (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtSalaryDate" maxlength="10" placeholder="Salary Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                

                                                 <div class="col-md-6">
                                                        <label for="modelname" class="labelclass">
                                                            Health Insurance Due Date (MM/dd/yyyy):</label>
                                                        <br />
                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                            </span>
                                                            <input type="text" class="form-control" id="txtHealthInsDueDate" maxlength="10" placeholder="Health Due Date" 
                                                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                                        </div>
                                                    </div>

                                                     <div class="col-md-6">
                                                        <label for="modelname" class="labelclass">
                                                             Accidental Insurance Due Date (MM/dd/yyyy):</label>
                                                        <br />
                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                            </span>
                                                            <input type="text" class="form-control" id="txtAccidentalInsDueDate" maxlength="10" placeholder="Accidental Due Date" 
                                                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                                        </div>
                                                    </div>

                                                    

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Opening Balance:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtOpeningBalance" maxlength="15" placeholder="Opening Balance"
                                                            onkeypress="return /[0-9 -.]/i.test(event.key)" onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Opening Balance Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtOpBalDt" maxlength="10" placeholder="Op Bal. Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                                    </div>
                                                </div>


                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Current Balance:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtCurrentBalance" maxlength="10" placeholder="Current Balance"
                                                            onkeypress="return /[0-9 -]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                <div class="col-md-6" >
                                                    <label for="modelname" class="labelclass">
                                                       Resignation Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtdoresignation" maxlength="10" placeholder="Resignation Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>


                                                <%--<div class="col-md-6">
                                                <br />
                                                <div class="col-md-9">
                                                <input type="file" id="postedFile" name="postedFile"   />
                                                <asp:HiddenField ID="hiddenFileName" runat="server" ClientIDMode="Static" />
                                                <span id="lblMessage" style="color: Green"></span>
                                                </div>
                                                 <div class="col-md-3">
                                                <input type="button" id="btnUpload" value="Upload" onclick="btnUploadFile();"  />
                                                <progress id="fileProgress" style="display: none"></progress>
                                                </div>
                                                    
                                                    
                                                </div>--%>
                                                <div class="col-md-6" style="display: none;">
                                                    <div class="col-md-6">
                                                        <label for="Photo">
                                                            Emp. Photo</label>
                                                        <input type="file" class="form-control" id="postedFile" name="postedFile" accept="image/jpg,image/png,image/jpeg" />
                                                        <asp:HiddenField ID="hiddenFileName" runat="server" ClientIDMode="Static" />
                                                        <span id="lblMessage" style="color: Green"></span>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div style="width: 50%; height: 60%">
                                                            <div id="imgPreview" class="thumbnail" style="display: none">
                                                                <img class="img-responsive" id="targetImg" />
                                                                <div class="caption">
                                                                    <a href="#" onclick="ClearPreview()"><i class="glyphicon glyphicon-trash"></i></a>
                                                                    <span id="description"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <input type="button" id="btnUpload" value="Upload" onclick="btnUploadFile();" />
                                                    </div>
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
                        </div>
                    </div>
                </div>
                <div class="empDressDetails">
                    <div class="modal fade" id="EmpDressModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 40px; width: 70%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="H1">
                                        Employee Dress Details
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    
                                                     <input type="hidden" name="empIDforDress" id="empIDforDress" value="">
                                                      <div class="col-md-6">
                                                        <label for="modelname" class="labelclass">
                                                            Name:</label>
                                                        <br />
                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                            </span>
                                                            <input type="text" readonly class="form-control" id="txtEmpDressDisplayName"  />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="modelname" class="labelclass">
                                                            Dress:</label>
                                                        <br />
                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa-suitcase fa-fw" aria-hidden="true"></i>
                                                            </span>
                                                            <select id="ddlempdress" class="form-control" required>
                                                                <option value="0">Please Select</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <div class="col-md-6">
                                                        <label for="modelname" class="labelclass">
                                                            Qty:</label>
                                                        <br />
                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa-check fa-fw" aria-hidden="true"></i>
                                                            </span>
                                                            <input type="text" class="form-control" id="txtDressQty" autocomplete="off" required maxlength="5" onkeypress="return /[0-9]/i.test(event.key)" placeholder="Qty." />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="modelname" class="labelclass">
                                                            Dress Given on (MM/dd/yyyy):</label>
                                                        <br />
                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                            </span>
                                                            <input type="text" class="form-control" id="txtempdressdate" maxlength="10" placeholder="Dress Date" required
                                                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    
                                                    <br />
                                                        <input type="submit" name="btnAddDress" id="btnAddDress" onclick="btnAddEmpDress();" value="Add Dress" class="btn btn-primary" />
                                                    
                                                </div>

                                                <div class="col-md-12">
                                                <br />
                                                    <table width="100%" id="tblDressDetails" class="table table-bordered  table-responsive">
                                                        <thead>
                                                            <tr>
                                                                 <th>
                                                                    ID
                                                                </th>
                                                                <th>
                                                                    Sr#
                                                                </th>
                                                                <th>
                                                                    Dress Name
                                                                </th>
                                                                 <th>
                                                                    Qty
                                                                </th>
                                                                <th>
                                                                    Dress Given Date
                                                                </th>
                                                                 <th>
                                                                  Delete
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="empSalaryDetails">
                    <div class="modal fade" id="EmpSalaryModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 40px; width: 70%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="H2">
                                        Employee Salary Details
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                 <input type="hidden" name="empIDforSalary" id="empIDforSalary" value="">

                                                 <div class="col-md-6">
                                                        <label for="modelname" class="labelclass">
                                                            Name:</label>
                                                        <br />
                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                            </span>
                                                            <input type="text" class="form-control" id="txtEmpSalDisplayName" name="txtEmpSalDisplayName" readonly />
                                                        </div>
                                                    </div>

                                                    <label for="modelname" class="labelclass">
                                                        Salary:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtEmpSalary" maxlength="10" placeholder="Salary" autocomplete="off"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" required />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Salary Updated on (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtEmpSalDate" maxlength="10" placeholder="Salary Date" autocomplete="off"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;"  required/>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">                                                    
                                                    <br />
                                                        <input type="submit" name="btnAddSalary" id="btnAddSalary" onclick="btnEmpSalary();" value="Save" class="btn btn-primary" />
                                                    
                                                </div>
                                                <div class="col-md-12">
                                                <br />
                                                    <table id="tblSalaryDetails" width="100%" class="table table-bordered  table-responsive">
                                                        <thead>
                                                            <tr>
                                                                <th>
                                                                    ID
                                                                </th>
                                                                <th>
                                                                    Sr#
                                                                </th>
                                                                <th>
                                                                    Salary
                                                                </th>
                                                                <th>
                                                                    Last Updated On
                                                                </th>
                                                                 <th>
                                                                    Updated Details
                                                                </th>
                                                                <th>
                                                                  Delete
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
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
                                        Employee Name
                                       <%-- <button class="pull-right btn btn-default btn-condensed hide-column" 
            data-toggle="tooltip" data-placement="bottom" title="Hide Column">
    <i class="fa fa-eye-slash"></i>  
</button>--%>
                                    </th>
                                    <th>
                                        Designation
                                    </th>
                                    <th>
                                        Mobile No
                                    </th>
                                   <%-- <th>
                                        DOJ
                                    </th>--%>
                                    <th>
                                         Last Salary Updated Date
                                    </th>
                                    <th>
                                        Aadhaar No
                                    </th>
                                    <th>
                                        UAN No
                                    </th>
                                    <th>
                                        ESI No
                                    </th>
                                    <th>
                                        Dress
                                    </th>
                                    <th>
                                        Salary
                                    </th>
                                    <th>
                                        Current Balance
                                    </th>
                                    <th>
                                        Attendance Status
                                    </th>
                                    <th>
                                        Report Status
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

                          <%--  <tfoot class="show-column-footer">
   <tr>
    <th colspan="4"><a class="show-column" href="#">Some columns hidden - click to show all</a></th>
  </tr>
</tfoot>--%>
                        </table>
                    </div>
                </div>
            </div>

            <%--  <script src="datatableCSSJS/1jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/2dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/3jszip.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/4pdfmake.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/5vfs_fonts.js" type="text/javascript"></script>
            <script src="datatableCSSJS/6buttons.html5.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS/7buttons.colVis.min.js" type="text/javascript"></script>--%>

           <%-- <script src="datatableCSSJS2/jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/jszip.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/pdfmake.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/vfs_fonts.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/buttons.html5.min.js" type="text/javascript"></script>
            <link href="datatableCSSJS2/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
            <link href="datatableCSSJS2/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />--%>

        </ContentTemplate>
         <Triggers >
            <asp:PostBackTrigger ControlID="lnkExcel" />
             <%-- <asp:PostBackTrigger ControlID="lnkPdf" />--%>
        </Triggers>
    </asp:UpdatePanel>
    <script>

        $(document).ready(function () {

            $("#postedFile").change(function () {

                var File = this.files;

                if (File && File[0]) {
                    ReadImage(File[0]);
                }

            })

        })


        var ReadImage = function (file) {

            var reader = new FileReader;
            var image = new Image;

            reader.readAsDataURL(file);
            reader.onload = function (_file) {

                image.src = _file.target.result;
                image.onload = function () {

                    var height = this.height;
                    var width = this.width;
                    var type = file.type;
                    var size = ~ ~(file.size / 1024) + "KB";

                    $("#targetImg").attr('src', _file.target.result);
                    $("#description").text("Size:" + size + ", " + height + "X " + width + ", " + type + "");
                    $("#imgPreview").show();

                }

            }

        }

        var ClearPreview = function () {
            $("#imageBrowes").val('');
            $("#description").text('');
            $("#imgPreview").hide();

        }
    </script>
    <script>
        function checkUID(e) {
            /*e.preventDefault();*/
            var uid = $('#txtAadhaarNo').val();

            /*console.log(uid);*/
            if (uid.length != 12) {
                document.getElementById("chkAadharStatus").innerHTML = "Invalid aadhar no!!";
                return false;
            }

            var Verhoeff = {
                "d": [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
[2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
[3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
[4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
[5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
[6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
[7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
[8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]],
                "p": [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
[5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
[8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
[9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
[4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
[2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
[7, 0, 4, 6, 9, 1, 3, 2, 5, 8]],
                "j": [0, 4, 3, 2, 1, 5, 6, 7, 8, 9],
                "check": function (str) {
                    var c = 0;
                    str.replace(/\D+/g, "").split("").reverse().join("").replace(/[\d]/g, function (u, i) {
                        c = Verhoeff.d[c][Verhoeff.p[i % 8][parseInt(u, 10)]];
                    });
                    return c;

                },
                "get": function (str) {

                    var c = 0;
                    str.replace(/\D+/g, "").split("").reverse().join("").replace(/[\d]/g, function (u, i) {
                        c = Verhoeff.d[c][Verhoeff.p[(i + 1) % 8][parseInt(u, 10)]];
                    });
                    return Verhoeff.j[c];
                }
            };

            String.prototype.verhoeffCheck = (function () {
                var d = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
[2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
[3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
[4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
[5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
[6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
[7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
[8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]];
                var p = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
[5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
[8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
[9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
[4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
[2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
[7, 0, 4, 6, 9, 1, 3, 2, 5, 8]];

                return function () {
                    var c = 0;
                    this.replace(/\D+/g, "").split("").reverse().join("").replace(/[\d]/g, function (u, i) {
                        c = d[c][p[i % 8][parseInt(u, 10)]];
                    });
                    return (c === 0);
                };
            })();

            if (Verhoeff['check'](uid) === 0) {

                /* alert('Match Found..!');*/
                document.getElementById("chkAadharStatus").innerHTML = "";
                return true;
            } else {
                /*return false;*/
                /*alert('Invalid aadhaar no..!');*/
                /* $('#chkAadharStatus').val = "Invalid aadhar no!!";*/
                document.getElementById("chkAadharStatus").innerHTML = "Invalid aadhar no!!";
                document.getElementById("txtAadhaarNo").focus();
                return false
            }
        }
    </script>
</asp:Content>

