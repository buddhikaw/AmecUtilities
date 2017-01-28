<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AppStatus.aspx.cs" Inherits="Amec.Utilities.AppStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <div class="col-sm-12 alert alert-danger">
      <%: Request.QueryString["status"] %>   
    </div>
</asp:Content>
