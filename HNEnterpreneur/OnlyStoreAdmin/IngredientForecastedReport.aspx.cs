using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyStoreAdmin
{
    public partial class IngredientForecastedReport : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            int avgDeliveryTime = 21;
            var i = from x in db.Ingredients
                    where x.status == 'T'
                    select new
                    {
                        x.ingID,
                        x.name,
                        x.balanceType,
                        x.balance,
                        aUsage = HNEnterpreneurSecurity.avgDailyUsage(x.ingID).Mean(),
                        variance = HNEnterpreneurSecurity.avgDailyUsage(x.ingID).Variance(),
                        standardDeviation = HNEnterpreneurSecurity.avgDailyUsage(x.ingID).StandardDeviation(),
                        leadTimeDemand = HNEnterpreneurSecurity.calLeadTimeDemand(x.ingID, avgDeliveryTime),
                        safetyStock = HNEnterpreneurSecurity.calSafetyStock(x.ingID, avgDeliveryTime),
                        reorderPoint = HNEnterpreneurSecurity.calReorderPoint(x.ingID, avgDeliveryTime),
                        reorderDate = DateTime.Now.AddDays(HNEnterpreneurSecurity.calReorderDays(x.ingID, x.balance, avgDeliveryTime)).ToShortDateString(),
                        reorderDays = HNEnterpreneurSecurity.calReorderDays(x.ingID, x.balance, 0)
                    };

            dlReport.DataSource = i;
            dlReport.DataBind();
        }
    }
}