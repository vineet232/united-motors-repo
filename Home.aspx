<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="home, App_Web_y0qsyvj2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <style>
    
    
    /*almost everything here is em based*/
/*@import url(https://fonts.googleapis.com/css?family=Crete+Round);

html{
  font-size:1em;
  background: #825582;
}

h1, h2 {
  font-family: 'Crete Round', serif;
}

a{
  color: #825582;
  text-decoration: none;
}

.content{
  
  width: 90%;
  max-width: 1080px;
  min-height: 3.750em; 
  margin: 2em auto;
  padding: 1.250em;
  border-radius: 0.313em;
  box-shadow: 0 2px 5px 0 rgba(0,0,0,0.5);
  line-height: 1.5em;
  color: #292929;
}

.ribbon{
  position:relative;
  padding: 0 0.5em;
  font-size:2.000em;
  margin: 0 0 0 -0.625em;
  line-height: 1.875em;
  color: #fff;
  border-radius: 0 0.156em 0.156em 0;
  background: maroon;
  box-shadow: -1px 2px 3px rgba(0,0,0,0.5);
}

.ribbon:before, .ribbon:after{
  position:absolute;
  content: '';
  display: block;
}

.ribbon:before{
  width: 0.469em;
  height: 100%;
  padding: 0 0 0.438em;
  top:0;
  left: -0.469em;
  background:inherit;
  border-radius: 0.313em 0 0 0.313em;
}

.ribbon:after{
  width: 0.313em;
  height: 0.313em;
  background: rgba(0,0,0,0.35);
  bottom: -0.313em;
  left: -0.313em;
  border-radius: 0.313em 0 0 0.313em;
  box-shadow: inset -1px 2px 2px rgba(0,0,0,0.3);
}

@media (max-width: 600px) {
  
  body{
    font-size:0.875em;
  }
  
  .ribbon{
    line-height: 1.143em;
    padding: 0.5em;
  }
  
  .ribbon:before, .ribbon:after{
    font-size: 0.714em;
  }
  
}*/



.ribbon {
  width: 400px;
  height: 60px;
  margin: 100px auto 0px;
  position: relative;
  color: #fff;
  font: 28px/60px sans-serif;
  text-align: center;
  text-transform: uppercase;
  background: #3D79D0;
  
  -webkit-animation: main 250ms;
  -moz-animation: main 250ms;
  -ms-animation: main 250ms;
  animation: main 250ms;
}

.ribbon i {
  position: absolute;
}

.ribbon i:first-child, .ribbon i:nth-child(2) {
  position: absolute;
  left: -20px;
  bottom: -20px;
  z-index: -1;
  border: 20px solid transparent;
  border-right-color: #043140;
  
  -webkit-animation: edge 500ms;
  -moz-animation: edge 500ms;
  -ms-animation: edge 500ms;
  animation: edge 500ms;
}

.ribbon i:nth-child(2) {
  left: auto;
  right: -20px;
  border-right-color: transparent;
  border-left-color: #043140;
}

.ribbon i:nth-child(3), .ribbon i:last-child {
  width: 20px;
  bottom: -20px;
  left: -60px;
  z-index: -2;
  border: 30px solid #1D53C0;
  border-left-color: transparent;
  
  -webkit-animation: back 600ms;
  -moz-animation: back 600ms;
  -ms-animation: back 600ms;
  animation: back 600ms;
  
  -webkit-transform-origin: 100% 0;
  -moz-transform-origin: 100% 0;
  -ms-transform-origin: 100% 0;
  transform-origin: 100% 0;
}

.ribbon i:last-child {
  bottom: -20px;
  left: auto;
  right: -60px;
  border: 30px solid #1D53C0;
  border-right-color: transparent;

  -webkit-transform-origin: 0 0;
  -moz-transform-origin: 0 0;
  -ms-transform-origin: 0 0;
  transform-origin: 0 0;
}

p {
  text-align: center;
  color: #aaa;
}

/* animations */

@-webkit-keyframes main {
  0% { -webkit-transform: scaleX(0); }
  100% { -webkit-transform: scaleX(1); }
}

@-webkit-keyframes edge {
  0%, 50% { -webkit-transform: scaleY(0); }
  100% { -webkit-transform: scaleY(1); }
}

@-webkit-keyframes back {
  0%, 75% { -webkit-transform: scaleX(0); }
  100% { -webkit-transform: scaleX(1); }
}


@-moz-keyframes main {
  0% { -moz-transform: scaleX(0); }
  100% { -moz-transform: scaleX(1); }
}

@-moz-keyframes edge {
  0%, 50% { -moz-transform: scaleY(0); }
  100% { -moz-transform: scaleY(1); }
}

