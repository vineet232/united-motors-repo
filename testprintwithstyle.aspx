<%@ page language="C#" autoeventwireup="true" inherits="testprintwithstyle, App_Web_weocsvet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
     <style>
        #hidden_div{display: none;}
       
    </style>
    
   

   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   <script type="text/javascript">
       $(function () {
           $("#btnPrint").click(function () {
               var contents = $("#dvContents").html();
               var frame1 = $('<iframe />');
               frame1[0].name = "frame1";
               frame1.css({ "position": "absolute", "top": "-1000000px" });
               $("body").append(frame1);
               var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
               frameDoc.document.open();
               //Create a new HTML document.
               frameDoc.document.write('<html><head>');
               frameDoc.document.write('</head><body>');
               //Append the external CSS file.
               frameDoc.document.write('<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />');
               //Append the DIV contents.
               frameDoc.document.write(contents);
               frameDoc.document.write('</body></html>');
               frameDoc.document.close();
               setTimeout(function () {
                   window.frames["frame1"].focus();
                   window.frames["frame1"].print();
                   frame1.remove();
               }, 500);
           });
       });
</script>


</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="dvContents">
    <div id="hidden_div">
               <table class="table table-bordered">
                <tr>
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

               </table>
            </div>

 <table class="table table-bordered">
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
                        <td>
                            Total Premium:
                        </td>
                        <td class="altcol">
                            <asp:Label ID="lbltotalamount4" Text="0" Font-Bold="true" runat="server"></asp:Label>
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
                    </tr>
                    
                   
                </table>


</div>
<br />
<input type="button" id="btnPrint" value="Print" />
    </div>


       
    </form>
</body>
</html>
