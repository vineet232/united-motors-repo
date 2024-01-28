<%@ page title="" language="C#" masterpagefile="~/AdminMasterPage.master" autoeventwireup="true" inherits="masteremployees, App_Web_1ssuryoo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="DataTableActions/EmployeeMaster.js" type="text/javascript"></script>
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
            <div>
                <div class="row col-md-12">
                    <div class="col-md-4 topHeaderStyle" align="center">
                        Employee Master
                    </div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-success" data-target="#myModal" onclick="clearTextBox();">
                            Add New Employee
                        </button>
                    </div>
                    <div class="col-md-4" style="display: none;">
                        &nbsp;
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" style="padding-top: 40px; width: 70%;">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #00CACA;">
                                    <button type="button" class="close" data-dismiss="modal">
                                        ×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Add New Employee
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
                                                        Employee Name:</label>
                                                    <br />
                                                    <%-- <input type="text" id="modelID" style="display:none;" />--%>
                                                    <input type="hidden" name="recordID" id="recordID" value="">
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtName" maxlength="50" placeholder="Employee Name"
                                                            onkeypress="return /[0-9a-zA-Z ]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                    <span id="error" style="color: Red; display: none">* Special Characters not allowed.</span>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Designation:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlDesignation" class="form-control">
                                                            <option value="0" selected="selected">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Mobile No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtMobileNo" maxlength="10" placeholder="Mobile No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Date of Joining (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDOJ" maxlength="10" placeholder="D.O.J"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Date of Birth (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDOB" maxlength="10" placeholder="D.O.B."
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Aadhaar No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-envelope fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtAadhaarNo" maxlength="12" placeholder="Aadhaar No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" onfocusOut="return checkUID()" />
                                                    </div>
                                                    <div id="chkAadharStatus" style="color: Red;"></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        UAN No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtUANNo" maxlength="20" placeholder="UAN No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        ESI No:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtESINo" maxlength="12" placeholder="ESI No"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Dress:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-suitcase fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <select id="ddlDress" class="form-control">
                                                            <option value="0">Please Select</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Dress Given on (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtDressDate" maxlength="10" placeholder="Dress Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Salary:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-rupee fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtSalary" maxlength="10" placeholder="Salary"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Salary Updated on (MM/dd/yyyy):</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtSalaryDate" maxlength="10" placeholder="Salary Date"
                                                            onkeydown="return false;" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="modelname" class="labelclass">
                                                        Current Balance:</label>
                                                    <br />
                                                    <div class="input-group margin-bottom-sm">
                                                        <span class="input-group-addon"><i class="fa fa-edit fa-fw" aria-hidden="true"></i>
                                                        </span>
                                                        <input type="text" class="form-control" id="txtCurrentBalance" maxlength="10" placeholder="Current Balance"
                                                            onkeypress="return /[0-9]/i.test(event.key)" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                                </div>
                                                <%--<div class="col-md-6">
                                                <br />
                                                <div class="col-md-9">
                                                <input type="file" id="postedFile" name="postedFile"   />
                                                <asp:HiddenField ID="hiddenFileName" runat="server" ClientIDMode="Static" />
                                                <span id="lblMessage" style="color: Green"></span>
                                                </div>
                                                 <div class="col-md-3">
                                                <input type="button" id="btnUpload" value="Upload" onclick="btnUploadFile();"  />
                                                <progress id="fileProgress" style="display: none"></progress>
                                                </div>
                                                    
                                                    
                                                </div>--%>
                                                <div class="col-md-6">
                                                    <div class="col-md-6">
                                                        <label for="Photo">
                                                           Emp. Photo</label>
                                                        <input type="file" class="form-control" id="postedFile" name="postedFile" accept="image/jpg,image/png,image/jpeg" />
                                                        <asp:HiddenField ID="hiddenFileName" runat="server" ClientIDMode="Static" />
                                                <span id="lblMessage" style="color: Green"></span>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div style="width: 50%; height: 60%">
                                                            <div id="imgPreview" class="thumbnail" style="display: none">
                                                                <img class="img-responsive" id="targetImg" />
                                                                <div class="caption">
                                                                    <a href="#" onclick="ClearPreview()"><i class="glyphicon glyphicon-trash"></i></a>
                                                                    <span id="description"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <input type="button" id="btnUpload" value="Upload" onclick="btnUploadFile();"  />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" align="center" style="background-color: White !important;">
                <div class="c1">
                    <div id="Showoverlay" class="overlayWindow">
                        <br />
                        <br />
                        <i class="fa fa-spinner fa-pulse fa-3x fa-fw" style="font-size: 72px; color: black;">
                        </i>
                        <br />
                        <h2>
                            Loading .. Please wait</h2>
                    </div>
                    <table id="tblRecords" class="table table-bordered  table-responsive">
                        <thead>
                            <tr>
                                <th>
                                    Sr#
                                </th>
                                <th>
                                    ID
                                </th>
                                <th>
                                    Employee Name
                                </th>
                                <th>
                                    Designation
                                </th>
                                <th>
                                    Mobile No
                                </th>
                                <th>
                                    DOJ
                                </th>
                                <th>
                                    DOB
                                </th>
                                <th>
                                    Aadhaar No
                                </th>
                                <th>
                                    UAN No
                                </th>
                                <th>
                                    ESI No
                                </th>
                                <th>
                                    Dress 
                                </th>
                                <th>
                                    Salary 
                                </th>
                                <th>
                                    Current Balance
                                </th>
                                <th>
                                    Attendance Status
                                </th>
                                <th>
                                    Report Status
                                </th>
                                <th>
                                    Photo
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
                </div>
            </div>
            </div>
            <script src="datatableCSSJS2/jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/jszip.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/pdfmake.min.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/vfs_fonts.js" type="text/javascript"></script>
            <script src="datatableCSSJS2/buttons.html5.min.js" type="text/javascript"></script>
            <link href="datatableCSSJS2/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
            <link href="datatableCSSJS2/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>

        $(document).ready(function () {

            $("#postedFile").change(function () {

                var File = this.files;

                if (File && File[0]) {
                    ReadImage(File[0]);
                }

            })

        })


        var ReadImage = function (file) {

            var reader = new FileReader;
            var image = new Image;

            reader.readAsDataURL(file);
            reader.onload = function (_file) {

                image.src = _file.target.result;
                image.onload = function () {

                    var height = this.height;
                    var width = this.width;
                    var type = file.type;
                    var size = ~ ~(file.size / 1024) + "KB";

                    $("#targetImg").attr('src', _file.target.result);
                    $("#description").text("Size:" + size + ", " + height + "X " + width + ", " + type + "");
                    $("#imgPreview").show();

                }

            }

        }

        var ClearPreview = function () {
            $("#imageBrowes").val('');
            $("#description").text('');
            $("#imgPreview").hide();

        }
    </script>


      <script>
          function checkUID(e) {
              /*e.preventDefault();*/
              var uid = $('#txtAadhaarNo').val();

              /*console.log(uid);*/
              if (uid.length != 12) {
                  document.getElementById("chkAadharStatus").innerHTML = "Invalid aadhar no!!";
                  return false;
              }

              var Verhoeff = {
                  "d": [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
[2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
[3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
[4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
[5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
[6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
[7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
[8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]],
                  "p": [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
[5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
[8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
[9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
[4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
[2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
[7, 0, 4, 6, 9, 1, 3, 2, 5, 8]],
                  "j": [0, 4, 3, 2, 1, 5, 6, 7, 8, 9],
                  "check": function (str) {
                      var c = 0;
                      str.replace(/\D+/g, "").split("").reverse().join("").replace(/[\d]/g, function (u, i) {
                          c = Verhoeff.d[c][Verhoeff.p[i % 8][parseInt(u, 10)]];
                      });
                      return c;

                  },
                  "get": function (str) {

                      var c = 0;
                      str.replace(/\D+/g, "").split("").reverse().join("").replace(/[\d]/g, function (u, i) {
                          c = Verhoeff.d[c][Verhoeff.p[(i + 1) % 8][parseInt(u, 10)]];
                      });
                      return Verhoeff.j[c];
                  }
              };

              String.prototype.verhoeffCheck = (function () {
                  var d = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
[2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
[3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
[4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
[5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
[6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
[7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
[8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]];
                  var p = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
[5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
[8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
[9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
[4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
[2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
[7, 0, 4, 6, 9, 1, 3, 2, 5, 8]];

                  return function () {
                      var c = 0;
                      this.replace(/\D+/g, "").split("").reverse().join("").replace(/[\d]/g, function (u, i) {
                          c = d[c][p[i % 8][parseInt(u, 10)]];
                      });
                      return (c === 0);
                  };
              })();

              if (Verhoeff['check'](uid) === 0) {

                  /* alert('Match Found..!');*/
                  document.getElementById("chkAadharStatus").innerHTML = "";
                  return true;
              } else {
                  /*return false;*/
                  /*alert('Invalid aadhaar no..!');*/
                  /* $('#chkAadharStatus').val = "Invalid aadhar no!!";*/
                  document.getElementById("chkAadharStatus").innerHTML = "Invalid aadhar no!!";
                  document.getElementById("txtAadhaarNo").focus();
                  return false
              }
          }
    </script>


</asp:Content>
