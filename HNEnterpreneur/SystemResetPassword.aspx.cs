using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class SystemResetPassword : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblErr.Visible = false;
            if(Request.QueryString["w"] != null && Request.QueryString["q"] != null)
            {
                string id = Request.QueryString["w"];
                string password = Request.QueryString["q"];

                User u = db.Users.SingleOrDefault(x => x.userId == int.Parse(id) && x.password == password);
                if (u != null)
                {
                    //which means it is a authendicated user
                    txtEmail.Value = u.email;
                }
                else
                {
                    Response.Redirect("SystemForgotPassword.aspx?q=invalidID");
                }
            }
            else
            {
                Response.Redirect("SystemForgotPassword.aspx?q=nourl");
            }
        }

        protected void btnResetPass_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["w"];
            string password = Request.QueryString["q"];

            User u = db.Users.SingleOrDefault(x => x.userId == int.Parse(id) && x.password == password);
            if (u != null)
            {
                //which means it is a authendicated user
                u.password = HNEnterpreneurSecurity.GetHash(txtPassComf.Value);
                db.SubmitChanges();

                //reset password successful, then go to login page
                Response.Redirect("SystemLogin.aspx");
            }
            else
            {
                lblErr.Visible = true;
            }
        }
    }
}