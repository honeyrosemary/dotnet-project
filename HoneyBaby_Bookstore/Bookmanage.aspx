<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bookmanage.aspx.cs" Inherits="Honeybaby_BookStore.Bookmanage" MasterPageFile="~/Site.master" %>
<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceholder" runat="server">
    <title>Books Management</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="container-fluid">
        <h1 class="text-light mb-4">Books Management</h1>

        <!-- Tabs for Navigation -->
        <ul class="nav nav-tabs mb-4" id="adminTabs">
            <li class="nav-item">
                <a class="nav-link" href="Admin.aspx">Genre Maintenance</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ProductList.aspx">Books List</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="Bookmanage.aspx">Books Maintenance</a>
            </li>
        </ul>
        <asp:Label ID="lblsuccess" runat="server" 
                    EnableViewState="false" CssClass="text-success"></asp:Label>
        <div class="row">
            <div class="col-md-6">
                <asp:GridView ID="grdProducts" runat="server" SelectedIndex="0"
                    AutoGenerateColumns="False" DataKeyNames="BookID" 
                    DataSourceID="SqlDataSource1" AllowPaging="True" 
                    CssClass="table table-bordered table-striped table-condensed" 
                    OnPreRender="grdProducts_PreRender" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="BookID" HeaderText="ID" 
                            ReadOnly="True">
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Title" HeaderText="Title">
                            <ItemStyle CssClass="col-xs-6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GenreID" HeaderText="Genre"> 
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="true"> 
                            <ControlStyle BackColor="#007927" />
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle CssClass="pagerStyle" 
                        BackColor="#8c8c8c" HorizontalAlign="Center" />
                    <SelectedRowStyle CssClass="warning" BackColor="#1F6269" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BookstoreConnection %>" 
                    SelectCommand="SELECT [BookID], [Title], [GenreID], 
                        [UnitPrice], [OnHand] FROM [Books] ORDER BY [Title]">
                </asp:SqlDataSource>    
            </div>  

            <div class="col-sm-6">
                <asp:DetailsView ID="dvProduct" runat="server" 
                    DataSourceID="SqlDataSource2" DataKeyNames="BookID" 
                    AutoGenerateRows="False"  
                    CssClass="table table-bordered table-condensed" 
                    OnItemDeleted="dvProduct_ItemDeleted" 
                    OnItemDeleting="dvProduct_ItemDeleting" 
                    OnItemInserted="dvProduct_ItemInserted" 
                    OnItemUpdated="dvProduct_ItemUpdated">
                    <EditRowStyle BackColor="Black" />
                    <EmptyDataRowStyle BackColor="Black" />
                    <FieldHeaderStyle BackColor="#276583" />
                    <Fields>
                        <asp:TemplateField HeaderText="BookID">
                            <EditItemTemplate>
                                <asp:Label runat="server" ID="lblProductID"
                                    Text='<%# Eval("BookID") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtProductID" 
                                        Text='<%# Bind("BookID") %>' MaxLength="10" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvProductID" runat="server" 
                                    ControlToValidate="txtProductID" CssClass="text-danger"
                                    ErrorMessage="BookID is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblProductID" 
                                    Text='<%# Bind("BookID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-4" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtName"
                                        Text='<%# Bind("Title") %>' MaxLength="50" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                    ControlToValidate="txtName" CssClass="text-danger"
                                    ErrorMessage="Title is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtName" 
                                        Text='<%# Bind("Title") %>' MaxLength="50" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                    ControlToValidate="txtName" CssClass="text-danger"
                                    ErrorMessage="Title is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblName"
                                    Text='<%# Bind("Title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Short Description">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtShortDesc" 
                                        Text='<%# Bind("ShortDescription") %>' MaxLength="250"
                                        TextMode="MultiLine" Rows="4"   
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvShortDesc" runat="server" 
                                    ControlToValidate="txtShortDesc" CssClass="text-danger"
                                    ErrorMessage="Short Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtShortDesc" 
                                        Text='<%# Bind("ShortDescription") %>' MaxLength="250"
                                        TextMode="MultiLine" Rows="4"  
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvShortDesc" runat="server" 
                                    ControlToValidate="txtShortDesc" CssClass="text-danger"
                                    ErrorMessage="Short Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblShortDesc" 
                                    Text='<%# Bind("ShortDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Long Description">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtLongDesc" 
                                        Text='<%# Bind("LongDescription") %>' MaxLength="2000"
                                        TextMode="MultiLine" Rows="4" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvLongDesc" runat="server" 
                                    ControlToValidate="txtLongDesc" CssClass="text-danger"
                                    ErrorMessage="Long Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtLongDesc" 
                                        Text='<%# Bind("LongDescription") %>' MaxLength="2000"
                                        TextMode="MultiLine" Rows="4" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvLongDesc" runat="server" 
                                    ControlToValidate="txtLongDesc" CssClass="text-danger"
                                    ErrorMessage="Long Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblLongDesc" 
                                    Text='<%# Bind("LongDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Genre">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:DropDownList runat="server" ID="ddlCategory" 
                                        DataSourceID="SqlDataSource3" 
                                        DataTextField="LongName" DataValueField="GenreID" 
                                        SelectedValue='<%# Bind("GenreID") %>'
                                        CssClass="form-control"></asp:DropDownList>
                                </div>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:DropDownList runat="server" ID="ddlCategory" 
                                        DataSourceID="SqlDataSource3" 
                                        DataTextField="LongName" DataValueField="GenreID" 
                                        SelectedValue='<%# Bind("GenreID") %>'
                                        CssClass="form-control"></asp:DropDownList>
                                </div>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblCategory" 
                                    Text='<%# Bind("GenreID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ImageFile">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtImageFile" 
                                        Text='<%# Bind("ImageFile") %>' MaxLength="30" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtImageFile" 
                                        Text='<%# Bind("ImageFile") %>' MaxLength="30" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblImageFile" 
                                    Text='<%# Bind("ImageFile") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Unit Price">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtUnitPrice" 
                                        Text='<%# Bind("UnitPrice") %>'  
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvUnitPrice" runat="server" 
                                    ControlToValidate="txtUnitPrice" CssClass="text-danger"
                                    ErrorMessage="Unit Price is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvUnitPrice" runat="server" 
                                    ControlToValidate="txtUnitPrice" Type="Double" Operator="GreaterThan" 
                                    ErrorMessage="Unit Price must be a decimal value greater than 0." Text="*" 
                                    CssClass="text-danger" ValueToCompare="0.00"></asp:CompareValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtUnitPrice" 
                                        Text='<%# Bind("UnitPrice") %>'  
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvUnitPrice" runat="server" 
                                    ControlToValidate="txtUnitPrice" CssClass="text-danger"
                                    ErrorMessage="Unit Price is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvUnitPrice" runat="server" 
                                    ControlToValidate="txtUnitPrice" CssClass="text-danger"
                                    Type="Currency" Operator="DataTypeCheck" 
                                    ErrorMessage="Unit Price must be numeric." Text="*">
                                </asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblUnitPrice" 
                                    Text='<%# Bind("UnitPrice", "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="On Hand">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtOnHand" 
                                        Text='<%# Bind("OnHand") %>' 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvOnHand" runat="server" 
                                    ControlToValidate="txtOnHand" CssClass="text-danger"
                                    ErrorMessage="On Hand is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvOnHand" runat="server" 
                                    ControlToValidate="txtOnHand" CssClass="text-danger"
                                    Type="Integer" Operator="DataTypeCheck" 
                                    ErrorMessage="On Hand must be numeric." Text="*">
                                </asp:CompareValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtOnHand" 
                                        Text='<%# Bind("OnHand") %>'  
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvOnHand" runat="server" 
                                    ControlToValidate="txtOnHand" CssClass="text-danger"
                                    ErrorMessage="On Hand is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvOnHand" runat="server" 
                                    ControlToValidate="txtOnHand" CssClass="text-danger"
                                    Type="Integer" Operator="DataTypeCheck" 
                                    ErrorMessage="On Hand must be numeric." Text="*">
                                </asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblOnHand"
                                    Text='<%# Bind("OnHand") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" 
                            ShowDeleteButton="true" 
                            ShowEditButton="true" 
                            ShowInsertButton="true" >
                        <ControlStyle BackColor="Black" ForeColor="White" />
                        </asp:CommandField>
                    </Fields>
                    <InsertRowStyle BackColor="Black" />
                    <RowStyle BackColor="Black" />
                    <CommandRowStyle BackColor="#8c8c8c" ForeColor="white" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:BookstoreConnection %>"
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [BookID], [Title], [ShortDescription], 
                            [LongDescription], [GenreID], [ImageFile], 
                            [UnitPrice], [OnHand] 
                        FROM [Books] 
                        WHERE ([BookID] = @BookID)" 
                    DeleteCommand="DELETE FROM [Books] 
                        WHERE [BookID] =@original_BookID
                          AND [Title] =@original_Title 
                          AND [ShortDescription] = @original_ShortDescription 
                          AND [LongDescription] = @original_LongDescription 
                          AND [GenreID] =@original_GenreID 
                          AND (([ImageFile] = @original_ImageFile) 
                           OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL))
                          AND [UnitPrice] = @original_UnitPrice 
                          AND [OnHand] = @original_OnHand" 
                    InsertCommand="INSERT INTO [Books] ([BookID], [Title], 
                          [ShortDescription], [LongDescription], [GenreID], 
                          [ImageFile], [UnitPrice], [OnHand]) 
                        VALUES (@BookID, @Title, @ShortDescription, 
                          @LongDescription, @GenreID, @ImageFile,  
                          @UnitPrice, @OnHand)" 
                    UpdateCommand="UPDATE [Books] SET [Title] = @Title, 
                          [ShortDescription] = @ShortDescription, 
                          [LongDescription] = @LongDescription, 
                          [GenreID] = @GenreID, 
                          [ImageFile] = @ImageFile, 
                          [UnitPrice] = @UnitPrice, 
                          [OnHand] = @OnHand 
                        WHERE [BookID] =@original_BookID
                          AND [Title] =@original_Title 
                          AND [ShortDescription] = @original_ShortDescription 
                          AND [LongDescription] = @original_LongDescription
                          AND [GenreID] =@original_GenreID 
                          AND (([ImageFile] = @original_ImageFile) 
                           OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL))
                          AND [UnitPrice] = @original_UnitPrice 
                          AND [OnHand] = @original_OnHand">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdProducts" Name="BookID" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_BookID" Type="String" />
                        <asp:Parameter Name="original_Title" Type="String" />
                        <asp:Parameter Name="original_ShortDescription" Type="String" />
                        <asp:Parameter Name="original_LongDescription" Type="String" />
                        <asp:Parameter Name="original_GenreID" Type="String" />
                        <asp:Parameter Name="original_ImageFile" Type="String" />
                        <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="original_OnHand" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="ShortDescription" Type="String" />
                        <asp:Parameter Name="LongDescription" Type="String" />
                        <asp:Parameter Name="GenreID" Type="String" />    
                        <asp:Parameter Name="ImageFile" Type="String" />
                        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="OnHand" Type="Int32" />
                        <asp:Parameter Name="original_BookID" Type="String" />
                        <asp:Parameter Name="original_Title" Type="String" />
                        <asp:Parameter Name="original_ShortDescription" Type="String" />
                        <asp:Parameter Name="original_LongDescription" Type="String" />
                        <asp:Parameter Name="original_GenreID" Type="String" />
                        <asp:Parameter Name="original_ImageFile" Type="String" />
                        <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="original_OnHand" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="BookID" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="ShortDescription" Type="String" />
                        <asp:Parameter Name="LongDescription" Type="String" />
                        <asp:Parameter Name="GenreID" Type="String" />
                        <asp:Parameter Name="ImageFile" Type="String" />
                        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="OnHand" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>  
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString='<%$ ConnectionStrings:BookstoreConnection %>' 
                    SelectCommand="SELECT [GenreID], [LongName] 
                        FROM [Genre] ORDER BY [LongName]">
                </asp:SqlDataSource> 

                <p><asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        CssClass="text-danger" />
                <p><asp:Label ID="lblError" runat="server" 
                    EnableViewState="false" CssClass="text-danger"></asp:Label></p>
     </div>
        </div>
    </div>
</asp:Content>