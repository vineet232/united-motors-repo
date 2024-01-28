<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="generatebarcode, App_Web_xgwfkdro" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row col-md-12">
        <div class="col-md-4 topHeaderStyle" align="center">
            Inventory
        </div>
        <div class="col-md-4">
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        </div>
        <div class="col-md-4" style="display: none;">
            <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                Generate Bar Code</button>
        </div>
    </div>
    <div class="container-fluid">
        <asp:Label ID="lblRecordID" runat="server" Visible="false"></asp:Label>
            <div class="row col-md-12 well well-sm">
               
                <div class="col-md-4" >
                    <label>
                        Part ID:</label>
                        <asp:RequiredFieldValidator ID="RequiredField1" runat="server" ControlToValidate="txtpartid" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                         ErrorMessage="*"></asp:RequiredFieldValidator>
                        <br />

                        <asp:TextBox ID="txtpartid" placeholder="Part ID" CssClass="form-control" runat="server" autocomplete="false"></asp:TextBox>
                </div>
              <%--  <div class="col-md-4" align="right">
                    <label>
                        Barcode Value:</label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpartid" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                         ErrorMessage="*"></asp:RequiredFieldValidator>
                        <br />

                        <asp:TextBox ID="TextBox1" placeholder="Barcode Value" CssClass="form-control" runat="server" autocomplete="false"></asp:TextBox>
                </div>--%>
                <div class="col-md-4" >
                    <label>
                        Barcode Value:</label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBarcode" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                         ErrorMessage="*"></asp:RequiredFieldValidator>
                        <br />

                        <asp:TextBox ID="txtBarcode" placeholder="Barcode Value" CssClass="form-control" runat="server" autocomplete="false"></asp:TextBox>
                </div>
                <div class="col-md-4" >
                    <label>
                        Part No:</label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpartno" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                         ErrorMessage="*"></asp:RequiredFieldValidator>
                        <br />

                        <asp:TextBox ID="txtpartno" placeholder="Part No" CssClass="form-control" runat="server" autocomplete="false"></asp:TextBox>
                </div>
                <div class="col-md-4" >
                    <label>
                        Particulars:</label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtparticulars" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                         ErrorMessage="*"></asp:RequiredFieldValidator>
                        <br />

                        <asp:TextBox ID="txtparticulars" placeholder="Particulars" CssClass="form-control" runat="server" autocomplete="false"></asp:TextBox>
                </div>
                 <div class="col-md-4" >
                    <label>
                        MRP:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmrp" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                         ErrorMessage="*"></asp:RequiredFieldValidator>
                        <br />

                        <asp:TextBox ID="txtmrp" placeholder="MRP" CssClass="form-control" runat="server" autocomplete="false" onkeypress="return /[0-9 .]/i.test(event.key)"></asp:TextBox>
                </div>

                <div class="col-md-2" align="center">
                <br />
                    <asp:Button ID="btnSaveData" CssClass="btn btn-primary" runat="server" Text="Save"
                        OnClick="btnSaveData_Click" />

                         <asp:Button ID="btnUpdate" CssClass="btn btn-success" runat="server" Text="Update" Visible="false"
                        OnClick="btnUpdate_Click" />
                </div>
                 <div class="col-md-2" align="center">
                <br />
                

                    <asp:Button ID="btnReset" CssClass="btn btn-danger" runat="server" Text="Reset" CausesValidation="false"
                        OnClick="btnReset_Click" />
                </div>
            </div>
            <%--<asp:Button ID="btnGenrate" CssClass="btn btn-outline-primary" runat="server" Text="Generate" OnClick="btnGenrate_Click" />  --%>
        
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </div>
    <div class="container-fluid">
    <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
            OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnPageIndexChanging="GridView1_PageIndexChanged">
            <HeaderStyle BackColor="#344261" ForeColor="White" />
            <RowStyle Height="60px" />
            <Columns>
                <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                    ItemStyle-Width="20px" />
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Part ID">
                    <ItemTemplate>
                        <asp:Label ID="lblpartid" runat="server" Text='<%# Bind("partid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Barcode Value">
                    <ItemTemplate>
                        <asp:Label ID="lblbarcodedata" runat="server" Text='<%# Bind("barcodedata") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Part No">
                    <ItemTemplate>
                        <asp:Label ID="lblpartno" runat="server" Text='<%# Bind("partno") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Particulars">
                    <ItemTemplate>
                        <asp:Label ID="lblparticulars" runat="server" Text='<%# Bind("particulars") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="M.R.P.">
                    <ItemTemplate>
                        <asp:Label ID="lblmrp" runat="server" Text='<%# Bind("mrp") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Barcode" Visible="false">
                    <ItemTemplate  >
                     <asp:Label ID="lblbarcode" Font-Names="IDAutomationHC39M" runat="server" ></asp:Label>
                       <%-- <asp:PlaceHolder ID="PlaceHolder1Barcode"  runat="server"></asp:PlaceHolder>--%>
                       <%-- <asp:ImageButton ID="imgBarcode" runat="server" />--%>
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Barcode">
                    <ItemTemplate>
                        <asp:Button ID="btnPrint" runat="server" CssClass="btn btn-primary" CausesValidation="false" Text="Print Sticker" OnClick="btnPrintStickerReport_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server">
        </rsweb:ReportViewer>
    </div>
</asp:Content>
