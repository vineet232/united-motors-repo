<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="empwiseattendreport, App_Web_y0qsyvj2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="CssSearchSelect/select2.css" rel="stylesheet" />
    <script src="CssSearchSelect/select2.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
                    <div class="col-md-3">
                        <label for="modelname" class="labelclass">
                            Select Employee:</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlUsers"
                                    SetFocusOnError="true" Display="Dynamic" InitialValue="0" ForeColor="Red" runat="server"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>

                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:DropDownList ID="ddlUsers" ClientIDMode="Static" runat="server" Width="100%"   >
                                </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <label for="modelname" class="labelclass">
                            From Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox class="form-control" AutoPostBack="true" id="txtFromDate" maxlength="10" placeholder=" From Date" ClientIDMode="Static" runat="server"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;"  autocomplete="off"  ></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <label for="modelname" class="labelclass">
                           To Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox class="form-control" AutoPostBack="true" id="txtToDate" maxlength="10" placeholder="To Date" ClientIDMode="Static" runat="server"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;"  autocomplete="off" ></asp:TextBox>
                        </div>
                    </div>

                   
                    <div class="col-md-3">
                    <br />
                      
                            <asp:Button ID="btnMarkAttendance" runat="server" Text="Mark Attendance" CssClass="btn btn-success"  OnClick="btnShowAttendance_Click"
                             />
                          
                    </div>
                </div>


                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div align="center">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
             <div class="col-md-12">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                            AllowPaging="false">
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
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Employee Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("employeename") %>'></asp:Label>
                                        <asp:Label ID="lblsalary" Visible="false" runat="server" Text='<%# Bind("salary") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldesignation" runat="server" Text='<%# Bind("designation") %>'></asp:Label>

                                         <asp:Label ID="lbldesignationid" Visible="false" runat="server" Text='<%# Bind("desigid") %>'></asp:Label>
                                         
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Company Name">
                                    <ItemTemplate>
                                     <asp:Label ID="lbllocationid" Visible="false" runat="server" Text='<%# Bind("locationid") %>'></asp:Label>
                                        <asp:Label ID="lblCompany" runat="server" Text='<%# Bind("Company") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Present">
                                    <ItemTemplate>
                                         <asp:RadioButton ID="rdPresent" Checked="true" ForeColor="Green" CssClass="Space" runat="server" GroupName="grpAttendance" Text="Present" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Absent" >
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rdAbsent" runat="server" ForeColor="Red" CssClass="Space" GroupName="grpAttendance" Text="Absent" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Half Day" >
                                    <ItemTemplate>
                                         <asp:RadioButton ID="rdHalfDay" runat="server" CssClass="Space" GroupName="grpAttendance" Text="Half Day" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                              
                               
                            </Columns>
                        </asp:GridView>
                    </div>


                </div>
            </div>

           <script type="text/javascript">
               //    $(document).ready(function () {
               $(function () {
                   bindDataTable(); // bind data table on first page load
                   Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
               });

               //        $(document).ready(function () {

               function bindDataTable() {

                   $("#ddlUsers").select2();


                     $('#txtFromDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

      $('#txtToDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

                   var rowscount = $("#<%=GridView1.ClientID %> tr").length;
                   if (rowscount > 1) {
                       var t = $('#' + '<%=GridView1.ClientID%>').DataTable({
                           //                    "sDom": "Rlfrtip",

                           "lengthMenu": [[-1], ["All"]],
                           "bAutoWidth": false,
                           "bFilter": true,
                           "bPagination": true,
                           "sPaginationType": "full_numbers",
                           "bStateSave": true,
                           "bPaginate": true,
                           "bInfo": true,

                           destroy: true,

                           //                    "ordering": false,

                           //"aaSorting": [[0, 'asc']],

                           //"order": [[0, 'desc']],

                           dom: 'Blfrtip',
                           buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]

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

        </ContentTemplate>
    </asp:UpdatePanel>

 





                         

</asp:Content>

