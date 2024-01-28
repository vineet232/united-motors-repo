<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="premiumcalculator, App_Web_1ssuryoo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <script src="DataTableActions/PremiumCalculator.js" type="text/javascript"></script>--%>
   <%-- <link href="datatableResponsive/datatables.min.css" rel="stylesheet" type="text/css" />
    <script src="datatableResponsive/datatables.min.js" type="text/javascript"></script>--%>
    <%-- <link href="datatableCSSJS/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />--%>
  <%--  <link href="datatableCSSJS/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />--%>

    <style>
        #hidden_div{display: none;}
       
       
    </style>

   <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
   <script type="text/javascript">
//////       $(function () {
//////           $("#btnPrint").click(function () {
//////               debugger;
//////               var contents = $("#dvContents").html();
//////               var frame1 = $('<iframe />');
//////               frame1[0].name = "frame1";
//////               frame1.css({ "position": "absolute", "top": "-1000000px" });
//////               $("body").append(frame1);
//////               var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
//////               frameDoc.document.open();
//////               //Create a new HTML document.
//////               frameDoc.document.write('<html><head>');
//////               frameDoc.document.write('</head><body >');
//////               //Append the external CSS file.
//////               frameDoc.document.write('<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />');
//////               //Append the DIV contents.
//////               frameDoc.document.write(contents);
//////               frameDoc.document.write('</body></html>');
//////               frameDoc.document.close();
//////               setTimeout(function () {
//////                   window.frames["frame1"].focus();
//////                   window.frames["frame1"].print();
//////                   frame1.remove();
//////               }, 500);
//////           });
//////       });

       function printContents() {
           debugger;
           var contents = $("#dvContents").html();
           var frame1 = $('<iframe />');
           frame1[0].name = "frame1";
           frame1.css({ "position": "absolute", "top": "-1000000px" });
           $("body").append(frame1);
           var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
           frameDoc.document.open();
           //Create a new HTML document.
           frameDoc.document.write('<html><head>');
           frameDoc.document.write('</head><body style="font-size:smaller;">');
           //Append the external CSS file.
           frameDoc.document.write('<link href="css/PrintStyleSheet.css" rel="stylesheet" type="text/css" />');
           //Append the DIV contents.
           frameDoc.document.write(contents);
           frameDoc.document.write('</body></html>');
           frameDoc.document.close();
           setTimeout(function () {
               window.frames["frame1"].focus();
               window.frames["frame1"].print();
               frame1.remove();
           }, 500);
       }
