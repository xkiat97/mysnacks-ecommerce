using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class SystemRegister : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Value;

            //check email existence
            User u = db.Users.SingleOrDefault(x => x.email == email);

            if(u == null)
            {
                User newUser = new User
                {
                    email = txtEmail.Value,
                    name = txtEmail.Value,
                    password = HNEnterpreneurSecurity.GetHash(txtPassComf.Value),
                    userType = "Member",
                    status = 'T',
                    regUserId = 1000
                };
                db.Users.InsertOnSubmit(newUser);
                db.SubmitChanges();

                Member newMember = new Member
                {
                    point = 0,
                    userId = newUser.userId
                };

                db.Members.InsertOnSubmit(newMember);
                db.SubmitChanges();
            }
            else
            {
                lblEmailExistance.Visible = true;
            }
        }
    }
}