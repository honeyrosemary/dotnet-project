<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="HoneyBaby_Bookstore.Cart" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="containerProductTitle">
        <h1>Your Shopping Cart</h1>
    </div>
    <div class="shadow-box w-100">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Item" OnClick="btnRemove_Click" CssClass="btn btn-danger btn-block" Height="40px" Width="120px" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" OnClick="btnEmpty_Click" CssClass="btn btn-warning btn-block" BackColor="#0033CC" Height="40px" Width="120px" BorderColor="#000099" />
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-lg-12">
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-danger"></asp:Label>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-lg-12">
                <asp:Label ID="lblTotal" runat="server" CssClass="h4 text-right" BackColor="#2A2A2A" Font-Size="Large" ForeColor="White"></asp:Label>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-lg-12 text-center">
                <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/Order.aspx" Text="Continue Shopping" CssClass="btn btn-primary mx-2" Height="50px" />
                <asp:Button ID="btnCheckOut" runat="server" Text="Place Order" OnClick="btnCheckOut_Click" CssClass="btn btn-success mx-2" BackColor="#006666" Height="50px" />
            </div>
        </div>
    </div>
</asp:Content>
