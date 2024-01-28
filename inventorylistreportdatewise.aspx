<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="inventorylistreportdatewise, App_Web_gdx0w2k3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <%--  <script src="DataTableActions/ReportGeneralLedger.js" type="text/javascript"></script>--%>
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

            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        General Ledger Report
                    </div>
                    <div class="col-md-8" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            General Ledger Report
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
                                        From Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <asp:TextBox  CssClass="form-control" id="txtStartDate"  MaxLength="10" placeholder="Start Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" runat="server" ClientIDMode="Static" />

                                        <%--<input type="text" class="form-control" id="txtStartDate" name="txtStartDate" maxlength="10" placeholder="Start Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" runat="server" clientidmode="Static" />--%>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        To Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                         <asp:TextBox  CssClass="form-control" id="txtEndDate"  MaxLength="10" placeholder="End Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" runat="server" ClientIDMode="Static" />
                                       <%-- <input type="text" class="form-control" id="txtEndDate" name="txtEndDate" maxlength="10" placeholder="End Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" runat="server" clientidmode="Static" />--%>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                <br />
                                  <%--  <button type="button" class="btn btn-primary" id="btnSearch" onclick="BindDataTable();">
                                        
                                        Search
                                    </button>--%>

                                     <asp:LinkButton ID="lnkSearch" runat="server" CssClass="btn btn-primary" Text="Search"
                                            OnClick="lnkSearch_Click"></asp:LinkButton>

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

                         <div class="col-md-12">
                         
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                                OnRowDataBound="GridView1_RowDataBound"  AllowPaging="false">
                                <SelectedRowStyle BackColor="#CCDCA7" />
                                <Columns>
                                   
                                    <asp:TemplateField HeaderText="Sr#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                   <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%# Bind("createdon", "{0:dd-MMM-yyyy }") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Part No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpartno" runat="server" Text='<%# Bind("partno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Particulars">
                                        <ItemTemplate>
                                            <asp:Label ID="lblParticulars" runat="server" Text='<%# Bind("particulars") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Purchase Qty.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpurchaseqty" runat="server" Text='<%# Bind("purchaseqty") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                     <asp:TemplateField HeaderText="Sale Qty.">
                                        <ItemTemplate>
                                           <%--<span ><i class="fa fa-rupee "></i></span> &nbsp; --%>  <asp:Label ID="lblsaleqty" ForeColor="Red" runat="server" Text='<%# Bind("saleqty") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Current Balance">
                                        <ItemTemplate>
                                          <asp:Label ID="lblcurrentbalance" ForeColor="Red" runat="server" ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Challan No">
                                        <ItemTemplate>
                                          <%-- <span ><i class="fa fa-rupee "></i></span> &nbsp; --%>  <asp:Label ID="lblamountpaid" ForeColor="Green" runat="server" Text='<%# Bind("challanno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="Invoice Slip No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblinvoiceslipno" runat="server" Text='<%# Bind("invoiceslipno") %>' ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Vehicle No">
                                        <ItemTemplate>
                                             <asp:Label ID="lblvehicleno" runat="server" Text='<%# Bind("vehicleno") %>' ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Created Details">
                                        <ItemTemplate>
                                             <asp:Label ID="lblcreatedby" runat="server" Text='<%# Bind("createdby") %>' ></asp:Label>
                                             <br />
                                              <asp:Label ID="lblcreatedon" runat="server" Text='<%# Bind("createdon",  "{0:dd/MMM/yyyy hh:mm tt}") %>' ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>

                     

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

                

                $('#txtStartDate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });

        $('#txtEndDate').datepicker({
            format: "mm/dd/yyyy",
            autoclose: true,
           
        });


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

////    


    buttons.push( [ //begin array   
    
    {
			extend: 'excelHtml5',
				text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
				titleAttr: 'Excel',
				/////title: 'Save as Excel',
//                 exportOptions: {
//                    columns: [ 1,2 ]
//                }
                
                 
            ////title: 'Account of -' + $("#ddlGeneralLedger :selected").text() + ' (' + amount + ')' ,
				
		}, 

//        {
//			extend: 'pdf',
//				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
//				titleAttr: 'Pdf',
//				title: 'Save as PDF',
////				exportOptions: {
////				    columns: [1,2],

////				}

//            header: true,
//   
//           /// title: 'Account of -' + $("#ddlGeneralLedger :selected").text() + ' (' + amount + ')' ,
//            orientation: 'portrait',
//            customize: function(doc) {
//            doc.defaultStyle.fontSize = 9; //<-- set fontsize to 16 instead of 10 

//            doc.pageMargins = [20,10,10,10];
//            doc.styles.tableHeader.fontSize = 10;
//            doc.styles.title.fontSize = 14;
//            doc.styles.tableHeader.backgroundColor="white";
//            // Remove spaces around page title
//            doc.content[0].text = doc.content[0].text.trim();


//}

  

				
	///	} 

         ]) // end array

  }

               
              

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

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


