using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class SystemLogin : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ReturnUrl"] != null)
            {
                lblLogin.Text = "Please login to your account before you continue.";
            }
        }
        
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                errusr.Text = "";
                string userEmail = txtEmail.Value;
                string userPwd = txtPW.Value;
                bool rememberMe = true;

                // Login the user
                User u = db.Users.SingleOrDefault(
                    x => x.email == userEmail && x.password == HNEnterpreneurSecurity.GetHash(userPwd)
                    );

                //check if there are any same user exist
                if (u != null)
                {
                    if (u.status == 'T')
                    {
                        HNEnterpreneurSecurity.LoginUser(u.email, u.userType, rememberMe);
                    }
                    else
                    {
                        errusr.Text = "<div class='alert alert-danger col-sm-12'>Your account has been banned. </div>";
                    }
                }
                else
                {
                    //Wrong password, account not found
                    cvNotMatched.IsValid = false;
                }
            }
        }
    }
}