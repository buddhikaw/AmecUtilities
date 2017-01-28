<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Amec.Utilities.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <asp:PlaceHolder runat="server">
        <%: Styles.Render("~/Content/css") %>        
    </asp:PlaceHolder>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
    <script src="http://multidatespickr.sourceforge.net/jquery-ui.multidatespicker.js"></script>
    <link href="http://code.jquery.com/ui/1.12.1/themes/pepper-grinder/jquery-ui.css" rel="stylesheet">
</head>
<body>
    <form runat="server">
        <div class="container body-content">
            <div class="form-group row">
                <div class="col-sm-12 alert alert-info">
                Hi.. Untill we host in Corporate domain, Please provide your NT ID
                </div>
            </div>
            <div class="form-group row">
                <label for="UserName" class="col-md-2 col-form-label">User Name</label>
                <div class="col-sm-10">
                   <asp:TextBox ID="tbUserName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-2">
                    &nbsp;
                </div>
                <div class="col-sm-10">
                    <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
