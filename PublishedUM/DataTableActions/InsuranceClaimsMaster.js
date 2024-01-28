
$(document).ready(function () {

$("#ddlModel").select2();
$("#ddlSurveyorSpot").select2();
$("#ddlSurveyorFinal").select2();
$("#ddlSurveyorReInspection").select2();
$("#ddlInsuranceCompany").select2();
$("#ddlClaimStatus").select2();

$("#ddlcranevendor").select2();




$(".tabs").click(function(){
    
    $(".tabs").removeClass("active");
    $(".tabs h6").removeClass("font-weight-bold");    
    $(".tabs h6").addClass("text-muted");    
    $(this).children("h6").removeClass("text-muted");
    $(this).children("h6").addClass("font-weight-bold");
    $(this).addClass("active");

    current_fs = $(".active");

    next_fs = $(this).attr('id');
    next_fs = "#" + next_fs + "1";

    $("fieldset").removeClass("show");
    $(next_fs).addClass("show");

    current_fs.animate({}, {
        step: function() {
            current_fs.css({
                'display': 'none',
                'position': 'relative'
            });
            next_fs.css({
                'display': 'block'
            });
        }
    });
});




 $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetInsuranceCompanyName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlInsuranceCompany").append($("<option></option>").val(value.id).html(value.Name));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });


     $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetCraneVendorMaster",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlcranevendor").append($("<option></option>").val(value.id).html(value.vendorname));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });


     $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetSurveyorName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlSurveyorSpot").append($("<option></option>").val(value.id).html(value.Name));
                 $("#ddlSurveyorFinal").append($("<option></option>").val(value.id).html(value.Name));
                  $("#ddlSurveyorReInspection").append($("<option></option>").val(value.id).html(value.Name));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });

     $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetInsuranceType",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlInsuranceType").append($("<option></option>").val(value.id).html(value.Name));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });
    $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });


    $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetMasterClaimStatus",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlClaimStatus").append($("<option></option>").val(value.id).html(value.claimStatus));
                ///////$("#ddlsearchbyclaimstatus").append($("<option></option>").val(value.id).html(value.claimStatus));
            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });

   


    $('#txtEstimatedDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

    $('#txtDateofLoss').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
        endDate: "today"
    });
    
    
     $('#txtInsDueDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });


    $('#txtInvoiceDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });


     $('#txtmanufacturedt').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

    



})  




function ddlcranevendor_SelectedIndexChanged() {
    

     var id = $("#ddlcranevendor :selected").val();

    ////alert(id);
   
    $.ajax({
        type: "POST",
        url: "insuranceclaimdetails.aspx/GetCraneVendorContactNo",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
         $("#txtcranevendorcontactno").val(JSON.parse(result.d));
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });
}

function GetSelectedCraneVendor(cranevendid)
{
   $('#ddlcranevendor').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
       type: "POST", url: "insuranceclaimdetails.aspx/GetCraneVendorMaster",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlcranevendor").append($("<option></option>").val(value.id).html(value.vendorname));
            })
         $('#ddlcranevendor').val(cranevendid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
}
 
 function GetSelectedModelbyid(modelid)
 {
 $('#ddlModel').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
    $.ajax({
       type: "POST", url: "insuranceclaimdetails.aspx/GetModelName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlModel").append($("<option></option>").val(value.id).html(value.Name));
            })
         $('#ddlModel').val(modelid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetSelectedInsCompbyid(inscompid)
 {
 $('#ddlInsuranceCompany').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
   $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetInsuranceCompanyName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlInsuranceCompany").append($("<option></option>").val(value.id).html(value.Name));
            })
         $('#ddlInsuranceCompany').val(inscompid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }
 function GetSelectedClaimStatusbyid(modelid)
 {
 $('#ddlClaimStatus').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
     $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetMasterClaimStatus",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlClaimStatus").append($("<option></option>").val(value.id).html(value.claimStatus));
            })

             $('#ddlClaimStatus').val(modelid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }


 function GetSpotSurveyorbyid(spotsid)
 {
 $('#ddlSurveyorSpot').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
   $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetSurveyorName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlSurveyorSpot").append($("<option></option>").val(value.id).html(value.Name));
            })

            $('#ddlSurveyorSpot').val(spotsid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }

 function GetFinalSurveyorbyid(finalsid)
 {
 $('#ddlSurveyorFinal').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
   $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetSurveyorName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlSurveyorFinal").append($("<option></option>").val(value.id).html(value.Name));
            })

            $('#ddlSurveyorFinal').val(finalsid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }


 function GetReinspectionSurveyorbyid(reinssid)
 {
 $('#ddlSurveyorReInspection').find('option:not(:first)').remove();
 ////$('#ddlPayoutAccountType').find('option:not(:first)').remove();
 $("#Showoverlay").show();
   $.ajax({
        type: "POST", url: "insuranceclaimdetails.aspx/GetSurveyorName",
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlSurveyorReInspection").append($("<option></option>").val(value.id).html(value.Name));
            })

            $('#ddlSurveyorReInspection').val(reinssid);
            $("#Showoverlay").hide();
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
            $("#Showoverlay").show();
        }

    });
 }





$(function () {
    //$("#Showoverlay").show();
    //GetData();
    BindDataTable();
});




function BindDataTable() {


 $("#tblRecords").dataTable().fnDestroy();

 /////////////for export import ///////////////

  var show = false;
 var printPermission= $("#hdnPrintPermission").val();
 //////alert(printPermission);

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
				title: 'Save as Excel',
                 "action": newexportaction,
				
		}, 

        {
			extend: 'pdf',
				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
				titleAttr: 'Pdf',
				title: 'Save as PDF',
                 "action": newexportactiontoPDF,
				
		} 

         ]) // end array

  }

  //////////////End for import export /////////////////////
