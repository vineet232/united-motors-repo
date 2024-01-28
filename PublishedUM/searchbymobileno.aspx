<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="searchbymobileno, App_Web_y0qsyvj2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
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
            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Find by Mobile No
                    </div>
                    <div class="col-md-8">
                        <asp:Label ID="lblerrormsg" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                <div class="container">
                    <div class="col-md-6">
                        <label for="modelname" class="labelclass">
                            Enter Mobile No:
                        </label>
                        <br />
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox ID="txtsearchbymobileno" runat="server" MaxLength="10" onkeypress="return /[0-9]/i.test(event.key)" CssClass="form-control" placeholder="Enter Mobile No"></asp:TextBox>
                        </div>
                    </div>
                     <div class="col-md-4">
                <br />

                    <asp:Button ID="btnSearchbyMobileNo" runat="server" CssClass="btn btn-primary" Text="Find..." OnClick="btnSearchbyMobileNo_Click"  />
                </div>
                </div>
                <div class="col-md-12">
                <br />
                   <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound" >
                            <HeaderStyle BackColor="#344261" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                 <%-- <asp:CommandField ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/img/check.gif"
                            ItemStyle-Width="20px" />
                                <asp:TemplateField Visible="false" HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Sr#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Page Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpagename" runat="server" Text='<%# Bind("pagename") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Mobile No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmobileno" runat="server" Text='<%# Bind("mobileno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                               
                               
                            </Columns>
                        </asp:GridView>
                </div>
               
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
