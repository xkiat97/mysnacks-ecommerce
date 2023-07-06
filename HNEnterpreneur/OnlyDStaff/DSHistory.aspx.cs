using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyDStaff
{
    public partial class DSHistory : System.Web.UI.Page
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

                    Order o = db.Orders.SingleOrDefault(x => x.orderId == ordID 
                    && x.status == 'C' 
                    && x.User.email == userName 
                    && x.deliveryDate.Value.AddDays(1) >= DateTime.Now);

                    User u = db.Users.SingleOrDefault(x => x.email == userName && x.userType == "DStaff");
                    if (o != null && u != null)
                    {
                        o.deliveryDate = null;
                        o.status = 'D';
                        db.SubmitChanges();
                        Response.Redirect("DSHistory.aspx?success=" + ordID);
                    }
                }
                Response.Redirect("DSHistory.aspx");
            }
            if (!Page.IsPostBack)
            {
                var s = from x in db.Orders
                        where x.status == 'C' && x.User.email == Page.User.Identity.Name && x.deliveryDate != null
                        orderby x.deliveryDate descending
                        select new
                        {
                            x.orderId,
                            x.orderDate,
                            x.deliveryDate,
                            x.Address,
                            incomplete = x.deliveryDate.Value.AddDays(1) >= DateTime.Now ?
                            "<a href='DSHistory.aspx?Id=" + x.orderId + "' class='btn btn-sm btn-outline-danger btn-block'>Incomplete</a>" :
                            "Not Available"
                        };
                dlDelivery.DataSource = s.Take(100);
                dlDelivery.DataBind();
            }
        }
    }
}