//var i = 1;
 
            $('#tblRecords').DataTable({
            "order": [[ 6, 'asc' ]],
            "columnDefs": [
        //////     { "visible": false, "targets": [0] }
    ],
//            "async": false,
//                "processing": true,
//                "serverSide": true,
//                "ajax": {
//                    url: "WebServiceDataTable.asmx/GetDataForDataTable", type: "post"
//                },

                bServerSide: true,
                sAjaxSource: 'InsuranceClaimsListHandler.ashx/GetClaimsData',
                sServerMethod: 'post',
                "processing": true,
                 bPaginate: true,

             "sPaginationType": "input",

               dom: 'Bfrtip',
                responsive: true,
               buttons: buttons,

                "columns": [
                
                    {  "data": "id" ,
////                     {
////                     bSortable: false,
////                      render: function (data, type, row, meta) {
////                     return meta.row + meta.settings._iDisplayStart + 1;
////                    }

 render: function (data, type, row, meta) {
            return meta.row + meta.settings._iDisplayStart + 1;
       }
                    },
                    { "data": "ocustname",
                        render: function ( data, type, row )
                        {
                         return row.ocustname + '<hr style="border-top: 2px solid #F0F0F0; margin-top:3px;margin-botton:-2px;" />(' + row.ocontactno + ')';
                        }
                     },
                    { "data": "ovehno" },
                    { "data": "oinscompname" },
//                    { "data": "policyno" },
                   
                    { "data": "orepairtype" },
                    { "data": "oestimateddate" ,
                        render: function ( data, type, row )
                        {
                         return row.oestimateddate  + '<hr style="border-top: 2px solid #F0F0F0; margin-top:3px;margin-botton:-2px;" />  ' + row.invoicedate +  '';

////                         + '<hr style="border-top: 1px solid #F0F0F0; margin-top:3px;margin-botton:-2px;" />  ' + row.odateofloss
                        }
                    },
                     { "data": "odays"
                     ,
                         render: function ( data, type, row )
                        {
                         return row.odays  + "<br />" + '<hr style="border-top: 2px solid #F0F0F0; margin-top:3px;margin-botton:-2px;" />  ' + row.totaldaysafterinvdt + '';

////                         + '<hr style="border-top: 2px solid #F0F0F0; margin-top:3px;margin-botton:-2px;" />  '
                        }

                      },
                    { "data": "ovehmakemodel",
                        render: function ( data, type, row )
                        {
                         return row.ovehmakemodel + '<br />  ' + row.oinstype + '';
                        }
                     },
                    { "data": "osurveyornamespot",
                        render: function ( data, type, row )
                        {
                         return "<div class='text-nowrap'>" + '<b style="color:red;"> Spot- </b>' + row.osurveyornamespot +" (" + row.spotsurveyormobileno + ")" + '<br /> <b style="color:red;"> Final- </b> ' + row.osurveyornamefinal +" (" + row.finalsurveyormobileno + ")" + '<br /> <b style="color:red;">RI-</b> ' + row.osurveyornamereins +" (" + row.reinssurveyormobileno + ")" + '' + "</div>";
                        }
                     },


////                    { "data": "osurveyornamefinal"  },
////                    { "data": "osurveyornamereins"  },
                 ////   { "data": "oinstype" },
                    
                   //// { "data": "odateofloss" },
                     
                     
//                      { "data": "ocontactno" },
                       { "data": "oclaimstatus" },
                        { "data": "remarks",
                            
                            render: function ( data, type, row )
                        {
                            if(row.oclaimstatus=="Paid")
                            {
                                /////return "<div class='text-nowrap'>" + '<b style="color:red;"> Spot- </b>' + row.osurveyornamespot +" (" + row.spotsurveyormobileno + ")" + '<br /> <b style="color:red;"> Final- </b> ' + row.osurveyornamefinal +" (" + row.finalsurveyormobileno + ")" + '<br /> <b style="color:red;">RI-</b> ' + row.osurveyornamereins +" (" + row.reinssurveyormobileno + ")" + '' + "</div>";
                                return "Tax Invoice Number - " + row.invoiceno + "<br /> Amount - " + row.invoiceamount
                            }
                            else
                            {
                                return  row.remarks ;

                            }
                         
                        }

                        },
                       


                       ////////////// uncomment below lines to show entry details////////////////////
//                    { "data": "createdon",
//                        render: function ( data, type, row )
//                        {
//                         return "<div class='text-nowrap'>" 
//                         + '<b style="color:red;"> Created On- </b>' + row.createdon 
//                         + '<br /> <b style="color:red;"> Created By- </b> ' +  GetUserName(row.createdby) + '' 
//                         + '<br /> <b style="color:red;">Created IP-</b> ' + row.createdip + '' 
//                         + '<br /> <b style="color:red;">Updated On-</b> ' + row.updatedon + '' 
//                         + '<br /> <b style="color:red;">Updated By-</b> ' + GetUserName(row.updatedby) + '' 
//                         + '<br /> <b style="color:red;">Updated IP-</b> ' + row.updatedip + ''  
//                         + "</div>";
//                        }
//                     },

//                        { "data": "createdby",
//                        render: function ( data, type, row )
//                        {
//////                          var cdate = new Date(row.createdon).format('dd-MMM-yyyy HH:mm:ss')
//////                        var udate = new Date(row.updatedon).format('dd-MMM-yyyy HH:mm:ss')

//                         var cdate = moment(row.createdon).format('DD-MMM-YYYY hh:mm A')
//                         var udate = moment(row.updatedon).format('DD-MMM-YYYY hh:mm A')


//                         return "<div class='text-nowrap'>" + row.createdby + '(' + cdate + ')  <br/>' + row.updatedby + '(' + udate + ')' + "</div>";
//                        }
//                     },

                   {
                       "data": "id",
                       "render": function (id, type, full, meta) {
                           //debugger
                           return '<a href="#" onclick="EditRecordbyID(' + id + ')"><i class="glyphicon glyphicon-pencil text-success" style="font-size:x-large;"></i></a>'
                       }
                   },
                    {
                        "data": "id",
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#" onclick="DeleteRecord(' + id + ')"><i class="glyphicon glyphicon-trash text-danger" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ],
                stateSave: true,
                "bDestroy": true
            });


            }


function GetUserName(id) {
    var returnValue;
    $.ajax({
        type: "POST",
        async: false,
        url: "insuranceclaimdetails.aspx/GetUserNameByID",
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ id: id }),
        success: function (data) {
        var json = JSON.parse(data.d);
            returnValue = json;
        }
    });
    return returnValue;
}



//function sentenceCase(str) {
//    if ((str === null) || (str === ''))
//        return false;
//    else
//        str = str.toString();

//    return str.replace(/\w\S*/g, function (txt) {
//        return txt.charAt(0).toUpperCase() +
//       txt.substr(1).toLowerCase();
//    });
//}



function newexportaction()
 {

      

    
       $("#Showoverlay").show(); 
       $.ajax({
        type: "POST",
        url: "insuranceclaimdetails.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "InsuranceClaims Data", true);

         $("#Showoverlay").hide(); 


        }
        });
    }
            ////alert("export");          

   


function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    
    var CSV = '';    
    //Set Report title in first row or line
    
    CSV += ReportTitle + '\r\n\n';

    //This condition will generate the Label/Header
    if (ShowLabel) {
        var row = "";
        
        //This loop will extract the label from 1st index of on array
        for (var index in arrData[0]) {
            
            //Now convert each value to string and comma-seprated
            row += index + ',';
        }

        row = row.slice(0, -1);
        
        //append Label row with line break
        CSV += row + '\r\n';
    }
    
    //1st loop is to extract each row
    for (var i = 0; i < arrData.length; i++) {
        var row = "";
        
        //2nd loop will extract each column and convert it in string comma-seprated
        for (var index in arrData[i]) {
            row += '"' + arrData[i][index] + '",';
        }

        row.slice(0, row.length - 1);
        
        //add a line break after each row
        CSV += row + '\r\n';
    }

    if (CSV == '') {        
        alert("Invalid data");
        return;
    }   
    
    //Generate a file name
    var fileName = "InsuranceClaims";
    //this will remove the blank-spaces from the title and replace it with an underscore
    fileName += ReportTitle.replace(/ /g,"_");   
    
    //Initialize file format you want csv or xls
    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
    
    // Now the little tricky part.
    // you can use either>> window.open(uri);
    // but this will not work in some browsers
    // or you will not get the correct file extension    
    
    //this trick will generate a temp <a /> tag
    var link = document.createElement("a");    
    link.href = uri;
    
    //set the visibility hidden so it will not effect on your web-layout
    link.style = "visibility:hidden";
    link.download = fileName + ".csv";
    
    //this part will append the anchor tag and remove it after automatic click
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

 

 function newexportactiontoPDF()
  {

     
      $("#Showoverlay").show();
           $.ajax({
        type: "POST",
        url: "insuranceclaimdetails.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
       
         var json = JSON.parse(data.d)

         var count = Object.keys(json).length;
         
        if(json == '')
            return;        

       var doc = new jspdf.jsPDF()

        var head = [['ID', 'Insurance Company', 'Repair Type', 'Spot Surveyor', 'Final Surveyor', 'Ins. Surveyor', 'Insurance Type', 'Estimated Date',  'Veh. No', 'Date of Loss', 'Customer Name', 'Model', 'Contact No', 'Claim Status']]
        var body = []
      $.each(json, function (key, item) {

        var data =  [item.id, item.inscompname, item.repairtype, item.surveyornamespot, item.surveyornamefinal, item.surveyornamereins, item.instype, item.estimateddate, item.vehno, item.dateofloss, item.custname, item.vehmakemodel, item.contactno, item.claimstatus];
        body.push(data);
         });

       doc.autoTable({ head: head, body: body })

        // Simple html example
        doc.autoTable({ html: '#tabledata' })

        doc.save('InsuranceClaims.pdf')
         $("#Showoverlay").hide(); 

        }
       });
   
    
 }    


 function dateDiff(date) {
    date = date.split('/');
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();
    var yy = parseInt(date[2]);
    var mm = parseInt(date[0]);
    var dd = parseInt(date[1]);

    var years, months, days;
    // months
    months = month - mm;
    if (day < dd) {
        months = months - 1;
    }
    // years
    years = year - yy;
    if (month * 100 + day < mm * 100 + dd) {
        years = years - 1;
        months = months + 12;
    }
    // days
    days = Math.floor((today.getTime() - (new Date(yy + years, mm + months - 1, dd)).getTime()) / (24 * 60 * 60 * 1000));
    //
   /// return {years: years, months: months, days: days};
   if(years>0)
   {
    months=months + (years*12);
   }

   ////alert( months + "y" + year);

   if(months<6)
   {
        $("#percentageofdepri").val("Nil");
   }
   if(months>6 && months < 12)
   {
        $("#percentageofdepri").val("5%");
   }

   if(months>=12 && months <= 24)
   {
        $("#percentageofdepri").val("10%");
   }
   if(months>24 && months < 36)
   {
        $("#percentageofdepri").val("15%");
   }
   if(years>=3 && years <= 4)
   {
        $("#percentageofdepri").val("25%");
   }
   if(years>4 && years < 5)
   {
        $("#percentageofdepri").val("35%");
   }
   if(years>=5 && years <= 10)
   {
        $("#percentageofdepri").val("40%");
   }
   if(years> 10)
   {
        $("#percentageofdepri").val("50%");
   }

}


 function ddlmanufacturedt_Changed()
 {
   
////let currentDate = ${day}-${month}-${year} ;

     var manufacturedt = $("#txtmanufacturedt").val();
     ////alert(currentDt + "-" + manufacturedt);

     dateDiff(manufacturedt);


    ///a = calcDate(manufacturedt, currentDt)
//dates in js are counted from 0, so 05 is june
////alert(a);

}

