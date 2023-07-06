using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class ReportInventoryBalance : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            lblDate.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(dt.Month - 1) + " " + dt.Year.ToString();
            var i = from x in db.Ingredients
                    where x.status == 'T'
                    select new
                    {
                        x.ingID,
                        x.name,
                        x.balanceType,
                        stockIn = HNEnterpreneurSecurity.calStockInByMonth(x.ingID, dt.Month - 1, dt.Year),
                        stockOut = HNEnterpreneurSecurity.calStockOutByMonth(x.ingID, dt.Month - 1, dt.Year),
                        qtyDelivering = HNEnterpreneurSecurity.calStockDeliveringByMonth(x.ingID, dt.Month - 1, dt.Year)
                    };

            dlReport.DataSource = i;
            dlReport.DataBind();
        }
    }
}