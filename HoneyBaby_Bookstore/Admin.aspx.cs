using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Honeybaby_BookStore
{
    public partial class Admin: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any additional logic for Page_Load can be added here
        }

        protected void grdGenre_PreRender(object sender, EventArgs e)
        {
            grdGenre.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["GenreID"].DefaultValue = txtID.Text;
                parameters["ShortName"].DefaultValue = txtShortName.Text;
                parameters["LongName"].DefaultValue = txtLongName.Text;

                try
                {
                    SqlDataSource1.Insert();
                    txtID.Text = "";
                    txtShortName.Text = "";
                    txtLongName.Text = "";
                    ShowToast("Genre added successfully.", "toast-success");
                }
                catch (Exception ex)
                {
                    ShowToast(DatabaseErrorMessage(ex.Message), "toast-danger");
                }
            }
        }

        protected void grdGenre_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowToast(DatabaseErrorMessage(e.Exception.Message), "toast-danger");
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                ShowToast(ConcurrencyErrorMessage(), "toast-warning");
            }
            else
            {
                ShowToast("Genre updated successfully.", "toast-success");
            }
        }

        protected void grdGenre_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowToast(DatabaseErrorMessage(e.Exception.Message), "toast-danger");
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                ShowToast(ConcurrencyErrorMessage(), "toast-warning");
            }
            else
            {
                ShowToast("Genre deleted successfully.", "toast-success");
            }
        }

        protected void grdGenre_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Custom logic before deletion (if any)
            }
            catch (SqlException ex) when (ex.Number == 547) // Foreign key constraint violation
            {
                ShowToast("Cannot delete this genre as it is referenced by one or more books.", "toast-danger");
                e.Cancel = true;
            }
            catch (Exception ex)
            {
                ShowToast(DatabaseErrorMessage(ex.Message), "toast-danger");
                e.Cancel = true;
            }
        }

        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that genre. Please try again.";
        }

        private string DatabaseErrorMessage(string errorMessage)
        {
            // Custom error messages for user-friendly display
            if (errorMessage.Contains("REFERENCE constraint"))
            {
                return "Cannot delete this genre as it is mapped to one or more books.";
            }
            return "A database error has occurred. Please try again later.";
        }

        private void ShowToast(string message, string toastType)
        {
            // Register a script to show the toast message
            string script = $"showToastFromServer('{message}', '{toastType}');";
            ClientScript.RegisterStartupScript(this.GetType(), "ShowToast", script, true);
        }
    }
}
