using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class ProfileMemberPoint : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!db.Users.Any(x => x.email == Page.User.Identity.Name && x.userType == "Member" && x.status == 'T'))
            {
                Response.Redirect("Home.aspx");
            }
            Member mem = db.Members.SingleOrDefault(x => x.User.email == Page.User.Identity.Name);
            lblPoints.Text = mem.point.ToString();
        }
    }
}