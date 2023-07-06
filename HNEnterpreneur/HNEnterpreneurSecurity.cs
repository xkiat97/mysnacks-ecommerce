using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.Security.Principal;
using System.Threading;
using System.Web.Security;

namespace HNEnterpreneur
{
    public class HNEnterpreneurSecurity
    {
        //method to generate hash
        public static string GetHash(string password)
        {
            //convert string into byte array
            byte[] binPass = Encoding.Default.GetBytes(password);

            //compute hash value, hash can only work with byte array
            SHA256 sha = SHA256.Create();

            byte[] binHash = sha.ComputeHash(binPass);

            //convert hashed byte back to string
            string strHash = Convert.ToBase64String(binHash);

            return strHash;
        }

        public static void LoginUser(string username, string role, bool rememberMe)
        {
            HttpContext ctx = HttpContext.Current;

            HttpCookie authCookie = FormsAuthentication.GetAuthCookie(username, rememberMe);
            FormsAuthenticationTicket oldTicket = FormsAuthentication.Decrypt(authCookie.Value);
            FormsAuthenticationTicket newTicket = new FormsAuthenticationTicket(
                oldTicket.Version,
                oldTicket.Name,
                oldTicket.IssueDate,
                oldTicket.Expiration,
                oldTicket.IsPersistent,
                role
            );
            authCookie.Value = FormsAuthentication.Encrypt(newTicket);
            ctx.Response.Cookies.Add(authCookie);

            string redirectUrl = FormsAuthentication.GetRedirectUrl(username, rememberMe);
            ctx.Response.Redirect(redirectUrl);
        }

        public static void ProcessRoles()
        {
            HttpContext ctx = HttpContext.Current;

            if (ctx.User != null &&
                ctx.User.Identity.IsAuthenticated &&
                ctx.User.Identity is FormsIdentity)
            {
                FormsIdentity identity = (FormsIdentity)ctx.User.Identity;
                string[] roles = identity.Ticket.UserData.Split(',');

                GenericPrincipal principal = new GenericPrincipal(identity, roles);
                ctx.User = principal;
                Thread.CurrentPrincipal = principal;
            }
        }
        
        public static string getOrderStatus(char x)
        {
            string status = "";
            switch (x)
            {
                case 'W':
                    status = "Pending";
                    break;
                case 'P':
                    status = "Preparing";
                    break;
                case 'D':
                    status = "Delivering";
                    break;
                case 'C':
                    status = "Complete";
                    break;
                case 'V':
                    status = "Cancelled";
                    break;
            }
            return status;
        }
        public static int getDateDifferent(DateTime t1, DateTime t2)
        {
            return t1.Subtract(t2).Days;
        }
        public static int getCookAvailable(int foodID)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            int count = 0;
            if(db.Ing_lists.Any(x => x.foodID == foodID))
            {
                var fooding = from x in db.Ing_lists
                                where x.foodID == foodID
                                select x;
                count = fooding.Min(x => (int)Math.Floor(x.Ingredient.balance / x.qtyNeeded));
            }
            
            return count;
        }
        public static void updateBidding()
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            //get all the bidding status with available
            var b = from x in db.Biddings
                    where x.status == 'T' && x.deliveryDate < DateTime.Now
                    select x;

