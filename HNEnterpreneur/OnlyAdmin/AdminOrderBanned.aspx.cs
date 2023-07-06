using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminOrderBanned : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            var resultItems = from x in db.Orders
                              where x.status == 'F'
                              select new
                              {
                                  x.orderId,
                                  datetime = ((DateTime)x.orderDate).ToShortDateString(),
                                  x.total,
                                  x.charges,
                                  x.discountPrice
                              };
            dlOrder.DataSource = resultItems;
            dlOrder.DataBind();
        }
    }
}