using System;
using System.Data;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using HoneyBaby_Bookstore.Models;
using Microsoft.AspNet.FriendlyUrls;

namespace HoneyBaby_Bookstore
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                ddlBooks.DataBind();

                string id = "";
                var segments = Request.GetFriendlyUrlSegments();
                if (segments.Count > 0) id = segments[0];

                if (!string.IsNullOrEmpty(id))
                    ShowSelectedBook(id);
                else
                    DisplayDefaultBook();
                if (Request.Cookies["FirstName"] != null)
                {
                    string firstName = Request.Cookies["FirstName"].Value;
                    lblWelcomeMessage.Text = "<h4>Welcome back, " + firstName + "!</h4>";
                }
            }
           
        }

        protected void ddlBooks_SelectedIndexChanged(object sender, EventArgs e)
        {
            Reload();
        }

        private void Reload()
        {
            var id = ddlBooks.SelectedValue;
            var url = FriendlyUrl.Href("~/Order", id);
            Response.Redirect(url);
        }

        private void DisplayDefaultBook()
        {
            if (ddlBooks.Items.Count > 0)
            {
                string defaultBookId = ddlBooks.Items[0].Value;
                ShowSelectedBook(defaultBookId);
            }
        }

        private void ShowSelectedBook(string id)
        {
            var book = GetSelectedBook(id);
            lblName.Text = book.Title;
            lblShortDescription.Text = book.ShortDescription;
            lblLongDescription.Text = book.LongDescription;
            lblUnitPrice.Text = book.UnitPrice.ToString("C", CultureInfo.CreateSpecificCulture("en-US")) + " each";
            imgBook.ImageUrl = "Images/Books/" + book.ImageFile;
            ddlBooks.SelectedValue = book.BookID;
        }

        private Book GetSelectedBook(string id)
        {
            DataView booksTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            booksTable.RowFilter = $"BookID = '{id}'";
            DataRowView row = booksTable[0];

            Book book = new Book
            {
                BookID = row["BookID"].ToString(),
                Title = row["Title"].ToString(),
                ShortDescription = row["ShortDescription"].ToString(),
                LongDescription = row["LongDescription"].ToString(),
                UnitPrice = (decimal)row["UnitPrice"],
                ImageFile = row["ImageFile"].ToString()
            };

            return book;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var book = GetSelectedBook(ddlBooks.SelectedValue);
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[book.BookID];

                if (cartItem == null)
                {
                    cart.AddItem(book, Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                }

                Response.Redirect("~/Cart");
            }
        }
    }
}
