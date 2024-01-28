<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="reportBanks, App_Web_0q52z0j3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/ReportBanks.js" type="text/javascript"></script>
   <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />

   <%-- <script src="csssearch/jquery-3.2.1.min.js" type="text/javascript"></script>--%>
 <style>
    td.highlight {
        font-weight: bold;
        color: blue;
    }
 </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

     <%--<asp:TextBox ID="lblTotals" runat="server" ClientIDMode="Static" Text="0"></asp:TextBox>--%>

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

         <asp:HiddenField ID="hdnRunningTotal" ClientIDMode="Static" runat="server" />
        
            <div class="col-md-12">
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Banks Report
                    </div>
                    <div class="col-md-8" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Banks Report
                        </button>
                    </div>
                </div>
                <div class="modal-body">
                    <br />
                    <form>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                            <div class="form-group">
                                <input type="hidden" name="recordID" id="recordID" value="">
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Select Bank:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                      

                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <select id="ddlBanks" class="form-control"  > <%--onchange="ddlCustomers_SelectedIndexChanged()"--%>
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>


                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Start Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtStartDate" maxlength="10" placeholder="Start Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        End Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtEndDate" maxlength="10" placeholder="End Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                <br />
                                    <button type="button" class="btn btn-primary" id="btnSearch" onclick="BindDataTable();">
                                        
                                        Search
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
                <%-- </div>
                        </div>
                    </div>
                </div>--%>
                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div class="c1">
                        <div id="Showoverlay" class="overlayWindow">
                            <h2>
                                Loading .. Please wait</h2>
                        </div>
                        <table id="tblRecords" class="table table-bordered  table-responsive ">
                            <thead>
                                <tr>
                                   <%-- <th>
                                        ID
                                    </th>--%>
                                    <th>
                                        Sr#
                                    </th>
                                    <th>
                                        Description
                                    </th>
                                    <th>
                                        Catgory
                                    </th>
                                   
                                    <%--<th>
                                        Description
                                    </th>--%>
                                    <th>
                                       Remarks/Cheque No
                                    </th>
                                     <th>
                                        Mode
                                    </th>
                                    <th>
                                         Date
                                    </th>
                                    <th>
                                       Amount Paid
                                    </th>
                                     <th>
                                       Amount Received
                                    </th>
                                    <th class="sum">
                                        Running Balance
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                             <tfoot>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th>Running Bal:</th>
                <th></th>
                <th> <asp:TextBox ID="lblRunningDifference" ClientIDMode="Static" runat="server" /> </th>
            </tr>
        </tfoot>
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

                     // Initialize select2
                     $("#ddlBanks").select2();

//                     // Read selected option
//                     $('#but_read').click(function () {
//                         var username = $('#selUser option:selected').text();
//                         var userid = $('#selUser').val();

//                         $('#result').html("id : " + userid + ", name : " + username);
//                     });
                 });
        </script>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

