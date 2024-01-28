<%@ page title="" language="C#" masterpagefile="~/SuperAdminMasterPage.master" autoeventwireup="true" inherits="firmMaster, App_Web_1ssuryoo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <button onclick="topFunction()" id="myBtn" title="Go to top">
        Top</button>

    <div class="row">
        <div align="center" class="topHeaderStyle">
            Firm Master
        </div>
    </div>
    <div class="row well well-sm" style="border: 1px solid black;">
        <div class="col-md-3">
            Firm/Location Name:
            <asp:RequiredFieldValidator ControlToValidate="txtFirmName" SetFocusOnError="true"
                Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator>
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                <asp:TextBox ID="txtFirmName" runat="server" MaxLength="50" placeholder="Firm Name"
                    required CssClass="form-control "></asp:TextBox>
            </div>
        </div>
        <div class="col-md-3">
            Firm Type:
            <br />
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                <asp:TextBox ID="txtFirmType" runat="server" MaxLength="50" placeholder="Firm Type"
                    CssClass="form-control "></asp:TextBox>
            </div>
        </div>
        <div class="col-md-3">
            Firm/Location Phone No:
            <asp:RequiredFieldValidator ControlToValidate="txtPhoneNo" SetFocusOnError="true"
                Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                <asp:TextBox ID="txtPhoneNo" runat="server" onKeyPress="return checkIt(event)" MaxLength="10"
                    placeholder="Firm Phone No" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-3">
            Firm/Location Email:
            <br />
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" placeholder="Firm Email"
                    CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-3">
            Firm PAN No:
            <br />
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span>
                <asp:TextBox ID="txtFirmPan" runat="server" MaxLength="10" placeholder="Firm PAN"
                    CssClass="form-control text-uppercase"></asp:TextBox></div>
            <br />
            Status: &nbsp;
            <asp:CheckBox ID="chkStatus" runat="server" Checked="true" />
        </div>
        <div class="col-md-3">
            Firm GSTIN:
            <br />
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span>
                <asp:TextBox ID="txtFirmGSTIN" runat="server" MaxLength="30" placeholder="Firm GSTIN"
                    CssClass="form-control text-uppercase"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-3">
            Firm/Location Address:
            <asp:RequiredFieldValidator ControlToValidate="txtAddress" SetFocusOnError="true"
                Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                <asp:TextBox ID="txtAddress" TextMode="MultiLine" placeholder="Firm Address" runat="server"
                    CssClass="form-control "></asp:TextBox></div>
        </div>
        <div class="col-md-3">
            Firm Logo:
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Image ID="imgLogo" Width="200px" Height="60px" runat="server" />
        </div>
        <div class="col-md-12" align="center">
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        </div>
        <div class="col-md-12  " align="center">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="AddRecord"
                Text="Save" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success" Text="Update"
                OnClick="UpdateRecord" Visible="false" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Button ID="btnReset" runat="server" CssClass="btn btn-info" Text="Reset" CausesValidation="false"
                OnClick="ResetTextBoxes" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete"
                OnClick="DeleteRecord" Visible="false" OnClientClick="return confirm('Are you sure you want to delete this record!')" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" align="center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                OnRowDataBound="GridViewRowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <HeaderStyle BackColor="#344261" ForeColor="White" />
                <AlternatingRowStyle BackColor="#DFEAF9" />
                <SelectedRowStyle BackColor="#CCDCA7" />
                <Columns>
                    <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                        ItemStyle-Width="20px" />
                    <%-- <asp:BoundField HeaderText="ID" DataField="Id" ItemStyle-Width="100px" ItemStyle-Wrap="false" />
                     <asp:BoundField HeaderText="Firm Name" DataField="firmName" ItemStyle-Width="100px" ItemStyle-Wrap="false" />
                      <asp:BoundField HeaderText="Firm Type" DataField="firmType" ItemStyle-Width="80px" ItemStyle-Wrap="false" />
                      <asp:BoundField HeaderText="Phone No" DataField="phoneNo" ItemStyle-Width="100px" ItemStyle-Wrap="false" />

                      <asp:BoundField HeaderText="Email" DataField="email" ItemStyle-Width="100px" ItemStyle-Wrap="false" />--%>
                    <%--<asp:BoundField HeaderText="Address" Visible="false" DataField="firmAddress" ItemStyle-Width="100px" ItemStyle-Wrap="false" />--%>
                    <%-- <asp:BoundField HeaderText="Pan No" DataField="firmPan" ItemStyle-Width="80px" ItemStyle-Wrap="false" />
                      <asp:BoundField HeaderText="GSTIN" DataField="firmGSTIN" ItemStyle-Width="100px" ItemStyle-Wrap="false" />--%>
                    <asp:TemplateField HeaderText="ID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Firm Name">
                        <ItemTemplate>
                            <asp:Label ID="lblfirmName" runat="server" Text='<%# Bind("firmName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Firm Type">
                        <ItemTemplate>
                            <asp:Label ID="lblfirmType" runat="server" Text='<%# Bind("firmType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone No">
                        <ItemTemplate>
                            <asp:Label ID="lblphoneNo" runat="server" Text='<%# Bind("phoneNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblemail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("firmAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PAN No">
                        <ItemTemplate>
                            <asp:Label ID="lblfirmPan" runat="server" Text='<%# Bind("firmPan") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="GSTIN">
                        <ItemTemplate>
                            <asp:Label ID="lblfirmGSTIN" runat="server" Text='<%# Bind("firmGSTIN") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Active?">
                        <ItemTemplate>
                           <asp:Label ID="lblisactive" Visible="false" runat="server" Text='<%# Bind("isactive") %>'></asp:Label>
                                    <asp:Label ID="lbldisplayisactive" runat="server" Text='<%# Eval("isactive").ToString() == "1" ? "Yes": "No" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Logo">
                        <ItemTemplate>
                            <%-- <asp:Label ID="lblfirmLogo" Visible="false" runat="server" Text='<%# Bind("firmLogo") %>' ></asp:Label>--%>
                            <asp:Image ID="imgLogo" runat="server" Height="100" Width="100" ImageUrl='<%# (Eval("firmLogo") != System.DBNull.Value ? "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("firmLogo")) : "img/no_image.png") %>'>
                            </asp:Image>
                            <%--<img src='<%# (Eval("firmLogo") != System.DBNull.Value ? "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("firmLogo")) : "img/no_image.png") %>'
height="100" width="200" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