////function calcDate(date1,date2) {

////    
////    var diff = Math.floor(date1.getTime() - date2.getTime());
////    var day = 1000 * 60 * 60 * 24;

////    var days = Math.floor(diff/day);
////    var months = Math.floor(days/31);
////    var years = Math.floor(months/12);

////    alert(day);

////    var message = date2.toDateString();
////    message += " was "
////    message += days + " days " 
////    message += months + " months "
////    message += years + " years ago \n"

////    alert( message)
////    }




 




function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    

    //var id = table.rows()[0].length + 1;
     
      
   ////debugger;
     var oinscompid = $("#ddlInsuranceCompany :selected").val();
      var oinscompname = $("#ddlInsuranceCompany :selected").text();
      var orepairtypeid = $("#ddlRepair :selected").val();
      var orepairtype = $("#ddlRepair :selected").text();
      var osurveyoridspot = $("#ddlSurveyorSpot :selected").val();
      var osurveyornamespot = $("#ddlSurveyorSpot :selected").text();
      var osurveyoridfinal = $("#ddlSurveyorFinal :selected").val();
      var osurveyornamefinal = $("#ddlSurveyorFinal :selected").text();
      var osurveyoridreins = $("#ddlSurveyorReInspection :selected").val();
      var osurveyornamereins = $("#ddlSurveyorReInspection :selected").text();
      var oinstypeid = $("#ddlInsuranceType :selected").val();
      var oinstype = $("#ddlInsuranceType :selected").text();
      var oestimateddate = $('[id*=txtEstimatedDate]').val();
      var ovehno = $('[id*=txtVehChasisNo]').val();
      var odateofloss = $('[id*=txtDateofLoss]').val();
      var ocustname = $('[id*=txtName]').val();
      var ovehmakemodelid =  $("#ddlModel :selected").val();
      var ovehmakemodel = $("#ddlModel :selected").text();
      var ocontactno = $('[id*=txtMobileNo]').val();
        
      var oclaimstatusid = $("#ddlClaimStatus :selected").val();
      var oclaimstatus = $("#ddlClaimStatus :selected").text();
       var oinsduedate = $('[id*=txtInsDueDate]').val();
       var remarks = $('[id*=txtRemarks]').val();

        var policyno = $('[id*=txtPolicyNo]').val();
       var invoicedate = $('[id*=txtInvoiceDate]').val();

       var whatsappmsg = $('[id*=txtMessage]').val();


        var craneservicevendorid = $("#ddlcranevendor :selected").val();
         var craneservicevendorname = $("#ddlcranevendor :selected").text();
          var craneservicevendorcontactno = $("#txtcranevendorcontactno").val();

           var manufacturedt = $("#txtmanufacturedt").val();

          var percentageofdepriciation = $("#percentageofdepri").val();


   // name = sentenceCase(name);
    var model = {};
        model.oinscompid = oinscompid;
        model.oinscompname = oinscompname;
        model.orepairtypeid = orepairtypeid;
        model.orepairtype = orepairtype;
        model.osurveyoridspot = osurveyoridspot;
        model.osurveyornamespot = osurveyornamespot;
        model.osurveyoridfinal = osurveyoridfinal;
        model.osurveyornamefinal = osurveyornamefinal;
        model.osurveyoridreins = osurveyoridreins;
        model.osurveyornamereins = osurveyornamereins;
        model.oinstypeid = oinstypeid;
        model.oinstype = oinstype;
        model.oestimateddate = oestimateddate;
        model.ovehno=ovehno;
        model.odateofloss=odateofloss;
        model.ocustname=ocustname;
        model.ovehmakemodelid=ovehmakemodelid;
        model.ovehmakemodel=ovehmakemodel;
        model.ocontactno=ocontactno;
        model.oclaimstatusid=oclaimstatusid;
        model.oclaimstatus=oclaimstatus;
        model.oinsduedate=oinsduedate;
        model.remarks=remarks;

        model.policyno=policyno;
        model.invoicedate=invoicedate;
        model.whatsappmsg=whatsappmsg;
           

            model.craneservicevendorid=craneservicevendorid;
        model.craneservicevendorname=craneservicevendorname;
        model.craneservicevendorcontactno=craneservicevendorcontactno;
        model.manufacturedt=manufacturedt;

        model.percentageofdepriciation=percentageofdepriciation;


    $.ajax({
        type: "POST",
        url: "insuranceclaimdetails.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {

       /// alert(r.d);

        if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtMobile]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30 || r.d == 50 || r.d == 55) {
                    if (r.d == 20) {
                        $.notify("Error!! veh./chasis no already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        $('[id*=txtName]').focus();
                        return;
                    }
                    if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtMobile]').focus();
                        return;
                    }

                     if (r.d == 55) {
                        $.notify("Error!! Vehicle no already exists with same estimate date!", "error");
                        $('[id*=txtMobile]').focus();
                        return;
                    }

                }
                else {
                    $('#myModal').modal('hide');
                     $('#recordID').val("0");

                    BindDataTable();
                    $.notify("Record saved!", "success");
                }
            }
        }
            ,
        error: function (errormessage) {
            ///////alert(errormessage.responseText);
            if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                //alert("Error!! model name already exists!!");
                $.notify("Error!! model name already exists!", "error");
            }
            else {
                //alert("Error while saving data!!");
                $.notify("Error while saving data!", "error");
            }
        }
    });
}

function SendWhatsappMessage()
{
     var ocontactno = $('[id*=txtMobileNo]').val();
     var whatsappmsg = $('[id*=txtMessage]').val();
      var model = {};
        model.ocontactno=ocontactno;
        model.whatsappmsg=whatsappmsg;

         $.ajax({
        type: "POST",
        url: "insuranceclaimdetails.aspx/SendWhatsAppMessages",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
        if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtMobile]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 ) {
                    if (r.d == 20) {
                        $.notify("Error!! message not sent!", "error");
                        return;
                    }                    
                }
                else {
                    $('#myModal').modal('hide');

                    $.notify("Whatspp message sent!", "success");
                }
            }
        }
            ,
        error: function (errormessage) {
            alert(errormessage.responseText);
           
        }
    });


}

