using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class ProfileChangePassword : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!db.Users.Any(x => x.email == Page.User.Identity.Name && x.userType == "Member" && x.status == 'T'))
            {
                Response.Redirect("Home.aspx");
            }

        }

        protected void btnChgPass_Click(object sender, EventArgs e)
        {
            string userEmail = Page.User.Identity.Name;
            string oldPassword = txtOldPass.Value;
            string newPassword = txtNewPass.Value;

            User u = db.Users.SingleOrDefault(x => x.email == userEmail && x.password == HNEnterpreneurSecurity.GetHash(oldPassword));

            //check if there are any same user exist
            if (u != null)
            {
                //change password here
                u.password = HNEnterpreneurSecurity.GetHash(newPassword);
                db.SubmitChanges();
                Response.Redirect("ProfileChangePassword.aspx");
            }
            else
            {
                //Wrong password, account not found
                cvNotMatched.IsValid = false;
            }
        }
    }
}