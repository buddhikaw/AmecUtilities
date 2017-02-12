<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveSubmit.aspx.cs" Inherits="Amec.Utilities.Leave.LeaveSubmit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link rel="stylesheet" href="/DataTables/datatables.min.css">
    <script src="/MultiDatesPicker/jquery-ui.multidatespicker.js"></script>
    <script src="/DataTables/datatables.min.js"></script>

     <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/datetime-moment") %> 
    </asp:PlaceHolder>

    <script type="text/javascript">
        $(function () {
            $.fn.dataTable.moment('DD MMM YYYY');
            $('#gdVwLeave').DataTable();
            $('[data-toggle="tooltip"]').tooltip();
            $('#dvFullDay').multiDatesPicker();
            $('#dvHalfDay').multiDatesPicker({
                maxPicks: 1
            });

            $('#ddlDateSelection').change(function () {
                var dateSelection = $('#ddlDateSelection').val();
                if (dateSelection == 1) {
                    $('#dvHalfDay').multiDatesPicker('resetDates', 'picked');
                    $('#dvHalfDaySelector').show();
                    $('#dvFullDaySelector').hide();
                }
                else {
                    $('#dvFullDay').multiDatesPicker('resetDates', 'picked');
                    $('#dvFullDaySelector').show();
                    $('#dvHalfDaySelector').hide();
                }
            })
        });

        function BeforeSubmit() {
            var leaveDates;
            var dateSelection = $('#ddlDateSelection').val();
            if (dateSelection == 1) {
                leaveDates = $('#dvHalfDay').multiDatesPicker('getDates', 'object');
                if ($('#rbAm').is(':checked')) {
                    $('#hdLeaveDateType').val('AM');
                } else {
                    $('#hdLeaveDateType').val('PM');
                }
            }
            else {
                leaveDates = $('#dvFullDay').multiDatesPicker('getDates', 'object');
                $('#hdLeaveDateType').val('FULL');
            }
            if (leaveDates != 'undefined' && leaveDates.length > 0) {
                var dateCommaStr = '';
                $.each(leaveDates, function (key, value) {
                    dateCommaStr += $.format.date(value, "dd/MM/yyyy") + ',';
                });
                $('#hdLeaveDates').val(dateCommaStr);
                return true;
            }
            else {
                alert('Select dates !!!');
                return false;
            }
        }
    </script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="panel panel-primary" style="margin-bottom: 15px;">
                <div class="panel-heading">
                    <i class="fa fa-tasks"></i>Submit Leave 
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3">Leave Type</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="ddlLeaveType" runat="server" class="form-control" name="leaveType"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="LeaveRemarks" class="col-sm-3 col-form-label">Remarks</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" rows="5" id="txtLeaveRemarks" name="leaveRemarks" maxlength="800"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <label for="example-date-input" class="col-form-label">Leave Date(s) &nbsp;<span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="top" title="In a single Leave submission,submit either Half Day or Full Day(s) only.(ex:If you have one AM leave and one full day, Then submit seperately)"></span> </label>
                                        <br />
                                        <a href="http://www.mom.gov.sg/employment-practices/public-holidays" class="small" target="_blank" title="Go to MOM public holidays page"><span class="glyphicon glyphicon-link" aria-hidden="true"></span><strong><u>Public Holidays</u></strong></a>
                                    </div>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="ddlDateSelection">
                                            <option value="1">Half Day</option>
                                            <option value="2">Full Day(s)</option>
                                        </select>
                                        <div id="dvHalfDaySelector" style="display: normal; padding-top: 1%">
                                            <label class="radio-inline">
                                                <input type="radio" name="inlineRadioOptions" id="rbAm" value="AM" checked>
                                                AM
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="inlineRadioOptions" id="rbPm" value="PM">
                                                PM
                                            </label>
                                            <div id="dvHalfDay" style="padding-top: 1%"></div>
                                        </div>

                                        <div id="dvFullDaySelector" style="display: none; padding-top: 1%">
                                            <div id="dvFullDay"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-offset-3 col-sm-9">
                                        <asp:Button ID="btnLeaveSubmit" runat="server" Text="Submit" OnClick="btnLeaveSubmit_Click" OnClientClick="return BeforeSubmit()" CssClass="btn btn-primary" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="hdLeaveDates" name="LeaveDates" />
        <input type="hidden" id="hdLeaveDateType" name="LeaveDateType" />
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="panel panel-primary" style="margin-bottom: 15px;">
                <div class="panel-heading">
                    <i class="fa fa-tasks"></i>Your Submitted Leaves 
                </div>
                <div class="panel-body">
                    <div style="padding-top: 1%">
                        <asp:GridView ID="gdVwLeave" runat="server" CssClass="table table-striped table-bordered" Width="100%" ClientIDMode="Static" AutoGenerateColumns="true" OnRowCommand="GridView1_RowCommand" OnPreRender="gdVwLeave_PreRender" OnRowDataBound="gdVwLeave_RowDataBound">
                           
                            <Columns> <asp:TemplateField HeaderText="Delete">
                            <itemtemplate>
                               <asp:LinkButton ID="LinkButton1" 
                                 CommandArgument='<%# Eval("Leave Id") %>' 
                                 CommandName="Delete" runat="server" CssClass="btn btn-danger btn-sm">
                                 Delete</asp:LinkButton>
                             </itemtemplate>
                                </asp:TemplateField>
                                </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
