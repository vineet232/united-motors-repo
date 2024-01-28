<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="salesTransactionDetailsInsuranceReport, App_Web_y0qsyvj2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:HiddenField ID="hdnPrintPermission" ClientIDMode="Static" runat="server" />
  <div class="row well well-sm">
                <div style="padding-left: 20px;">
                    <div class="col-md-2">
                        <label for="modelname" class="labelclass">
                            Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox CssClass="form-control" runat="server" ClientIDMode="Static" id="txtFromInvoiceDt"  maxlength="10" placeholder="From Date"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="modelname" class="labelclass">
                            To Date (MM/dd/yyyy):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                            </span>
                             <asp:TextBox CssClass="form-control" runat="server" ClientIDMode="Static" id="txtToInvoiceDt" name="txtToInvoiceDt" maxlength="10" placeholder="To Date"
                                onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="modelname" class="labelclass">
                            From (Invoice No):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                            </span>
                             <asp:TextBox CssClass="form-control" runat="server" id="txtInvoiceFrom" name="txtInvoiceFrom" maxlength="40" placeholder="Invoice From"
                                autocomplete="off" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="modelname" class="labelclass">
                            To (Invoice No):</label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                            </span>
                             <asp:TextBox CssClass="form-control" id="txtInvoiceTo" runat="server" name="txtInvoiceTo" maxlength="40" placeholder="Invoice To"
                                autocomplete="off" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                                    <label for="modelname" class="labelclass">
                                        Select Executive:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                        </span>
                                      <%--  <select id="ddlEmployee" class="form-control" > 
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>--%>

                                        <asp:DropDownList ID="ddlSalesExecutive"  ClientIDMode="Static" runat="server" CssClass="form-control select2-dropdown"></asp:DropDownList>

                                    </div>
                                </div>

                    <div class="col-md-1">
                        <br />
                       <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success" OnClick="btnSearch_Click" />
                    </div>
                    <div class="col-md-1">
                        <br />
                        <asp:Button ID="btnReser" runat="server" Text="Reset" CssClass="btn btn-danger" />
                    </div>

                   
                </div>
            </div>


             <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div class="c1">
                        <div id="Showoverlay" class="overlayWindow">
                            <h2>
                                Loading .. Please wait</h2>
                        </div>

                          <div class="col-md-12">
                           <div class="col-md-4">
                            Total Policies: &nbsp;  <span ><i class="fa fa-edit "></i></span> &nbsp;  <asp:Label ID="lblTotalPolicies" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                          </div>

                          <div class="col-md-4">
                           Total Vendor Payment: &nbsp;  <span ><i class="fa fa-rupee "></i></span> &nbsp;  <asp:Label ID="lblTotalVendorPayment" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                           </div>
                           <div class="col-md-4">
                            Total Payout Payment: &nbsp;  <span ><i class="fa fa-rupee "></i></span> &nbsp;  <asp:Label ID="lblTotalPayoutPayment" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                          </div>
                          <hr />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                                OnRowDataBound="GridView1_RowDataBound"  AllowPaging="false">
                                <SelectedRowStyle BackColor="#CCDCA7" />
                                <Columns>
                                  
                                    <asp:TemplateField HeaderText="Sr#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                   <asp:TemplateField HeaderText="Invoice Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblinvoicedt" runat="server" Text='<%# Bind("invoicedt", "{0:dd-MMM-yyyy }") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Invoice No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblinvoiceno" runat="server" Text='<%# Bind("invoiceno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Vehicle/Chasis No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblvehchasisno" runat="server" Text='<%# Bind("vehchasisno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sales Executive">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsalesexecutive" runat="server" Text='<%# Bind("salesexecutive") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Vendor">
                                        <ItemTemplate>
                                            <asp:Label ID="lblvendorname" runat="server" Text='<%# Bind("vendorname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                     <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                           <span ><i class="fa fa-rupee "></i></span> &nbsp;   <asp:Label ID="lblvenpaymentamt" ForeColor="Red" runat="server" Text='<%# Bind("venpaymentamt") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="payout">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpayout" runat="server" Text='<%# Bind("payout") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                           <span ><i class="fa fa-rupee "></i></span> &nbsp;   <asp:Label ID="lblpayoutpaymentamt" ForeColor="Green" runat="server" Text='<%# Bind("payoutpaymentamt") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                   
                                </Columns>
                            </asp:GridView>
                        </div>

                     
                    </div>
                </div>


                 <script>
                     $(document).ready(function () {

                         // Initialize select2
                         $("#ddlSalesExecutive").select2();

                     });
        </script>

         <script type="text/javascript">
              //    $(document).ready(function () {
              $(function () {
                  bindDataTable(); // bind data table on first page load
                  Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
              });

              //        $(document).ready(function () {

              function bindDataTable() {

                $("#ddlSalesExecutive").select2();


                $('#txtFromInvoiceDt').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });

        $('#txtToInvoiceDt').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });

          ////////////////////////To SHow Print Buttons ////////////////
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

     var amount = document.getElementById("<%=lblTotalVendorPayment.ClientID %>").innerHTML;


    buttons.push( [ //begin array   
    
    {
			extend: 'excelHtml5',
				text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
				titleAttr: 'Excel',
				/////title: 'Save as Excel',
//                 exportOptions: {
//                    columns: [ 1,2 ]
//                }
                
                 
            title: 'Account of -' + $("#ddlSalesExecutive :selected").text()  ,
				
		}, 
				
		

         ]) // end array

  }

              ////////////////////////End to SHow Print Buttons ////////////////   
              

                  var t = $('#' + '<%=GridView1.ClientID%>').DataTable({

                   

                      //                    "sDom": "Rlfrtip",
                      "bSort": false,

                      "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                      "bAutoWidth": false,
                      "bFilter": true,
                      "bPagination": true,
                      "sPaginationType": "full_numbers",
                      "bStateSave": true,
                      "bPaginate": true,
                      "bInfo": true,

                      destroy: true,
                     

                     "order": [],
//                        "columnDefs" : [{"targets":5, "type":"date-eu"}],

                      dom: 'Blfrtip',

                      buttons: buttons,


                  });
              }

          
                </script>


</asp:Content>

