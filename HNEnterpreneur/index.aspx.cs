using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class index : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Page.User.Identity.Name;
            //check the role and redirect to a correct page

            //retrieve the user type from db
            User usr = db.Users.SingleOrDefault(x => x.email == username);
            if (usr == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                switch (usr.userType)
                {
                    case "SuperAdmin":
                        Response.Redirect("OnlyAdmin/AdminIndex.aspx");
                        break;
                    case "Admin":
                        Response.Redirect("OnlyAdmin/AdminIndex.aspx");
                        break;
                    case "CStaff":
                        Response.Redirect("OnlyCStaff/index.aspx");
                        break;
                    case "DStaff":
                        Response.Redirect("OnlyDStaff/index.aspx");
                        break;
                    case "PStaff":
                        Response.Redirect("OnlyPStaff/index.aspx");
                        break;
                    case "StoreAdmin":
                        Response.Redirect("OnlyStoreAdmin/SAindex.aspx");
                        break;
                    case "Supplier":
                        Response.Redirect("OnlySupplier/BiddingAvailable.aspx");
                        break;
                    case "Member":
                        Member m = db.Members.SingleOrDefault(x => x.userId == usr.userId);
                        if(m != null)
                        {
                            m.loginDate = DateTime.Now;
                            db.SubmitChanges();
                        }
                        Response.Redirect("Home.aspx");
                        break;
                    default:
                        Response.Redirect("Home.aspx");
                        break;
                }
            }
        }
    }
}