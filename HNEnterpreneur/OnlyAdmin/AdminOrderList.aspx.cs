using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminOrderList : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            var resultItems = from x in db.Orders
                              orderby x.orderId descending
                              select new
                              {
                                  x.orderId,
                                  datetime = x.orderDate.ToShortDateString(),
                                  x.Address.User.email,
                                  total = x.total + x.charges - x.discountPrice,
                                  status = HNEnterpreneurSecurity.getOrderStatus(x.status),
                                  deliveryMan = x.User == null ? "None" : x.User.email,
                                  preparationMan = x.preparationUserId == null ? "None" : db.Users.SingleOrDefault(y => y.userId == x.preparationUserId).email
                              };
            dlOrder.DataSource = resultItems.Take(500);
            dlOrder.DataBind();
        }


    }
}