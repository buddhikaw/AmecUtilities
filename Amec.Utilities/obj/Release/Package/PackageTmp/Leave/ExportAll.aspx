<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExportAll.aspx.cs" Inherits="Amec.Utilities.Leave.ExportAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="form-group row">
        <label for="ddlYear" class="col-sm-1 col-form-label">Year</label>
        <div class="col-sm-11">
        <asp:DropDownList ID="ddlYear" runat="server" class="form-control" name="leaveYear">
            <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
            <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
        </asp:DropDownList>
            </div>
    </div>
    <div class="form-group row">
        <label for="ddlMonth" class="col-sm-1 col-form-label">Month</label>
        <div class="col-sm-11">
        <asp:DropDownList ID="ddlMonth" runat="server" class="form-control" name="leaveMonth">
            <asp:ListItem Text="January" Value="1"></asp:ListItem>
            <asp:ListItem Text="February" Value="2"></asp:ListItem>
            <asp:ListItem Text="March" Value="3"></asp:ListItem>
            <asp:ListItem Text="April" Value="4"></asp:ListItem>
            <asp:ListItem Text="May" Value="5"></asp:ListItem>
            <asp:ListItem Text="June" Value="6"></asp:ListItem>
            <asp:ListItem Text="July" Value="7"></asp:ListItem>
            <asp:ListItem Text="August" Value="8"></asp:ListItem>
            <asp:ListItem Text="September" Value="9"></asp:ListItem>
            <asp:ListItem Text="October" Value="10"></asp:ListItem>
            <asp:ListItem Text="November" Value="11"></asp:ListItem>
            <asp:ListItem Text="December" Value="12"></asp:ListItem>
        </asp:DropDownList>
            </div>
    </div>
    <div class="form-group row">
      <div class="col-sm-offset-1 col-sm-11">
           <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn btn-default" OnClick="btnExport_Click" />
      </div>
    </div>    
</asp:Content>
