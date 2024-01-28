<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="inventoryStockDetails, App_Web_y0qsyvj2" %>

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
                        Inventory Stock Details
                    </div>
                </div>
              

                <div class="col-md-12" align="center" style="background-color: White !important;">
                    <div align="center">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
            <div align="center" class="row well well-sm">
            <div class="col-md-2">  Part No:
            <asp:RequiredFieldValidator id="requiredfieldvalidator1" runat="server" controltovalidate="txtSearchPartNo" errormessage="*" setfocusonerror="true" display="dynamic" forecolor="red"></asp:RequiredFieldValidator>
             </div>
              <div class="col-md-4">  
                <asp:TextBox id="txtSearchPartNo" runat="server" cssclass="form-control" placeholder="Part No"></asp:TextBox>

                </div>

                 <div class="col-md-4">
                 
                    <asp:Button id="btnShowSearchResults" runat="server" text="Show Details" cssclass="btn btn-danger" onclick="btnShowSearchResults_Click" />
                </div>
            </div>
             <div class="col-md-12">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                            AllowPaging="false"  OnRowDataBound="GridView1_RowDataBound" >
                           <%-- <HeaderStyle BackColor="#344261" ForeColor="White" />  OnPageIndexChanging="GridView1_PageIndexChanging"
                            <AlternatingRowStyle BackColor="#DFEAF9" />   OnRowDataBound="grdMainMenu_RowDataBound"  --%>
                            <SelectedRowStyle BackColor="#CCDCA7" />
                            <Columns>
                              
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
                              <asp:TemplateField HeaderText="Part#" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpartno" runat="server" Text='<%# Bind("partno") %>'></asp:Label>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Particulars">
                                    <ItemTemplate>
                                        <asp:Label ID="lblparticulars" runat="server" Text='<%# Bind("particulars") %>'></asp:Label>

                                       
                                         
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Purchase">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpurchaseqty" runat="server" Text='<%# Bind("purchaseqty" ) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Sale">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsaleqty" runat="server" Text='<%# Bind("saleqty" ) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                  <asp:TemplateField HeaderText="Available Stock">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcurrentStock" Text='<%# Bind("currentStock" ) %>' runat="server" ></asp:Label>
                                        <%-- <asp:Label ID="lblcurrentStockHidden" Visible="false" runat="server" Text='<%# Bind("currentStock" ) %>'></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Challan No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblchallanno" runat="server" Text='<%# Bind("challanno" ) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Created On / Updated On">
                                    <ItemTemplate>
                                     <asp:Label ID="lblcreatedon" Visible="false" Text='<%# Bind("createdon" ) %>' runat="server"  ></asp:Label>
                                      <asp:Label ID="lblcreatedondisplay" Text='<%# Bind("createdon", "{0:dd/MMM/yyyy HH:mm:ss}" ) %>' runat="server"  ></asp:Label>
                                      <br />
                                       <asp:Label ID="Label1" Text='<%# Bind("updatedon", "{0:dd/MMM/yyyy HH:mm:ss}" ) %>' runat="server"  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Created By">
                                    <ItemTemplate>
                                     <asp:Label ID="lblcreatedby" Text='<%# Bind("createdby" ) %>' runat="server"  ></asp:Label>
                                     <br />
                                      <asp:Label ID="Label2" Text='<%# Bind("updatedby" ) %>' runat="server"  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Invoice / Slip No">
                                    <ItemTemplate>
                                     <asp:Label ID="lblinvoiceslipno" Text='<%# Bind("invoiceslipno" ) %>' runat="server"  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Vehicle No">
                                    <ItemTemplate>
                                     <asp:Label ID="lblvehicleno" Text='<%# Bind("vehicleno" ) %>' runat="server"  ></asp:Label>
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

////                   $("#ddlEmployees").select2();


////                   

////     $('#txtSalMonth').datepicker({

////    format: "mm-yyyy",
////    viewMode: "months", 
////    minViewMode: "months",
////      autoclose: true,
////    });


////    $('#txtFromDate').datepicker({
////       format: "mm/dd/yyyy",
////        autoclose: true,
////    });

////      $('#txtToDate').datepicker({
////        format: "mm/dd/yyyy",

////        autoclose: true,
////    });


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
                
                 
             title: 'Stock Inventory  '  ,
				
		}, 

        {
			extend: 'pdf',
				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
				titleAttr: 'Pdf',
				title: 'Stock Inventory',
//				exportOptions: {
//				    columns: [1,2],

//				}

            header: true,
   
            title: 'Stock Inventory '   ,
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

                           "lengthMenu": [[10, 20, 50, -1], ["10","20","50","All"]],
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



