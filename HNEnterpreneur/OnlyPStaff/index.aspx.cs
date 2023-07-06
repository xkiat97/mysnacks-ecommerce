using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyPStaff
{
    public partial class index : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var s = from x in db.Orders
                        where x.status == 'W'
                        select new
                        {
                            x.orderId,
                            x.orderDate,
                            x.Address,
                            daysPast = DateTime.Now.Subtract(x.orderDate).Days
                        };
                dlPreparation.DataSource = s;
                dlPreparation.DataBind();
            }
        }
    }
}