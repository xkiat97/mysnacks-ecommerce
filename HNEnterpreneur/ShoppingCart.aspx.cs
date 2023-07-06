using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class ShoppingCart1 : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
        double charge = 10.00;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["cart"] == null || !db.Members.Any(x => x.User.email == Page.User.Identity.Name))
                {
                    Response.Redirect("Products.aspx?q=noId");
                }
                else if (((ShoppingCart)Session["cart"]).getNumberOfItem() == 0)
                {
                    Response.Redirect("Products.aspx?q=noQty");
                }

                //START OF SHOPPING CART
                float totalAmount = 0;
                ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["cart"];
                if (cart == null)
                {
                    //create a new cart
                    cart = new ShoppingCart();
                }

                //save to session
                HttpContext.Current.Session["cart"] = cart;
                if (Session["cart"] != null)
                {
                    ShoppingCart c = (ShoppingCart)Session["cart"];
                    List<Order_list> ol = c.getOrdList();
                    List<Food> f = new List<Food>();

                    foreach (Order_list no in ol)
                    {
                        if (db.Foods.Any(x => x.foodId == no.foodId))
                        {
                            Food nf = db.Foods.SingleOrDefault(x => x.foodId == no.foodId);
                            Food nf1 = new Food
                            {
                                foodId = nf.foodId,
                                name = nf.name,
                                image = nf.image,
                                quantity = no.quantity,
                                description = no.description,
                                price = nf.price
                            };
                            totalAmount += (float)(nf1.price * nf1.quantity);
                            f.Add(nf1);
                        }
                    }
                    dlCart.DataSource = f;
                    dlCart.DataBind();

                    //insert discount option
                    //get member point
                    Setting s = db.Settings.SingleOrDefault(x => x.settingId == 9001);

                    int point = db.Members.SingleOrDefault(x => x.User.email == Page.User.Identity.Name).point;
                    double[] voucher = { 0, 5, 15, 30 };
                    List<double> v = new List<double>();

                    foreach (double i in voucher)
                    {
                        if (i > point * s.setCashPerPoint || i > (c.getTotalShoppingCartAmount() + charge))
                        {
                            break;
                        }
                        v.Add(i);
                    }
                    ddlDiscount.DataSource = v;
                    ddlDiscount.DataBind();
                    ddlDiscount.SelectedValue = c.discountPrice.ToString();

                    lblSubTotal.Text = String.Format("{0:0.00}", totalAmount);
                    lblCharge.Text = String.Format("{0:0.00}", charge);
                    lblTotal.Text = String.Format("{0:0.00}", totalAmount + charge);
                    txtTotal.Value = lblTotal.Text;
                }
                //END OF SHOPPING CART
            }
        }

        protected void btnChkOut_Click(object sender, EventArgs e)
        {
            ShoppingCart c = (ShoppingCart)Session["cart"];
            c.discountPrice = double.Parse(ddlDiscount.SelectedValue);
            c.chargePrice = charge;
            Response.Redirect("CheckoutS1.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }
    }
}