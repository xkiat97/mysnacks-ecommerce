using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyCStaff
{
    public partial class index : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            var dsFood = from x in db.Foods
                         where x.status == 'T'
                         select new
                         {
                             x.foodId,
                             x.name,
                             x.quantity,
                             x.reservedQty,
                             shortage = (x.reservedQty - x.quantity),
                             available = HNEnterpreneurSecurity.getCookAvailable(x.foodId)
                         };
            dlFood.DataSource = dsFood;
            dlFood.DataBind();
        }
    }
}