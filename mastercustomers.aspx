<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="mastercustomers, App_Web_h5d101sg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">



            <script src="DataTableActions/CustomerMaster.js" type="text/javascript"></script>
 <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>
   <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />


    <%--<link href="bootstrap5/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet"
        type="text/css" />--%>

   <%-- <link href="bootstrap5/bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="bootstrap4/css/bootstrap.css" rel="stylesheet" type="text/css" />--%>

   <%-- <link  href="//cdn.datatables.net/plug-ins/1.10.19/pagination/select.js" />--%>

    <script src="pagination/select.js" type="text/javascript"></script>
    <script src="pagination/input.js" type="text/javascript"></script>
    <script src="pagination/full_numbers_no_ellipses.js" type="text/javascript"></script>
    <script src="pagination/scrolling.js" type="text/javascript"></script>

    


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" >
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

            <div >
                <div class="row col-md-12">
                    <div class="col-md-3 topHeaderStyle" align="center">
                    Customer Master
                    </div>
                        <div class="col-md-6">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add Customer</button>
                    </div>
						
					</div>
                <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 70px; width:50%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add Customer
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
                                                      Customer Name:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                     <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i></span>
                                                    <input type="text" class="form-control" id="txtName" maxlength="50" placeholder="Customer Name"  autocomplete="off" required
                                                          />  <%--onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;"--%>
                                                        </div> 
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                                </div>

                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                      Vehicle No:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    
                                                     <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-truck fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtVehChasisNo" maxlength="25" placeholder="Veh./Chasis No"
                                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                  
                                                </div>


                                                 <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Account Type:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlAccountType" class="form-control">
                                                            <option value="0" selected>Please Select</option>
                                                        <option value="1"> Insurance </option>
                                                        <%--<option value="2"> Invoice </option>
                                                        <option value="3"> Labour </option>
                                                        <option value="4"> Slip </option>--%>
                                                        <option value="5"> Finance </option>
                                                         <option value="6"> Body Shop </option>
                                                        <option value="7"> Service </option>
                                                        <option value="8"> Spare Parts </option>
                                                        <%--<option value="9"> Cashless </option>--%>
                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Contact No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtMobileNo" maxlength="10" placeholder="Mobile No"
                                                            onkeypress="return /[0-9]/i.test(event.key)"  />  <%--ondrop="return false;" onpaste="return false;"--%>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                      Opening Balance:</label>
                                                    <br />
                                                   
                                                     <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i></span>
                                                    <input type="text" class="form-control" id="txtOpeningBalance" maxlength="10" placeholder="Opening Balance"  autocomplete="off"
                                                        onkeypress="return /[0-9 -.]/i.test(event.key)" onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;"  />
                                                        </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Opening Balance Date (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDate" maxlength="10" placeholder="Opening Balance Date" onkeydown="return false;" 
                                                            ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>

                                                 <div class="col-md-12">
                                                    <label for="modelname" class="labelclass">
                                                       Remarks:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtRemarks" maxlength="300" placeholder="Remarks"  />
                                                    </div>
                                                </div>

                                                <div class="col-md-12"  id="divWhatsappMessage" style="display:none;">
                                                    <label for="modelname" class="labelclass">
                                                       Whatsapp Message:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <textarea  class="form-control" id="txtwhatsappmessage" maxlength="400" placeholder="Whatsapp Message"  ></textarea>
                                                    </div>
                                                    <br />
                                                    <button type="button" class="btn btn-success" id="btnSendWhatsappMessage" onclick="SendWhatsppMessage();">
                                                       Save & Send Message</button>
                                                </div>




                                                <%-- <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                      Status:</label>
                                                    <br />
                                                    
                                                    <input type="hidden" name="recordID" id="Hidden3" value="">
                                                     <div class="input-group margin-bottom-sm">
                                                        
                                                    <input type="checkbox" id="chkStatus" name="chkStatus" value="Active" checked />
                                                        </div>
                                                   
                                                </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
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
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card  ">
				
				<div class="card-body">
					<div class="table-responsive">

                <div class="col-md-12" align="center" style="background-color: White !important;">
                   <div class="c1">
                        <div id="Showoverlay" class="overlayWindow">
                            <h2>
                                Loading .. Please wait</h2>
                        </div>
                        <table id="tblRecords" class="table table-bordered  table-responsive">
                            <thead>
                                <tr>
                                    <th>
                                        ID
                                    </th>
                                   
                                    <th>
                                        Customer Name
                                    </th>
                                    <th>
                                        Account Type 
                                    </th>
                                    <th>
                                       Vehicle No
                                    </th>
                                    <th>
                                        Contact No
                                    </th>
                                    <%-- <th>
                                        Opening Balance
                                    </th>
                                    <th>
                                        Date
                                    </th>--%>
                                    <th>
                                        Current Balance
                                    </th>
                                    <th>
                                        Payment Due Days
                                    </th>
                                   
                                     <th>
                                        Remarks
                                    </th>
                                     <th>
                                        Report Status
                                    </th>
                                    <th>
                                        Edit
                                    </th>
                                     <th>
                                        Delete
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>

                     

                          <div class="col-md-12">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                            OnRowDataBound="GridView1_RowDataBound" 
                            AllowPaging="false">
                          
                            <SelectedRowStyle BackColor="#CCDCA7" />
                            <%--<Columns>
                               <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                                    ItemStyle-Width="20px" />
                               
                              < <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("srno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Sr#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbank" runat="server" Text='<%# Bind("bank") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcategory" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks/Cheque No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblremarksorchequeno" runat="server" Text='<%# Bind("remarksorchequeno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mode">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpaymentmode" runat="server" Text='<%# Bind("paymentmode") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblpmodebankname" runat="server" Text='<%# Bind("pmodebankname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date" >
                                    <ItemTemplate>
                                        <asp:Label ID="lbltrndate"   runat="server" Text='<%# Bind("trndate", "{0:MMM-dd-yyyy }") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount Paid" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblamountpaid" ForeColor="Red"  runat="server" Text='<%# Bind("amountpaid") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount Received" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblamountreceived" ForeColor="Green"  runat="server" Text='<%# Bind("amountreceived") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Running Balance" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblrunningbalance"   runat="server" ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>--%>
                        </asp:GridView>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

