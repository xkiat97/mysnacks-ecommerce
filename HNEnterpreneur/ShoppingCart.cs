using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HNEnterpreneur
{
    public class ShoppingCart
    {
        List<Order_list> items;
        public double discountPrice { get; set; }
        public double chargePrice { get; set; }

        public ShoppingCart()
        {
            items = new List<Order_list>();
        }

        public List<Order_list> getOrdList()
        {
            return items;
        }

        public int getNumberOfItem()
        {
            return items.Count();
        }
        
        public double getTotalShoppingCartAmount()
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            double total = 0;
            foreach(Order_list no in items)
                {
                if (db.Foods.Any(x => x.foodId == no.foodId))
                {
                    Food nf = db.Foods.SingleOrDefault(x => x.foodId == no.foodId);
                    total += (float)(nf.price * no.quantity);
                }
            }
            return Math.Round(total, 2);
        }
        public void addItem(int id, int qty, string desc)
        {
            Order_list currentOrd = getOrderListById(id);
            if (currentOrd == null)
            {
                Order_list ord = new Order_list
                {
                    foodId = id,
                    quantity = qty,
                    description = desc,
                    status = 'T'
                };

                // add new ord into list
                items.Add(ord);
            }
            else
            {
                //if it already exist, update the item
                currentOrd.quantity += qty;
                currentOrd.description += ". " + desc;
            }
        }

        public void updateItem(int id, int qty, string desc)
        {
            removeItem(id);
            addItem(id, qty, desc);
        }

        public void removeItem(int id)
        {
            foreach (Order_list o in items)
            {
                if (o.foodId == id)
                {
                    items.Remove(o);
                    break;
                }
            }
        }

        public Order_list getOrderListById(int id)
        {
            foreach (Order_list o in items)
            {
                if (o.foodId == id)
                {
                    return o;
                }
            }
            return null;
        }
    }
}