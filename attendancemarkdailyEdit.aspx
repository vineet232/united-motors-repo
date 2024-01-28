<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="markdailyattendanceEdit, App_Web_gdx0w2k3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
    <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

     <style>
        .Space label
{
   margin-left: 10px;
}
    </style>

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
                        Edit Attendance
                    </div>
                </div>
                <div class="col-md-12 well well-sm">
                    <div class="col-md-2">
                        <label for="modelname" class="labelclass">
                            Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox class="form-control"  id="txtDate" maxlength="10" placeholder="Attendance Date" ClientIDMode="Static" runat="server"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;"  autocomplete="off" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-1"  >
                    <br />
                       
                            <asp:Button ID="btnShowAttendance" CssClass="btn btn-primary" runat="server" Text="Show All" OnClick="btnShowAttendance_Click" />
                    </div>
                    <div class="col-md-1"  >
                    <br />
                       
                            <asp:Button ID="btnUpdateAllAttendance" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to update all employees attendance!!')"
                             runat="server" Text="Update All" OnClick="btnUpdateAllAttendance_Click" />
                    </div>
                    <div class="col-md-2"  style="font-size:medium; font-weight:bold;" >
                    Total Present: 
                    <br /> <asp:Label ID="lblTotalPresent" runat="server" ForeColor="Red"></asp:Label>
                          
                    </div>
                     <div class="col-md-2" style="font-size:medium; font-weight:bold;">
                    Total Absent: 
                    <br /> <asp:Label ID="lblTotalAbsent" runat="server" ForeColor="Red"></asp:Label>
                          
                    </div>
                     <div class="col-md-2" style="font-size:medium; font-weight:bold;" >
                    Total Half Day: 
                    <br /> <asp:Label ID="lblTotalHDay" runat="server" ForeColor="Red"></asp:Label>
                          
                    </div>

                     <div class="col-md-2" style="font-size:medium; font-weight:bold;">
                    Total Employees: 
                    <br /> <asp:Label ID="lblNetTotal" runat="server" ForeColor="Red"></asp:Label>
                          
                    </div>

                </div>


                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div align="center">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
            <%-- <div class="row col-md-12" id="divOrderBy" runat="server" visible="false" >
              <div class="col-md-2">&nbsp;</div>
             <div class="col-md-1">
                   Order by:
                </div>
                <div class="col-md-1">
                    <asp:RadioButton ID="rdReset" runat="server" AutoPostBack="true" OnCheckedChanged="rdOrderby_CheckChanged" GroupName="orderbyattend" Text="Reset" />
                </div>
                <div class="col-md-1">
                    <asp:RadioButton ID="rdAbsent" runat="server" AutoPostBack="true" GroupName="orderbyattend" Text="Absent" />
                </div>
                <div class="col-md-1">
                    <asp:RadioButton ID="rdPresent" runat="server" AutoPostBack="true" GroupName="orderbyattend" Text="Present" />
                </div>
                <div class="col-md-1">
                    <asp:RadioButton ID="rdHalfDay" runat="server" AutoPostBack="true" GroupName="orderbyattend" Text="Half Day" />
                </div>
             </div>--%>
             <div class="col-md-12">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                            AllowPaging="false" OnRowDataBound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging">
                           <%-- <HeaderStyle BackColor="#344261" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#DFEAF9" />   OnRowDataBound="grdMainMenu_RowDataBound"  --%>
                            <SelectedRowStyle BackColor="#CCDCA7" />
                            <Columns>
                                <%-- <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                ItemStyle-Width="20px" />--%>
                                <%--<asp:TemplateField>
                               

                         <HeaderTemplate>
     <asp:CheckBox ID="chkboxSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkboxSelectAll_CheckedChanged" ></asp:CheckBox> 
    </HeaderTemplate>

                                <ItemTemplate>
                                    <asp:CheckBox ID="chkMenuRow" runat="server" />
                                  
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Sr#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID"  Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Employee Name">
                                    <ItemTemplate>
                                     <asp:Label ID="lblEmpID" Visible="false" runat="server" Text='<%# Bind("empId") %>'></asp:Label>
                                        <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("empname") %>'></asp:Label>
                                        <asp:Label ID="lblsalary" Visible="false" runat="server" Text='<%# Bind("empsalinmonth") %>'></asp:Label>

                                         <asp:Label ID="lblemptype" Visible="false" runat="server" Text='<%# Bind("emptype") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldesignation" runat="server" Text='<%# Bind("designame") %>'></asp:Label>
                                         <asp:Label ID="lbldesignationid" Visible="false" runat="server" Text='<%# Bind("desigid") %>'></asp:Label>
                                          <asp:Label ID="lblattendstatusid" Visible="false"  runat="server" Text='<%# Bind("attendstatusid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Company Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompany" runat="server" Text='<%# Bind("locationname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Details">
                                    <ItemTemplate>
                                    <i style="color:black; font-size:small;"> Created by:</i> <br />
                                        <asp:Label ID="lblCreatedby" runat="server" Font-Size="Small" Text='<%# Bind("createdby") %>'></asp:Label>
                                         (<asp:Label ID="lblcreatedon" runat="server" Font-Size="X-Small" Text='<%# Bind("createdon" , "{0: dd/MMM/yyyy hh:mm:ss tt }") %>'></asp:Label>)
                                         <br />
                                       <i style="color:black; font-size:small;"> Updated by:</i><br />
                                         <asp:Label ID="lblUpdatedBy" runat="server" Font-Size="Small" Text='<%# Bind("updatedby") %>'></asp:Label>
                                         (<asp:Label ID="lblUpdatedon" runat="server" Font-Size="X-Small" Text='<%# Bind("updatedon" , "{0: dd/MMM/yyyy hh:mm:ss tt}") %>'></asp:Label>)
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="">



                                 <HeaderTemplate>
                                        <asp:RadioButton ID="chkboxSelectPresentAll" runat="server" Text="Present" AutoPostBack="true"
                                            OnCheckedChanged="chkboxSelectPresentAll_CheckedChanged" GroupName="HeaderRadio"></asp:RadioButton>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                      
                                         <asp:RadioButton ID="rdPresent"  ForeColor="Green" CssClass="Space" runat="server" GroupName="grpAttendance" Text="Present" />
                                         <asp:Label ID="lblPattendstatusid" ForeColor="White" runat="server" Text='<%# Bind("attendstatusid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" >

                                <HeaderTemplate>
                                        <asp:RadioButton ID="chkboxSelectAbsentAll" runat="server" Text="Absent" AutoPostBack="true"
                                            OnCheckedChanged="chkboxSelectAbsentAll_CheckedChanged" GroupName="HeaderRadio"></asp:RadioButton>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                    
                                        <asp:RadioButton ID="rdAbsent" ForeColor="Red" CssClass="Space" runat="server" GroupName="grpAttendance" Text="Absent" />
                                         <asp:Label ID="lblAattendstatusid" ForeColor="White" runat="server" Text='<%# Bind("attendstatusid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" >

                                 <HeaderTemplate>
                                        <asp:RadioButton ID="chkboxSelectHalfDayAll" runat="server" Text="Half Day" AutoPostBack="true"
                                            OnCheckedChanged="chkboxSelectHalfDayAll_CheckedChanged" GroupName="HeaderRadio"></asp:RadioButton>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                    
                                         <asp:RadioButton ID="rdHalfDay" runat="server" GroupName="grpAttendance" Text="Half Day" />
                                          <asp:Label ID="lblHattendstatusid" ForeColor="White" runat="server" Text='<%# Bind("attendstatusid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Update" >
                                    <ItemTemplate>
                                         <asp:LinkButton ID="lnkUpdate" runat="server" CssClass="btn btn-success" Text="Update" OnClick="btnUpdate_Click"
                                           OnClientClick="return confirm('Are you sure you want to update attendance!!')" ></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                              
                               
                            </Columns>
                        </asp:GridView>
                    </div>


                </div>
            </div>

            <%--<script type="text/javascript">
                $(document).ready(function () {

 $('#txtDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

////////    $('#txtDate').datepicker({
////////        format: "mm/dd/yyyy",
////////        autoclose: true,
////////        endDate: "today"
////////    });
    

})  
            </script>--%>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblStatus" runat="server" Text="."></asp:Label>


     <%--For Datatable--%>
    <script src="datatableCSSJS2/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/jszip.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/pdfmake.min.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/vfs_fonts.js" type="text/javascript"></script>
    <script src="datatableCSSJS2/buttons.html5.min.js" type="text/javascript"></script>
    <link href="datatableCSSJS2/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="datatableCSSJS2/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="datatableCSSJS2/DataTableHeaderFooterStyleSheet.css" rel="stylesheet"
        type="text/css" />
   
    <script type="text/javascript">
        //    $(document).ready(function () {
        $(function () {
            bindDataTable(); // bind data table on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
        });

        //        $(document).ready(function () {

        function bindDataTable() {

         $('#txtDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });


            var rowscount = $("#<%=GridView1.ClientID %> tr").length;
            if (rowscount > 1) {
                var t = $('#' + '<%=GridView1.ClientID%>').DataTable({
                    //                    "sDom": "Rlfrtip",

                    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                    "bAutoWidth": false,
                    "bFilter": true,
                    "bPagination": true,
                    "sPaginationType": "full_numbers",
                    "bStateSave": true,
                    "bPaginate": true,
                    "bInfo": true,

                    destroy: true,

                     // dom: 'Blfrtip',
//                    buttons: [
//            'copyHtml5',
//            'excelHtml5',
//            'csvHtml5',
//            'pdfHtml5'
//        ]

                });
            }
        }
        //            t.on('order.dt search.dt', function () {
        //                t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
        //                    cell.innerHTML = i + 1;
        //                });
        //            }).draw();

        //        });


       
       

          
    </script>

    <%-- end for datatable--%>


</asp:Content>