function EditRecordbyID(id) {
    ////alert(id);
    $("#lblMessage").html("");    
     $("#lblMessage2").html("");    
      $("#lblMessage3").html("");    

      $("#postedFile").val('');
      $("#postedFile2").val('');
      $("#postedFile3").val('');

    $('#recordID').val("0");
   
    $.ajax({
        type: "POST",
        url: "insuranceclaimdetails.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                ////var custname = json[0].custname;
               //// alert(result.d);
                $('#recordID').val(json[0].id);
               
               
                 $("#ddlInsuranceCompany").val(json[0].inscompid);
                  $("#ddlRepair").val(json[0].repairtypeid);
                  
                    $("#ddlInsuranceType").val(json[0].instypeid);

                    ///////alert(json[0].instypeid);
                   GetSelectedInsCompbyid(json[0].inscompid);
                   GetSelectedClaimStatusbyid(json[0].claimstatusid);

                     var estdate = new Date(json[0].estimateddate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                $('#txtEstimatedDate').val(estdate);
                $('#txtVehChasisNo').val(json[0].vehno);

                var dateofloss = new Date(json[0].dateofloss.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })
                $('#txtDateofLoss').val(dateofloss);
                $('#txtName').val(json[0].custname);
               //// $('#ddlModel').val(json[0].vehmakemodelid);

               GetSelectedModelbyid(json[0].vehmakemodelid);

                $('#txtMobileNo').val(json[0].contactno);

                if(json[0].insduedate != null)
                {
               
                var insduedate = new Date(json[0].insduedate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

                if(insduedate=="01/01/1900")
                {
                    insduedate="";
                }

                 $('#txtInsDueDate').val(insduedate);
                 }

                
                ////$('#ddlClaimStatus').val(json[0].claimstatusid);

////               $("#ddlSurveyorSpot").val(json[0].surveyoridspot);
////               $("#ddlSurveyorFinal").val(json[0].surveyoridfinal);
////               $("#ddlSurveyorReInspection").val(json[0].surveyoridreins);


                GetSpotSurveyorbyid(json[0].surveyoridspot)
                GetFinalSurveyorbyid(json[0].surveyoridfinal)
                GetReinspectionSurveyorbyid(json[0].surveyoridreins)

                  $('#txtRemarks').val(json[0].remarks);

                  $('#txtMessage').val(json[0].whatsappmsg);

                  $('#txtPolicyNo').val(json[0].policyno);

                  if(json[0].invoicedate != null)
                {
                var invoicedate = new Date(json[0].invoicedate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

                 $('#txtInvoiceDate').val(invoicedate);
                 }


                 $('#divuploadspotsurveyfiles').show();
                 $('#divuploadfinalsurveyfiles').show();
                 GetUploadedFiles(json[0].id);
                 GetUploadedFilesFS(json[0].id);


                  /////$('#ddlcranevendor').val(json[0].craneservicevendorid);

                   GetSelectedCraneVendor(json[0].craneservicevendorid);

                   $('#txtcranevendorcontactno').val(json[0].craneservicevendorcontactno);

                 //// $('#txtInvoiceDate').val(json[0].invoicedate);

////                 var mydate = new Date(json[0].duedate.substring(0, 10));
  

////   
////                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
////                 $('#txtDueDate').val(duedate);
////                  $('#txtMobileNo').val(json[0].mobileno);
////                   $('#txtAlternateNo').val(json[0].whatsappno);
////                    $("#ddlModel").val(json[0].modelid);


                          var cdate = moment(json[0].createdon).format('DD-MMM-YYYY hh:mm A')
                         var udate = moment(json[0].updatedon).format('DD-MMM-YYYY hh:mm A')

                          $('#txtcreateiondetails').val(json[0].createdby + ' ' + cdate);
                           $('#txtupdationdetails').val(json[0].updatedby + ' ' + udate);



                if(json[0].manufacturedt != null)
                {
                var manufacturedt = new Date(json[0].manufacturedt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

                 $('#txtmanufacturedt').val(manufacturedt);
                 }
                 else
                 {
                    $('#txtmanufacturedt').val("");
                 }


                 $("#percentageofdepri").val(json[0].percentageofdepriciation);


                  $("#txtinvoiceno").val(json[0].invoiceno);
                  if(json[0].invoicedt != null)
                    {
                    var invoicedt = new Date(json[0].invoicedt.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

                    $('#txtinvdt').val(invoicedt);
                    }
                    else
                    {
                         $("#txtinvdt").val("");
                    }

                  
                    $("#txtinvamount").val(json[0].invoiceamount);
                     /////$("#hdnviewfileid").val(json[0].securitycheckfilename);


                     if(json[0].securitycheckfilename===null)
                     {                    
                     $('#divviewcheckstatusfiles').hide();
                      
                     }
                     else
                     {
                      $('#divviewcheckstatusfiles').show();
                     }



                     GetDetailsbyInvoiceNo();

                  $('#liactab').show();

                $('#myModal').modal('show');
                $('#myModal').on('shown.bs.modal', function () {
                    $('#txtName').focus();
                });
                $('#btnUpdate').show();
                 $('#btnSendWhtsAppMsg').show();
                $('#btnAdd').hide();
            }
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            $.notify("Error while fetchiing data!", "error");
        }
    });
}

//function for updating record
function UpdateRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
      var id = $('[id*=recordID]').val();    
      var oinscompid = $("#ddlInsuranceCompany :selected").val();
      var oinscompname = $("#ddlInsuranceCompany :selected").text();
      var orepairtypeid = $("#ddlRepair :selected").val();
      var orepairtype = $("#ddlRepair :selected").text();
      var osurveyoridspot = $("#ddlSurveyorSpot :selected").val();
      var osurveyornamespot = $("#ddlSurveyorSpot :selected").text();
      var osurveyoridfinal = $("#ddlSurveyorFinal :selected").val();
      var osurveyornamefinal = $("#ddlSurveyorFinal :selected").text();
      var osurveyoridreins = $("#ddlSurveyorReInspection :selected").val();
      var osurveyornamereins = $("#ddlSurveyorReInspection :selected").text();
      var oinstypeid = $("#ddlInsuranceType :selected").val();
      var oinstype = $("#ddlInsuranceType :selected").text();
      var oestimateddate = $('[id*=txtEstimatedDate]').val();
      var ovehno = $('[id*=txtVehChasisNo]').val();
      var odateofloss = $('[id*=txtDateofLoss]').val();
      var ocustname = $('[id*=txtName]').val();
      var ovehmakemodelid =  $("#ddlModel :selected").val();
      var ovehmakemodel = $("#ddlModel :selected").text();
      var ocontactno = $('[id*=txtMobileNo]').val();
        
      var oclaimstatusid = $("#ddlClaimStatus :selected").val();
      var oclaimstatus = $("#ddlClaimStatus :selected").text();
      var oinsduedate = $('[id*=txtInsDueDate]').val();
      var remarks = $('[id*=txtRemarks]').val();

       var policyno = $('[id*=txtPolicyNo]').val();
       var invoicedate = $('[id*=txtInvoiceDate]').val();

       var whatsappmsg = $('[id*=txtMessage]').val();


        var craneservicevendorid = $("#ddlcranevendor :selected").val();
         var craneservicevendorname = $("#ddlcranevendor :selected").text();
          var craneservicevendorcontactno = $("#txtcranevendorcontactno").val();
          var manufacturedt = $("#txtmanufacturedt").val();
 
  var percentageofdepriciation = $("#percentageofdepri").val();

  var invoiceno = $('[id*=txtinvoiceno]').val();
  var invoiceid="0";
  var invoicedt = $('[id*=txtinvdt]').val();
  var invoiceamount = $('[id*=txtinvamount]').val();


      ///// alert(remarks);

    ////name = sentenceCase(name);
    if (id > 0) {
        var model = {};
        model.id = id;
        model.oinscompid = oinscompid;
        model.oinscompname = oinscompname;
        model.orepairtypeid = orepairtypeid;
        model.orepairtype = orepairtype;
        model.osurveyoridspot = osurveyoridspot;
        model.osurveyornamespot = osurveyornamespot;
        model.osurveyoridfinal = osurveyoridfinal;
        model.osurveyornamefinal = osurveyornamefinal;
        model.osurveyoridreins = osurveyoridreins;
        model.osurveyornamereins = osurveyornamereins;
        model.oinstypeid = oinstypeid;
        model.oinstype = oinstype;
        model.oestimateddate = oestimateddate;
        model.ovehno=ovehno;
        model.odateofloss=odateofloss;
        model.ocustname=ocustname;
        model.ovehmakemodelid=ovehmakemodelid;
        model.ovehmakemodel=ovehmakemodel;
        model.ocontactno=ocontactno;
        model.oclaimstatusid=oclaimstatusid;
        model.oclaimstatus=oclaimstatus;
         model.oinsduedate=oinsduedate;
         model.remarks=remarks;

         model.policyno=policyno;
        model.invoicedate=invoicedate;
        model.whatsappmsg=whatsappmsg;

        model.craneservicevendorid=craneservicevendorid;
        model.craneservicevendorname=craneservicevendorname;
        model.craneservicevendorcontactno=craneservicevendorcontactno;

        model.manufacturedt=manufacturedt;

        model.percentageofdepriciation=percentageofdepriciation;

        model.invoiceno=invoiceno;
        model.invoicedt=invoicedt;
        model.invoiceamount=invoiceamount;


        $.ajax({
            type: "POST",
            url: "insuranceclaimdetails.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not updated!", "error");
                $('[id*=txtMobile]').focus();
                return;
            }
                if (r.d == 10 || r.d == 20 || r.d == 30 || r.d == 50) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to add record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! veh./chasis no already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! required fields cannot be blank!", "error");
                        return;
                    }
                   if (r.d == 50) {
                        $.notify("Error!! invalid mobile no!", "error");
                        $('[id*=txtMobile]').focus();
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                     $('#btnSendWhtsAppMsg').hide();
                    
                    $('#btnAdd').hide();
                    $("#lblMessage").html("");
                    $("#postedFile").val('');
                    BindDataTable();
                    $.notify("Record updated!", "success");
                }
            }
            ,
            error: function (errormessage) {
                ///////alert(errormessage.responseText);
                if (errormessage.responseText.includes("Violation of PRIMARY KEY constraint")) {
                    //alert("Error!! model name already exists!!");
                    $.notify("Error!! model name already exists!", "error");
                }
                else {
                    //alert("Error while saving data!!");
                    $.notify("Error while updating data!", "error");
                }
            }
        });
    }
    else {
        alert("invalid id!!");
        return;
    }
}

