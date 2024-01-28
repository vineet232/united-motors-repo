<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="rptCustomers, App_Web_1ssuryoo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <%-- <script src="DataTableActions/ReportCustomers.js" type="text/javascript"></script>

    <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>   
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />--%>

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
        <asp:HiddenField ID="hdnPrintPermission" ClientIDMode="Static" runat="server" />
            <table id="tabledata">
            </table>
            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Customer Report
                    </div>
                    <div class="col-md-8" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Customer Report
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
                                        Select Customer:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                        </span>
                                       <%-- <select id="ddlCustomers" class="form-control" onchange="ddlCustomers_SelectedIndexChanged()">
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>--%>

                                         <asp:DropDownList ID="ddlCustomers"  ClientIDMode="Static" runat="server" CssClass="form-control select2-dropdown"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Start Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtStartDate" name="txtStartDate" maxlength="10" placeholder="Start Date"
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
                                        <input type="text" class="form-control" id="txtEndDate" name="txtEndDate" maxlength="10" placeholder="End Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                <br />
                                   <%-- <button type="button" class="btn btn-primary" id="btnSearch" onclick="BindDataTable();">
                                        
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
                          <div align="right">
                           Net Balance: &nbsp;  <span ><i class="fa fa-rupee "></i></span> &nbsp;  <asp:Label ID="lblNetCurrentBalance" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                          </div>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                                OnRowDataBound="GridView1_RowDataBound" AllowPaging="false">
                                <%-- <HeaderStyle BackColor="#344261" ForeColor="White" />--%>
                                <%--<AlternatingRowStyle BackColor="#DFEAF9" />--%>
                                <SelectedRowStyle BackColor="#CCDCA7" />
                                <Columns>
                                    <%--<asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                                    ItemStyle-Width="20px" />--%>
                                    <asp:TemplateField HeaderText="Sr#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--  <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("srno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                   <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltrndate" runat="server" Text='<%# Bind("trndate", "{0:dd-MMM-yyyy }") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Vehicle No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblvehicleno" runat="server" Text='<%# Bind("vehicleno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Invoice No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("InvoiceNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltrnType" runat="server" Text='<%# Bind("trnType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                   
                                    <asp:TemplateField HeaderText="Mode of Payment">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpaymentmode" runat="server" Text='<%# Bind("paymentmode") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="lblpmodebankid" runat="server" Visible="false" Text='<%# Bind("pmodebankid") %>'></asp:Label>
                                            <asp:Label ID="lblpmodebankname" runat="server" Text='<%# Bind("pmodebankname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                     <asp:TemplateField HeaderText="Sales">
                                        <ItemTemplate>
                                           <span ><i class="fa fa-rupee "></i></span> &nbsp;   <asp:Label ID="lblamountreceived" ForeColor="Red" runat="server" Text='<%# Bind("sales") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount Received">
                                        <ItemTemplate>
                                           <span ><i class="fa fa-rupee "></i></span> &nbsp;   <asp:Label ID="lblamountpaid" ForeColor="Green" runat="server" Text='<%# Bind("AmountReceived") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks">
                                        <ItemTemplate>
                                            <asp:Label ID="lblremarks" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Running Balance">
                                        <ItemTemplate>
                                           <span ><i class="fa fa-rupee "></i></span> &nbsp;   <asp:Label ID="lblrunningbalance" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>



                        <%--<table id="tblRecords" class="table table-bordered  table-responsive">
                            <thead>
                                <tr>
                                   
                                    <th>
                                        Sr#
                                    </th>
                                    <th>
                                        Date
                                    </th>
                                    <th>
                                        Vehicle No
                                    </th>
                                    <th>
                                        Invoice No
                                    </th>
                                    <th>
                                        Type
                                    </th>
                                    <th>
                                        Mode of Payment
                                    </th>
                                    <th>
                                        Sales
                                    </th>
                                    <th>
                                        Amount Received
                                    </th>
                                    <th>
                                       Remarks
                                    </th>
                                    <th>
                                        Running Balance
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>--%>
                    </div>
                </div>
            </div>

              <script>
                  $(document).ready(function () {

                      // Initialize select2
                      $("#ddlCustomers").select2();

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

                $("#ddlCustomers").select2();


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

     var amount = document.getElementById("<%=lblNetCurrentBalance.ClientID %>").innerHTML;


    buttons.push( [ //begin array   
    
    {
			extend: 'excelHtml5',
				text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
				titleAttr: 'Excel',
				/////title: 'Save as Excel',
//                 exportOptions: {
//                    columns: [ 1,2 ]
//                }
                
                 
            title: 'Account of -' + $("#ddlCustomers :selected").text() + ' (' + amount + ')' ,
				
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
   
            title: 'Account of -' + $("#ddlCustomers :selected").text() + ' (' + amount + ')' ,
//            orientation: 'portrait',
            orientation: 'portrait',
            customize: function(doc) {
            doc.defaultStyle.fontSize = 8; //<-- set fontsize to 16 instead of 10 

            doc.pageMargins = [20,10,10,10];
            doc.styles.tableHeader.fontSize = 8;
            doc.styles.title.fontSize = 10;
            doc.styles.tableHeader.backgroundColor="white";
            // Remove spaces around page title
            doc.content[0].text = doc.content[0].text.trim();


}

  

				
		} 

         ]) // end array

  }

               
              

                  var t = $('#' + '<%=GridView1.ClientID%>').DataTable({

                   

                      //                    "sDom": "Rlfrtip",
                      "bSort": false,

                      "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                      "bAutoWidth": false,
                      "bFilter": true,
                      "bPagination": true,
                     ///// "sPaginationType": "full_numbers",
                     "sPaginationType": "input",
                      "bStateSave": true,
                      "bPaginate": true,
                      "bInfo": true,

                      destroy: true,
                     

                     "order": [],
//                        "columnDefs" : [{"targets":5, "type":"date-eu"}],

                      dom: 'Blfrtip',

                      buttons: buttons,


//////////                      buttons: [

//////////////                      {
//////////////////////                         extend: 'pdf',
//////////////////////                       // messageTop:  'Account of -' + $("#ddlVendors :selected").text() 
//////////////////////                        messageTop: function() { 
//////////////////////                            return "       Account of: "  +  $('#ddlVendors :selected').text() + "\n"
//////////////////////                          },
//////////////////////                          
//////////////////////    customize: function(doc) {
//////////////////////        /** this line changes the alignment of 'messageBottom' and 'messageTop' **/
//////////////////////        doc.styles.message.alignment = "center";
//////////////////////        doc.styles.message.fontSize = "19";
//////////////////////        
//////////////////////        }   


////////////// 



//////////////                    }






//////////{
//////////   extend: 'pdfHtml5',
//////////   text: 'Save PDF',
//////////   exportOptions: {
//////////      modifier: {
//////////         ///////page: 'current'
//////////      }
//////////   },
//////////   header: true,
//////////   
//////////   title: 'Account of -' + $("#ddlVendors :selected").text() + ' (' + amount + ')' ,
//////////   orientation: 'portrait',
//////////   customize: function(doc) {
//////////      doc.defaultStyle.fontSize = 10; //<-- set fontsize to 16 instead of 10 
//////////   }  
//////////}, 




////////////            'copyHtml5',
////////////            'excelHtml5',
////////////            'csvHtml5',
////////////            'pdfHtml5'
//////////        ]

                  });
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