</script>


   

   <%-- <script type="text/javascript">  

        function printPartOfPage(elementId) {
            var printContent = document.getElementById(elementId);
            var windowUrl = 'about:blank';
            var uniqueName = new Date();
            var windowName = 'Print' + uniqueName.getTime();
            var printWindow = window.open(windowUrl, windowName, 'left=50000,top=50000,width=0,height=0');

            printWindow.document.write('<html><head>');

            // Make sure the relative URL to the stylesheet works:
            printWindow.document.write('<base href="' + location.origin + location.pathname + '">');

            // Add the stylesheet link and inline styles to the new document:
            printWindow.document.write('<link rel="stylesheet" href="css/bootstrap.css">');
            printWindow.document.write('<style type="text/css">.style1{width: 100%;}</style>');

            printWindow.document.write('</head><body > <table class="table table-bordered">');

            printWindow.document.write(printContent.innerHTML);

           ///// var element2 = document.getElementById("hidden_div");
           ///// element2.classList.add("table table-bordered");
            printWindow.document.getElementById('hidden_div').style.display = 'block'

           

            printWindow.document.close();
            printWindow.focus();
            printWindow.print();
            printWindow.close();
        }  
 
    </script>--%>
    <%--<script>
        $(document).ready(function () {
            var currentYear = new Date().getFullYear()
            max = currentYear + 1
            var option = "";
            for (var year = currentYear - 15; year <= max; year++) {

                var option = document.createElement("option");
                option.text = year;
                option.value = year;

                document.getElementById("ddlModelYear").appendChild(option)

            }
            document.getElementById("ddlModelYear").value = currentYear;
        });
    </script>--%>
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
                        Premium Calculator
                    </div>
                    <div class="col-md-2" style="display: none;">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New</button>
                    </div>
                    <div align="center" class="col-md-6">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true" />
                    </div>
                </div>
                <%-- <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 70px; width:50%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add Payments
                                    </h4>
                                </div>--%>
                <div class="modal-body">
                    <br />
                    <form>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <%--<h6 class="text-on-pannel text-primary"><strong class="text-uppercase"> Model Details </strong></h6>--%>
                            <div class="form-group" />
                            <input type="hidden" name="recordID" id="recordID" value="">
                            <div class="col-md-12">
                                <%-- <div class="col-md-4">
                                    <label for="modelname" class="labelclass">
                                        Date (MM/dd/yyyy):</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtDate" name="txtDate" maxlength="10" placeholder="Payment Date"
                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" autocomplete="off" />
                                    </div>
                                </div>--%>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Select Company :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <%-- <select id="ddlcompany" class="form-control" runat="server" clientidmode="Static">
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>--%>
                                        <asp:DropDownList ID="ddlcompany" runat="server" ClientIDMode="Static" CssClass="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Model Year:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <asp:DropDownList ID="ddlModelYear" runat="server" ClientIDMode="Static" CssClass="form-control">
                                        </asp:DropDownList>
                                        <%--  <select id="ddlModelYear" class="form-control" runat="server" clientidmode="Static">
                                            <option value="0" selected="selected">Please Select</option>
                                        </select>--%>
                                    </div>
                                </div>
                                <%-- <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Date of Sale:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtDate" clientidmode="Static"
                                            maxlength="10" placeholder="Date of Sale" onkeydown="return false;" ondrop="return false;"
                                            onpaste="return false;" autocomplete="off" />
                                    </div>
                                    
                                </div>--%>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        IDV:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtidv" clientidmode="Static"
                                            maxlength="30" placeholder="IDV" autocomplete="off" required onkeypress="return /[0-9]/i.test(event.key)"
                                            onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        IDV Trolly:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtIDVTrolly" value="0"
                                            clientidmode="Static" maxlength="30" placeholder="IDV Trolly" autocomplete="off"
                                            required onkeypress="return /[0-9]/i.test(event.key)" onkeyup="myFunc(this);"
                                            ondrop="return false;" onpaste="return false;" />
                                    </div>
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        IDV Electrical Accessories:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtidvelectricalaccess"
                                            value="0" clientidmode="Static" maxlength="30" placeholder="IDV Elect. Access."
                                            autocomplete="off" required onkeypress="return /[0-9]/i.test(event.key)" onkeyup="myFunc(this);"
                                            ondrop="return false;" onpaste="return false;" />
                                    </div>
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>
                                <div class="col-md-3">
                                    <label for="paymentto" id="paymentto" class="labelclass">
                                        GVW:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtGVW" clientidmode="Static"
                                            maxlength="30" placeholder="GVW" autocomplete="off" required onkeypress="return /[0-9]/i.test(event.key)"
                                            onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        OD Disc.:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" id="txtoddisc" runat="server" value="0" clientidmode="Static"
                                            maxlength="30" placeholder="OD Disc" autocomplete="off" required onkeypress="return /[0-9 .-]/i.test(event.key)"
                                            onkeyup="myFunc(this);" ondrop="return false;" onpaste="return false;" />
                                    </div>
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        NCB:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <%-- <select id="ddlncb" class="form-control" runat="server" clientidmode="Static">
                                            <option value="0" selected="selected">Please Select</option>
                                            <option value="1">0</option>
                                            <option value="2">20</option>
                                            <option value="3">25</option>
                                            <option value="4">35</option>
                                            <option value="5">45</option>
                                            <option value="6">50</option>
                                        </select>--%>
                                        <asp:DropDownList ID="ddlncb" runat="server" ClientIDMode="Static" CssClass="form-control">
                                            <asp:ListItem Value="0">Select NCB</asp:ListItem>
                                            <asp:ListItem Value="1">0</asp:ListItem>
                                            <asp:ListItem Value="2">20</asp:ListItem>
                                            <asp:ListItem Value="3">25</asp:ListItem>
                                            <asp:ListItem Value="4">35</asp:ListItem>
                                            <asp:ListItem Value="5">45</asp:ListItem>
                                             <asp:ListItem Value="6">50</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Towing :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <%--  <select id="ddltowing" class="form-control" runat="server" clientidmode="Static">
                                            <option value="0" selected="selected">Please Select</option>
                                            <option value="1">0</option>
                                            <option value="2">10000</option>
                                            <option value="3">20000</option>
                                        </select>--%>
                                        <asp:DropDownList ID="ddltowing" runat="server" ClientIDMode="Static" CssClass="form-control">
                                            <asp:ListItem Value="0">Select Towing</asp:ListItem>
                                            <asp:ListItem Value="1">0</asp:ListItem>
                                            <asp:ListItem Value="2">10000</asp:ListItem>
                                            <asp:ListItem Value="3">20000</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        CNG Value:</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                        </span>
                                        <input type="text" class="form-control" runat="server" id="txtcngvalue" value="0"
                                            clientidmode="Static" maxlength="30" placeholder="CNG Value" autocomplete="off"
                                            required onkeypress="return /[0-9]/i.test(event.key)" onkeyup="myFunc(this);"
                                            ondrop="return false;" onpaste="return false;" />
                                    </div>
                                    <%-- onkeypress="return numericOnly(this);" --%>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkimt23" runat="server"  clientidmode="Static" name="chkimt23"
                                            value="" checked  />
                                        <label for="modelname" class="labelclass" >
                                            IMT-23</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chknildep" runat="server" clientidmode="Static" name="chknildep"
                                            value="" checked />
                                        <label for="modelname" class="labelclass">
                                            Nil Dep</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkisgeographical" name="chkisgeographical" runat="server"
                                            clientidmode="Static" value="" checked />
                                        <label for="modelname" class="labelclass">
                                            Is Geographical</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkcng" name="chkcng" value="" runat="server" clientidmode="Static"
                                            checked />
                                        <label for="modelname" class="labelclass">
                                            CNG</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkPA" name="chkPA" runat="server" clientidmode="Static"
                                            value="" checked />
                                        <label for="modelname" class="labelclass">
                                            PA</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkPADriver" name="chkPADriver" runat="server" clientidmode="Static"
                                            value="" checked />
                                        <label for="modelname" class="labelclass">
                                            PA Driver</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <input type="checkbox" id="chkPACleaner" name="chkPACleaner" runat="server" clientidmode="Static"
                                            value="" checked />
                                        <label for="modelname" class="labelclass">
                                            PA Cleaner
                                        </label>
                                    </div>
                                </div>
                                 
                        </div>

                        <div class="col-md-12">
                            <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Customer Name :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                       <input type="text" id="txtcustname" class="form-control" runat="server" clientidmode="Static" maxlength="30" placeholder="Customer Name" autocomplete="off" />
                                            
                                        </select>
                                    </div>
                            </div>
                            <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Vehicle No :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                       <input type="text" id="txtvehicleno" class="form-control" runat="server" clientidmode="Static" maxlength="30" placeholder="Vehicle No" autocomplete="off" />
                                            
                                        </select>
                                    </div>
                            </div>
                            <div class="col-md-3">
                                    <label for="modelname" class="labelclass">
                                        Vehicle Model :</label>
                                    <br />
                                    <div class="input-group margin-bottom-sm">
                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                        </span>
                                      <select id="ddlModel" style="width:100%;" class="form-control" runat="server" clientidmode="Static">
                                                            <option value="0">Please Select</option>
                                                        </select>
                                            
                                        </select>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer123" align="center" style="background-color: #F7F7F7;">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" CssClass="btn btn-danger"
                        OnClick="btncalculate_click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>

           <%-- <div>
                <marquee behavior="alternate"><b style="color:Red; font-size:xx-large;">This calculator is developed and maintained by United Motors </b> <b style="color:white;">Amit Walia</b> </marquee>
            </div>--%>
            
            
            <div>
            
            

        

            <div id="dvContents">

                <div id="hidden_div">
               <table class="table table-bordered table-condensed">
                <tr >
                    <td colspan="4" align="center">
                        <b>Good Carrying Vehicle Premium Quotation</b>
                    </td>
                </tr>

                 <tr class="altcol">
                    <td colspan="4" align="center">
                        <b>Vehicles Details</b>
                    </td>
                </tr>
                <tr>
                    <td>
                    Insurance Company:
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblprintinscompany" runat="server"></asp:Label>
                    </td>
                    <td>
                        Model:
                    </td>
                    <td class="altcol">
                         <asp:Label ID="lblprintmodel" runat="server"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                    IDV:
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblprintidv" runat="server"></asp:Label>
                    </td>
                    <td>
                        IDV Trolly:
                    </td>
                    <td class="altcol">
                         <asp:Label ID="lblprintidvtrolly" runat="server"></asp:Label>
                    </td>
                </tr>

                 <tr>
                    <td>
                    IDV Electrical Accessories:
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblprintelect" runat="server"></asp:Label>
                    </td>
                    <td>
                        Gross Weight:
                    </td>
                    <td class="altcol">
                         <asp:Label ID="lblprintgrossweight" runat="server"></asp:Label>
                    </td>
                </tr>

                 <tr>
                    <td>
                    OD Discount:
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblprintoddisc" runat="server"></asp:Label>
                    </td>
                    <td>
                        NCB:
                    </td>
                    <td class="altcol">
                         <asp:Label ID="lblprintncb" runat="server"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                    Towing Charges:
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblprinttowing" runat="server"></asp:Label>
                    </td>
                    <td>
                        CNG Value:
                    </td>
                    <td class="altcol">
                         <asp:Label ID="lblprintcngval" runat="server"></asp:Label>
                    </td>
                </tr>

                 <tr>
                    <td>
                    IMT 23:
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblprintisimt23" runat="server"></asp:Label>
                    </td>
                    <td>
                        Nil Dep:
                    </td>
                    <td class="altcol">
                         <asp:Label ID="lblprintisnildep" runat="server"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                    Is Geographical:
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblprintisgeographical" runat="server"></asp:Label>
                    </td>
                    <td>
                        CNG:
                    </td>
                    <td class="altcol">
                         <asp:Label ID="lblprintiscng" runat="server"></asp:Label>
                    </td>
                </tr>

                 <tr>
                    <td>
                    PA (Owner Driver):
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblprintpaownerdriver" runat="server"></asp:Label>
                    </td>
                    <td>
                        Paid Driver
                    </td>
                    <td class="altcol">
                         <asp:Label ID="lblprintpaiddriver" runat="server"></asp:Label>
                    </td>
                </tr>

                 <tr>

                 <td>&nbsp;</td>
                  <td>&nbsp;</td>

                    <td>
                    Paid Cleaner:
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblprintpaidcleaner" runat="server"></asp:Label>
                    </td>
                    <%--<td>
                        Model
                    </td>
                    <td>
                         <asp:Label ID="Label17" runat="server"></asp:Label>
                    </td>--%>
                </tr>

                 <tr>

                
                    <td>
                   Customer Name:
                    </td>
                    <td class="altcol">
                        <asp:Label ID="lblcustomername" runat="server"></asp:Label>
                    </td>
                    <td>
                        Vehicle No:
                    </td>
                    <td>
                         <asp:Label ID="lblvehicleno" runat="server"></asp:Label>
                    </td>
                   
                </tr>
                <tr>
                      <td>
                        Vehicle Model:
                    </td>
                    <td>
                         <asp:Label ID="lblvehiclemodel" runat="server"></asp:Label>
                    </td>
                </tr>
                 <tr>
                      <td colspan="4">
                        Cashless by United Motors, Hisar
                    </td>
                   
                </tr>

               </table>
            </div>

                <table class="table table-bordered table-condensed">
                <tr class="altcol">
                    <td colspan="4" align="center">
                        <b>Insurance Details</b>
                    </td>
                </tr>

                    <tr>
                        <td>
                            Towing Charges:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblTowingCharges" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Trolly TP:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lbltrollytp" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            Geographical Extension:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblgeographicalext" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Basic TP Cover:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblbasictpcover" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Trolly Premium:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lbltrollypremium" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Owner Driver:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblownerdriver" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CNG Charges:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblcngcharges" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Driver PA:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lbldriverpa" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Basic OD:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblbasicod" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Cleaner PA:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblcleanerpa" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Basic OD after discount:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblbasicodafterdiscount" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Geographical TP:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblgeographicaltp" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Electrical Premium:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblelectricalpremium" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            CNG & LPG TP:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblcnglpgtp" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Electrical Premium after discount:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblelectpreiumafterdisc" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                            Total (TP +
                            <asp:Label ID="lbladdedvalues" runat="server"></asp:Label>);
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lbltotaltpdrivercleaner" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Imt 23:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblimt" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td>
                             GST @12%:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblgst12" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                       
                         <td>
                            Imt After Discount:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblimtafterdiscount" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                         
                           <td>
                            GST @18%:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblgst18" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                       

                         <td>
                            CNG Premium:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblcngpremium" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        <td >
                            Total GST:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lbltotalgst" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                         

                    </tr>
                    <tr>
                        <td>
                            Total Premium (Basic OD + IMT 23):
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblTotal1" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Amount after Discount:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblamtafterdiscount" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            Nil Dep. Premium:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblnildepamount" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nil Dep. Discount:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblnildepdiscount" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nil Dep. Premium after Discount:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblnildepremiumafterdiscount" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            NCB:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lblncbamt" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Total:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lbltotalamount2" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Total Amount:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lbltotalamount3" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>

                        <td>
                            Total Payable Premium:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lbltotalamount4" Text="0" Font-Bold="true" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                   
                </table>
            </div>
            <div align="center">

            <input type="button" id="btnPrint" class="btn btn-danger" value="Print" onclick="printContents()" />

               <%-- <input type="button" class="btn btn-danger" value="Print" onclick="JavaScript:printPartOfPage('divPrint');" />--%>
            </div>
            
          
            <div class="col-md-12" style="background-color: White !important;">
                <div class="c1">
                    <div id="Showoverlay" class="overlayWindow">
                        <h2>
                            Loading .. Please wait</h2>
                    </div>
                </div>
            </div>
            </div>
         
    
        </ContentTemplate>
       
    </asp:UpdatePanel>

    <script type="text/javascript">
        $(document).ready(function () {

            $("#ddlModel").select2();

            $.ajax({
                type: "POST", url: "policyrenewal.aspx/GetModelName",
                dataType: "json",
                contentType: "application/json",
                success: function (res) {
                    $.each(res.d, function (data, value) {

                        $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
                    })

                    ////// $("#ddlModel").select2();
                }
        ,
                error: function (response) {
                    ///alert(response.responseText);
                    $.notify("BOOM!", "error");
                }

            });

        });
    </script>
   <%-- <script type="text/javascript">
                  $(document).ready(function () {

////                      // Initialize select2
////                      $("#ddlPaymentTo").select2();
                      ////                      $("#ddlPaymentToBank2").select2();

                        });


                         $(function () {
            showCalendar(); // bind data table on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(showCalendar); // bind data table on every UpdatePanel refresh
        });

        function showCalendar()
        {
 $('#txtDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
    }

                
    </script>--%>
</asp:Content>
