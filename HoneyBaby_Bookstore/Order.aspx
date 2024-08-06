<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="HoneyBaby_Bookstore.Order" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="containerProductTitle">
        <h1>Order Books</h1>
    </div>
    <div class="shadow-box w-100">
        <div class="form-group">
            <h4><asp:Label ID="lblWelcomeMessage" runat="server" CssClass="welcome-msg text-light" /></h4>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="form-group darkly-dropdown">
                    <label class="text-light">Please select a Book:</label>
                    <asp:DropDownList ID="ddlBooks" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                        DataTextField="Title" DataValueField="BookID" CssClass="form-control" OnSelectedIndexChanged="ddlBooks_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource 
                        ID="SqlDataSource1" 
                        runat="server" 
                        ConnectionString='<%$ ConnectionStrings:BookstoreConnection %>' 
                        SelectCommand="SELECT [BookID], [Title], [ShortDescription], [LongDescription], [ImageFile], [UnitPrice] 
                                       FROM [Books] 
                                       ORDER BY [Title]">
                    </asp:SqlDataSource>

                </div>
                <div class="form-group">
                    <h4><asp:Label ID="lblName" runat="server" CssClass="text-light" Font-Bold="True" Font-Size="X-Large" ForeColor="White"></asp:Label></h4>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblShortDescription" runat="server" CssClass="text-light"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblLongDescription" runat="server" CssClass="text-light"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblUnitPrice" runat="server" CssClass="text-light"></asp:Label>
                </div>
                    
            </div>
            <div class="col-lg-4">
                <asp:Image ID="imgBook" runat="server" CssClass="img-fluid fixed-image-size"  ToolTip='<%# Eval("ShortDescription") %>' Height="359px" Width="260px" />
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-lg-12">
                <div class="form-group row">
                    <label class="col-sm-1 col-form-label text-light">Quantity:&nbsp;&nbsp; </label>
                    &nbsp;<div class="col-sm-2">
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" BackColor="#383838" Width="100px" ForeColor="White"></asp:TextBox>
                    </div>
                    <div class="col-sm-9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Quantity is a required field." CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Please input a valid quantity that falls within the range of 1 to 500" MaximumValue="500" MinimumValue="1" Type="Integer" CssClass="text-danger"></asp:RangeValidator>
                    </div>
                </div>
                <div class="form-group d-flex justify-content-end">
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" OnClick="btnAdd_Click" CssClass="btn btn-primary mx-2" Height="50px" Width="190px" />
                    <asp:Button ID="btnCart" runat="server" Text="Go to Cart" PostBackUrl="~/Cart" CausesValidation="False" CssClass="btn btn-secondary mx-2" BackColor="#006666" Height="50px" Width="170px" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
