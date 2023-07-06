using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class CheckoutS2 : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!db.Users.Any(x => x.email == Page.User.Identity.Name && x.userType == "Member" && x.status == 'T'))
            {
                Response.Redirect("Home.aspx");
            }
            if (Session["address"] == null)
            {
                if(Session["cart"] == null)
                {
                    Response.Redirect("Products.aspx");
                }
                Response.Redirect("CheckoutS1.aspx");
            }
            else if (((ShoppingCart)Session["cart"]).getNumberOfItem() == 0)
            {
                Response.Redirect("Products.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckoutS1.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            //process order complete
            if (Session["address"] == null)
            {
                if (Session["cart"] == null)
                {
                    Response.Redirect("Products.aspx");
                }
                Response.Redirect("CheckoutS1.aspx");
            }
            else if (((ShoppingCart)Session["cart"]).getNumberOfItem() == 0)
            {
                Response.Redirect("Products.aspx");
            }
            else
            {
                ShoppingCart s = (ShoppingCart)Session["cart"];
                Address a = (Address)Session["address"];
                User usr = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name);
                Member m = db.Members.SingleOrDefault(x => x.userId == usr.userId);
                Setting setting = db.Settings.SingleOrDefault(x => x.settingId == 9001);
                double totalAmount = s.getTotalShoppingCartAmount();

                if (m == null || setting == null || usr == null)
                {
                    Response.Redirect("SystemLogin.aspx");
                }
                //update member point
                m.point += (int)(totalAmount * setting.setPointPerCash);

                //reduce the points for voucher
                m.point -= (int)(s.discountPrice / setting.setCashPerPoint);

                //insert address
                Address newAddress = new Address
                {
                    line1 = a.line1,
                    line2 = a.line2,
                    city = a.city,
                    state = a.state,
                    postcode = a.postcode,
                    country = a.country,
                    contact = a.contact,
                    name = a.name,
                    status = 'T',
                    memId = m.userId
                };

                db.Addresses.InsertOnSubmit(newAddress);
                db.SubmitChanges();

                //insert order
                Order newOrder = new Order
                {
                    orderDate = DateTime.Now,
                    charges = 10.00,
                    discountPrice = s.discountPrice,
                    total = totalAmount,
                    status = 'W',
                    addressId = newAddress.addressId
                };

                db.Orders.InsertOnSubmit(newOrder);
                db.SubmitChanges();

                //retrive the list from the shopping cart 
                List<Order_list> ol = s.getOrdList();
                Food f;
                //loop all ol to get all the records row 
                foreach (Order_list aol in ol)
                {
                    //set the order id into aol
                    aol.orderId = newOrder.orderId;
                    db.Order_lists.InsertOnSubmit(aol);
                    db.SubmitChanges();

                    //reduce the food 
                    //retrieve the food db
                    f = db.Foods.SingleOrDefault(x => x.foodId == aol.foodId);
                    if (f != null)
                    {
                        f.quantity = f.quantity - aol.quantity;
                        db.SubmitChanges();
                    }
                }

                //clear all the session
                Session["cart"] = null;
                Session["address"] = null;
                Response.Redirect("CheckoutS3.aspx?Id="+ newOrder.orderId);
            }
        }
    }
}