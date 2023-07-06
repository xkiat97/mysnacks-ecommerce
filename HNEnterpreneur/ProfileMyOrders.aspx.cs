using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class ProfileMyOrders : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!db.Users.Any(x => x.email == Page.User.Identity.Name && x.userType == "Member" && x.status == 'T'))
            {
                Response.Redirect("Home.aspx");
            }
            string userName = Page.User.Identity.Name;

            var o = from x in db.Orders
                    where (x.status == 'W' || x.status == 'P' || x.status == 'D') && x.Address.User.email == userName
                    select new {
                        x.orderId,
                        x.orderDate,
                        x.Address,
                        sts = HNEnterpreneurSecurity.getOrderStatus(x.status)
                    };

            rOrderStatus.DataSource = o;
            rOrderStatus.DataBind();

            var oh = from x in db.Orders
                    where (x.status == 'C') && x.Address.User.email == userName
                    select new
                    {
                        x.orderId,
                        x.orderDate,
                        x.Address,
                        total = (x.total + x.charges - x.discountPrice)
                    };

            rOrderHistory.DataSource = oh;
            rOrderHistory.DataBind();
        }
    }
}