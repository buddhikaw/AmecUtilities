<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Amec.Utilities.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Welcome &nbsp;<asp:Literal ID="ltName" runat="server"></asp:Literal>  !!!</h2> 
        <p class="lead">AMEC Utilities to make your life a little bit easier .</p>        
    </div>

</asp:Content>
