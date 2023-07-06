using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class ProfileReports : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
        public string usedByFoodChartData = "";
        public string BCmonthlyOrderDATA = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!db.Users.Any(x => x.email == Page.User.Identity.Name && x.userType == "Member" && x.status == 'T'))
            {
                Response.Redirect("Home.aspx");
            }
            //making graph (used by food)
            var graph1 = from x in db.Order_lists
                         where x.Order.Address.User.email == Page.User.Identity.Name && x.Order.status != 'V'
                         group x by new {x.Food.name} into g
                         select new
                         {
                             name = g.Key.name,
                             value = g.Sum(s => s.quantity)
                         };
            foreach (var a in graph1)
            {
                usedByFoodChartData += "{\"name\": \"" + a.name + " \", \"value\": " + a.value + "},";
            }
            //END

            var graph2 = from x in db.Orders
                         where x.Address.User.email == Page.User.Identity.Name &&
                         x.status != 'V' && x.orderDate.Year == DateTime.Now.Year
                         group x by new { x.orderDate.Month, x.orderDate.Year } into g
                         select new
                         {
                             month = g.Key.Month,
                             year = g.Key.Year,
                             value = g.Sum(x => (x.total + x.charges - x.discountPrice))
                         };

            graph2 = graph2.OrderBy(x => x.month);
            foreach (var a in graph2)
            {
                BCmonthlyOrderDATA += "{\"month\": \"" + DateTimeFormatInfo.CurrentInfo.GetAbbreviatedMonthName(a.month) + " " + a.year + " \", \"Total\": " + a.value + "},";
            }
        }
    }
}