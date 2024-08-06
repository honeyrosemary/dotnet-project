<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="HoneyBaby_Bookstore.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Store: Confirmation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap Darkly theme CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/darkly/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" class="formConfirm" runat="server">
        <div>
            <div class="containerProductTitle">
                <h1 class="text-center">Order Confirmation</h1>
                <div class="shadow-box p-5">
                    <div class="form-group">
                        <asp:TextBox ID="txtBookDetails" runat="server" TextMode="MultiLine" CssClass="form-control" Columns="50" Rows="25" BackColor="Black" ForeColor="White" Height="480px"></asp:TextBox>
                    </div>
                   <div class="col-lg-12">
                        <br />
                        <asp:Label ID="lblthanku" runat="server" CssClass="h4 text-right" Font-Size="Large" ForeColor="White">Thank You For shopping withus!!!</asp:Label>
                        <br />
                        <br />
                    </div>
                    <div class="form-group text-center">
                        <asp:Button ID="btnContinueShopping" runat="server" CssClass="btn btn-primary" PostBackUrl="~/Order.aspx" Text="Continue Shopping" Height="66px" Width="215px" BackColor="#104347" BorderStyle="Solid" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JavaScript -->
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
