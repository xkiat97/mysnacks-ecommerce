using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminIndex : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
        public string BCtop5BDATA = "";
        public string BCtop5WDATA = "";
        public string PCPStaffDATA = "";
        public string PCDStaffDATA = "";
        public string PCTimeCompletedDATA = "";
        public int GUserLogin1 = 0;
        public int GUserLogin2 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            BCtop5BDATA = "";
            BCtop5WDATA = "";
            PCPStaffDATA = "";
            PCDStaffDATA = "";
            PCTimeCompletedDATA = "";
            GUserLogin1 = 0;
            GUserLogin2 = 0;

            DateTime dt = DateTime.Now;

            lblUserRegisted.Text = db.Members.Count(x => x.loginDate.Value.Date == dt.Date).ToString();
            lblTodaySales.Text = db.Orders.Any(y => y.orderDate.Date == dt.Date) == false ? "0":
                db.Orders.Where(y => y.orderDate.Date == dt.Date).Sum(x => (x.total + x.charges - x.discountPrice)).ToString();
            lblIncompletedOrders.Text = db.Orders.Count(x => x.status != 'V' && x.status != 'C').ToString();

            lblMonthlyExpensers.Text = db.Quotations.Any(x => x.status == 'A'
                && db.Transactions.Any(y => y.receivedTime.Value.Month == dt.Month && y.receivedTime.Value.Year == dt.Year)) == false? "0":
                db.Quotations.Where(x => x.status == 'A'
                && db.Transactions.Any(y => y.receivedTime.Value.Month == dt.Month && y.receivedTime.Value.Year == dt.Year)).Sum(z => (z.price * z.quantity)).ToString();

            //making graph (best and worst selling )
            var BCtop5BDATAG = from x in db.Order_lists
                               where x.Order.status == 'C'
                               group x by new { x.Food.name } into g
                               select new
                               {
                                   name = g.Key.name,
                                   value = g.Sum(y => y.quantity)
                               };

            var BCworst5BDATAG = BCtop5BDATAG.OrderBy(x => x.value).Take(5);
            BCtop5BDATAG = BCtop5BDATAG.OrderByDescending(x => x.value).Take(5);

            foreach (var a in BCtop5BDATAG)
            {
                BCtop5BDATA += "{\"name\": \"" + a.name + " \", \"value\": " + a.value + "},";
            }
            foreach (var a in BCworst5BDATAG)
            {
                BCtop5WDATA += "{\"name\": \"" + a.name + " \", \"value\": " + a.value + "},";
            }

            //making pie chart
            //for preparation staff
            var PCPStaffDATAG = from x in db.Orders
                                where x.status == 'C'
                                group x by new { x.preparationUserId } into g
                                select new
                                {
                                    name = db.Users.SingleOrDefault(x => x.userId == g.Key.preparationUserId).email,
                                    value = g.Count()
                                };
            foreach (var a in PCPStaffDATAG)
            {
                PCPStaffDATA += "{\"name\": \"" + a.name + " \", \"value\": " + a.value + "},";
            }

            //for delivery staff
            var PCDStaffDATAG = from x in db.Orders
                                where x.status == 'C'
                                group x by new { x.User.email } into g
                                select new
                                {
                                    name = g.Key.email,
                                    value = g.Count()
                                };
            foreach (var a in PCDStaffDATAG)
            {
                PCDStaffDATA += "{\"name\": \"" + a.name + " \", \"value\": " + a.value + "},";
            }

            //for avg completement time
            var PCTimeCompletedDATAG = from x in db.Orders
                                       where x.status == 'C'
                                       select new
                                       {
                                           pday = HNEnterpreneurSecurity.getDateDifferent(x.preparationDate.Value, x.orderDate),
                                           uday = HNEnterpreneurSecurity.getDateDifferent(x.pickingDate.Value, x.preparationDate.Value),
                                           dDay = HNEnterpreneurSecurity.getDateDifferent(x.deliveryDate.Value, x.pickingDate.Value)
                                       };
            int count = 0;
            int pDays = 0;
            int uDays = 0;
            int dDays = 0;

            foreach (var i in PCTimeCompletedDATAG)
            {
                count++;
                pDays += i.pday;
                uDays += i.uday;
                dDays += i.dDay;
            }

            if (count != 0)
            {
                pDays /= count;
                uDays /= count;
                dDays /= count;
            }
            
            PCTimeCompletedDATA += "{\"name\": \"" + "Preperation Days" + " \", \"value\": " + pDays + "},";
            PCTimeCompletedDATA += "{\"name\": \"" + "Picking Days" + " \", \"value\": " + uDays + "},";
            PCTimeCompletedDATA += "{\"name\": \"" + "Delivery Days" + " \", \"value\": " + dDays + "}";

            //create gauge
            var u = from x in db.Members
                    select x;

            GUserLogin1 = u.Where(x => x.loginDate.Value.Date == DateTime.Now.Date).Count();
            GUserLogin2 = u.Count();
        }
    }
}