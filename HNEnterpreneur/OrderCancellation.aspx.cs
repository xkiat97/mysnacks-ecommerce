using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class OrderCancellation : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!db.Users.Any(x => x.email == Page.User.Identity.Name && x.userType == "Member" && x.status == 'T'))
            {
                Response.Redirect("Home.aspx");
            }
            int orderID;
            if (int.TryParse(Request.QueryString["Id"], out orderID))
            {
                //company details
                Setting setting = db.Settings.SingleOrDefault(x => x.settingId == 9001);

                //order details
                Order o = db.Orders.SingleOrDefault(x => x.orderId == orderID && x.Address.User.email == Page.User.Identity.Name);

                if(o != null && setting != null)
                {
                    lblPoint.InnerHtml = ((int)((o.total + o.charges - o.discountPrice) / setting.setCashPerPoint) - (int)(o.total * setting.setPointPerCash)).ToString();
                }
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Member mem = db.Members.SingleOrDefault(x => x.User.email == Page.User.Identity.Name);
            int point = int.Parse(lblPoint.InnerHtml);

            //remove the order
            int orderID;
            if (int.TryParse(Request.QueryString["Id"], out orderID))
            {
                //company details
                Setting setting = db.Settings.SingleOrDefault(x => x.settingId == 9001);

                //order details
                Order o = db.Orders.SingleOrDefault(x => x.orderId == orderID && x.status == 'W' && x.Address.User.email == Page.User.Identity.Name);

                if (o != null && setting != null)
                {
                    var ordLst = from x in db.Order_lists
                                 where x.orderId == o.orderId
                                 select x;

                    foreach(var y in ordLst)
                    {
                        Food f = db.Foods.SingleOrDefault(x => x.foodId == y.foodId);
                        if(f != null)
                        {
                            f.quantity += y.quantity;
                            db.SubmitChanges();
                        }
                    }

                    //remove order
                    o.status = 'V';

                    //adding the point
                    mem.point += (int)((o.total + o.charges - o.discountPrice) / setting.setCashPerPoint) - (int)(o.total * setting.setPointPerCash);
                    db.SubmitChanges();
                }
                Response.Redirect("ProfileMyOrders.aspx");
            }
        }
    }
}