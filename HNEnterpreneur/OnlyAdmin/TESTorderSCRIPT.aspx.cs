using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class TESTorderSCRIPT : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            int days = 0;
            DateTime dt = DateTime.Now.AddDays(-days);
            int i, j, k, demands, rand;
            DateTime pday, pickday, dday;
            for (i = 0; i < days; i++)
            {
                if (dt.Year == 2015)
                {
                    demands = demand(dt.Month);
                }
                else if (dt.Year == 2016)
                {
                    demands = demand(dt.Month) + 3;
                }
                else if (dt.Year == 2017)
                {
                    demands = demand(dt.Month) + 8;
                }
                else
                {
                    demands = demand(dt.Month) + 10;
                }
                for (k = 0; k <= demands; k++)
                {
                    pday = dt.AddDays(i + getRandom() + 1);
                    pickday = pday.AddDays(getRandom());
                    dday = pickday.AddDays(getRandom());
                    Order o = new Order
                    {
                        orderDate = dt.AddDays(i),
                        charges = 10,
                        discountPrice = getRandomDiscount(),
                        total = 0,
                        status = 'C',
                        addressId = getRandomCustomer(),
                        preparationUserId = getRandomPreparationMan(),
                        preparationDate = pday,
                        pickingDate = pickday,
                        deliveryUserId = getRandomDeliveryMan(),
                        deliveryDate = dday
                    };
                    db.Orders.InsertOnSubmit(o);
                    db.SubmitChanges();

                    rand = getRandom();
                    for (j = 0; j <= rand; j++)
                    {
                        Order_list ol = new Order_list
                        {
                            orderId = o.orderId,
                            foodId = getRandomFood(),
                            quantity = getRandomQty(),
                            status = 'T'
                        };
                        if (db.Order_lists.Any(x => x.foodId == ol.foodId && x.orderId == o.orderId))
                        {
                            j--;
                        }
                        else
                        {
                            db.Order_lists.InsertOnSubmit(ol);
                            db.SubmitChanges();
                        }
                    }
                    o.total = Math.Round(db.Order_lists.Where(x => x.orderId == o.orderId).Sum(y => y.Food.price * y.quantity), 2);
                    db.SubmitChanges();
                }
            }
        }

        public int getRandomDiscount()
        {
            Random rnd = new Random();
            int[] r = { 0, 5, 10, 15 };
            return r[rnd.Next(r.Length)];
        }

        public int getRandomFood()
        {
            Random rnd = new Random();
            int[] r = { 6001, 6002, 6003, 6004, 6005, 6006, 6007, 6008, 6009, 6010, 6011, 6012, 6013, 6014, 6015 };
            return r[rnd.Next(r.Length)];
        }
        public int getRandomDeliveryMan()
        {
            Random rnd = new Random();
            int[] r = { 1005, 1009 };
            return r[rnd.Next(r.Length)];
        }
        public int getRandomPreparationMan()
        {
            Random rnd = new Random();
            int[] r = { 1006, 1010, 1028 };
            return r[rnd.Next(r.Length)];
        }
        public int getRandomCustomer()
        {
            Random rnd = new Random();
            int[] r = { 3001, 3002, 3003, 3004, 3005, 3006, 3007, 3008, 3009 };
            return r[rnd.Next(r.Length)];
        }
        public int getRandom()
        {
            Random rnd = new Random();
            return rnd.Next(1, 5);
        }

        public int getRandomQty()
        {
            Random rnd = new Random();
            return rnd.Next(1, 7);
        }

        public int demand(int month)
        {
            Random rnd = new Random();
            switch (month)
            {
                case 1:
                    return rnd.Next(19, 23);
                case 2:
                    return rnd.Next(25, 30);
                case 3:
                    return rnd.Next(10, 13);
                case 4:
                    return rnd.Next(13, 17);
                case 5:
                    return rnd.Next(12, 15);
                case 6:
                    return rnd.Next(27, 33);
                case 7:
                    return rnd.Next(25, 28);
                case 8:
                    return rnd.Next(17, 20);
                case 9:
                    return rnd.Next(15, 17);
                case 10:
                    return rnd.Next(24, 27);
                case 11:
                    return rnd.Next(12, 15);
                case 12:
                    return rnd.Next(28, 35);
            }
            return 1;
        }
    }
}