function DeleteRecord(id) {
    if (confirm('Are you sure delete this record?')) {
//        var data = table.row($(this).parents('tr')).data();
//        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "insuranceclaimdetails.aspx/DeleteRecord",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not deleted!", "error");
                $('[id*=txtMobile]').focus();
                return;
            }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    BindDataTable();
                    $.notify("Record deleted!", "success");
                }
            },
            error: function (errormessage) {
                $.notify("Error while deleting data!", "error");
            }

        });
        $("#Showoverlay").hide();
    }
}


//Function for clearing the textboxes  
function clearTextBox() {

 $("#tblUploadedFiles").dataTable().fnDestroy();
$('#tblUploadedFiles tbody').empty();
 $('#recordID').val('0');


    $('#txtName').val("");

    $('#txtmanufacturedt').val("");

    $('#ddlModel').prop("selectedIndex", 0);

////      $("#ddlLastRenewalFrom :selected").val("0");
////      $("#ddlLastRenewalFrom :selected").text("Please Select");
       $('#txtVehChasisNo').val("");
        $('#txtDueDate').val("");
        $('#txtMobileNo').val("");
         $('#txtAlternateNo').val("");
         $('#txtDateofLoss').val("");
         $('#txtEstimatedDate').val("");

          $('#txtPolicyNo').val("");
         $('#txtInvoiceDate').val("");

          $('#txtMessage').val("");

           $('#ddlInsuranceCompany').prop("selectedIndex", 0);

           $('#ddlSurveyorSpot').prop("selectedIndex", 0);
           $('#ddlSurveyorFinal').prop("selectedIndex", 0);
           $('#ddlSurveyorReInspection').prop("selectedIndex", 0);
           $('#ddlClaimStatus').prop("selectedIndex", 0);
           $('#ddlInsuranceType').prop("selectedIndex", 0);
           $('#ddlRepair').prop("selectedIndex", 0);
           $('#ddlInsuranceCompany').prop("selectedIndex", 0);
// $("#ddlSurveyorSpot :selected").val("0");
//       $("#ddlSurveyorSpot :selected").text("Please Select");
//        $("#ddlSurveyorFinal :selected").val("0");
//       $("#ddlSurveyorFinal :selected").text("Please Select");
//        $("#ddlSurveyorReInspection :selected").val("0");
//       $("#ddlSurveyorReInspection :selected").text("Please Select");

//        $("#ddlClaimStatus :selected").val("0");
//       $("#ddlClaimStatus :selected").text("Please Select");

//        $("#ddlInsuranceType :selected").val("0");
//       $("#ddlInsuranceType :selected").text("Please Select");
//        $("#ddlRepair :selected").val("0");
//       $("#ddlRepair :selected").text("Please Select");
//        $("#ddlInsuranceCompany :selected").val("0");
//       $("#ddlInsuranceCompany :selected").text("Please Select");

      $('#ddlModel').css('border-color', 'lightgrey');
       $('#txtDateofLoss').css('border-color', 'lightgrey');


    $('#btnUpdate').hide();
     $('#btnSendWhtsAppMsg').hide();
      $('#liactab').hide();

     

      $('#divuploadspotsurveyfiles').hide();
       $('#divuploadfinalsurveyfiles').hide();
      
   

    $('#btnAdd').show();

    $('#txtName').css('border-color', 'lightgrey');   
    $('#txtVehChasisNo').css('border-color', 'lightgrey'); 
    $('#txtMobileNo').css('border-color', 'lightgrey');   
    $('#ddlModel').css('border-color', 'lightgrey');

     
   

    $("#lblMessage").html("");
    $("#postedFile").val('');

    $('#myModal').modal('show');
    $('#myModal').on('shown.bs.modal', function () {
        $('#txtName').focus();
    });

}
//Valdidation using jquery  
function validate() {
    var isValid = true;
    

    if ($('#ddlInsuranceCompany :selected').val() == "0") {
        $('#ddlInsuranceCompany').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlInsuranceCompany').css('border-color', 'lightgrey');
    }

    
    if ($('#ddlRepair :selected').val() == "0") {
        $('#ddlRepair').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlRepair').css('border-color', 'lightgrey');
    }

    
    if ($('#ddlSurveyorSpot :selected').val() == "0") {
        $('#ddlSurveyorSpot').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlSurveyorSpot').css('border-color', 'lightgrey');
    }

    
    if ($('#ddlInsuranceType :selected').val() == "0") {
        $('#ddlInsuranceType').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlInsuranceType').css('border-color', 'lightgrey');
    }


    if ($('#txtEstimatedDate').val() == "") {
        $('#txtEstimatedDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtEstimatedDate').css('border-color', 'lightgrey');
    }

    if ($('#txtVehChasisNo').val() == "") {
        $('#txtVehChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehChasisNo').css('border-color', 'lightgrey');
    }

    if ($('#txtDateofLoss').val() == "") {
        $('#txtDateofLoss').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDateofLoss').css('border-color', 'lightgrey');
    }

    if ($('#txtName').val() == "") {
        $('#txtName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtName').css('border-color', 'lightgrey');
    }
    
    if ($('#ddlModel :selected').val() == "0") {
        $('#ddlModel').css('border-color', 'Red');
        $.notify("select model!!","error");
        isValid = false;
    }
    else {
        $('#ddlModel').css('border-color', 'lightgrey');
    }

    if ($('#txtMobileNo').val() == "") {
        $('#txtMobileNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobileNo').css('border-color', 'lightgrey');
    }

    if ($('#ddlClaimStatus :selected').val() == "0") {
        $('#ddlClaimStatus').css('border-color', 'Red');
         $.notify("select claim status!!","error");
        isValid = false;
    }
    else {
        $('#ddlClaimStatus').css('border-color', 'lightgrey');
    }


    if ($('#txtPolicyNo').val() == "") {
        $('#txtPolicyNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtPolicyNo').css('border-color', 'lightgrey');
    }


////    if ($('#ddlClaimStatus :selected').val() == "") {
////        $('#ddlClaimStatus').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#ddlClaimStatus').css('border-color', 'lightgrey');
////    }

    return isValid;
}






