using System;
using System.Web.UI;

namespace Honeybaby_BookStore
{
    public partial class ProductList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Code to run only on the initial page load
            }
        }

        protected void grdBooks_PreRender(object sender, EventArgs e)
        {
            
        }

        
    }
}
