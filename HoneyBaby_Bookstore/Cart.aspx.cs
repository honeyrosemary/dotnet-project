using System;
using System.Collections.Generic;
using System.Linq;
using HoneyBaby_Bookstore.Models;

namespace HoneyBaby_Bookstore
{
    public partial class Cart : System.Web.UI.Page
    {
        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CartItemList.GetCart();
            if (!IsPostBack)
                this.DisplayCart();
        }

        private void DisplayCart()
        {
            lstCart.Items.Clear();
            CartItem item;
            decimal total = 0;

            for (int i = 0; i < cart.Count; i++)
            {
                item = cart[i];
                lstCart.Items.Add(item.Display());
                total += item.TotalPrice;
            }

            lblTotal.Text = "Total: $" + total.ToString("0.00");
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                    lblMessage.Text = "Please select the item you want to remove.";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
                lblTotal.Text = "Total: $0.00";
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                Response.Redirect("~/CheckOut");
            }
            else
            {
                lblMessage.Text = "Please add at least one item to the cart before checking out.";
            }
        }
    }
}