function GetUploadedFiles(id) {
////    $("#Showoverlay").show(); 
////alert(id);
if(id!="0")
{
    $.ajax({
        type: "POST",
        url: "insuranceclaimdetails.aspx/GetAttachedFiles",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblUploadedFiles").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblUploadedFiles tbody').empty();
            $.each(json, function (key, item) {
                var id = item.id;
                var uploadedfilename = item.uploadedfilename;
                var downloadfilename = item.uploadedfilename;
                var createdon = item.uploadedon;
               
////                var mydate = new Date(json[0].createdon);
////                var uploadDt = new Date(createdon).format('dd-MMM-yyyy HH:mm:ss')

                 var mydate = moment(json[0].createdon).format('DD-MMM-YYYY hh:mm A')
                 var uploadDt = moment(createdon).format('DD-MMM-YYYY hh:mm A')

                
                rows += "<tr><td>" + id +
                    "</td><td>" + uploadedfilename + ' ' +
                    "</td>" +
                   " <td>" + uploadDt + ' ' + "</td>" +
                    "<td> " +
                    " <input type='button' id='btnDownload'  onclick='DownloadFile(" + id + ")' value='Download' class='btn btn-primary'> </td>" +
//                    <a onclick='DownloadFile(" + id + ")' >   <i class='fa fa-download' style='font-size:36px;'></i> </a>   
                    
                     " <td> <input type='button' id='btnDelete'  onclick='DeleteAttachedFile(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
                    + "</tr>";
            });
            $('#tblUploadedFiles tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblUploadedFiles]').DataTable({
                "order": [[0, "desc"]],
                "paging": false,
                "dom": 'lrtip'
////                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                
////                "info": false,
//                'processing': true,
//                fnInitComplete: function () {
//                    $("#Showoverlay").hide();
//                }
            });
        },
        failure: function (response) {
            // alert(response.responseText);
            $.notify("BOOM!", "error");
        },
        error: function (response) {
            ///alert(response.responseText);

            $.notify("BOOM!", "error");
        }
    });
    }
    else
    {
   // alert("invalid id");
     $("#tblRecords").dataTable().fnDestroy();
    return;
    }

}


function DeleteAttachedFile(id) {
////alert(id);

    if (confirm('Are you sure delete this record?')) {
        var data = table.row($(this).parents('tr')).data();
        table.row($(this).parents('tr')).remove().draw();
         var claimid = $('[id*=recordID]').val();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "insuranceclaimdetails.aspx/DeleteAttachedFile",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    GetUploadedFiles(claimid);
                    $.notify("Record deleted!", "success");
                }
            },
            error: function (errormessage) {
                $.notify("Error while deleting data!", "error");
            }

        });
        $("#Showoverlay").hide();
    }
}



function DownloadFile2(id) { 
//////alert(id);
  $.ajax({
        type: "POST",
        url: "insuranceclaimdetails.aspx/ConvertToPdfAndDownload",
        data: '{id: "' + id + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) { 
            if (response.d == '')
                alert('There is a problem exporting the file');
            else {
            //alert("byte");
                var sampleArr = base64ToArrayBuffer(response.d);
                //saveByteArray("File-" + id, sampleArr);



                alert(response.d);

                 //Convert Base64 string to Byte Array.
                var bytes = Base64ToBytes(response.d);
 
                //Convert Byte Array to BLOB.
                var blob = new Blob([bytes], { type: "application/octetstream" });
 
                //Check the Browser type and download the File.
                var isIE = false || !!document.documentMode;
                if (isIE) {
                    window.navigator.msSaveBlob(blob, fileName);
                } else {
                    var url = window.URL || window.webkitURL;
                    link = url.createObjectURL(blob);
                    var a = $("<a />");
                    a.attr("download", fileName);
                    a.attr("href", link);
                    $("body").append(a);
                    a[0].click();
                    $("body").remove(a);
                }

            }
        },
        failure: function (response) {
            alert("Cannot export thefile: Error in calling Ajax");
        }
    });
           
 }

  function Base64ToBytes(base64) {
        var s = window.atob(base64);
        var bytes = new Uint8Array(s.length);
        for (var i = 0; i < s.length; i++) {
            bytes[i] = s.charCodeAt(i);
        }
        return bytes;
    };


        //convert BASE64 string to Byte{} array
function base64ToArrayBuffer(base64) { 
    var binaryString = window.atob(base64);
    var binaryLen = binaryString.length;
    var bytes = new Uint8Array(binaryLen);
    for (var i = 0; i < binaryLen; i++) {
        var ascii = binaryString.charCodeAt(i);
        bytes[i] = ascii;
    }
    return bytes;
}

//save Byte[] array and download
function saveByteArray(reportName, byte) {
    var blob = new Blob([byte]);
    var link = document.createElement('a');
    link.href = window.URL.createObjectURL(blob);
    var fileName = reportName + ".pdf";
    link.download = fileName;
    link.click();
}


     function  btnUploadFile()
     {
 
        var id = $('[id*=recordID]').val();
        /////alert(id);
        //                                                            if (id != "0") {
        var fileUpload = $("#postedFile").get(0);
        var files = fileUpload.files;
        if (files.length == 0) {
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> please select a .pdf file to uplod  </b> ");
            return;
        }
        var docVal = fileUpload.value;
        var extension = docVal.substring(docVal.lastIndexOf(".") + 1, docVal.length);
       ///// alert(extension.toLowerCase());
        if (extension.toLowerCase() != 'pdf' && extension.toLowerCase() != 'doc' && extension.toLowerCase() != 'docx' && extension.toLowerCase() != 'xls' && extension.toLowerCase() != 'xlsx') {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> only .pdf/word/excel file is allowed  </b> ");
            return;
        }

         ////var omobileno = $('[id*=txtMobileNo]').val();

        if (typeof ($("#postedFile")[0].files) != "undefined") {
            var size = parseFloat($("#postedFile")[0].files[0].size / 1024).toFixed(2);
            ////alert(size + " KB.");
            if (size <= 5000) {
                $.ajax({
                   ////// url: 'InsuranceClaimsPolicyUploadHandler.ashx?claimid=' + id+'&mobileno=' + omobileno,
                    url: 'InsuranceClaimsPolicyUploadHandler.ashx?claimid=' + id ,
                    type: 'POST',
                    data: new FormData($('form')[0]),
                    //  data: '{"ItemSelected=" ' + new FormData($('form')[0]) + ', "ID="',
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (file) {
                        $("#fileProgress").hide();
                        $("#lblMessage").css('color', 'green');
                        $("#lblMessage").html("<b>" + file.name + "</b> has been uploaded.");
                        if (id != "0") {
                            GetUploadedFiles(id);
                        }
                        else {
                                                                               
                            $('#hiddenFileName').val(file.name);
                                                                               
                        }
                    },

                    xhr: function () {
                        var fileXhr = $.ajaxSettings.xhr();
                        if (fileXhr.upload) {
                            $("progress").show();
                            fileXhr.upload.addEventListener("progress", function (e) {
                                if (e.lengthComputable) {
                                    $("#fileProgress").attr({
                                        value: e.loaded,
                                        max: e.total
                                    });
                                }
                            }, false);
                        }
                        return fileXhr;
                    },
                    error: function (file) {
                        $("#lblMessage").css('color', 'red');
                        $("#lblMessage").html("<b> " + file.name + " </b> ");

                    }
                });
            }
            else {
                //alert("Please upload file upto 5MB");
                $("#lblMessage").css('color', 'red');
                $("#lblMessage").html("<b> Please upload file upto 5MB  </b> ");
                return;
            }
        } else {
            //alert("This browser does not support HTML5.");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> This browser does not support HTML5.  </b> ");
            return;
        }

       

    }







     function DownloadFile(id) {
        $.ajax({
            type: "POST",
        url: "insuranceclaimdetails.aspx/ConvertToPdfAndDownload",
        data: '{id: "' + id + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                //Convert Base64 string to Byte Array.
                

                var text=r.d;
                const myArray = text.split("<");
               /// alert(myArray[0]);
                /// alert(myArray[1]);
                 var bytes = Base64ToBytes(myArray[1]);
                 var fileName=myArray[0];
 
                //Convert Byte Array to BLOB.
                var blob = new Blob([bytes], { type: "application/octetstream" });
 
                //Check the Browser type and download the File.
                var isIE = false || !!document.documentMode;
                if (isIE) {
                    window.navigator.msSaveBlob(blob, fileName);
                } else {
                    var url = window.URL || window.webkitURL;
                    link = url.createObjectURL(blob);

                    var a = $("<a />");
                    a.attr("download", fileName);
                    a.attr("href", link);
                    $("body").append(a);
                    a[0].click();
                    $("body").remove(a);
                }
            }
        });
    };
    function Base64ToBytes(base64) {
        var s = window.atob(base64);
        var bytes = new Uint8Array(s.length);
        for (var i = 0; i < s.length; i++) {
            bytes[i] = s.charCodeAt(i);
        }
        return bytes;
    };



    ///////////////////////For Final Surveryor Upload Files ///////////////

    

