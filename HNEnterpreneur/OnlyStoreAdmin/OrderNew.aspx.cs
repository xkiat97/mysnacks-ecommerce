using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyStoreAdmin
{
    public partial class OrderNew : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            var o = from x in db.Transactions
                    where x.status == 'N' && x.Quotation.status == 'A'
                    select new
                    {
                        x.traID,
                        x.Quotation,
                        rate = calRate(x.Quotation.price, (double)x.Quotation.Bidding.Ingredient.marketPrice * x.Quotation.Bidding.quantity),
                        deliveryDate = deliveryDate(x.Quotation.Bidding.deliveryDate, x.Quotation.Bidding.urgency)
                    };
            dlOrd.DataSource = o;
            dlOrd.DataBind();
        }
        public static string calRate(double newPrice, double oldPrice)
        {
            double rate = (newPrice - oldPrice) * 100 / oldPrice;
            rate = Math.Round(rate, 2);
            return rate.ToString() + " %";
        }
        public static string deliveryDate(DateTime dt, string urgency)
        {
            int days;
            switch (urgency)
            {
                case "High":
                    days = 3;
                    break;
                case "Medium":
                    days = 14;
                    break;
                case "Low":
                    days = 30;
                    break;
                default:
                    days = 0;
                    break;
            }
            dt = dt.AddDays(days);

            return dt.ToShortDateString();
        }
    }
}