using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace HoneyBaby_Bookstore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;

            if (!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName))
            {
                // cookie to store the user's first name
                HttpCookie firstNameCookie = new HttpCookie("FirstName", firstName);
                firstNameCookie.Expires = DateTime.Now.AddDays(1); // Cookie expires in 1 day
                Response.Cookies.Add(firstNameCookie);


                // Redirect to Order page
                Response.Redirect("~/Order");
            }
            else
            {
                 lblErrorMessage.Text = "Please enter both first name and last name.";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default");
        }
    }
}
