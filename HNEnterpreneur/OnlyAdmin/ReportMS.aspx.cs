using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class ReportMS : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        public string year1 = "";
        public string year2 = "";
        public string year3 = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;

            int years1 = dt.Year - 1;
            int years2 = dt.Year - 2;
            int years3 = dt.Year - 3;

            lblTitle.Text = "From " + years3.ToString() + " To " + years1.ToString();
            lblDateCreated.Text = dt.ToShortDateString();

            var sales1 = from x in db.Orders
                        where x.status == 'C' && x.orderDate.Year == years1
                        orderby x.orderDate.Date
                        group x by new { x.orderDate.Date  } into g
                        select new
                        {
                            date = g.Key.Date,
                            value = g.Sum(x => (x.total + x.charges - x.discountPrice))
                        };
            sales1 = sales1.OrderBy(x => x.date);
            foreach (var s in sales1)
            {
                year1 += "{\"date\": \"" + CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(s.date.Month) + s.date.Day.ToString() + " 2000\", \"value\": " + s.value + ", \"volume\": " + s.value + "},";
            }

            var sales2 = from x in db.Orders
                         where x.status == 'C' && x.orderDate.Year == years2
                         orderby x.orderDate.Date
                         group x by new { x.orderDate.Date } into g
                         select new
                         {
                             date = g.Key.Date,
                             value = g.Sum(x => (x.total + x.charges - x.discountPrice))
                         };
            sales2 = sales2.OrderBy(x => x.date);
            foreach (var s in sales2)
            {
                year2 += "{\"date\": \"" + CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(s.date.Month) + s.date.Day.ToString() + " 2000\", \"value\": " + s.value + ", \"volume\": " + s.value + "},";
            }

            var sales3 = from x in db.Orders
                         where x.status == 'C' && x.orderDate.Year == years3
                         orderby x.orderDate.Date
                         group x by new { x.orderDate.Date } into g
                         select new
                         {
                             date = g.Key.Date,
                             value = g.Sum(x => (x.total + x.charges - x.discountPrice))
                         };
            sales3 = sales3.OrderBy(x => x.date);
            foreach (var s in sales3)
            {
                year3 += "{\"date\": \"" + CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(s.date.Month) + s.date.Day.ToString() + " 2000\", \"value\": " + s.value + ", \"volume\": " + s.value + "},";
            }

        }
    }
}