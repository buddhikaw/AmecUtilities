<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveSubmit.aspx.cs" Inherits="Amec.Utilities.Leave.LeaveSubmit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
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
    <div class="form-group row">
        <label class="col-sm-2">Leave Type</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlLeaveType" runat="server" class="form-control" name="leaveType"></asp:DropDownList>
        </div>
    </div>
    <div class="form-group row">
        <label for="example-date-input" class="col-sm-2 col-form-label">Leave Date(s) &nbsp;<span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="top" title="In a single Leave submission,submit either Half Day or Full Day(s) only.(ex:If you have one AM leave and one full day, Then submit seperately)"></span> </label>
        <div class="col-sm-10">
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
        <label for="LeaveRemarks" class="col-sm-2 col-form-label">Remarks</label>
        <div class="col-sm-10">
            <textarea class="form-control" rows="5" id="txtLeaveRemarks" name="leaveRemarks" maxlength="800"></textarea>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-2">
            &nbsp;
        </div>
        <div class="col-sm-10">
            <asp:Button ID="btnLeaveSubmit" runat="server" Text="Submit" OnClick="btnLeaveSubmit_Click" OnClientClick="return BeforeSubmit()" CssClass="btn btn-default" />
        </div>
    </div>
    <input type="hidden" id="hdLeaveDates" name="LeaveDates"/>
    <input type="hidden" id="hdLeaveDateType" name="LeaveDateType"/>
</asp:Content>