function GetUploadedFilesFS(id) {
////    $("#Showoverlay").show(); 
////alert(id);
if(id!="0")
{
    $.ajax({
        type: "POST",
        url: "insuranceclaimdetails.aspx/GetAttachedFilesFS",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblFSUploadedFiles").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblFSUploadedFiles tbody').empty();
            $.each(json, function (key, item) {
                var id = item.id;
                var uploadedfilename = item.uploadedfilename;
                var downloadfilename = item.uploadedfilename;
                var createdon = item.uploadedon;
               
////                var mydate = new Date(json[0].createdon);
////                var uploadDt = new Date(createdon).format('dd-MMM-yyyy HH:mm:ss')

                 var mydate = moment(json[0].createdon).format('DD-MMM-YYYY hh:mm A')
                 var uploadDt = moment(createdon).format('DD-MMM-YYYY hh:mm A')

                
                rows += "<tr><td>" + id +
                    "</td><td>" + uploadedfilename + ' ' +
                    "</td>" +
                   " <td>" + uploadDt + ' ' + "</td>" +
                    "<td> " +
                    " <input type='button' id='btnDownload'  onclick='DownloadFileFS(" + id + ")' value='Download' class='btn btn-primary'> </td>" +
//                    <a onclick='DownloadFile(" + id + ")' >   <i class='fa fa-download' style='font-size:36px;'></i> </a>   
                    
                     " <td> <input type='button' id='btnDelete'  onclick='DeleteAttachedFileFS(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
                    + "</tr>";
            });
            $('#tblFSUploadedFiles tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblFSUploadedFiles]').DataTable({
                "order": [[0, "desc"]],
                "paging": false,
                "dom": 'lrtip'
////                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                
////                "info": false,
//                'processing': true,
//                fnInitComplete: function () {
//                    $("#Showoverlay").hide();
//                }
            });
        },
        failure: function (response) {
            // alert(response.responseText);
            $.notify("BOOM!", "error");
        },
        error: function (response) {
            ///alert(response.responseText);

            $.notify("BOOM!", "error");
        }
    });
    }
    else
    {
   // alert("invalid id");
     $("#tblFSUploadedFiles").dataTable().fnDestroy();
    return;
    }

}


function DeleteAttachedFileFS(id) {
////alert(id);

    if (confirm('Are you sure delete this record?')) {
        var data = table.row($(this).parents('tr')).data();
        table.row($(this).parents('tr')).remove().draw();
         var claimid = $('[id*=recordID]').val();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "insuranceclaimdetails.aspx/DeleteAttachedFileFS",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    
                     GetUploadedFilesFS(claimid);
                    $.notify("Record deleted!", "success");
                }
            },
            error: function (errormessage) {
                $.notify("Error while deleting data!", "error");
            }

        });
        $("#Showoverlay").hide();
    }
}




function DownloadFileFS(id) {
        $.ajax({
            type: "POST",
        url: "insuranceclaimdetails.aspx/ConvertToPdfAndDownloadFS",
        data: '{id: "' + id + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                //Convert Base64 string to Byte Array.
                

                var text=r.d;
                const myArray = text.split("<");
               /// alert(myArray[0]);
                /// alert(myArray[1]);
                 var bytes = Base64ToBytes(myArray[1]);
                 var fileName=myArray[0];
 
                //Convert Byte Array to BLOB.
                var blob = new Blob([bytes], { type: "application/octetstream" });
 
                //Check the Browser type and download the File.
                var isIE = false || !!document.documentMode;
                if (isIE) {
                    window.navigator.msSaveBlob(blob, fileName);
                } else {
                    var url = window.URL || window.webkitURL;
                    link = url.createObjectURL(blob);

                    var a = $("<a />");
                    a.attr("download", fileName);
                    a.attr("href", link);
                    $("body").append(a);
                    a[0].click();
                    $("body").remove(a);
                }
            }
        });
    };
//////    function Base64ToBytes(base64) {
//////        var s = window.atob(base64);
//////        var bytes = new Uint8Array(s.length);
//////        for (var i = 0; i < s.length; i++) {
//////            bytes[i] = s.charCodeAt(i);
//////        }
//////        return bytes;
//////    };




//////  function Base64ToBytes(base64) {
//////        var s = window.atob(base64);
//////        var bytes = new Uint8Array(s.length);
//////        for (var i = 0; i < s.length; i++) {
//////            bytes[i] = s.charCodeAt(i);
//////        }
//////        return bytes;
//////    };


//////        //convert BASE64 string to Byte{} array
//////function base64ToArrayBuffer(base64) { 
//////    var binaryString = window.atob(base64);
//////    var binaryLen = binaryString.length;
//////    var bytes = new Uint8Array(binaryLen);
//////    for (var i = 0; i < binaryLen; i++) {
//////        var ascii = binaryString.charCodeAt(i);
//////        bytes[i] = ascii;
//////    }
//////    return bytes;
//////}

