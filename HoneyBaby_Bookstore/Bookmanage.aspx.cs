using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI;

namespace Honeybaby_BookStore
{
    public partial class Bookmanage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
            lblsuccess.Text = "";
        }

        protected void grdProducts_PreRender(object sender, EventArgs e)
        {
            grdProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void dvProduct_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
            {
                grdProducts.DataBind();
                lblsuccess.Text = "Book updated successfully!";
            }
               
        }

        protected void dvProduct_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
            {
                lblsuccess.Text = "Book deleted successfully!";
                grdProducts.DataBind();
            }
        }

        protected void dvProduct_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
            else
            {
                lblsuccess.Text = "New book added successfully!";
                grdProducts.DataBind();
            }
        }

        protected void dvProduct_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
        {
            if (e.Values["UnitPrice"] != null)
                e.Values["UnitPrice"] =
                    e.Values["UnitPrice"].ToString().Substring(1);
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that Genre. Please try again";
        }
    }
}
