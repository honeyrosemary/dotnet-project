<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Honeybaby_BookStore.ProductList" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
    <title>Book Maintenance</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container-fluid">
        <h1 class="text-light mb-4">Admin Dashboard</h1>

        <!-- Tabs for Navigation -->
        <ul class="nav nav-tabs mb-4" id="adminTabs">
            <li class="nav-item">
                <a class="nav-link" href="Admin.aspx">Genre Maintenance</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="ProductList.aspx">Book List</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Bookmanage.aspx">Book Maintenance</a>
            </li>
        </ul>

        <!-- Book Maintenance GridView -->
        <asp:GridView ID="grdBooks" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="BookID" 
            DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="8" 
            AllowSorting="True" OnPreRender="grdBooks_PreRender"
            CssClass="table table-bordered table-striped table-condensed" ToolTip="Book List Table">
            <AlternatingRowStyle BackColor="#18526D" />
            <Columns>
                <asp:BoundField DataField="BookID" HeaderText="ID" 
                    ReadOnly="True" SortExpression="BookID">
                    <ItemStyle CssClass="col-xs-1" />
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title" 
                    SortExpression="Title">
                    <ItemStyle CssClass="col-xs-4" />
                </asp:BoundField>
                <asp:BoundField DataField="ShortDescription" HeaderText="Short Description" 
                    SortExpression="ShortDescription">
                    <ItemStyle CssClass="col-xs-4" />
                </asp:BoundField>
                <asp:BoundField DataField="LongDescription" HeaderText="Long Description" 
                    SortExpression="LongDescription">
                    <ItemStyle CssClass="col-xs-4" />
                </asp:BoundField>
                <asp:BoundField DataField="GenreName" HeaderText="Genre" 
                    SortExpression="Genre">
                    <ItemStyle CssClass="col-xs-2" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" 
                    DataFormatString="{0:c}">
                    <ItemStyle CssClass="col-xs-2 text-right" />
                    <ControlStyle ForeColor="#009900" />
                    <HeaderStyle CssClass="text-right" />
                </asp:BoundField>
                <asp:BoundField DataField="OnHand" HeaderText="On Hand">
                    <ItemStyle CssClass="col-xs-2 text-right" />
                    <HeaderStyle CssClass="text-right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle ForeColor="#006600" />
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagerStyle" BackColor="#8C8C8C" HorizontalAlign="Center" />
            <RowStyle BackColor="#29819A" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BookstoreConnection %>" 
           SelectCommand="SELECT b.[BookID], b.[Title], b.[ShortDescription], b.[LongDescription], 
                g.[LongName] AS GenreName, b.[UnitPrice], b.[OnHand] 
                FROM [Books] b
                INNER JOIN [Genre] g ON b.[GenreID] = g.[GenreID]">
            </asp:SqlDataSource>
    </div>
</asp:Content>
