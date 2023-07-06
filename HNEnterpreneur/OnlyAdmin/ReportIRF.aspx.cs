using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class ReportIRF : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            lblTitle.Text = "for next 30 Days";
            lblDateCreated.Text = dt.ToShortDateString();
            int avgDeliveryTime = 21;
            var i = from x in db.Ingredients
                    where x.status == 'T'
                    select new
                    {
                        x.ingID,
                        x.name,
                        x.balanceType,
                        x.balance,
                        reorderPoint = HNEnterpreneurSecurity.calReorderPoint(x.ingID, avgDeliveryTime),
                        reorderDate = DateTime.Now.AddDays(HNEnterpreneurSecurity.calReorderDays(x.ingID, x.balance, avgDeliveryTime)).ToShortDateString(),
                        reorderDays = HNEnterpreneurSecurity.calReorderDays(x.ingID, x.balance, avgDeliveryTime)
                    };
            //var j = from y in i
            //        where y.reorderDays <= 30
            //        select y;

            rforecast.DataSource = i;
            rforecast.DataBind();
        }
    }
}