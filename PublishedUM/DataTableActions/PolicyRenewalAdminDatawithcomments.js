
$(document).ready(function () {
    $.ajax({
        type: "POST", url: "policyrenewal.aspx/GetLastRenewalName",
        dataType: "json",
        contentType: "application/json", 
        success: function (res) {
            $.each(res.d, function (data, value) {

                $("#ddlLastRenewalFrom").append($("<option></option>").val(value.id).html(value.renewalFrom));

                $("#ddlSearchLastRenewalFrom").append($("<option></option>").val(value.id).html(value.renewalFrom));
                

            })
        }
        ,
        error: function (response) {
            ///alert(response.responseText);
            $.notify("BOOM!", "error");
        }

    });

    $.ajax({
        type: "POST", url: "policyrenewal.aspx/GetModelName",
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


    $('#txtDueDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });

    $('#txtFromDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
    $('#txtToDate').datepicker({
        format: "mm/dd/yyyy",
        autoclose: true,
    });
    







})  

 



$(function () {
    //$("#Showoverlay").show();
    //GetData();
    BindDataTable();
});


function ShowFilteredData()
{
     var fromDt= $("#txtFromDate").val();
     var toDt= $("#txtToDate").val();

    var searchlastrenewalfromid = $("#ddlSearchLastRenewalFrom :selected").val();
    ///var olastrenewalfromval = $("#ddlSearchLastRenewalFrom :selected").text();

    if((fromDt != "" && toDt !="" ) || searchlastrenewalfromid != "0")
    {
        BindDataTable();
    }
    else
    {
         $.notify("Error!! Please enter search criteria!", "error");
         fromDt.focus();
         return;
    }
}

function ShowAllData()
{
$("#txtFromDate").val("");
$("#txtToDate").val("");
 $('#ddlSearchLastRenewalFrom').prop("selectedIndex", 0);

    BindDataTable()
}


////     // Before the request starts, show the 'Loading message...'
////     $('.result').text('File is being uploaded...');
////     event.preventDefault();
////     // On the click even,
////     var formData = new FormData($('#form')[0]);
////       $.ajax({
////           type: 'POST',
////           processData: false,
////           contentType: false,
////           data: formData,
////           success: function (data) {
////              // The file was uploaded successfully...
////              $('.result').text('File was uploaded.');
////           },
////           error: function (data) {
////              // there was an error.
////              $('.result').text('Whoops! There was an error in the request.');
////           }
////       });
//    });
// });

function BindDataTable() {


 $("#tblRecords").dataTable().fnDestroy();

 var lrID = $("#ddlSearchLastRenewalFrom :selected").val();
var startDT = $("#txtFromDate").val();
var endDt = $("#txtToDate").val();

////if(lrID<=0)
////{
////    $.notify("Please select vendor first!", "error");
////    return;
////}

////if((startDT != "" && endDt == "") || (startDT == "" && endDt != ""))
////{
////    $.notify("Please select start date and end date!", "error");
////    return;
////}

 
//table.draw( false );
//var i = 1;
 

// var show = false;
// var printPermission= $("#hdnPrintPermission").val();
// ////alert(printPermission);

// if(printPermission == "1")
// {
//    show = true;
// }

//  var buttons = ['colvis'];
//  
//  if (show) {
//    /////buttons.push('copyHtml5', 'excelHtml5', 'pdfHtml5' );
//    buttons.push('excel',  'pdfHtml5' );
//  }


          $('#tblRecords').DataTable({

////            rowCallback: function(row, data, index){
////           
////  	if(data.olastrenewalfromval == "Others"){
////    	$(row).find('td:eq(7)').css('color', 'red');
////    }
////  },


            "order": [[ 0, 'desc' ]],
            "columnDefs": [
    { "visible": false, "targets": [0,1] }
    ],
//            "async": false,
//                "processing": true,
//                "serverSide": true,
//                "ajax": {
//                    url: "WebServiceDataTable.asmx/GetDataForDataTable", type: "post"
//                },

                bServerSide: true,
                sAjaxSource: 'PolicyDataHandler.ashx?lrID=' + lrID +'&startDt='+ startDT +'&endDt='+ endDt,
                sServerMethod: 'post',
                "processing": true,
                dom: 'Bfrtip',
//                buttons: [
//                    'copy', 'excel', 'pdf', 'csv'
//                ],

//             buttons: [
////            {
////                extend: 'copyHtml5',
////                exportOptions: {
////                    columns: [ 0, ':visible' ]
////                }
////            },


//                        {
//                            "extend": 'excel',
//                            "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
//                            "titleAttr": 'Excel',
//                          ///  "action": newexportaction
//                        },


//            {
//                extend: 'excelHtml5',
////                "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i> Export to Excel</button>',
////                            "titleAttr": 'Excel Export',
////                            "action": newexportaction,

//                ////text: '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
//                exportOptions: {
//                    columns: ':visible',
//                }
//            },
////            {
////                extend: 'pdfHtml5',
////                exportOptions: {
////                    columns: [ 0, 1, 2, 5 ]
////                }
////            },




//            //'colvis'
//        ]











//"buttons": [
// {
//                extend: 'collection',
//                text: 'Export',
                buttons: ['export', 
                
//                'excel', 'csv', 'pdf',

//                 { extend: 'excel',
//                    text: 'Export Current Page',
//                    exportOptions: {
//                        modifier: {
//                            page: 'current'
//                        }
//                    },
//                    customize: function (xlsx)
//                    {
//                        var sheet = xlsx.xl.worksheets['sheet1.xml'];
//                        $('row:first c', sheet).attr('s', '7');
//                    }
//                },
                
                {
                    text: 'Export All to Excel',
                     "action": newexportaction,
//                    ajax: 
//                    { type: "POST",
//                        url: "policyrenewal.aspx/GetTop1000Data?ExportToExcel=Yes",
//                       
//                    }
                },
                
                {
                    text: 'Export All to PDF',
                     "action": newexportactiontoPDF,
                    
                }

                ],
//            }
//            ],


        
                
                "columns": [
                {"data": "olastchangeson"},
                    {  "data": "id" },
                     {
                     bSortable: false,
                      render: function (data, type, row, meta) {
                     return meta.row + meta.settings._iDisplayStart + 1;
                    }
                    },
                    { "data": "ocustname"
////                    ,
////                       createdCell: function(td, cellData, rowData, row, col){
//////                        var color = (cellData === 'Surender Singh') ? '#F0F0F0' : 'white';
////                        var color = (cellData != "") ? '#F0F0F0' : 'white';      
////                        $(td).css('background-color', color );
////                        $(td).css('font-weight', 'bold' );
////                      }
                    },
                    { "data": "ovehChasisno" },
                    { "data": "oduedate" },
                    { "data": "omobileno" },
                    { "data": "owhatsappno" },
                    { "data": "omodelName" },
                    { "data": "olastrenewalfromval" },
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
                    ,
                    {
                        "data": "id",
                        "render": function (id, type, full, meta) {
                            //debugger
                            return '<a href="#"  onclick="SendFilebyWhatsapp(' + id + ')"><i class="fa fa-whatsapp text-success" style="font-size:x-large;"></i></a>'
                        }
                    }
                  
                    
                ]

               ,
               stateSave: true,
                "bDestroy": true,
////                dom: 'Bfrtip',

////                 "lengthMenu": [[10, 50, 75, 100, 150, -1], [10, 50, 75, 100, 150, 'All']],
////            "dom": '<"top"Bifpl<"clear">>rt<"bottom"ip<"clear">>',

//      responsive: true,
//        buttons: buttons,


//                , fnRowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
//                            if (aData.olastrenewalfromval == "Others") {
//                                $('td', nRow).css('background-color', '#FEEDF2');
//                            } else {
//                                $('td', nRow).css('background-color', 'white');
//                            }
//                        }

            });

           

            }




//            function newexportaction()
//            {
//            ////alert("export");

//             $.ajax({
//        type: "POST",
//        url: "policyRenewal.aspx/GetDatainExcel",
//        data: '',
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (data) {
//        ////alert(data);
//         var json = JSON.parse(data.d)
//        ////var data = $('#txt').val();
//        if(json == '')
//            return;
//        
//        JSONToCSVConvertor(json, "Policy Data", true);


//        }
//        });

//            }


//            function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
//    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
//    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
//    
//    var CSV = '';    
//    //Set Report title in first row or line
//    
//    CSV += ReportTitle + '\r\n\n';

//    //This condition will generate the Label/Header
//    if (ShowLabel) {
//        var row = "";
//        
//        //This loop will extract the label from 1st index of on array
//        for (var index in arrData[0]) {
//            
//            //Now convert each value to string and comma-seprated
//            row += index + ',';
//        }

//        row = row.slice(0, -1);
//        
//        //append Label row with line break
//        CSV += row + '\r\n';
//    }
//    
//    //1st loop is to extract each row
//    for (var i = 0; i < arrData.length; i++) {
//        var row = "";
//        
//        //2nd loop will extract each column and convert it in string comma-seprated
//        for (var index in arrData[i]) {
//            row += '"' + arrData[i][index] + '",';
//        }

//        row.slice(0, row.length - 1);
//        
//        //add a line break after each row
//        CSV += row + '\r\n';
//    }

//    if (CSV == '') {        
//        alert("Invalid data");
//        return;
//    }   
//    
//    //Generate a file name
//    var fileName = "MyReport_";
//    //this will remove the blank-spaces from the title and replace it with an underscore
//    fileName += ReportTitle.replace(/ /g,"_");   
//    
//    //Initialize file format you want csv or xls
//    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
//    
//    // Now the little tricky part.
//    // you can use either>> window.open(uri);
//    // but this will not work in some browsers
//    // or you will not get the correct file extension    
//    
//    //this trick will generate a temp <a /> tag
//    var link = document.createElement("a");    
//    link.href = uri;
//    
//    //set the visibility hidden so it will not effect on your web-layout
//    link.style = "visibility:hidden";
//    link.download = fileName + ".csv";
//    
//    //this part will append the anchor tag and remove it after automatic click
//    document.body.appendChild(link);
//    link.click();
//    document.body.removeChild(link);
//}

// function newexportactiontoPDF()
//            {
//            ////alert("export");

//             $.ajax({
//        type: "POST",
//        url: "policyRenewal.aspx/GetDatainExcel",
//        data: '',
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (data) {
//       
//         var json = JSON.parse(data.d)
//        ////var data = $('#txt').val();

//        ///// alert(json);

//        if(json == '')
//            return;
//        
//       var doc = new jsPDF();
//        $.each(json, function (key, item) {
//        alert(item.custname);
//        doc.text(20, 10 + (i * 10), 
//        "Customer Name: " + item.custname +
//        "Veh/Chasis No: " + item.vehchasisno);

//        });

////employees.forEach(function(employee, i){
////    doc.text(20, 10 + (i * 10), 
////        "First Name: " + employee.firstName +
////        "Last Name: " + employee.lastName);
////});

//doc.save('Test.pdf');


//        }
//        });

//            }


//function ShowAllRecords()
//{
//    GetAllRecordsData();
//}

//function GetAllRecordsData() {
//    $("#Showoverlay").show();
//    $.ajax({
//        type: "POST",
//        url: "policyRenewal.aspx/GetAllData",
//        data: '',
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (data) {

//            $("#tblRecords").dataTable().fnDestroy();
//            var json = JSON.parse(data.d)
//            var i=0;
//            var rows = '';
//            $('#tblRecords tbody').empty();
//            $.each(json, function (key, item) {
//            i=i+1;
//                var id = item.id;
//                var custname = item.custname;
//                var vehchasisno = item.vehchasisno;
//                var duedate = item.duedate;
//                var mobileno = item.mobileno;
//                var whatsappno = item.whatsappno;
//                var modelid = item.modelid;
//                var modelname = item.modelname;
//                var lastrenewalfromval = item.lastrenewalfromval;
//                var lastrenewalfromid = item.lastrenewalfromid;
//                var lastchangeson=item.lastchangeson;
//                
//                rows += "<tr><td>" + id +
//                    "</td>" + 
//                     " <td>" + i + ' ' + "</td>" +
//                    "</td><td>" + custname + ' ' +
//                    "</td>" +
//                   " <td>" + vehchasisno + ' ' + "</td>" +
//                    " <td>" + duedate + ' ' + "</td>" +
//                     " <td>" + mobileno + ' ' + "</td>" +
//                      " <td>" + whatsappno + ' ' + "</td>" +
//                       " <td>" + modelname + ' ' + "</td>" +
//                        " <td>" + lastrenewalfromval + ' ' + "</td>" +
//                         " <td>" + lastchangeson + ' ' + "</td>" +

//                    "<td> " +
//                    " <input type='button' id='btnEdit'  onclick='EditRecordbyID(" + id + ")' value='Edit' class='btn btn-primary'>  </td>" +
//                     " <td> <input type='button' id='btnDelete'  onclick='DeleteRecord(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
//                    + "</tr>";
//            });
//            $('#tblRecords tbody').append(rows);

//            // Apply DataTable Plugin.
//            table = $('[id*=tblRecords]').DataTable({
//            "columnDefs": [
//            {
//                "targets": [ 0 ],
//                "visible": false,
//                "searchable": false
//            }
//            ,
//            {
//                "targets": [ 9 ],
//                "visible": false
//            }
//        ]
//        ,
//                "order": [[10, "desc"]],
//                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
//                "paging": true,
//                "info": true,
//                'processing': true,
//                 dom: 'Bfrtip',
//buttons: [
//    'pageLength', 'excel', 'pdf'
//],
//                fnInitComplete: function () {
//                    $("#Showoverlay").hide();
//                }
//            });
//        },
//        failure: function (response) {
//            // alert(response.responseText);
//            $.notify("BOOM!", "error");
//        },
//        error: function (response) {
//            ///alert(response.responseText);

//            $.notify("BOOM!", "error");
//        }
//    });
//}

//function GetData() {
//    $("#Showoverlay").show();
//    $.ajax({
//        type: "POST",
//        url: "policyRenewal.aspx/GetTop1000Data",
//        data: '',
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (data) {

//            $("#tblRecords").dataTable().fnDestroy();
//            var json = JSON.parse(data.d)
//            var i=0;
//            var rows = '';
//            $('#tblRecords tbody').empty();
//            $.each(json, function (key, item) {
//            i=i+1;
//                var id = item.id;
//                var custname = item.custname;
//                var vehchasisno = item.vehchasisno;
//                var duedate = item.duedate;
//                var mobileno = item.mobileno;
//                var whatsappno = item.whatsappno;
//                var modelid = item.modelid;
//                var modelname = item.modelname;
//                var lastrenewalfromval = item.lastrenewalfromval;
//                var lastrenewalfromid = item.lastrenewalfromid;
//                var lastchangeson=item.lastchangeson;

//                rows += "<tr><td>" + id +
//                    "</td>" + 
//                     " <td>" + i + ' ' + "</td>" +
//                    "<td>" + custname + ' ' +
//                    "</td>" +
//                   " <td>" + vehchasisno + ' ' + "</td>" +
//                    " <td>" + duedate + ' ' + "</td>" +
//                     " <td>" + mobileno + ' ' + "</td>" +
//                      " <td>" + whatsappno + ' ' + "</td>" +
//                       " <td>" + modelname + ' ' + "</td>" +
//                        " <td>" + lastrenewalfromval + ' ' + "</td>" +
//                        " <td>" + lastchangeson + ' ' + "</td>" +
//                    "<td> " +
//                    " <input type='button' id='btnEdit'  onclick='EditRecordbyID(" + id + ")' value='Edit' class='btn btn-primary'>  </td>" +
//                     " <td> <input type='button' id='btnDelete'  onclick='DeleteRecord(" + id + ")' value='Delete' class='btn btn-danger'> </td>"
//                    + "</tr>";
//            });
//            $('#tblRecords tbody').append(rows);

//            // Apply DataTable Plugin.
//            table = $('[id*=tblRecords]').DataTable({
//          
//          "columnDefs": [
//            {
//                "targets": [ 0 ],
//                "visible": false,
//                "searchable": false
//            }
//            ,
//            {
//                "targets": [ 9 ],
//                "visible": false
//            }
//        ]
//        ,
//                "order": [[10, "desc"]],
//                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
//                "paging": true,
//                "info": true,
//                 'processing': true,
////                dom: 'lBfrtip',
// dom: 'Bfrtip',
//buttons: [
//    'pageLength', 'excel', 'pdf'
//],
////'copy','csv', 'print'
////                 dom: 'Bfrtip',            
//// 
////       buttons: ['pageLength','excel', 'pdf'],
////                 buttons: [
////                { extend: 'copy', text: 'Copy to clipboard', className: 'exportExcel', exportOptions: { modifier: { page: 'all'}} },
////                { extend: 'excel', text: 'Export to Excel', className: 'exportExcel', filename: 'Agenda_Excel', exportOptions: { modifier: { page: 'all'}} },
////                { extend: 'csv', text: 'Export to CSV', className: 'exportExcel', filename: 'Agenda_Csv', exportOptions: { modifier: { page: 'all'}} },
////                { extend: 'pdf', text: 'Export to PDF', className: 'exportExcel', filename: 'Agenda_Pdf', orientation: 'Portrait', pageSize: 'LEGAL', exportOptions: { modifier: { page: 'all' }, columns: [0, 1, 2]} }
////               

////            ],
//               

//                
//                fnInitComplete: function () {
//                    $("#Showoverlay").hide();
//                }
//            });



////             table.processing( true );
//// 
////  setTimeout( function () {
////    table.processing( false );
////  }, 2000 );

//        },
//        failure: function (response) {
//            // alert(response.responseText);
//            $.notify("BOOM!", "error");
//        },
//        error: function (response) {
//            ///alert(response.responseText);

//            $.notify("BOOM!", "error");
//        }
//    });
//}



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

             var fromDt= $("#txtFromDate").val();
     var toDt= $("#txtToDate").val();

    var searchlastrenewalfromid = $("#ddlSearchLastRenewalFrom :selected").val();
    ///var olastrenewalfromval = $("#ddlSearchLastRenewalFrom :selected").text();

    if(fromDt != "" && toDt !="" && searchlastrenewalfromid >=0)
    {
     var model = {};
    model.fromdt = fromDt;
     model.todt = toDt;
    model.olastrenewalfromid = searchlastrenewalfromid;

    

           $("#Showoverlay").show(); 
             $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/GetFilteredDatainExcel",
        data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Policy Data", true);

         $("#Showoverlay").hide(); 


        }
        });
    }

    else
    {
           $("#Showoverlay").show(); 
             $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        ////alert(data);
         var json = JSON.parse(data.d)
        ////var data = $('#txt').val();
        if(json == '')
            return;
        
        JSONToCSVConvertor(json, "Policy Data", true);

         $("#Showoverlay").hide(); 


        }
        });
    }
            ////alert("export");
          

            }


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
    var fileName = "MyReport_";
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

             var fromDt= $("#txtFromDate").val();
     var toDt= $("#txtToDate").val();

    var searchlastrenewalfromid = $("#ddlSearchLastRenewalFrom :selected").val();

    

          

            /////alert("export");

    if(fromDt != "" && toDt !=""  && searchlastrenewalfromid >=0)
    {
     var model = {};
    model.fromdt = fromDt;
     model.todt = toDt;
    model.olastrenewalfromid = searchlastrenewalfromid;

      $("#Showoverlay").show();
    $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/GetFilteredDatainExcel",
       data: '{ model :' + JSON.stringify(model) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
       
         var json = JSON.parse(data.d)

         var count = Object.keys(json).length;
         
        if(json == '')
            return;        

       var doc = new jspdf.jsPDF()

        var head = [['ID', 'Customer Name', 'Last Renewal From', 'Veh./Chasis No', 'Due Date', 'Mobile No', 'Whatsapp No', 'Model Name']]
        var body = []
      $.each(json, function (key, item) {

  var data =  [item.id, item.custname, item.lastrenewalfromval, item.vehChasisno, item.duedate, item.mobileno, item.whatsappno, item.modelname];

  body.push(data);
         });

       doc.autoTable({ head: head, body: body })

        // Simple html example
        doc.autoTable({ html: '#tabledata' })

        doc.save('PolicyData.pdf')
         $("#Showoverlay").hide(); 

        }
       });

    }

    else
    {
      $("#Showoverlay").show();
           $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/GetDatainExcel",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
       
         var json = JSON.parse(data.d)

         var count = Object.keys(json).length;
         
        if(json == '')
            return;        

       var doc = new jspdf.jsPDF()

        var head = [['ID', 'Customer Name', 'Last Renewal From', 'Veh./Chasis No', 'Due Date', 'Mobile No', 'Whatsapp No', 'Model Name']]
        var body = []
      $.each(json, function (key, item) {

  var data =  [item.id, item.custname, item.lastrenewalfromval, item.vehChasisno, item.duedate, item.mobileno, item.whatsappno, item.modelname];

  body.push(data);
         });

       doc.autoTable({ head: head, body: body })

        // Simple html example
        doc.autoTable({ html: '#tabledata' })

        doc.save('PolicyData.pdf')
         $("#Showoverlay").hide(); 

        }
       });
    }


            


        }    