@-moz-keyframes back {
  0%, 75% { -moz-transform: scaleX(0); }
  100% { -moz-transform: scaleX(1); }
}


@keyframes main {
  0% { transform: scaleX(0); }
  100% { transform: scaleX(1); }
}

@keyframes edge {
  0%, 50% { transform: scaleY(0); }
  100% { transform: scaleY(1); }
}

@keyframes back {
  0%, 75% { transform: scaleX(0); }
  100% { transform: scaleX(1); }
}



   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 0px;">
        <div style="display: none;">
            <button onclick="topFunction()" id="myBtn" title="Go to top">
                Top</button>
        </div>
    </div>
    <%--<p style="font-weight:bold; font-size:larger; color:Red; text-align:center;">
    Welcome to  United Motors ERP
</p>--%>
    <%--<div class="content"><h1 class="ribbon">United ERP</h1></div>--%>
   <%-- <div class="ribbon">
        United ERP <i></i><i></i><i></i><i></i>
    </div>--%>

    <%-- <div align="center" style="font-size:x-large; color:Navy;">
        United ERP
    </div>
    <hr />--%>

   <%-- <div>
        <asp:Button ID="btnSendSMS" runat="server" Text="Send SMS" CssClass="btn btn-primary" OnClick="btnSendSMS_Click" Visible="false" />
        &nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="btnSendWhatsappMessages" runat="server" Text="Send Whatsapp Messages" CssClass="btn btn-success" OnClick="btnSendWhatsappMessages_Click" Visible="false" />
    </div>--%>
    <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
    <br />

       <div class=" row">
            <div class="col-md-2">
                &nbsp;</div>
            <div class="col-md-2   ">
                <a href="slipdetails.aspx" style="text-decoration: none;">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h5>
                                Total United Open Slips
                            </h5>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/slip2.png" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lblunitedopenslips" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2 ">
                <a href="slipdetailsva.aspx" style="text-decoration: none;">
                    <div class="panel panel-success">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h5>
                                Total Vipin Open Slips
                            </h5>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/slip1.png" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lblvipinopenslips" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2 ">
                <a href="sparepartsdelivery.aspx" style="text-decoration: none;">
                    <div class="panel panel-danger">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h5>
                                Total Open Challans
                            </h5>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/slip3.png" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lbltotalopendeliverychallans" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>

             <div class="col-md-2 ">
                <a href="vehicletracker.aspx" style="text-decoration: none;">
                    <div class="panel panel-warning">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h5>
                                Total Open Tracker
                            </h5>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/vehicletracker.png" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lbltotalopenvehicletracker" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-2">
                &nbsp;</div>

               </div>

                <div class=" row">
            <div class="col-md-2">
                &nbsp;</div>
                <div class="col-md-2 ">
                <a href="attendancemarkdailyedit.aspx" style="text-decoration: none;">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h5>
                                Total Absent
                            </h5>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/absent2.jpg" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lbltotalabsent" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>


            <div class="col-md-2  " id="divbackup" runat="server" visible="false">
                <a href="#" style="text-decoration: none;">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h4>
                                Backup DataBase
                            </h4>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                             <asp:LinkButton ID="lnkBackupDB" runat="server" OnClick="lnkBackupDB_Click">  <img src="img/backup.jpg" height="60px" style="margin-bottom: 10px"> </asp:LinkButton>
                             </i>
                            <br />
                            <b style="font-size: x-small; color: Red;"><asp:LinkButton ID="lblDBBackup" runat="server" OnClick="lblDBBackup_DownloadBackupClick"></asp:LinkButton></b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>


        </div>


    <div class="row" style=" display:none;">
        <div class=" row">
            <div class="col-md-2">
                &nbsp;</div>
            <div class="col-md-2   ">
                <a href="masteremployees.aspx" style="text-decoration: none;">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h4>
                                Total Employee
                            </h4>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/homevendors.png" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lblTotalEmployees" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2 ">
                <a href="mastervendors.aspx" style="text-decoration: none;">
                    <div class="panel panel-success">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h4>
                                Total Vendor
                            </h4>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/paidicon.png" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lblTotalVendors" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2 ">
                <a href="Home.aspx" style="text-decoration: none;">
                    <div class="panel panel-danger">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h4>
                                Total Customer
                            </h4>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/customers.jpg" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lblTotalCustomers" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2 ">
                <a href="Home.aspx" style="text-decoration: none;">
                    <div class="panel panel-info">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h4>
                                Total Insurance
                            </h4>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/insurance.jpg" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lblTotalInsurance" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2">
                &nbsp;</div>
        </div>
        <div class=" row">
            <div class="col-md-2">
                &nbsp;</div>
            <%--<div class="col-md-2  ">
                <a href="#" style="text-decoration: none;">
                    <div class="panel panel-primary">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h4>
                                Backup DataBase
                            </h4>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                             <asp:LinkButton ID="lnkBackupDB" runat="server" OnClick="lnkBackupDB_Click">  <img src="img/backup.jpg" height="60px" style="margin-bottom: 10px"> </asp:LinkButton>
                             </i>
                            <br />
                            <b style="font-size: x-small; color: Red;"><asp:LinkButton ID="lblDBBackup" runat="server" OnClick="lblDBBackup_DownloadBackupClick"></asp:LinkButton></b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>--%>
            <div class="col-md-2 ">
                <a href="Home.aspx" style="text-decoration: none;">
                    <div class="panel panel-success">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h4>
                                Total Models
                            </h4>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/models.jpg" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lblTotalModels" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2 ">
                <a href="Home.aspx" style="text-decoration: none;">
                    <div class="panel panel-danger">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h4>
                                Total Users
                            </h4>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/users.jpg" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lblTotalUsers" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2  ">
                <a href="Home.aspx" style="text-decoration: none;">
                    <div class="panel panel-info">
                        <div class="panel panel-heading text-center text-capitalize">
                            <h4>
                                Insurance Claims
                            </h4>
                        </div>
                        <div class="panel-body" align="center">
                            <i>
                                <img src="img/insuranceclaims.jpg" height="60px" style="margin-bottom: 10px"></i>
                            <br />
                            <b style="font-size: x-large; color: Red;">(<asp:Label ID="lblTotalInsuranceClaims" runat="server"></asp:Label>)</b>
                            <br />
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-2">
                &nbsp;</div>
        </div>
        <br />
        <br />
    </div>
    <%--<div style="background-color:Silver; min-height:200px; min-width:200px;">
    This is a popupe
