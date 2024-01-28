<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="policyRenewal, App_Web_h5d101sg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/PolicyRenewalAdminData.js" type="text/javascript"></script>
    <%--<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.colVis.min.js" type="text/javascript"></script>

    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>--%>
    


     <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.5/r-2.2.9/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.5/r-2.2.9/datatables.min.js"></script>
    

    
    <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

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
                        Policy Renewal Master
                    </div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New Policy</button>
                    </div>
                    <div class="col-md-2" style="display: none;">
                        <button type="button" class="btn btn-primary" data-target="#myModal" onclick="ShowAllRecords();">
                            Show All</button>
                    </div>
                </div>
               <%-- <div id="divShowExport" class="col-md-12" align="right" style="background-color:White !important;">
                    <div class="col-md-6">
                        &nbsp;</div>
                    <div class="col-md-6" style="background-color:White !important;">
                        <div class="col-md-6">
                            <asp:LinkButton ID="lnkSelectedDataToExcel" runat="server" OnClick="lnkExcel_Click">Export Filtered <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>
                        </div>
                        <div class="col-md-6">
                            <asp:LinkButton ID="lnkExcel" runat="server" OnClick="lnkExcel_Click"> Export All <img src="img/excel1.png" height="40" alt="Excel" /> </asp:LinkButton>
                        </div>
                    </div>
                </div>--%>
                <div>
                    <br />
                    <br />
                    <div class="row well well-sm">
                        <div class="col-md-12">
                            <div class="col-md-3">
                                From Date (MM/dd/yyyy):
                                <br />
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" class="form-control" id="txtFromDate" maxlength="10" placeholder="From Date"
                                        onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                To Date (MM/dd/yyyy):
                                <br />
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" class="form-control" id="txtToDate" maxlength="10" placeholder="To Date"
                                        onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                Insurance By:
                                <br />
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-home fa-fw" aria-hidden="true"></i>
                                    </span>
                                    <select id="ddlSearchLastRenewalFrom" class="form-control">
                                        <option value="0" selected="selected">Please Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                            <br />
                                <button type="button" class="btn btn-danger" onclick="ShowFilteredData()">
                                    Show Filtered Data</button>
                            </div>
                            <div class="col-md-1">
                            <br />
                                <button type="button" class="btn btn-primary" onclick="ShowAllData()">
                                    Show All</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 40px; width: 70%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add New Policy
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
                                                        Cust Name:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtName" maxlength="50" placeholder="Customer Name"
                                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Last Renewal From:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlLastRenewalFrom" class="form-control">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Veh./Chasis No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtVehChasisNo" maxlength="40" placeholder="Veh./Chasis No"
                                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Due Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDueDate" maxlength="10" placeholder="Due Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
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
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Alternate No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtAlternateNo" maxlength="10" placeholder="Alternate No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Model:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlModel" class="form-control">
                                                            <option value="0">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <br />
                                                    <div class="col-md-9">
                                                        <input type="file" id="postedFile" name="postedFile" />
                                                        <asp:HiddenField ID="hiddenFileName" runat="server" ClientIDMode="Static" />
                                                        <span id="lblMessage" style="color: Green"></span>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input type="button" id="btnUpload" value="Upload" onclick="btnUploadFile();" />
                                                        <progress id="fileProgress" style="display: none"></progress>
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
                                <div class="col-md-12" align="center" style="background-color: White !important;">
                                    <div class="c1">
                                        <%-- <div id="Showoverlay1" class="overlayWindow">
                            <h2>
                                Loading .. Please wait</h2>
                        </div>--%>
                                        <table id="tblUploadedFiles"  class="table table-bordered  table-responsive">  <%--class="table table-bordered  table-responsive"--%>
                                            <thead>
                                                <tr>
                                                    <th>
                                                        Sr#
                                                    </th>
                                                    <th>
                                                        File
                                                    </th>
                                                    <th>
                                                        Last Updated
                                                    </th>
                                                    <th>
                                                        Download
                                                    </th>
                                                    <th>
                                                        Action
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                        <br />
                                        <br />
                                    </div>
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
                                        changeson
                                    </th>
                                    <th>
                                        Sr#
                                    </th>
                                   
                                    <th>
                                        Customer Name
                                    </th>
                                    <th>
                                        Veh./Chasis No
                                    </th>
                                    <th>
                                        Due Date
                                    </th>
                                    <th>
                                        Mobile No
                                    </th>
                                    <th>
                                        Alternate No
                                    </th>
                                    <th>
                                        Model Name
                                    </th>
                                    <th>
                                        Last Renewal From
                                    </th>
                                    <%-- <th>
                                        Last Changes on
                                    </th>--%>
                                    <th>
                                        Edit
                                    </th>
                                    <th>
                                        Delete
                                    </th>
                                    <th>
                                        Send File
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
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
            <%--  <script src="datatableCSSJS2/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/jszip.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/pdfmake.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/vfs_fonts.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/buttons.html5.min.js" type="text/javascript"></script>
    <link href="datatableCSSJS2/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="datatableCSSJS2/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
            <%--  <script>
        $(document).ready(function () {



            function newexportaction(e, dt, button, config) {



                var self = this;
                var oldStart = dt.settings()[0]._iDisplayStart;
                dt.one('preXhr', function (e, s, data) {
                    // Just this once, load all data from the server...
                    data.start = 0;
                    data.length = 2147483647;
                    dt.one('preDraw', function (e, settings) {
                        // Call the original action function
                        if (button[0].className.indexOf('buttons-copy') >= 0) {
                            $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
                        } else if (button[0].className.indexOf('buttons-excel') >= 0) {
                            $.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
                         $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
                         $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
                        } else if (button[0].className.indexOf('buttons-csv') >= 0) {
                            $.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
                         $.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
                         $.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
                        } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
                            $.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
                         $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
                         $.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
                        } else if (button[0].className.indexOf('buttons-print') >= 0) {
                            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
                        }
                        dt.one('preXhr', function (e, s, data) {
                            // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                            // Set the property to what it was before exporting.
                            settings._iDisplayStart = oldStart;
                            data.start = oldStart;
                        });
                        // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
                        setTimeout(dt.ajax.reload, 0);
                        // Prevent rendering of the full data to the DOM
                        return false;
                    });
                });
                // Requery the server with the new one-time export settings
                dt.ajax.reload();
            }



        });
    </script>--%>
            <%-- <script language="javascript">
        $(document).ready(function () {

       


 $("#tblRecords").dataTable().fnDestroy();

 var lrID = $("#ddlSearchLastRenewalFrom :selected").val();
var startDT = $("#txtFromDate").val();
var endDt = $("#txtToDate").val();

////if(lrID<=0)
////{
////    $.notify("Please select vendor first!", "error");
////    return;
////}

////if((startDT != "" && endDt == "") || (startDT == "" && endDt != ""))
////{
////    $.notify("Please select start date and end date!", "error");
////    return;
////}

 
//table.draw( false );
//var i = 1;
 

// var show = false;
// var printPermission= $("#hdnPrintPermission").val();
// ////alert(printPermission);

// if(printPermission == "1")
// {
//    show = true;
// }

//  var buttons = ['colvis'];
//  
//  if (show) {
//    /////buttons.push('copyHtml5', 'excelHtml5', 'pdfHtml5' );
//    buttons.push('excel',  'pdfHtml5' );
//  }


          $('#tblRecords').DataTable({

////            rowCallback: function(row, data, index){
////           
////  	if(data.olastrenewalfromval == "Others"){
////    	$(row).find('td:eq(7)').css('color', 'red');
////    }
////  },


            "order": [[ 0, 'desc' ]],
            "columnDefs": [
    { "visible": false, "targets": [0,1] }
    ],
//            "async": false,
//                "processing": true,
//                "serverSide": true,
//                "ajax": {
//                    url: "WebServiceDataTable.asmx/GetDataForDataTable", type: "post"
//                },

                bServerSide: true,
                sAjaxSource: 'PolicyDataHandler.ashx?lrID=' + lrID +'&startDt='+ startDT +'&endDt='+ endDt,
                sServerMethod: 'post',
                "processing": true,
                dom: 'Bfrtip',
//                buttons: [
//                    'copy', 'excel', 'pdf', 'csv'
//                ],

//             buttons: [
////            {
////                extend: 'copyHtml5',
////                exportOptions: {
////                    columns: [ 0, ':visible' ]
////                }
////            },


//                        {
//                            "extend": 'excel',
//                            "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
//                            "titleAttr": 'Excel',
//                          ///  "action": newexportaction
//                        },


//            {
//                extend: 'excelHtml5',
////                "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
////                            "titleAttr": 'Excel Export',
////                            "action": newexportaction,

//                ////text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
//                exportOptions: {
//                    columns: ':visible',
//                }
//            },
////            {
////                extend: 'pdfHtml5',
////                exportOptions: {
////                    columns: [ 0, 1, 2, 5 ]
////                }
////            },




//            //'colvis'
//        ]









"dom": 'Blfrtip',
                    "buttons": [
                        {
                            "extend": 'excel',
                            "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
                            "titleAttr": 'Excel',
                            "action": newexportaction
                        },
                    ],

        
                
                "columns": [
                {"data": "olastchangeson"},
                    {  "data": "id" },
                     {
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "ocustname"
////                    ,
////                       createdCell: function(td, cellData, rowData, row, col){
//////                        var color = (cellData === 'Surender Singh') ? '#F0F0F0' : 'white';
////                        var color = (cellData != "") ? '#F0F0F0' : 'white';      
////                        $(td).css('background-color', color );
////                        $(td).css('font-weight', 'bold' );
////                      }
                    },
                    { "data": "ovehChasisno" },
                    { "data": "oduedate" },
                    { "data": "omobileno" },
                    { "data": "owhatsappno" },
                    { "data": "omodelName" },
                    { "data": "olastrenewalfromval" },
                   {
                       "data": "id",
                       "render": function (id, type, full, meta) {
                           //debugger
                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
                       }
                   },
                    {
                        "data": "id",
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
                        }
                    }
                    ,
                    {
                        "data": "id",
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#"  onclick="SendFilebyWhatsapp(' + id + ')"><i class="fa fa-whatsapp text-success" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ]

               ,
               stateSave: true,
                "bDestroy": true,
////                dom: 'Bfrtip',

////                 "lengthMenu": [[10, 50, 75, 100, 150, -1], [10, 50, 75, 100, 150, 'All']],
////            "dom": '<"top"Bifpl<"clear">>rt<"bottom"ip<"clear">>',

//      responsive: true,
//        buttons: buttons,


//                , fnRowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
//                            if (aData.olastrenewalfromval == "Others") {
//                                $('td', nRow).css('background-color', '#FEEDF2');
//                            } else {
//                                $('td', nRow).css('background-color', 'white');
//                            }
//                        }

            });

           

            


/* For Export Buttons available inside jquery-datatable "server side processing" - Start
- due to "server side processing" jquery datatble doesn't support all data to be exported
- below function makes the datatable to export all records when "server side processing" is on */

function newexportaction(e, dt, button, config) {
    var self = this;
    var oldStart = dt.settings()[0]._iDisplayStart;
    dt.one('preXhr', function (e, s, data) {
        // Just this once, load all data from the server...
        data.start = 0;
        data.length = 2147483647;
        dt.one('preDraw', function (e, settings) {
            // Call the original action function
            if (button[0].className.indexOf('buttons-copy') >= 0) {
                $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
            } else if (button[0].className.indexOf('buttons-excel') >= 0) {
                $.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
                    $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
                    $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
            } else if (button[0].className.indexOf('buttons-csv') >= 0) {
                $.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
                    $.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
                    $.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
            } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
                $.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
                    $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
                    $.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
            } else if (button[0].className.indexOf('buttons-print') >= 0) {
                $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
            }
            dt.one('preXhr', function (e, s, data) {
                // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                // Set the property to what it was before exporting.
                settings._iDisplayStart = oldStart;
                data.start = oldStart;
            });
            // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
            setTimeout(dt.ajax.reload, 0);
            // Prevent rendering of the full data to the DOM
            return false;
        });
    });
    // Requery the server with the new one-time export settings
    dt.ajax.reload();
};
//For Export Buttons available inside jquery-datatable "server side processing" - End



        });
    </script>--%>


    <%--<script  type="text/javascript">
     $(document).ready(function () {

    $("#tblRecords").dataTable().fnDestroy();

 var lrID = $("#ddlSearchLastRenewalFrom :selected").val();
var startDT = $("#txtFromDate").val();
var endDt = $("#txtToDate").val();

////if(lrID<=0)
////{
////    $.notify("Please select vendor first!", "error");
////    return;
////}

////if((startDT != "" && endDt == "") || (startDT == "" && endDt != ""))
////{
////    $.notify("Please select start date and end date!", "error");
////    return;
////}

 
//table.draw( false );
//var i = 1;
 

// var show = false;
// var printPermission= $("#hdnPrintPermission").val();
// ////alert(printPermission);

// if(printPermission == "1")
// {
//    show = true;
// }

//  var buttons = ['colvis'];
//  
//  if (show) {
//    /////buttons.push('copyHtml5', 'excelHtml5', 'pdfHtml5' );
//    buttons.push('excel',  'pdfHtml5' );
//  }


          $('#tblRecords').DataTable({

////            rowCallback: function(row, data, index){
////           
////  	if(data.olastrenewalfromval == "Others"){
////    	$(row).find('td:eq(7)').css('color', 'red');
////    }
////  },


            "order": [[ 0, 'desc' ]],
            "columnDefs": [
    { "visible": false, "targets": [0,1] }
    ],
//            "async": false,
//                "processing": true,
//                "serverSide": true,
//                "ajax": {
//                    url: "WebServiceDataTable.asmx/GetDataForDataTable", type: "post"
//                },

                bServerSide: true,
                sAjaxSource: 'PolicyDataHandler.ashx?lrID=' + lrID +'&startDt='+ startDT +'&endDt='+ endDt,
                sServerMethod: 'post',
                "processing": true,
                dom: 'Bfrtip',
//                buttons: [
//                    'copy', 'excel', 'pdf', 'csv'
//                ],

//             buttons: [
////            {
////                extend: 'copyHtml5',
////                exportOptions: {
////                    columns: [ 0, ':visible' ]
////                }
////            },


//                        {
//                            "extend": 'excel',
//                            "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
//                            "titleAttr": 'Excel',
//                          ///  "action": newexportaction
//                        },


//            {
//                extend: 'excelHtml5',
////                "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
////                            "titleAttr": 'Excel Export',
////                            "action": newexportaction,

//                ////text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
//                exportOptions: {
//                    columns: ':visible',
//                }
//            },
////            {
////                extend: 'pdfHtml5',
////                exportOptions: {
////                    columns: [ 0, 1, 2, 5 ]
////                }
////            },




//            //'colvis'
//        ]













//"buttons": [
// {
//                extend: 'collection',
//                text: 'Export',
                buttons: ['export', 
                
//                'excel', 'csv', 'pdf',

//                 { extend: 'excel',
//                    text: 'Export Current Page',
//                    exportOptions: {
//                        modifier: {
//                            page: 'current'
//                        }
//                    },
//                    customize: function (xlsx)
//                    {
//                        var sheet = xlsx.xl.worksheets['sheet1.xml'];
//                        $('row:first c', sheet).attr('s', '7');
//                    }
//                },
                
                {
                    text: 'Export All to Excel',
                     "action": newexportaction,
//                    ajax: 
//                    { type: "POST",
//                        url: "policyrenewal.aspx/GetTop1000Data?ExportToExcel=Yes",
//                       
//                    }
                },
                
                {
                    text: 'Export All to PDF',
                     "action": newexportactiontoPDF,
                    
                }

                ],
//            }
//            ],


        
                
                "columns": [
                {"data": "olastchangeson"},
                    {  "data": "id" },
                     {
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "ocustname"
////                    ,
////                       createdCell: function(td, cellData, rowData, row, col){
//////                        var color = (cellData === 'Surender Singh') ? '#F0F0F0' : 'white';
////                        var color = (cellData != "") ? '#F0F0F0' : 'white';      
////                        $(td).css('background-color', color );
////                        $(td).css('font-weight', 'bold' );
////                      }
                    },
                    { "data": "ovehChasisno" },
                    { "data": "oduedate" },
                    { "data": "omobileno" },
                    { "data": "owhatsappno" },
                    { "data": "omodelName" },
                    { "data": "olastrenewalfromval" },
                   {
                       "data": "id",
                       "render": function (id, type, full, meta) {
                           //debugger
                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
                       }
                   },
                    {
                        "data": "id",
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
                        }
                    }
                    ,
                    {
                        "data": "id",
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#"  onclick="SendFilebyWhatsapp(' + id + ')"><i class="fa fa-whatsapp text-success" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ]

               ,
               stateSave: true,
                "bDestroy": true,
////                dom: 'Bfrtip',

////                 "lengthMenu": [[10, 50, 75, 100, 150, -1], [10, 50, 75, 100, 150, 'All']],
////            "dom": '<"top"Bifpl<"clear">>rt<"bottom"ip<"clear">>',

//      responsive: true,
//        buttons: buttons,


//                , fnRowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
//                            if (aData.olastrenewalfromval == "Others") {
//                                $('td', nRow).css('background-color', '#FEEDF2');
//                            } else {
//                                $('td', nRow).css('background-color', 'white');
//                            }
//                        }

            });

           

       





            function newexportaction()
            {

             var fromDt= $("#txtFromDate").val();
     var toDt= $("#txtToDate").val();

    var searchlastrenewalfromid = $("#ddlSearchLastRenewalFrom :selected").val();
    ///var olastrenewalfromval = $("#ddlSearchLastRenewalFrom :selected").text();

    if((fromDt != "" && toDt !="" ) || searchlastrenewalfromid != "0")
    {
     var model = {};
    model.fromdt = fromDt;
     model.todt = toDt;
    model.olastrenewalfromid = searchlastrenewalfromid;

           $("#Showoverlay").show(); 
             $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/GetFilteredDatainExcel",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Policy Data", true);

         $("#Showoverlay").hide(); 


        }
        });
    }

    else
    {
           $("#Showoverlay").show(); 
             $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Policy Data", true);

         $("#Showoverlay").hide(); 


        }
        });
    }
            ////alert("export");
          

            }


            function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    
    var CSV = '';    
    //Set Report title in first row or line
    
    CSV += ReportTitle + '\r\n\n';

    //This condition will generate the Label/Header
    if (ShowLabel) {
        var row = "";
        
        //This loop will extract the label from 1st index of on array
        for (var index in arrData[0]) {
            
            //Now convert each value to string and comma-seprated
            row += index + ',';
        }

        row = row.slice(0, -1);
        
        //append Label row with line break
        CSV += row + '\r\n';
    }
    
    //1st loop is to extract each row
    for (var i = 0; i < arrData.length; i++) {
        var row = "";
        
        //2nd loop will extract each column and convert it in string comma-seprated
        for (var index in arrData[i]) {
            row += '"' + arrData[i][index] + '",';
        }

        row.slice(0, row.length - 1);
        
        //add a line break after each row
        CSV += row + '\r\n';
    }

    if (CSV == '') {        
        alert("Invalid data");
        return;
    }   
    
    //Generate a file name
    var fileName = "MyReport_";
    //this will remove the blank-spaces from the title and replace it with an underscore
    fileName += ReportTitle.replace(/ /g,"_");   
    
    //Initialize file format you want csv or xls
    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
    
    // Now the little tricky part.
    // you can use either>> window.open(uri);
    // but this will not work in some browsers
    // or you will not get the correct file extension    
    
    //this trick will generate a temp <a /> tag
    var link = document.createElement("a");    
    link.href = uri;
    
    //set the visibility hidden so it will not effect on your web-layout
    link.style = "visibility:hidden";
    link.download = fileName + ".csv";
    
    //this part will append the anchor tag and remove it after automatic click
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

 

 function newexportactiontoPDF()
            {

            $("#Showoverlay").show();

            /////alert("export");

             $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
       
         var json = JSON.parse(data.d)

         var count = Object.keys(json).length;

        ////var data = $('#txt').val();

         ////alert(count);

        if(json == '')
            return;
        
////         var customers = eval(json);
//// 
////        //Convert JSON to HTML Table.
////        var table = document.createElement("TABLE");
////        table.border = "1";
////        table.Id = "tblCustomers";
//// 
////        //Get the count of columns.
////        var columnCount = customers[0].length;

////        //Add the header row.
////        var row = table.insertRow(-1);
////        for (var i = 0; i < columnCount; i++) {
////            var headerCell = document.createElement("TH");
////            headerCell.innerHTML = customers[0][i];
////            row.appendChild(headerCell);
////        }
//// 
////        //Add the data rows.
////        for (var i = 1; i < customers.length; i++) {
////            row = table.insertRow(-1);
////            for (var j = 0; j < columnCount; j++) {
////                var cell = row.insertCell(-1);
////                cell.innerHTML = customers[i][j];
////                alert( customers[i][j]);
////            }
////        }
//// 
////        //Append the Table to the HTML DIV.
////        var dvTable = document.getElementById("dvTable");
////        dvTable.innerHTML = "";
////        dvTable.appendChild(table);
//// 
//// debugger;
////        //Convert Table to PDF.
////        html2canvas(document.getElementById('dvTable'), {
////            onrendered: function (canvas) {
////                var data = canvas.toDataURL();
////                var docDefinition = {
////                    content: [{
////                        image: data,
////                        width: 500
////                    }]
////                };
////                pdfMake.createPdf(docDefinition).download("JSON.pdf");
//// 
////                //Remove the Table.
////                dvTable.innerHTML = "";
////            }
////        });

       var doc = new jspdf.jsPDF()

        // Simple data example
//        var head = [['ID', 'Customer Name', 'Veh/Chasis No']]
//          var body = [
//           $.each(json, function (key, item) {
//          [item.id, item.custname, item.vehChasisno],
//           });
//        ]

// Simple data example
        var head = [['ID', 'Country', 'Rank', 'Capital']]
        var body = []
      $.each(json, function (key, item) {

  var data =  [item.id, item.custname, item.vehChasisno, item.duedate];

  body.push(data);
         });

//          [1, 'Denmark', 7.526, 'Copenhagen'],
//          [2, 'Switzerland', 7.509, 'Bern'],
//          [3, 'Iceland', 7.501, 'Reykjavík'],
///        ]

//var data=[];
////for(var i=1; i<count; i++)
////{

////var tablerow=i;
////var rowdata={};
//// for( var j=0; j<tablerow.cells.length;j++)
//// {
////    rowdata[0]=tablerow.cells[j].innerHTML;
//// }
//// data.push(rowdata);

////}

//////alert(data);

//$.each(json, function (key, item) {

//    data[0]=item.id;
//    data[1]=item.custname;
//    data[2]=vehChasisno;
//    data[3]=duedate;
//    alert(data);
//    body.push(data);
//});


       doc.autoTable({ head: head, body: body })

        // Simple html example
        doc.autoTable({ html: '#tabledata' })

        doc.save('table.pdf')
         $("#Showoverlay").hide(); 
//        $("#tabledata").append(
//          "<tr><th>ID</th><th>Owner</th></tr>");

//          $.each(json, function (key, item) {
//           $("#tabledata").append("<tbody><tr><td>" +

//            item.custname + "</td> <td>" +
//             item.vehChasisno + "</td> </tr></tbody>");
//               
//               });


//                 for (var i = 0; i < json.length; i++) {

//                     if (json[i] !== null) {
//                         $("#tabledata").append("<tbody><tr><td>" +
//                                             json[i][0] + "</td> <td>" +
//                                             json[i][1] + "</td> <td>" +
//                                             json[i][2] + "</td></tr></tbody>");

//                     }
//                 }
//                 $("#tabledata tr:first").addClass('GridviewScrollHeader');
//                 $("#tabledata tr").addClass('GridviewScrollItem');
//                 $("#tabledata").addClass('GridviewScrollPager');


//doc.text('Hello world!', 10, 10);
//doc.save('a4.pdf');

//        $.each(json, function (key, item) {
//      
//        doc.text( 
//        "Customer Name: " + item.custname, 20, 100 );
//       
//        });

//employees.forEach(function(employee, i){
//    doc.text(20, 10 + (i * 10), 
//        "First Name: " + employee.firstName +
//        "Last Name: " + employee.lastName);
//});

//alert("pdf saved!!");
//doc.save('Test.pdf');

        }
       });


        }    
      
         

      });

    </script>--%>

        </ContentTemplate>

      <%--  <Triggers >
            <asp:PostBackTrigger ControlID="lnkExcel" />
        </Triggers>--%>

    </asp:UpdatePanel>
</asp:Content>
