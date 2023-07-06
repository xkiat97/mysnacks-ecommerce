using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminAddCategory : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //get the quere value from url
            bool success = Request.QueryString["success"] == "true" ? true : false;

            //if success, then prompt a message
            if (success && !Page.IsPostBack)
            {
                lblSuccess.Text = "<div class='alert alert-success'>Register Successfully.</div>";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (db.Categories.Any(x => x.name.ToLower() == txtCateName.Value.ToLower()))
                {
                    errname.Text = "<div class='alert alert-danger col-sm-12'>Category name has been used. </div>";
                }
                else
                {
                    //set the user who register this account
                    int registedUserId = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId; ;

                    // create object to store all the user information
                    Category c = new Category
                    {
                        name = txtCateName.Value,
                        description = txtDesc.Value,
                        status = 'T',
                        //set the modified time & date
                        modifiedTime = DateTime.Now.TimeOfDay,
                        modifiedDate = DateTime.Now,
                        modifiedUser = registedUserId

                    };

                    // save entire new registed user object into database
                    db.Categories.InsertOnSubmit(c);
                    db.SubmitChanges();

                    //redirect page
                    Response.Redirect("AdminAddCategory.aspx?success=true");
                }
            }
            else
            {
                Response.Redirect("AdminRegisterAcc.aspx");
            }
        }
    }
}