<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="HoneyBaby_Bookstore.CheckOut" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="containerProductTitle">
        <h1>Checkout</h1>
    </div>
    <div class="w-100 checkbox">
        <div class="form-horizontal">
            <h3 class="text-light">Contact Information</h3>
            
            <div class="form-group">
                <label class="control-label col-sm-3 text-light">Email Address:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" ErrorMessage="Email field is required" CssClass="text-danger" ControlToValidate="txtEmail1"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-light">Email Re-entry:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" ErrorMessage="Email field is required" CssClass="text-danger" ControlToValidate="txtEmail2"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-light">First Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="ddlFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First name is required" CssClass="text-danger" ControlToValidate="ddlFirstName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-light">Last Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="ddlLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last name is required" CssClass="text-danger" ControlToValidate="ddlLastName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-light">Date of Birth:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="ddlDob" runat="server" CssClass="form-control" placeholder="MM/DD/YYYY"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-light">Phone Number:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="ddlPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ErrorMessage="Phone number is required." CssClass="text-danger" ControlToValidate="ddlPhone"></asp:RequiredFieldValidator>
                </div>
            </div>

            <h3 class="text-light">Billing Address</h3>

            <div class="form-group">
                <label class="control-label col-sm-3 text-light">Address:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="ddlAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" ErrorMessage="Street Address is required" CssClass="text-danger" ControlToValidate="ddlAddress"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-light">City:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="ddlCity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is required" CssClass="text-danger" ControlToValidate="ddlCity"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-light">Province:</label>
                <div class="col-sm-5">
                    <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="ProvinceName" DataValueField="ProvinceCode">
                        <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookstoreConnection %>" SelectCommand="SELECT [ProvinceCode], [ProvinceName] FROM [Provinces] ORDER BY [ProvinceCode]"></asp:SqlDataSource>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvProvince" runat="server" ErrorMessage="Province is required" CssClass="text-danger" ControlToValidate="ddlProvince"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 text-light">Zip code:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="ddlZip" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="Zip is required" CssClass="text-danger" ControlToValidate="ddlZip"></asp:RequiredFieldValidator>
                </div>
            </div>

            <h3 class="text-light">Optional Data</h3>

            <div class="form-group">
                <div class="col-sm-12 optional">
                    <label class="text-light">Please let me know about:</label>
                    <asp:CheckBoxList ID="cblAboutList" runat="server" RepeatColumns="2">
                        <asp:ListItem Value="New" Selected="True">New products</asp:ListItem>
                        <asp:ListItem Value="Special">Special offers</asp:ListItem>
                        <asp:ListItem Value="Revisions">New editions</asp:ListItem>
                        <asp:ListItem Value="Local">Local events</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12">
                    <label class="text-light">Please contact me via:</label>
                    <asp:RadioButtonList id="rblContactVia" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Twitter</asp:ListItem>
                        <asp:ListItem>Facebook</asp:ListItem>
                        <asp:ListItem Value="Text">Text message</asp:ListItem>
                        <asp:ListItem>Email</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>

            <div class="form-group d-flex justify-content-end">
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn btn-primary mx-2" OnClick="btnCheckOut_Click" Height="50px" Width="190px" BackColor="#1A3839" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary mx-2" OnClick="btnCancel_Click" CausesValidation="False" Height="50px" Width="170px" BackColor="Black" />
                <asp:LinkButton ID="lbtnContinueShopping" runat="server" CssClass="btn btn-secondary mx-2" PostBackUrl="~/Order.aspx" CausesValidation="False" Height="50px" BackColor="#007777">Continue Shopping</asp:LinkButton>       
            </div>
        </div>
    </div>
</asp:Content>

