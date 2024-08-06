using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Honeybaby_BookStore
{
    public partial class Site : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie firstNameCookie = Request.Cookies["FirstName"];
                if (firstNameCookie != null)
                {
                    loginNavItem.Visible = false;
                }
                else
                {
                    loginNavItem.Visible = true;
                }
            }

        }
    }
}
