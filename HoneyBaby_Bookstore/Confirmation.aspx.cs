using HoneyBaby_Bookstore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace HoneyBaby_Bookstore
{
    public partial class Confirmation : System.Web.UI.Page
    {
        private CartItemList cart;
        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CartItemList.GetCart();
            cart.Clear();
            var customer = (Customer)Session["Customer"];

            string message =
                "Contact information:\n" +
                "    Email: " + customer.EmailAddress + "\n" +
                "    First name: " + customer.FirstName + "\n" +
                "    Last name: " + customer.LastName + "\n" +
                "    Phone number: " + customer.Phone + "\n\n" +
                "Billing address:\n" +
                "    Address: " + customer.Address + "\n" +
                "    City: " + customer.City + "\n" +
                "    Province: " + customer.Province + "\n" +
                "    Zip code: " + customer.Zip + "\n" +
                 "\n";
                txtBookDetails.Text = message;


        }
    }
}