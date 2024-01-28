<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="datewiseempreport, App_Web_h5d101sg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="CssSearchSelect/select2.css" rel="stylesheet" />
    <script type="text/javascript" src="CssSearchSelect/select2.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
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
                        Datewise All Attendance
                    </div>
                </div>
                <div class="col-md-12 well well-sm">
                    <%--<div class="col-md-6">
                        <label for="modelname" class="labelclass">
                            Select Employee:</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlEmployees"
                                    SetFocusOnError="true" Display="Dynamic" InitialValue="0" ForeColor="Red" runat="server"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>

                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:DropDownList ID="ddlEmployees" ClientIDMode="Static" runat="server" Width="100%"   >
                                </asp:DropDownList>
                        </div>
                    </div>--%>

                    <div class="col-md-2"  style="display:none;">
                        <label for="modelname" class="labelclass">
                            From Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox class="form-control"  id="txtFromDate" maxlength="10" placeholder=" From Date" ClientIDMode="Static" runat="server"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;"  autocomplete="off"  ></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-2" style="display:none;">
                        <label for="modelname" class="labelclass">
                           To Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox class="form-control"  id="txtToDate" maxlength="10" placeholder="To Date" ClientIDMode="Static" runat="server"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;"  autocomplete="off" ></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-2" >
                        <label for="modelname" class="labelclass">
                           Select Month:</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox class="form-control"  id="txtSalMonth" maxlength="10" placeholder="Month" ClientIDMode="Static" runat="server"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;"  autocomplete="off"  ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txtSalMonth" SetFocusOnError="true" Display="Dynamic"
                                 ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                   
                    <div class="col-md-2">
                    <br />
                      
                            <asp:Button ID="btnMarkAttendance" runat="server" Text="Show Attendance" CssClass="btn btn-success"  OnClick="btnShowAttendance_Click"
                             />
                          
                    </div>

                    <div class="col-md-2">
                    <br />
                      
                            <asp:Button ID="btnPostSalary" runat="server" Text="Post Salary" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to post data!!')"
                               OnClick="btnPostSalary_Click"
                             />
                          
                    </div>


                </div>


                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div align="center">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
             <div class="col-md-12">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                            AllowPaging="false" OnRowDataBound="GridView1_RowDataBound">
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
                              <%--  <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Employee Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("empname") %>'></asp:Label>
                                         <asp:Label ID="lblempid" Visible="false" runat="server" Text='<%# Bind("empid") %>'></asp:Label>
                                        <asp:Label ID="lblsalary" Visible="false" runat="server" ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldesignation" runat="server" Text='<%# Bind("designame") %>'></asp:Label>

                                        <%-- <asp:Label ID="lbldesignationid" Visible="false" runat="server" Text='<%# Bind("desigid") %>'></asp:Label>--%>
                                         
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Company">
                                    <ItemTemplate>
                                        <asp:Label ID="lbllocationname" runat="server" Text='<%# Bind("locationname" ) %>'></asp:Label>
                                          <asp:Label ID="lbllocationid" Visible="false" runat="server" Text='<%# Bind("locationid" ) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Salary">
                                    <ItemTemplate>
                                        <asp:Label ID="ulblempsalinmonth" runat="server" Text='<%# Bind("uempsalinmonth" ) %>'></asp:Label>
                                         <asp:Label ID="vlblempsalinmonth" runat="server" Text='<%# Bind("vempsalinmonth" ) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Present">
                                    <ItemTemplate>
                                     <asp:Label ID="lblPresent" ForeColor="Green" runat="server"  ></asp:Label>
                                     <asp:Label ID="lblFullSunday" ForeColor="Navy" runat="server"  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Absent">
                                    <ItemTemplate>
                                     <asp:Label ID="lblAbsent" ForeColor="Red" runat="server" ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Half Day">
                                    <ItemTemplate>
                                     <asp:Label ID="lblHalfDay"  runat="server" ></asp:Label>
                                     <asp:Label ID="lblHalfSunday" ForeColor="Navy" runat="server"  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Present">
                                    <ItemTemplate>
                                     <asp:Label ID="lblTotalPresent" ForeColor="Green" Font-Bold="true" runat="server" ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Calculated Salary">
                                    <ItemTemplate>

                                     <div class="input-group ">
                                        <span ><i class="fa fa-rupee "></i></span> &nbsp;
                                       <asp:Label ID="lblCalculatedSalary" ForeColor="Red" Font-Bold="true" runat="server" ></asp:Label>
                                    </div>

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

                   $("#ddlEmployees").select2();


                   

     $('#txtSalMonth').datepicker({

    format: "mm-yyyy",
    viewMode: "months", 
    minViewMode: "months",
      autoclose: true,
    });


    $('#txtFromDate').datepicker({
       format: "mm/dd/yyyy",
        autoclose: true,
    });

      $('#txtToDate').datepicker({
        format: "mm/dd/yyyy",

        autoclose: true,
    });


     ////////////////////////To Show Print Buttons //////////////////////

          var show = false;
 var printPermission= $("#hdnPrintPermission").val();
 ///alert(printPermission);

 if(printPermission == "1")
 {
    show = true;
 }

 var buttons = [''];
  /////var buttons = ['colvis'];
  ////var buttons = ['export'];
  
  if (show) {
    /////buttons.push('copyHtml5', 'excelHtml5', 'pdfHtml5' );
    ////buttons.push('excel',  'pdfHtml5' );

    


    buttons.push( [ //begin array   
    
    {
			extend: 'excelHtml5',
				text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
				titleAttr: 'Excel',
				/////title: 'Save as Excel',
//                 exportOptions: {
//                    columns: [ 1,2 ]
//                }
                
                 
             title: 'Employees Attendance - ' + $("#txtFromDate").val()  + '  - ' + $("#txtToDate").val()  ,
				
		}, 

        {
			extend: 'pdf',
				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
				titleAttr: 'Pdf',
				title: 'Save as PDF',
//				exportOptions: {
//				    columns: [1,2],

//				}

            header: true,
   
            title: 'Employees Attendance - ' + $("#txtFromDate").val()  + '  - ' + $("#txtToDate").val()  ,
            orientation: 'portrait',
            customize: function(doc) {
            doc.defaultStyle.fontSize = 9; //<-- set fontsize to 16 instead of 10 

            doc.pageMargins = [20,10,10,10];
            doc.styles.tableHeader.fontSize = 10;
            doc.styles.title.fontSize = 14;
            doc.styles.tableHeader.backgroundColor="white";
            // Remove spaces around page title
            doc.content[0].text = doc.content[0].text.trim();


}

  

				
		} 

         ]) // end array

  }


        ////////////////////////End to SHow Print Buttons ////////////////


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
                           buttons: buttons,
//                           buttons: [
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

        </ContentTemplate>
    </asp:UpdatePanel>

 





                         

</asp:Content>


