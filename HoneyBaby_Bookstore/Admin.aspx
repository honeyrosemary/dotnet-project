<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Honeybaby_BookStore.Admin" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceholder" runat="server">
    <title>Admin Dashboard</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container-fluid">
        <h1 class="text-light mb-4">Admin Dashboard</h1>

        <!-- Tabs for Navigation -->
        <ul class="nav nav-tabs mb-4" id="adminTabs">
            <li class="nav-item">
                <a class="nav-link active" href="Admin.aspx">Genre Maintenance</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ProductList.aspx">Book List</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Bookmanage.aspx">Book Maintenance</a>
            </li>
        </ul>

        <!-- Toast container -->
        <div aria-live="polite" aria-atomic="true" style="position: absolute; top: 0; right: 0; padding: 1rem; z-index: 1050;">
            <div id="toastContainer" class="toast-container">
                <div id="generalToast" class="toast fade" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header">
                        <strong class="mr-auto">Notification</strong>
                        <small class="text-muted">just now</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div id="toastBody" class="toast-body"></div>
                </div>
            </div>
        </div>

        <!-- Genre Maintenance GridView and Form -->
        <div class="content-wrapper">
            <asp:GridView ID="grdGenre" runat="server"
                AutoGenerateColumns="False" DataKeyNames="GenreID"
                DataSourceID="SqlDataSource1"
                CssClass="table table-bordered table-condensed table-hover"
                OnPreRender="grdGenre_PreRender"
                OnRowDeleted="grdGenre_RowDeleted"
                OnRowUpdated="grdGenre_RowUpdated"
                OnRowDeleting="grdGenre_RowDeleting"
                AllowPaging="True" AllowSorting="True" ToolTip="Genre details for bookstore">
                <Columns>
                    <asp:BoundField DataField="GenreID" HeaderText="ID" ReadOnly="True">
                        <ItemStyle CssClass="col-xs-1" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ShortName" HeaderText="Short Name" SortExpression="ShortName">
                        <ItemStyle CssClass="col-xs-3" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LongName" HeaderText="Long Name" SortExpression="LongName">
                        <ItemStyle CssClass="col-xs-5" />
                    </asp:BoundField>
                    <asp:CommandField CausesValidation="False" ShowEditButton="True" ButtonType="Button">
                        <ControlStyle BackColor="Black" Font-Size="Smaller" ForeColor="White" />
                        <ItemStyle CssClass="col-xs-1 text-danger" />
                    </asp:CommandField>
                    <asp:CommandField CausesValidation="False" ShowDeleteButton="True" ButtonType="Button">
                        <ControlStyle BackColor="#FF1A1A" Font-Size="Smaller" ForeColor="White" />
                        <ItemStyle CssClass="col-xs-1" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle CssClass="bg-dark text-white" />
                <AlternatingRowStyle CssClass="altRow" BackColor="#1B8992" />
                <EditRowStyle CssClass="warning" HorizontalAlign="Center" VerticalAlign="Middle" />
                <RowStyle BackColor="#365C65" BorderColor="#333300" />
                <SelectedRowStyle BackColor="#66FFFF" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:BookstoreConnection %>"
                ConflictDetection="CompareAllValues"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT [GenreID], [ShortName], [LongName] FROM [Genre]"
                DeleteCommand="DELETE FROM [Genre] WHERE [GenreID] = @original_GenreID AND [ShortName] = @original_ShortName AND [LongName] = @original_LongName"
                InsertCommand="INSERT INTO [Genre] ([GenreID], [ShortName], [LongName]) VALUES (@GenreID, @ShortName, @LongName)"
                UpdateCommand="UPDATE [Genre] SET [ShortName] = @ShortName, [LongName] = @LongName WHERE [GenreID] = @original_GenreID AND [ShortName] = @original_ShortName AND [LongName] = @original_LongName">
                <DeleteParameters>
                    <asp:Parameter Name="original_GenreID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="original_ShortName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="original_LongName" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="GenreID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="original_GenreID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="original_ShortName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="original_LongName" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>

            <!-- Add New Genre Form -->
            <div class="add-genre-container shadow-box mt-4">
                <h2>Add New Genre</h2>
                <asp:TextBox ID="txtID" runat="server" MaxLength="10" CssClass="form-control mb-2" Placeholder="Enter Genre ID"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="txtID" CssClass="text-danger" ErrorMessage="ID is a required field"></asp:RequiredFieldValidator>
                
                <asp:TextBox ID="txtShortName" runat="server" MaxLength="15" CssClass="form-control mb-2" Placeholder="Enter Short Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvShortName" runat="server" ControlToValidate="txtShortName" CssClass="text-danger" ErrorMessage="Short Name is a required field"></asp:RequiredFieldValidator>
                
                <asp:TextBox ID="txtLongName" runat="server" MaxLength="50" CssClass="form-control mb-2" Placeholder="Enter Long Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLongName" runat="server" ControlToValidate="txtLongName" CssClass="text-danger" ErrorMessage="Long Name is a required field"></asp:RequiredFieldValidator>
                
                <asp:Button ID="btnAdd" runat="server" Text="Add New Genre" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
            </div>
        </div>
    </div>

    <!-- Script to trigger toasts -->
    <script type="text/javascript">
        function showToast(message, type) {
            var toastElement = document.getElementById('generalToast');
            var toastBody = document.getElementById('toastBody');
            toastBody.textContent = message;
            toastElement.className = `toast fade show ${type}`; // Apply type class
            setTimeout(function () {
                toastElement.classList.remove('show');
            }, 5000); // Hide after 5 seconds
        }

        // ASP.NET server-side methods can call this function
        function showToastFromServer(message, type) {
            showToast(message, type);
        }
    </script>
</asp:Content>