</div>--%>
    <%-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <style type="text/css">
        #overlay
        {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #000;
            filter: alpha(opacity=70);
            -moz-opacity: 0.7;
            -khtml-opacity: 0.7;
            opacity: 0.7;
            z-index: 100;
            display: none;
        }
        .cnt223 a
        {
            text-decoration: none;
        }
        .popup
        {
            width: 100%;
            margin: 0 auto;
            display: none;
            position: fixed;
            z-index: 101;
        }
        .cnt223
        {
            min-width: 600px;
            width: 600px;
            min-height: 150px;
            margin: 50px auto;
            background: #f3f3f3;
            position: relative;
            z-index: 103;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px #000;
        }
        .cnt223 p
        {
            clear: both;
            color: #555555;
            text-align: justify;
        }
        .cnt223 p a
        {
            color: #d91900;
            font-weight: bold;
        }
        .cnt223 .x
        {
            float: right;
            height: 35px;
            left: 22px;
            position: relative;
            top: -25px;
            width: 34px;
        }
        .cnt223 .x:hover
        {
            cursor: pointer;
        }
    </style>
    <script type='text/javascript'>
        $(function () {
            var overlay = $('<div id="overlay"></div>');
            overlay.show();
            overlay.appendTo(document.body);
            $('.popup').show();
            $('.close').click(function () {
                $('.popup').hide();
                overlay.appendTo(document.body).remove();
                return false;
            });


            $('.x').click(function () {
                $('.popup').hide();
                overlay.appendTo(document.body).remove();
                return false;
            });
        });
    </script>
    <div class='popup'>
        <div class='cnt223'>
            <img src="img/x3.png" alt='quit' class='x' id='x' />
            <p>
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="90%">
                <HeaderStyle BackColor="Teal" ForeColor="White" />
                <AlternatingRowStyle BackColor="#DFEAF9" />
                <Columns>
                    <asp:BoundField HeaderText="User Name" DataField="username" ItemStyle-Width="100px" ItemStyle-Wrap="false" />
                     <asp:BoundField HeaderText="LoggedIn Date/Time" DataField="loggedindatetime" ItemStyle-Width="100px" ItemStyle-Wrap="false" />
                      <asp:BoundField HeaderText="IP Address" DataField="ip_addr" ItemStyle-Width="80px" ItemStyle-Wrap="false" />
                      <asp:BoundField HeaderText="Status" DataField="login_logout" ItemStyle-Width="100px" ItemStyle-Wrap="false" />
                </Columns>
                </asp:GridView>
                <br />
                <br />
                <a href='' class='close'>Close</a>
            </p>
        </div>
    </div>--%>
</asp:Content>