            //loop all the available bidding result
            foreach (Bidding b1 in b)
            {
                //if the bidding got quotation, mean got someone to bid
                if (db.Quotations.Any(x => x.bidID == b1.bidID && x.status == 'T'))
                {
                    var q = from y in db.Quotations
                            where y.status == 'T' && y.bidID == b1.bidID
                            select y;
                    foreach (Quotation q1 in q)
                    {
                        //if it is the lowest price for bidding
                        if (q1.quoID == db.Quotations.OrderBy(z => z.price).FirstOrDefault(y => y.bidID == b1.bidID).quoID)
                        {
                            q1.status = 'A';
                            //if it is bid successfully, then create a transaction accout for it
                            Transaction t = new Transaction
                            {
                                status = 'N',
                                quoID = q1.quoID
                            };
                            db.Transactions.InsertOnSubmit(t);
                        }
                        else
                        {
                            q1.status = 'R';
                        }
                        db.SubmitChanges();
                    }
                    //if it is checked, then assume it is D = done
                    b1.status = 'D';
                    db.SubmitChanges();
                }
                else
                {
                    //no ppl bid it
                    //change the bidding status to N = no ppl
                    b1.status = 'N';
                    db.SubmitChanges();
                }
            }
        }

        public static string shortageRate(double balance, int ingID)
        {
            double qtyNeeded = calTotalIngredientNeeded(ingID);
            double rate = 0;

            if (qtyNeeded != 0)
            {
                rate = balance * 100 / qtyNeeded;
            }

            return Math.Round(rate, 2).ToString();
        }

        public static string timeLeft(DateTime dt, string urgency)
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
            int day = dt.Subtract(DateTime.Now).Days;

            if (day == 0)
            {
                //able to deliver
                return "Today";
            }
            else if (day < 0)
            {
                return "<span class='color:red;'>" + (day * -1) + " (Late)</span>";
            }

            return day.ToString();
        }

        public static DateTime deliveryDate(DateTime dt, string urgency)
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

            return dt;
        }

        public static double calTotalIngredientNeeded(int ingID)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            double total = 0;

            Ingredient i = db.Ingredients.SingleOrDefault(x => x.status == 'T' && x.ingID == ingID);
            if (i != null)
            {
                foreach (Ing_list il in i.Ing_lists)
                {
                    //use ingredient needed multiply with the sold out quantity
                    total += (double)il.qtyNeeded * (double)(il.Food.reservedQty - il.Food.quantity);
                }
            }
            return Math.Round(total, 2);
        }

        public static string lowPrice(int bidID)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            double price = db.Biddings.FirstOrDefault(x => x.bidID == bidID).maxPrice;

            Quotation q = db.Quotations.OrderBy(z => z.price).FirstOrDefault(y => y.bidID == bidID);
            if (q != null)
            {
                price = q.price;
            }
            return price.ToString();
        }

        public static double calStockInByMonth(int ingID, int month, int year)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            double stockIn = 0;
            if (db.Transactions.Any(x => x.status == 'D' && x.receivedTime.Value.Month == month && x.receivedTime.Value.Year == year))
            {
                stockIn = db.Transactions.Where(x => x.status == 'D' && x.receivedTime.Value.Month == month && x.receivedTime.Value.Year == year).Sum(y => y.Quotation.quantity);
            }

            return stockIn;
        }

        public static double calStockOutByMonth(int ingID, int month, int year)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            double stockOut = 0;
            if (db.Order_lists.Any(x => x.Order.status == 'C' && x.Order.orderDate.Month == month && x.Order.orderDate.Year == year && db.Ing_lists.Any(z => z.foodID == x.foodId && z.ingID == ingID)))
            {
                stockOut = db.Order_lists.Where(x => x.Order.status == 'C' && x.Order.orderDate.Month == month && x.Order.orderDate.Year == year && db.Ing_lists.Any(z => z.foodID == x.foodId && z.ingID == ingID)).Sum(y => (double)(y.Food.quantity * db.Ing_lists.SingleOrDefault(z => z.foodID == y.foodId && z.ingID == ingID).qtyNeeded));
            }

            return stockOut;
        }

        public static double calStockDeliveringByMonth(int ingID, int month, int year)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            double delivering = 0;
            if (db.Quotations.Any(y => y.status == 'A' && y.Bidding.deliveryDate.Month == month && y.Bidding.deliveryDate.Year == year && y.Bidding.ingID == ingID))
            {
                delivering = db.Quotations.Where(y => y.status == 'A' && y.Bidding.deliveryDate.Month == month && y.Bidding.deliveryDate.Year == year &&  y.Bidding.ingID == ingID).Sum(y => y.quantity);
            }

            return delivering;
        }

        public static double calCurrentUsage(int ingID, DateTime date)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            double usage = 0;
            if (db.Order_lists.Any(x => x.Order.orderDate.Date == date.Date && db.Ing_lists.Any(z => z.foodID == x.foodId && z.ingID == ingID)))
            {
                usage = db.Order_lists.Where(x => x.Order.orderDate.Date == date.Date && db.Ing_lists.Any(z => z.foodID == x.foodId && z.ingID == ingID)).Sum(y => (double)(y.Food.quantity * db.Ing_lists.SingleOrDefault(z => z.foodID == y.foodId && z.ingID == ingID).qtyNeeded));
            }

            return usage;
        }

        public static List<double> avgDailyUsage(int ingID)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

            var graph1 = from x in db.Order_lists
                         where db.Ing_lists.Any(y => y.foodID == x.Food.foodId && y.ingID == ingID)
                         group x by new { x.Order.orderDate } into g
                         select new
                         {
                             date = g.Key.orderDate,
                             value = g.Sum(s => s.quantity * db.Ing_lists.SingleOrDefault(y => y.foodID == s.foodId && y.ingID == ingID).qtyNeeded)
                         };

            List<double> d = new List<double>();

            foreach (var gra in graph1)
            {
                if (gra.date.AddDays(28) >= DateTime.Now && gra.date != DateTime.Today)//exclude today
                {
                    d.Add(gra.value);
                }
            }

            return d;
        }

        public static double calLeadTimeDemand(int ingID, int avgDeliveryDay)
        {
            return Math.Round(avgDailyUsage(ingID).Mean() * avgDeliveryDay, 2);
        }

        public static double calSafetyStock(int ingID, int avgDeliveryDay)
        {
            //safety stock = max daily usage * max lead time - avg daily usage * avg lead time
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

            var graph1 = from x in db.Order_lists
                         where db.Ing_lists.Any(y => y.foodID == x.Food.foodId && y.ingID == ingID)
                         group x by new { x.Order.orderDate } into g
                         select new
                         {
                             date = g.Key.orderDate,
                             value = g.Sum(s => s.quantity * db.Ing_lists.SingleOrDefault(y => y.foodID == s.foodId && y.ingID == ingID).qtyNeeded)
                         };

            double totalUsed = 0;
            int count = 0;
            foreach (var gra in graph1)
            {
                if (gra.date.AddDays(28) >= DateTime.Now && gra.date != DateTime.Today)//exclude today
                {
                    totalUsed += gra.value;
                    count++;
                }
            }

            double maxDailyUsed = 0;
            double avgDailyUsed = 0;

            if (count > 0)
            {
                maxDailyUsed = graph1.Max(x => x.value);
                avgDailyUsed = totalUsed / count;
            }
            return Math.Round(avgDeliveryDay * (maxDailyUsed - avgDailyUsed), 2);
        }

        public static double calReorderPoint(int ingID, int avgDeliveryDay)
        {
            return calLeadTimeDemand(ingID, avgDeliveryDay) + calSafetyStock(ingID, avgDeliveryDay);
        }

        public static double calReorderDays(int ingID, double balance, int day)
        {
            double days = Math.Round(balance - calReorderPoint(ingID, day));
            if (days > 0 && avgDailyUsage(ingID).Mean() != 0)
            {
                return Math.Floor((balance - calReorderPoint(ingID, day)) / avgDailyUsage(ingID).Mean());
            }
            return 0;
        }

        public static string getQtyAlert(int qty)
        {
            int min = 3;
            if(qty <= min)
            {
                return "color:red;";
            }
            return "";
        }
        public static double getIngPriceSD(int ingID)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

            var graph = from x in db.Quotations
                        where x.status == 'A' && x.Bidding.ingID == ingID
                        select new
                        {
                            price = x.price / x.quantity
                        };
            List<double> d = new List<double>();
            foreach (var q in graph)
            {
                //convert all the price into double list format
                d.Add(q.price);
            }
            return d.Mean() + d.StandardDeviation();
        }

        public static double divide(double a, double b)
        {
            return Math.Round(a / b, 2);
        }

        public static double multiply(double a, double b)
        {
            return Math.Round(a * b, 2);
        }

        public static double minus(double a, double b)
        {
            return Math.Round(a - b, 2);
        }

        public static double plus(double a, double b)
        {
            return Math.Round(a + b, 2);
        }
    }
    public static class MyListExtensions
    {
        public static double Mean(this List<double> values)
        {
            return values.Count == 0 ? 0 : values.Mean(0, values.Count);
        }

        public static double Mean(this List<double> values, int start, int end)
        {
            double s = 0;

            for (int i = start; i < end; i++)
            {
                s += values[i];
            }

            return s / (end - start);
        }

        public static double Variance(this List<double> values)
        {
            return values.Variance(values.Mean(), 0, values.Count);
        }

        public static double Variance(this List<double> values, double mean)
        {
            return values.Variance(mean, 0, values.Count);
        }

        public static double Variance(this List<double> values, double mean, int start, int end)
        {
            double variance = 0;

            for (int i = start; i < end; i++)
            {
                variance += Math.Pow((values[i] - mean), 2);
            }

            int n = end - start;
            if (start > 0) n -= 1;

            return variance / (n);
        }

        public static double StandardDeviation(this List<double> values)
        {
            return values.Count == 0 ? 0 : values.StandardDeviation(0, values.Count);
        }

        public static double StandardDeviation(this List<double> values, int start, int end)
        {
            double mean = values.Mean(start, end);
            double variance = values.Variance(mean, start, end);

            return Math.Sqrt(variance);
        }
    }
}