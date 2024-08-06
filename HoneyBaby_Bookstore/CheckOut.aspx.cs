using HoneyBaby_Bookstore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HoneyBaby_Bookstore
{
    public partial class CheckOut : System.Web.UI.Page
    {
        private Customer customer;
        protected TextBox ddlDob;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                customer = (Customer)Session["Customer"];
                this.LoadCustomerData();
               
            }
        }
       

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (txtEmail1.Text != txtEmail2.Text)
                {
                    lblMessage.Text = "Email and confirm email do not match.";
                    return;
                }

                this.GetCustomerData();
                Response.Redirect("~/Confirmation");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            Session.Remove("Customer");
            Response.Redirect("~/Order");
        }
        private void LoadCustomerData()
        {
            if (customer != null)
            {
                ddlFirstName.Text = customer.FirstName;
                ddlLastName.Text = customer.LastName;
                txtEmail1.Text = customer.EmailAddress;
                ddlPhone.Text = customer.Phone;
                ddlAddress.Text = customer.Address;
                ddlCity.Text = customer.City;
                ddlZip.Text = customer.Zip;
                ddlProvince.SelectedValue = customer.Province;
                rblContactVia.SelectedValue = customer.ContactVia;
                cblAboutList.Items[0].Selected = customer.NewProductsInfo;
                cblAboutList.Items[1].Selected = customer.SpecialPromosInfo;
                cblAboutList.Items[2].Selected = customer.NewRevisionsInfo;
                cblAboutList.Items[3].Selected = customer.LocalEventsInfo;
            }
        }
        private void GetCustomerData()
        {
            if (customer == null) customer = new Customer();
            customer.FirstName = ddlFirstName.Text;
            customer.LastName = ddlLastName.Text;
            customer.EmailAddress = txtEmail1.Text;
            customer.Phone = ddlPhone.Text;
            customer.Address = ddlAddress.Text;
            customer.City = ddlCity.Text;
            customer.Zip = ddlZip.Text;
            customer.Province = ddlProvince.SelectedValue;
            customer.ContactVia = rblContactVia.SelectedValue;
            customer.NewProductsInfo = cblAboutList.Items[0].Selected;
            customer.SpecialPromosInfo = cblAboutList.Items[1].Selected;
            customer.NewRevisionsInfo = cblAboutList.Items[2].Selected;
            customer.LocalEventsInfo = cblAboutList.Items[3].Selected;
            
            Session["Customer"] = customer;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}