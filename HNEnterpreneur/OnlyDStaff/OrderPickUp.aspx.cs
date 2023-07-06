using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyDStaff
{
    public partial class OrderPickUp : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["Id"] != null)
            {
                int ordID;
                if (int.TryParse(Request.QueryString["Id"], out ordID))
                {
                    Order o = db.Orders.SingleOrDefault(x => x.orderId == ordID && x.status == 'P');
                    User u = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name && x.userType == "DStaff");
                    if (o != null && u != null)
                    {
                        o.deliveryUserId = u.userId;
                        o.pickingDate = DateTime.Now;
                        o.status = 'D';
                        db.SubmitChanges();
                        Response.Redirect("OrderPickUp.aspx?success=t");
                    }
                }
                Response.Redirect("OrderPickUp.aspx");
            }
        }
    }
}