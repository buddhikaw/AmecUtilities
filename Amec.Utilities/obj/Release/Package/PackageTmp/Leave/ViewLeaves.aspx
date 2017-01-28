<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewLeaves.aspx.cs" Inherits="Amec.Utilities.Leave.ViewLeaves" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">    
    <script type="text/javascript">
        $(document).ready(function () {
            $('#gdVwLeave').DataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="alert alert-info" style="padding-top:1%">
     <span>Your Submitted Leaves</span>
    </div>
    <div style="padding-top:1%">
        <asp:GridView ID="gdVwLeave" runat="server" CssClass="table table-striped table-bordered" Width="100%" ClientIDMode="Static" AutoGenerateColumns="true" OnPreRender="gdVwLeave_PreRender"></asp:GridView>
    </div>
</asp:Content>