////////save Byte[] array and download
//////function saveByteArray(reportName, byte) {
//////    var blob = new Blob([byte]);
//////    var link = document.createElement('a');
//////    link.href = window.URL.createObjectURL(blob);
//////    var fileName = reportName + ".pdf";
//////    link.download = fileName;
//////    link.click();
//////}


     function  btnUploadFileFS()
     {
 
        var id = $('[id*=recordID]').val();
        /////alert(id);
        //                                                            if (id != "0") {
        var fileUpload = $("#postedFile2").get(0);
        var files = fileUpload.files;
        if (files.length == 0) {
            $("#lblMessage2").css('color', 'red');
            $("#lblMessage2").html("<b> please select a .pdf file to uplod  </b> ");
            return;
        }
        var docVal = fileUpload.value;
        var extension = docVal.substring(docVal.lastIndexOf(".") + 1, docVal.length);
       ///// alert(extension.toLowerCase());
        if (extension.toLowerCase() != 'pdf' && extension.toLowerCase() != 'doc' && extension.toLowerCase() != 'docx' && extension.toLowerCase() != 'xls' && extension.toLowerCase() != 'xlsx') {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessage2").css('color', 'red');
            $("#lblMessage2").html("<b> only .pdf/word/excel file is allowed  </b> ");
            return;
        }

         ////var omobileno = $('[id*=txtMobileNo]').val();

        if (typeof ($("#postedFile2")[0].files) != "undefined") {
            var size = parseFloat($("#postedFile2")[0].files[0].size / 1024).toFixed(2);
            ////alert(size + " KB.");
            if (size <= 5000) {
                $.ajax({
                   ////// url: 'InsuranceClaimsPolicyUploadHandler.ashx?claimid=' + id+'&mobileno=' + omobileno,
                    url: 'InsuranceClaimsPolicyUploadHandlerFS.ashx?claimid=' + id ,
                    type: 'POST',
                    data: new FormData($('form')[1]),
                    //  data: '{"ItemSelected=" ' + new FormData($('form')[0]) + ', "ID="',
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (file) {
                        $("#fileProgress2").hide();
                        $("#lblMessage2").css('color', 'green');
                        $("#lblMessage2").html("<b>" + file.name + "</b> has been uploaded.");
                        if (id != "0") {
                            GetUploadedFilesFS(id);
                        }
                        else {
                                                                               
                            $('#hiddenFileName2').val(file.name);
                                                                               
                        }
                    },

                    xhr: function () {
                        var fileXhr = $.ajaxSettings.xhr();
                        if (fileXhr.upload) {
                            $("progress").show();
                            fileXhr.upload.addEventListener("progress", function (e) {
                                if (e.lengthComputable) {
                                    $("#fileProgress2").attr({
                                        value: e.loaded,
                                        max: e.total
                                    });
                                }
                            }, false);
                        }
                        return fileXhr;
                    },
                    error: function (file) {
                        $("#lblMessage2").css('color', 'red');
                        $("#lblMessage2").html("<b> " + file.name + " </b> ");

                    }
                });
            }
            else {
                //alert("Please upload file upto 5MB");
                $("#lblMessage2").css('color', 'red');
                $("#lblMessage2").html("<b> Please upload file upto 5MB  </b> ");
                return;
            }
        } else {
            //alert("This browser does not support HTML5.");
            $("#lblMessage2").css('color', 'red');
            $("#lblMessage2").html("<b> This browser does not support HTML5.  </b> ");
            return;
        }

       

    }

///////////////////////End For Final Surveryor Upload Files ///////////////



///////////////////////upload check status files////////////////////////////

 function  btnUploadFileCheckStatus()
     {
 
        var id = $('[id*=recordID]').val();

         var invdt = $("#txtinvdt").val();
         var invamt = $("#txtinvamount").val();

         if(invdt=="" || invamt=="")
         {
             $.notify("invoice date and invoice amount cannot be blank!", "error");
             return;
         }


        /////alert(id);
        //                                                            if (id != "0") {
        var fileUpload = $("#postedFile3").get(0);
        var files = fileUpload.files;
        if (files.length == 0) {
            $("#lblMessage3").css('color', 'red');
            $("#lblMessage3").html("<b> please select a .pdf file to uplod  </b> ");
            return;
        }
        var docVal = fileUpload.value;
        var extension = docVal.substring(docVal.lastIndexOf(".") + 1, docVal.length);
       ///// alert(extension.toLowerCase());
        if (extension.toLowerCase() != 'pdf' && extension.toLowerCase() != 'doc' && extension.toLowerCase() != 'docx' && extension.toLowerCase() != 'xls' && extension.toLowerCase() != 'xlsx') {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessage3").css('color', 'red');
            $("#lblMessage3").html("<b> only .pdf/word/excel file is allowed  </b> ");
            return;
        }

         ////var omobileno = $('[id*=txtMobileNo]').val();

        if (typeof ($("#postedFile3")[0].files) != "undefined") {
            var size = parseFloat($("#postedFile3")[0].files[0].size / 1024).toFixed(2);
            ////alert(size + " KB.");
            if (size <= 5000) {
                $.ajax({
                   ////// url: 'InsuranceClaimsPolicyUploadHandler.ashx?claimid=' + id+'&mobileno=' + omobileno,
                    url: 'InsuranceClaimsAccountDetailUploadHandlerCheckStatus.ashx?claimid=' + id ,
                    type: 'POST',
                    data: new FormData($('form')[2]),
                    //  data: '{"ItemSelected=" ' + new FormData($('form')[0]) + ', "ID="',
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (file) {
                        $("#fileProgress3").hide();
                        $("#lblMessage3").css('color', 'green');
                        $("#lblMessage3").html("<b>" + file.name + "</b> has been uploaded.");
                        if (id != "0") {
                            /////GetUploadedFilesFS(id);
                        }
                        else {
                                                                               
                            $('#hiddenFileName3').val(file.name);
                                                                               
                        }
                    },

                    xhr: function () {
                        var fileXhr = $.ajaxSettings.xhr();
                        if (fileXhr.upload) {
                            $("progress").show();
                            fileXhr.upload.addEventListener("progress", function (e) {
                                if (e.lengthComputable) {
                                    $("#fileProgress3").attr({
                                        value: e.loaded,
                                        max: e.total
                                    });
                                }
                            }, false);
                        }
                        return fileXhr;
                    },
                    error: function (file) {
                        $("#lblMessage3").css('color', 'red');
                        $("#lblMessage3").html("<b> " + file.name + " </b> ");

                    }
                });
            }
            else {
                //alert("Please upload file upto 5MB");
                $("#lblMessage3").css('color', 'red');
                $("#lblMessage3").html("<b> Please upload file upto 5MB  </b> ");
                return;
            }
        } else {
            //alert("This browser does not support HTML5.");
            $("#lblMessage3").css('color', 'red');
            $("#lblMessage3").html("<b> This browser does not support HTML5.  </b> ");
            return;
        }

       

    }


    function DownloadFile() {
     var id= $('#recordID').val();
        $.ajax({
            type: "POST",
        url: "insuranceclaimdetails.aspx/ConvertToPdfAndDownloadAccountCheckStatus",
        data: '{id: "' + id + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                //Convert Base64 string to Byte Array.
                

                var text=r.d;
                const myArray = text.split("<");
               /// alert(myArray[0]);
                /// alert(myArray[1]);
                 var bytes = Base64ToBytes(myArray[1]);
                 var fileName=myArray[0];

                  //////////////////To open in new tab blob as pdf file ////////////////
                  var file = new Blob([bytes], {type: 'application/pdf'});
       var fileURL = URL.createObjectURL(file);
       window.open(fileURL);

        //////////////////To open in new tab blob as pdf file ////////////////
 

 //////////////////To download blob as pdf file ////////////////
                ///////Convert Byte Array to BLOB.
//                var blob = new Blob([bytes], { type: "application/octetstream" });
// 
//                //Check the Browser type and download the File.
//                var isIE = false || !!document.documentMode;
//                if (isIE) {
//                    window.navigator.msSaveBlob(blob, fileName);
//                } else {
//                    var url = window.URL || window.webkitURL;
//                    link = url.createObjectURL(blob);

//                    var a = $("<a />");
//                    /////a.attr("download", fileName);
//                    a.attr("href", link);
//                    $("body").append(a);
//                    a[0].click();
//                    $("body").remove(a);
//                }

 //////////////////end To download blob as pdf file ////////////////
            }
        });
    };
    function Base64ToBytes(base64) {
        var s = window.atob(base64);
        var bytes = new Uint8Array(s.length);
        for (var i = 0; i < s.length; i++) {
            bytes[i] = s.charCodeAt(i);
        }
        return bytes;
    };



////////////////////////end upload check status files /////////////////////////



function GetDetailsbyInvoiceNo()
{
    
     $("#Showoverlay").show();
     var invno=$("#txtinvoiceno").val();

    var repairtypeid=$("#ddlRepair :selected").val();

      var model = {};
        model.orepairtypeid = repairtypeid;
        model.invoiceno=invno;

        $.ajax({
            type: "POST",
            url: "insuranceclaimdetails.aspx/GetDetailsByInvoiceNo",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            dataType: "json",
        success: function (result) {

            
                var json = JSON.parse(result.d);
                            
               ////alert(json[0].amount);
               var amt= parseInt( json[0].amount);
               ///alert(amt);

                 $("#txtinvdt").val(json[0].createdon);
                  $("#txtinvamount").val(amt);
                
            },
            error: function (errormessage) {
                $.notify("Error while deleting data!", "error");
            }

        });
        $("#Showoverlay").hide();
}



