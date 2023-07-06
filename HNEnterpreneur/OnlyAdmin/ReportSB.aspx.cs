using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class ReportSB : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            lblTitle.Text = dt.ToShortDateString();
            lblDateCreated.Text = dt.ToShortDateString();
            var s = from x in db.Foods
                    orderby x.Category.name ascending
                    select new
                    {
                        x.Category,
                        x.name,
                        x.foodId,
                        x.quantity,
                        x.price,
                        alert = x.quantity <= 4 ? "color:red;" : ""
                    };
            rStockBalance.DataSource = s;
            rStockBalance.DataBind();
        }
    }
}