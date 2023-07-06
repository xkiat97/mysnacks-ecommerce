using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminRegisterAcc : System.Web.UI.Page
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
                erremail.Text = "";

                //perform validation here
                if (db.Users.Any(x => x.email == txtEmail.Text))
                {
                    erremail.Text = "<div class='alert alert-danger col-sm-12'>Email address has been used. </div>";
                }
                if (erremail.Text == "")
                {
                    //set the user who register this account
                    int registedUserId = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;

                    // create object to store all the user information
                    User u = new User
                    {
                        name = txtInputName.Value,
                        password = HNEnterpreneurSecurity.GetHash(pwdPassword2.Value),
                        email = txtEmail.Text,
                        userType = selAccTyp.Value,
                        regUserId = registedUserId,
                        status = 'T'
                    };
                    // save entire new registed user object into database
                    db.Users.InsertOnSubmit(u);
                    db.SubmitChanges();

                    if (selAccTyp.Value == "Supplier")
                    {
                        if (!db.Bidders.Any(x => x.usrID == u.userId))
                        {
                            Bidder b = new Bidder
                            {
                                usrID = u.userId,
                                name = "Empty",
                                delayTime = 0
                            };
                            db.Bidders.InsertOnSubmit(b);
                            db.SubmitChanges();
                        }
                    }

                    //redirect page
                    Response.Redirect("AdminRegisterAcc.aspx?success=true");
                }
            }
            else
            {
                Response.Redirect("AdminRegisterAcc.aspx");
            }
        }
    }
}