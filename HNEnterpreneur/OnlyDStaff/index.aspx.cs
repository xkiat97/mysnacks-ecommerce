using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyDStaff
{
    public partial class index : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] != null)
            {
                int ordID;
                if (int.TryParse(Request.QueryString["Id"], out ordID))
                {
                    string userName = Page.User.Identity.Name;
                    Order o = db.Orders.SingleOrDefault(x => x.orderId == ordID && x.status == 'D' && x.User.email == userName);
                    User u = db.Users.SingleOrDefault(x => x.email == userName && x.userType == "DStaff");
                    if (o != null && u != null)
                    {
                        if(Request.QueryString["q"] != null)
                        {
                            o.deliveryDate = DateTime.Now;
                            o.status = 'C';
                        }
                        else
                        {
                            o.pickingDate = null;
                            o.deliveryUserId = null;
                            o.status = 'P';
                        }
                        db.SubmitChanges();
                        Response.Redirect("index.aspx?success=" + ordID);
                    }
                }
                Response.Redirect("index.aspx");
            }
            if (!Page.IsPostBack)
            {
                var s = from x in db.Orders
                        where x.status == 'D' && x.User.email == Page.User.Identity.Name
                        select x;
                dlDelivery.DataSource = s;
                dlDelivery.DataBind();
            }
        }
    }
}