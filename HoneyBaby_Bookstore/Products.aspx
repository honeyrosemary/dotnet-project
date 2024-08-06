<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="HoneyBaby_Bookstore.Products" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="books">
        <h1 class="text-light mb-4">Our Books</h1>
        <div class="row">
            <asp:Repeater ID="RepeaterBooks" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card bg-dark text-light h-100">
                            <a href='<%# "~/Order/" + Eval("BookID") %>'>
                                <img class="card-img-top fixed-image-size" src='<%# ResolveUrl("~/Images/Books/" + Eval("ImageFile")) %>' alt='<%# Eval("Title") %>' />
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Title") %></h5>
                                <p class="card-text"><%# Eval("LongDescription") %></p>
                                <p class="card-text"><b>Price: <%# Eval("UnitPrice", "{0:c}") %></b></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource 
                ID="SqlDataSource1" 
                runat="server" 
                ConnectionString='<%$ ConnectionStrings:BookstoreConnection %>' 
                SelectCommand="SELECT [BookID], [Title], [LongDescription], [UnitPrice], [ImageFile] FROM [Books] ORDER BY [Title]">
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