function AddRecord() {
    var res = validate();
    if (res == false) {
        return false;
    }
    

    //var id = table.rows()[0].length + 1;
      var fileName = $('[id*=hiddenFileName]').val();
      
    var name = $('[id*=txtName]').val();
    var olastrenewalfromid = $("#ddlLastRenewalFrom :selected").val();
    var olastrenewalfromval = $("#ddlLastRenewalFrom :selected").text();
    var ovehChasisno = $('[id*=txtVehChasisNo]').val();
    var oduedate = $('[id*=txtDueDate]').val();
    var omobileno = $('[id*=txtMobileNo]').val();
    var owhatsappno = $('[id*=txtAlternateNo]').val();
    var omodelid = $("#ddlModel :selected").val();
    var omodelName = $("#ddlModel :selected").text();

   // name = sentenceCase(name);
    var model = {};
    model.ocustname = name;
    model.olastrenewalfromid = olastrenewalfromid;
    model.olastrenewalfromval = olastrenewalfromval;
    model.ovehChasisno = ovehChasisno;
    model.oduedate = oduedate;
    model.omobileno = omobileno;
    model.owhatsappno = owhatsappno;
    model.omodelid = omodelid;
    model.omodelName = omodelName;
    model.ouploadedfilename=fileName;

    //        debugger;
    $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/SaveRecord",
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
                if (r.d == 20 || r.d == 30 || r.d == 50) {
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


function EditRecordbyID(id) {
    ////alert(id);
    $("#lblMessage").html("");
    $("#postedFile").val('');
    $('#recordID').val("0");
    GetUploadedFiles(id);
    $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/GetRecordbyID",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d == "10") {
                $.notify("Error!! You do not have permission to add record!", "error");
            }
            else {
                var json = JSON.parse(result.d);
                var custname = json[0].custname;
               ///// alert(result.d);
                $('#recordID').val(json[0].id);
               
                $('#txtName').val(custname);
                 $("#ddlLastRenewalFrom").val(json[0].lastrenewalfromid);
                $('#txtVehChasisNo').val(json[0].vehChasisno);
                 var mydate = new Date(json[0].duedate.substring(0, 10));
                 var duedate = new Date(json[0].duedate.substring(0, 10)).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" })

   
                ////var formattedDate = moment(json[0].duedate).format('MM-DD-YYYY');
                 $('#txtDueDate').val(duedate);
                  $('#txtMobileNo').val(json[0].mobileno);
                   $('#txtAlternateNo').val(json[0].whatsappno);
                    $("#ddlModel").val(json[0].modelid);

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
    var olastrenewalfromid = $("#ddlLastRenewalFrom :selected").val();
    var olastrenewalfromval = $("#ddlLastRenewalFrom :selected").text();
    var ovehChasisno = $('[id*=txtVehChasisNo]').val();
    var oduedate = $('[id*=txtDueDate]').val();
    var omobileno = $('[id*=txtMobileNo]').val();
    var owhatsappno = $('[id*=txtAlternateNo]').val();
    var omodelid = $("#ddlModel :selected").val();
    var omodelName = $("#ddlModel :selected").text();
    ////name = sentenceCase(name);
    if (id > 0) {
         var model = {};
         model.id = id;
         model.ocustname = name;
         model.olastrenewalfromid = olastrenewalfromid;
         model.olastrenewalfromval = olastrenewalfromval;
         model.ovehChasisno = ovehChasisno;
         model.oduedate = oduedate;
         model.omobileno = omobileno;
         model.owhatsappno = owhatsappno;
         model.omodelid = omodelid;
         model.omodelName = omodelName;

        $.ajax({
            type: "POST",
            url: "policyRenewal.aspx/UpdateRecord",
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
            url: "policyRenewal.aspx/DeleteRecord",
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

    $('#ddlLastRenewalFrom').prop("selectedIndex", 0);
    $('#ddlModel').prop("selectedIndex", 0);

////      $("#ddlLastRenewalFrom :selected").val("0");
////      $("#ddlLastRenewalFrom :selected").text("Please Select");
       $('#txtVehChasisNo').val("");
        $('#txtDueDate').val("");
        $('#txtMobileNo').val("");
         $('#txtAlternateNo').val("");
////         $("#ddlModel :selected").val("0");
////         $("#ddlModel :selected").text("Please Select");

    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#txtName').css('border-color', 'lightgrey');
    $('#ddlLastRenewalFrom').css('border-color', 'lightgrey');
    $('#txtVehChasisNo').css('border-color', 'lightgrey');
    $('#txtDueDate').css('border-color', 'lightgrey');
    $('#txtMobileNo').css('border-color', 'lightgrey');
    $('#txtAlternateNo').css('border-color', 'lightgrey');
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
    if ($('#txtName').val().trim() == "") {
        $('#txtName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtName').css('border-color', 'lightgrey');
    }

    if ($('#ddlLastRenewalFrom :selected').val().trim() == "0") {
        $('#ddlLastRenewalFrom').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlLastRenewalFrom').css('border-color', 'lightgrey');
    }

    if ($('#txtVehChasisNo').val().trim() == "") {
        $('#txtVehChasisNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtVehChasisNo').css('border-color', 'lightgrey');
    }

    if ($('#txtDueDate').val().trim() == "") {
        $('#txtDueDate').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtDueDate').css('border-color', 'lightgrey');
    }

    if ($('#txtMobileNo').val().trim() == "") {
        $('#txtMobileNo').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#txtMobileNo').css('border-color', 'lightgrey');
    }

////    if ($('#txtAlternateNo').val().trim() == "") {
////        $('#txtAlternateNo').css('border-color', 'Red');
////        isValid = false;
////    }
////    else {
////        $('#txtAlternateNo').css('border-color', 'lightgrey');
////    }

    if ($('#ddlModel :selected').val().trim() == "0") {
        $('#ddlModel').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#ddlModel').css('border-color', 'lightgrey');
    }

    return isValid;
}




function GetUploadedFiles(id) {
////    $("#Showoverlay").show(); 
///////alert(id);
if(id!="0")
{
    $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/GetAttachedFiles",
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
               
                var mydate = new Date(json[0].createdon);
                var uploadDt = new Date(createdon).format('dd-MMM-yyyy HH:mm:ss')

                
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
         var custid = $('[id*=recordID]').val();
        $("#Showoverlay").show();
        $.ajax({
            type: "POST",
            url: "policyRenewal.aspx/DeleteAttachedFile",
            data: '{ id :' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (r) {
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to delete record!", "error");
                }
                else {
                    $("#Showoverlay").hide();
                    GetUploadedFiles(custid);
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


function DownloadFile(id) { 
//////alert(id);
  $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/ConvertToPdfAndDownload",
        data: '{id: "' + id + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) { 
            if (response.d == '')
                alert('There is a problem exporting the file');
            else {
            //alert("byte");
                var sampleArr = base64ToArrayBuffer(response.d);
                saveByteArray("File-" + id, sampleArr);
            }
        },
        failure: function (response) {
            alert("Cannot export thefile: Error in calling Ajax");
        }
    });
           
 }

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
        if (extension.toLowerCase() != 'pdf') {
            //alert("Please enter file  in .pdf extension ");
            $("#lblMessage").css('color', 'red');
            $("#lblMessage").html("<b> only .pdf file is allowed  </b> ");
            return;
        }

        if (typeof ($("#postedFile")[0].files) != "undefined") {
            var size = parseFloat($("#postedFile")[0].files[0].size / 1024).toFixed(2);
            //alert(size + " KB.");
            if (size <= 5000) {
                $.ajax({
                    url: 'UploadPolicyHandler.ashx?custid=' + id,
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

        ////                                                                //                                                            alert(files.length);
        ////                                                                //                                                            return;
        ////                                                                //                                                            var test = new FormData();
        ////                                                                //                                                            for (var i = 0; i < files.length; i++) {
        ////                                                                //                                                                test.append(files[i].name, files[i]);
        ////                                                                //                                                            }
        //                                                            }
        //                                                            else {
        //                                                                $("#lblMessage").css('color', 'red');
        //                                                                $("#lblMessage").html("<b> invalid customer id  </b> ");
        //                                                            }

                                                      

    }

    function SendFilebyWhatsapp(id)
    {
    
     $.ajax({
        type: "POST",
        url: "policyRenewal.aspx/SendFileByWhatsapp",
        data: '{ id :' + id + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",

              success: function (r) {
                if (r.d == 10) {
                    $.notify("Error!! You do not have permission to send record!", "error");
                }
                else {
                    //alert(r.d);

                    window.open( r.d,'_blank'); // <- This is what makes it open in a new window.

                   // $.notify("File sent!", "success");
                }
            },
            error: function (errormessage) {
            ////alert(errormessage.responseText);
                $.notify("Error while sendig file!", "error");
            }

        });
    }