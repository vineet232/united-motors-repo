

$(function () {
    $("#Showoverlay").show();
    GetData();
});


function GetData() {

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
				title: 'Save as Excel',
                 exportOptions: {
                    columns: [ 1,2 ]
                }
                
				
		}, 

        {
			extend: 'pdf',
				text: '<button class="btn"><i class="fa fa-file-pdf-o" style="color: red;"></i> Export to PDF</button>',
				titleAttr: 'Pdf',
				title: 'Save as PDF',
				exportOptions: {
				    columns: [1,2]
				}
				
		} 

         ]) // end array

  }

    $("#Showoverlay").show();
    $.ajax({
        type: "POST",
        url: "serviceaddmodel.aspx/GetAllData",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $("#tblRecords").dataTable().fnDestroy();
            var json = JSON.parse(data.d)

            var rows = '';
            $('#tblRecords tbody').empty();
            var srno = 0;
            $.each(json, function (key, item) {
                srno += 1;
                var id = item.id;
                var modelname = item.modelname;
                rows += "<tr>" +
                "<td>" + id + "</td>" +
                "<td>" + srno + "</td>" +
                "<td>" + modelname + ' ' + "</td>" +

                  "<td>" + item.fstype + ' ' + "</td>" +
                    "<td>" + item.fskmfrom + "<br/>" + item.fskmto + ' ' + "</td>" +

                        "<td>" + item.fsfromdays + "<br/>" + item.fstodays + ' ' + "</td>" +

                         "<td>" + item.scstype + ' ' + "</td>" +
                    "<td>" + item.scskmfrom + "<br/>" + item.scskmto + ' ' + "</td>" +

                        "<td>" + item.scsfromdays + "<br/>" + item.scstodays + ' ' + "</td>" +

//                         "<td>" + item.thstype + ' ' + "</td>" +
//                    "<td>" + item.thskmfrom + "<br/>" + item.thskmto + ' ' + "</td>" +

//                        "<td>" + item.thsfromdays + "<br/>" + item.thstodays + ' ' + "</td>" +

                    "<td> " +
                    " <input type='button' id='btnEdit'  onclick='EditRecordbyID(" + id + ")' value='Edit' class='btn btn-primary'>  &nbsp;" +
                     " <input type='button' id='btnDelete'  onclick='DeleteRecord(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
                    + "</tr>";
            });
            $('#tblRecords tbody').append(rows);

            // Apply DataTable Plugin.
            table = $('[id*=tblRecords]').DataTable({
                "order": [[1, "asc"]],

                 dom: 'lBfrtip',
                responsive: true,
                buttons: buttons,


                "columnDefs": [
                                { "visible": false, "targets": [0] }
                              ],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "paging": true,
                "info": true,
                'processing': true,
                
               stateSave: true,
                "bDestroy": true,
                fnInitComplete: function () {
                    $("#Showoverlay").hide();
                }
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



function sentenceCase(str) {
    if ((str === null) || (str === ''))
        return false;
    else
        str = str.toString();

    return str.replace(/\w\S*/g, function (txt) {
        return txt.charAt(0).toUpperCase() +
       txt.substr(1).toLowerCase();
    });
}



function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }

    var id = table.rows()[0].length + 1;
    var name = $('[id*=txtName]').val();

//    var servicetypeid = $("#ddlServiceType :selected").val();
//    var servicetype = $("#ddlServiceType :selected").text();
//    var kmfrom = $('[id*=txtfromkm]').val();
//    var kmto = $('[id*=txttokm]').val();
    //    var vdays = $('[id*=txtvdays]').val();

    var pditypeid = "0";
    var pditype = $('[id*=txtservicetype0]').val();
    var pdikmfrom = $('[id*=txtfromkm0]').val();
    var pdikmto = $('[id*=txttokm0]').val();
    var pdifromdays = $('[id*=txtfromdays0]').val();
    var pditodays = $('[id*=txttodays0]').val();


    var fstypeid = "1";
    var fstype = $('[id*=txtservicetype1]').val();
    var fskmfrom = $('[id*=txtfromkm1]').val();
    var fskmto = $('[id*=txttokm1]').val();
    var fsfromdays = $('[id*=txtfromdays1]').val();
    var fstodays = $('[id*=txttodays1]').val();

   //// alert("1"); 
   
    var scstypeid = "2";
    var scstype = $('[id*=txtservicetype2]').val();
    var scskmfrom = $('[id*=txtfromkm2]').val();
    var scskmto = $('[id*=txttokm2]').val();
    var scsfromdays = $('[id*=txtfromdays2]').val();
    var scstodays = $('[id*=txttodays2]').val();

    ///alert("2"); 

    var thstypeid = "3";
    var thstype = $('[id*=txtservicetype3]').val();
    var thskmfrom = $('[id*=txtfromkm3]').val();
    var thskmto = $('[id*=txttokm3]').val();
    var thsfromdays = $('[id*=txtfromdays3]').val();
    var thstodays = $('[id*=txttodays3]').val();

    var fostypeid = "4";
    var fostype = $('[id*=txtservicetype4]').val();
    var foskmfrom = $('[id*=txtfromkm4]').val();
    var foskmto = $('[id*=txttokm4]').val();
    var fosfromdays = $('[id*=txtfromdays4]').val();
    var fostodays = $('[id*=txttodays4]').val();

    var fistypeid = "5";
    var fistype = $('[id*=txtservicetype5]').val();
    var fiskmfrom = $('[id*=txtfromkm5]').val();
    var fiskmto = $('[id*=txttokm5]').val();
    var fisfromdays = $('[id*=txtfromdays5]').val();
    var fistodays = $('[id*=txttodays5]').val();

    var sistypeid = "6";
    var sistype = $('[id*=txtservicetype6]').val();
    var siskmfrom = $('[id*=txtfromkm6]').val();
    var siskmto  = $('[id*=txttokm6]').val();
    var sisfromdays = $('[id*=txtfromdays6]').val();
    var sistodays = $('[id*=txttodays6]').val();

    var sestypeid = "7";
    var sestype = $('[id*=txtservicetype7]').val();
    var seskmfrom = $('[id*=txtfromkm7]').val();
    var seskmto = $('[id*=txttokm7]').val();
    var sesfromdays = $('[id*=txtfromdays7]').val();
    var sestodays = $('[id*=txttodays7]').val();

    

    var eistypeid = "8";
    var eistype = $('[id*=txtservicetype8]').val();
    var eiskmfrom = $('[id*=txtfromkm8]').val();
    var eiskmto = $('[id*=txttokm8]').val();
    var eisfromdays = $('[id*=txtfromdays8]').val();
    var eistodays = $('[id*=txttodays8]').val();

   

    var nistypeid = "9";
    var nistype = $('[id*=txtservicetype9]').val();
    var niskmfrom = $('[id*=txtfromkm9]').val();
    var niskmto = $('[id*=txttokm9]').val();
    var nisfromdays = $('[id*=txtfromdays9]').val();
    var nistodays = $('[id*=txttodays9]').val();

    var testypeid = "10";
    var testype = $('[id*=txtservicetype10]').val();
    var teskmfrom = $('[id*=txtfromkm10]').val();
    var teskmto = $('[id*=txttokm10]').val();
    var tesfromdays = $('[id*=txtfromdays10]').val();
    var testodays = $('[id*=txttodays10]').val();

    

   // name = sentenceCase(name);
    var model = {};
    model.Name = name;
////    model.servicetypeid = servicetypeid;
////    model.servicetype = servicetype;
////    model.kmfrom = kmfrom;
////    model.kmto = kmto;
    ////    model.vdays = vdays;


    model.pditypeid = pditypeid;
    model.pditype = pditype;
    model.pdikmfrom = pdikmfrom;
    model.pdikmto = pdikmto;
    model.pdifromdays = pdifromdays;
    model.pditodays = pditodays;

    model.fstypeid = fstypeid;
    model.fstype = fstype;
    model.fskmfrom = fskmfrom;
    model.fskmto = fskmto;
    model.fsfromdays = fsfromdays;
    model.fstodays = fstodays;
    model.scstypeid = scstypeid;
    model.scstype = scstype;
    model.scskmfrom = scskmfrom;
    model.scskmto = scskmto;
    model.scsfromdays = scsfromdays;
    model.scstodays = scstodays;
    model.thstypeid = thstypeid;
    model.thstype = thstype;
    model.thskmfrom = thskmfrom;
    model.thskmto = thskmto;
    model.thsfromdays = thsfromdays;
    model.thstodays = thstodays;
    model.fostypeid = fostypeid;
    model.fostype = fostype;
    model.foskmfrom = foskmfrom;
    model.foskmto = foskmto;
    model.fosfromdays = fosfromdays;
    model.fostodays = fostodays;
    model.fistypeid = fistypeid;
    model.fistype = fistype;
    model.fiskmfrom = fiskmfrom;
    model.fiskmto = fiskmto;
    model.fisfromdays = fisfromdays;
    model.fistodays = fistodays;
    model.sistypeid = sistypeid;
    model.sistype = sistype;
    model.siskmfrom = siskmfrom;
    model.siskmto = siskmto;
    model.sisfromdays = sisfromdays;
    model.sistodays = sistodays;
    model.sestypeid = sestypeid;
    model.sestype = sestype;
    model.seskmfrom = seskmfrom;
    model.seskmto = seskmto;
    model.sesfromdays = sesfromdays;
    model.sestodays = sestodays;

    

    model.eistypeid = eistypeid;
    model.eistype = eistype;
    model.eiskmfrom = eiskmfrom;
    model.eiskmto = eiskmto;
    model.eisfromdays = eisfromdays;
    model.eistodays = eistodays;
    model.nistypeid = nistypeid;
    model.nistype = nistype;
    model.niskmfrom = niskmfrom;
    model.niskmto = niskmto;
    model.nisfromdays = nisfromdays;
    model.nistodays = nistodays;

   

    model.testypeid = testypeid;
    model.testype = testype;
    model.teskmfrom = teskmfrom;
    model.teskmto = teskmto;
    model.tesfromdays = tesfromdays;
    model.testodays = testodays;

   

  

    $.ajax({
        type: "POST",
        url: "serviceaddmodel.aspx/SaveRecord",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (r) {
            if (r.d == 0) {
                $.notify("Error!! Record not saved!", "error");
                $('[id*=txtName]').focus();
                return;
            }
            if (r.d == 10) {
                $.notify("Error!! You do not have permission to add record!", "error");
                return;
            }
            else {
                if (r.d == 20 || r.d == 30) {
                    if (r.d == 20) {
                        $.notify("Error!! model name already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! model name cannot be blank!", "error");
                        $('[id*=txtName]').focus();
                        return;
                    }
                }
                else {
                    $('#myModal').modal('hide');
                    GetData();
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


function EditRecordbyID(id) {
    ////alert(id);
    $.ajax({
        type: "POST",
        url: "serviceaddmodel.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to edit record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                var modelname = json[0].modelname;
                //alert(modelname);
                $('#recordID').val(json[0].id);
                $('#txtName').val(modelname);

                ////$('#ddlServiceType :selected').val(json[0].servicetypeid);
////                $('#txtfromkm').val(json[0].kmfrom);
////                $('#txttokm').val(json[0].kmto);
                ////                $('#txtvdays').val(json[0].vdays);


                $('#txtfromkm0').val(json[0].pdikmfrom);
                $('#txttokm0').val(json[0].pdikmto);
                $('#txtfromdays0').val(json[0].pdifromdays);
                $('#txttodays0').val(json[0].pditodays);

                $('#txtfromkm1').val(json[0].fskmfrom);
                $('#txttokm1').val(json[0].fskmto);
                $('#txtfromdays1').val(json[0].fsfromdays);
                $('#txttodays1').val(json[0].fstodays);

                $('#txtfromkm2').val(json[0].scskmfrom);
                $('#txttokm2').val(json[0].scskmto);
                $('#txtfromdays2').val(json[0].scsfromdays);
                $('#txttodays2').val(json[0].scstodays);

                $('#txtfromkm3').val(json[0].thskmfrom);
                $('#txttokm3').val(json[0].thskmto);
                $('#txtfromdays3').val(json[0].thsfromdays);
                $('#txttodays3').val(json[0].thstodays);

                $('#txtfromkm4').val(json[0].foskmfrom);
                $('#txttokm4').val(json[0].foskmto);
                $('#txtfromdays4').val(json[0].fosfromdays);
                $('#txttodays4').val(json[0].fostodays);

                $('#txtfromkm5').val(json[0].fiskmfrom);
                $('#txttokm5').val(json[0].fiskmto);
                $('#txtfromdays5').val(json[0].fisfromdays);
                $('#txttodays5').val(json[0].fistodays);

                $('#txtfromkm6').val(json[0].siskmfrom);
                $('#txttokm6').val(json[0].siskmto);
                $('#txtfromdays6').val(json[0].sisfromdays);
                $('#txttodays6').val(json[0].sistodays);

                $('#txtfromkm7').val(json[0].seskmfrom);
                $('#txttokm7').val(json[0].seskmto);
                $('#txtfromdays7').val(json[0].sesfromdays);
                $('#txttodays7').val(json[0].sestodays);

                $('#txtfromkm8').val(json[0].eiskmfrom);
                $('#txttokm8').val(json[0].eiskmto);
                $('#txtfromdays8').val(json[0].eisfromdays);
                $('#txttodays8').val(json[0].eistodays);

                $('#txtfromkm9').val(json[0].niskmfrom);
                $('#txttokm9').val(json[0].niskmto);
                $('#txtfromdays9').val(json[0].nisfromdays);
                $('#txttodays9').val(json[0].nistodays);

                $('#txtfromkm10').val(json[0].teskmfrom);
                $('#txttokm10').val(json[0].teskmto);
                $('#txtfromdays10').val(json[0].tesfromdays);
                $('#txttodays10').val(json[0].testodays);


                $('#myModal').modal('show');
                $('#myModal').on('shown.bs.modal', function () {
                    $('#txtName').focus();
                });
                $('#btnUpdate').show();
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

    var name = $('[id*=txtName]').val();

//////    var servicetypeid = $("#ddlServiceType :selected").val();
//////    var servicetype = $("#ddlServiceType :selected").text();
//////    var kmfrom = $('[id*=txtfromkm]').val();
//////    var kmto = $('[id*=txttokm]').val();
    //////    var vdays = $('[id*=txtvdays]').val();


    var pditypeid = "0";
    var pditype = $('[id*=txtservicetype0]').val();
    var pdikmfrom = $('[id*=txtfromkm0]').val();
    var pdikmto = $('[id*=txttokm0]').val();
    var pdifromdays = $('[id*=txtfromdays0]').val();
    var pditodays = $('[id*=txttodays0]').val();



    var fstypeid = "1";
    var fstype = $('[id*=txtservicetype1]').val();
    var fskmfrom = $('[id*=txtfromkm1]').val();
    var fskmto = $('[id*=txttokm1]').val();
    var fsfromdays = $('[id*=txtfromdays1]').val();
    var fstodays = $('[id*=txttodays1]').val();

    //// alert("1"); 

    var scstypeid = "2";
    var scstype = $('[id*=txtservicetype2]').val();
    var scskmfrom = $('[id*=txtfromkm2]').val();
    var scskmto = $('[id*=txttokm2]').val();
    var scsfromdays = $('[id*=txtfromdays2]').val();
    var scstodays = $('[id*=txttodays2]').val();

    ///alert("2"); 

    var thstypeid = "3";
    var thstype = $('[id*=txtservicetype3]').val();
    var thskmfrom = $('[id*=txtfromkm3]').val();
    var thskmto = $('[id*=txttokm3]').val();
    var thsfromdays = $('[id*=txtfromdays3]').val();
    var thstodays = $('[id*=txttodays3]').val();

    var fostypeid = "4";
    var fostype = $('[id*=txtservicetype4]').val();
    var foskmfrom = $('[id*=txtfromkm4]').val();
    var foskmto = $('[id*=txttokm4]').val();
    var fosfromdays = $('[id*=txtfromdays4]').val();
    var fostodays = $('[id*=txttodays4]').val();

    var fistypeid = "5";
    var fistype = $('[id*=txtservicetype5]').val();
    var fiskmfrom = $('[id*=txtfromkm5]').val();
    var fiskmto = $('[id*=txttokm5]').val();
    var fisfromdays = $('[id*=txtfromdays5]').val();
    var fistodays = $('[id*=txttodays5]').val();

    var sistypeid = "6";
    var sistype = $('[id*=txtservicetype6]').val();
    var siskmfrom = $('[id*=txtfromkm6]').val();
    var siskmto = $('[id*=txttokm6]').val();
    var sisfromdays = $('[id*=txtfromdays6]').val();
    var sistodays = $('[id*=txttodays6]').val();

    var sestypeid = "7";
    var sestype = $('[id*=txtservicetype7]').val();
    var seskmfrom = $('[id*=txtfromkm7]').val();
    var seskmto = $('[id*=txttokm7]').val();
    var sesfromdays = $('[id*=txtfromdays7]').val();
    var sestodays = $('[id*=txttodays7]').val();



    var eistypeid = "8";
    var eistype = $('[id*=txtservicetype8]').val();
    var eiskmfrom = $('[id*=txtfromkm8]').val();
    var eiskmto = $('[id*=txttokm8]').val();
    var eisfromdays = $('[id*=txtfromdays8]').val();
    var eistodays = $('[id*=txttodays8]').val();



    var nistypeid = "9";
    var nistype = $('[id*=txtservicetype9]').val();
    var niskmfrom = $('[id*=txtfromkm9]').val();
    var niskmto = $('[id*=txttokm9]').val();
    var nisfromdays = $('[id*=txtfromdays9]').val();
    var nistodays = $('[id*=txttodays9]').val();

    var testypeid = "10";
    var testype = $('[id*=txtservicetype10]').val();
    var teskmfrom = $('[id*=txtfromkm10]').val();
    var teskmto = $('[id*=txttokm10]').val();
    var tesfromdays = $('[id*=txtfromdays10]').val();
    var testodays = $('[id*=txttodays10]').val();





    ////name = sentenceCase(name);
    if (id > 0) {
        var model = {};
        model.id = id;
        model.Name = name;

        model.pditypeid = pditypeid;
        model.pditype = pditype;
        model.pdikmfrom = pdikmfrom;
        model.pdikmto = pdikmto;
        model.pdifromdays = pdifromdays;
        model.pditodays = pditodays;

        model.fstypeid = fstypeid;
        model.fstype = fstype;
        model.fskmfrom = fskmfrom;
        model.fskmto = fskmto;
        model.fsfromdays = fsfromdays;
        model.fstodays = fstodays;
        model.scstypeid = scstypeid;
        model.scstype = scstype;
        model.scskmfrom = scskmfrom;
        model.scskmto = scskmto;
        model.scsfromdays = scsfromdays;
        model.scstodays = scstodays;
        model.thstypeid = thstypeid;
        model.thstype = thstype;
        model.thskmfrom = thskmfrom;
        model.thskmto = thskmto;
        model.thsfromdays = thsfromdays;
        model.thstodays = thstodays;
        model.fostypeid = fostypeid;
        model.fostype = fostype;
        model.foskmfrom = foskmfrom;
        model.foskmto = foskmto;
        model.fosfromdays = fosfromdays;
        model.fostodays = fostodays;
        model.fistypeid = fistypeid;
        model.fistype = fistype;
        model.fiskmfrom = fiskmfrom;
        model.fiskmto = fiskmto;
        model.fisfromdays = fisfromdays;
        model.fistodays = fistodays;
        model.sistypeid = sistypeid;
        model.sistype = sistype;
        model.siskmfrom = siskmfrom;
        model.siskmto = siskmto;
        model.sisfromdays = sisfromdays;
        model.sistodays = sistodays;
        model.sestypeid = sestypeid;
        model.sestype = sestype;
        model.seskmfrom = seskmfrom;
        model.seskmto = seskmto;
        model.sesfromdays = sesfromdays;
        model.sestodays = sestodays;



        model.eistypeid = eistypeid;
        model.eistype = eistype;
        model.eiskmfrom = eiskmfrom;
        model.eiskmto = eiskmto;
        model.eisfromdays = eisfromdays;
        model.eistodays = eistodays;
        model.nistypeid = nistypeid;
        model.nistype = nistype;
        model.niskmfrom = niskmfrom;
        model.niskmto = niskmto;
        model.nisfromdays = nisfromdays;
        model.nistodays = nistodays;



        model.testypeid = testypeid;
        model.testype = testype;
        model.teskmfrom = teskmfrom;
        model.teskmto = teskmto;
        model.tesfromdays = tesfromdays;
        model.testodays = testodays;


        $.ajax({
            type: "POST",
            url: "serviceaddmodel.aspx/UpdateRecord",
            data: '{ model :' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Record not updated!", "error");
                    $('[id*=txtName]').focus();
                    return;
                }
                if (r.d == 10 || r.d == 20 || r.d == 30) {
                    if (r.d == 10) {
                        $.notify("Error!! You do not have permission to update record!", "error");
                    }
                    if (r.d == 20) {
                        $.notify("Error!! model name already exists!", "error");
                        return;
                    }
                    if (r.d == 30) {
                        $.notify("Error!! model name cannot be blank!", "error");
                        return;
                    }
                }
                else {
                    $('#recordID').val('0');
                    $('#myModal').modal('hide');
                    $('#btnUpdate').hide();
                    $('#btnAdd').hide();
                    GetData();
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
        var data = table.row($(this).parents('tr')).data();
        table.row($(this).parents('tr')).remove().draw();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "serviceaddmodel.aspx/DeleteRecord",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
                if (r.d == 0) {
                    $.notify("Error!! Record not deleted!", "error");
                    $('[id*=txtName]').focus();
                    return;
                }
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                }
                if (r.d == 99) {
                    $.notify("Error!! unable to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    GetData();
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
    $('#txtName').val("");
    $('#txtfromkm1').val("");
    $('#txttokm1').val("");
    $('#txtfromdays1').val("");
    $('#txttodays1').val("");

    $('#txtfromkm2').val("0");
    $('#txttokm2').val("0");
    $('#txtfromdays2').val("0");
    $('#txttodays2').val("0");

    $('#txtfromkm3').val("0");
    $('#txttokm3').val("0");
    $('#txtfromdays3').val("0");
    $('#txttodays3').val("0");

    $('#txtfromkm4').val("0");
    $('#txttokm4').val("0");
    $('#txtfromdays4').val("0");
    $('#txttodays4').val("0");

    $('#txtfromkm5').val("0");
    $('#txttokm5').val("0");
    $('#txtfromdays5').val("0");
    $('#txttodays5').val("0");

    $('#txtfromkm6').val("0");
    $('#txttokm6').val("0");
    $('#txtfromdays6').val("0");
    $('#txttodays6').val("0");

    $('#txtfromkm7').val("0");
    $('#txttokm7').val("0");
    $('#txtfromdays7').val("0");
    $('#txttodays7').val("0");

    $('#txtfromkm8').val("0");
    $('#txttokm8').val("0");
    $('#txtfromdays8').val("0");
    $('#txttodays8').val("0");

    $('#txtfromkm9').val("0");
    $('#txttokm9').val("0");
    $('#txtfromdays9').val("0");
    $('#txttodays9').val("0");

    $('#txtfromkm10').val("0");
    $('#txttokm10').val("0");
    $('#txtfromdays10').val("0");
    $('#txttodays10').val("0");

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtName').css('border-color', 'lightgrey');
    $('#myModal').modal('show');
    $('#myModal').on('shown.bs.modal', function () {
        $('#txtName').focus();
    });

}
//Valdidation using jquery  
function validate() {
    var isValid = true;
    if ($('#txtName').val().trim() == "") {
        $('#txtName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtName').css('border-color', 'green');
    }

    if ($('#txtfromkm1').val().trim() == "") {
        $('#txtfromkm1').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm1').css('border-color', 'green');
    }
    if ($('#txttokm1').val().trim() == "") {
        $('#txttokm1').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm1').css('border-color', 'green');
    }
    if ($('#txtfromdays1').val().trim() == "") {
        $('#txtfromdays1').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays1').css('border-color', 'green');
    }
    if ($('#txttodays1').val().trim() == "") {
        $('#txttodays1').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays1').css('border-color', 'green');
    }



    if ($('#txtfromkm2').val().trim() == "") {
        $('#txtfromkm2').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm2').css('border-color', 'green');
    }
    if ($('#txttokm2').val().trim() == "") {
        $('#txttokm2').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm2').css('border-color', 'green');
    }
    if ($('#txtfromdays2').val().trim() == "") {
        $('#txtfromdays2').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays2').css('border-color', 'green');
    }
    if ($('#txttodays2').val().trim() == "") {
        $('#txttodays2').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays2').css('border-color', 'green');
    }


    if ($('#txtfromkm3').val().trim() == "") {
        $('#txtfromkm3').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm3').css('border-color', 'green');
    }
    if ($('#txttokm3').val().trim() == "") {
        $('#txttokm3').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm3').css('border-color', 'green');
    }
    if ($('#txtfromdays3').val().trim() == "") {
        $('#txtfromdays3').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays3').css('border-color', 'green');
    }
    if ($('#txttodays3').val().trim() == "") {
        $('#txttodays3').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays3').css('border-color', 'green');
    }



    if ($('#txtfromkm4').val().trim() == "") {
        $('#txtfromkm4').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm4').css('border-color', 'green');
    }
    if ($('#txttokm4').val().trim() == "") {
        $('#txttokm4').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm4').css('border-color', 'green');
    }
    if ($('#txtfromdays4').val().trim() == "") {
        $('#txtfromdays4').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays4').css('border-color', 'green');
    }
    if ($('#txttodays4').val().trim() == "") {
        $('#txttodays4').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays4').css('border-color', 'green');
    }


    if ($('#txtfromkm5').val().trim() == "") {
        $('#txtfromkm5').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm5').css('border-color', 'green');
    }
    if ($('#txttokm5').val().trim() == "") {
        $('#txttokm5').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm5').css('border-color', 'green');
    }
    if ($('#txtfromdays5').val().trim() == "") {
        $('#txtfromdays5').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays5').css('border-color', 'green');
    }
    if ($('#txttodays5').val().trim() == "") {
        $('#txttodays5').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays5').css('border-color', 'green');
    }


    if ($('#txtfromkm6').val().trim() == "") {
        $('#txtfromkm6').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm6').css('border-color', 'green');
    }
    if ($('#txttokm6').val().trim() == "") {
        $('#txttokm6').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm6').css('border-color', 'green');
    }
    if ($('#txtfromdays6').val().trim() == "") {
        $('#txtfromdays6').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays6').css('border-color', 'green');
    }
    if ($('#txttodays6').val().trim() == "") {
        $('#txttodays6').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays6').css('border-color', 'green');
    }


    if ($('#txtfromkm7').val().trim() == "") {
        $('#txtfromkm7').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm7').css('border-color', 'green');
    }
    if ($('#txttokm7').val().trim() == "") {
        $('#txttokm7').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm7').css('border-color', 'green');
    }
    if ($('#txtfromdays7').val().trim() == "") {
        $('#txtfromdays7').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays7').css('border-color', 'green');
    }
    if ($('#txttodays7').val().trim() == "") {
        $('#txttodays7').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays7').css('border-color', 'green');
    }


    if ($('#txtfromkm8').val().trim() == "") {
        $('#txtfromkm8').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm8').css('border-color', 'green');
    }
    if ($('#txttokm8').val().trim() == "") {
        $('#txttokm8').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm8').css('border-color', 'green');
    }
    if ($('#txtfromdays8').val().trim() == "") {
        $('#txtfromdays8').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays8').css('border-color', 'green');
    }
    if ($('#txttodays8').val().trim() == "") {
        $('#txttodays8').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays8').css('border-color', 'green');
    }


    if ($('#txtfromkm9').val().trim() == "") {
        $('#txtfromkm9').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm9').css('border-color', 'green');
    }
    if ($('#txttokm9').val().trim() == "") {
        $('#txttokm9').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm9').css('border-color', 'green');
    }
    if ($('#txtfromdays9').val().trim() == "") {
        $('#txtfromdays9').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays9').css('border-color', 'green');
    }
    if ($('#txttodays9').val().trim() == "") {
        $('#txttodays9').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays9').css('border-color', 'green');
    }


    if ($('#txtfromkm10').val().trim() == "") {
        $('#txtfromkm10').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromkm10').css('border-color', 'green');
    }
    if ($('#txttokm10').val().trim() == "") {
        $('#txttokm10').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttokm10').css('border-color', 'green');
    }
    if ($('#txtfromdays10').val().trim() == "") {
        $('#txtfromdays10').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtfromdays10').css('border-color', 'green');
    }
    if ($('#txttodays10').val().trim() == "") {
        $('#txttodays10').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txttodays10').css('border-color', 'green');
    }





    return isValid;
}



