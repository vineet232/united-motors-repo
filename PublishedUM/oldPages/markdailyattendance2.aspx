<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="markdailyattendance, App_Web_1ap4si5r" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/AttendanceDetails.js" type="text/javascript"></script>
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
            <asp:HiddenField ID="hdnPrintPermission" ClientIDMode="Static" runat="server" />
            <table id="tabledata">
            </table>
            <div style="margin-bottom:40px;">
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Mark Attendance
                    </div>
                </div>
                <div class="col-md-12 well well-sm">
                    <div class="col-md-4">
                        <label for="modelname" class="labelclass">
                            Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <input type="text" class="form-control" id="txtDate" maxlength="10" placeholder="Attendance Date"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;"  autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-4" >
                    <br />
                        <button type="button" class="btn btn-primary"  onclick="ShowEmployeesList();">
                           Show Employees </button>
                    </div>
                    <div class="col-md-4">
                    <br />
                        <button type="button" class="btn btn-success" id="btnMarkAttendance" name="btnMarkAttendance"  onclick="AddRecord();">
                            Mark Attendance </button>

                          
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
                                    <th style="display:none;">
                                        ID
                                    </th>
                                    <th>
                                        Sr#
                                    </th>
                                    <th>
                                        Employee Name
                                    </th>
                                   <th>
                                        Present
                                    </th>
                                     <th>
                                        Absent
                                    </th>
                                    <th>
                                        Half Day
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

    <asp:Label ID="lblStatus" runat="server" Text="."></asp:Label>
</asp:Content>
