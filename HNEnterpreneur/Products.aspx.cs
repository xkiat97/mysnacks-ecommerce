using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class Products : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] == null)
                {
                    script.InnerHtml = "<script>$('#all').addClass('active');</script>";
                }
                else
                {
                    script.InnerHtml = "<script>$('#" + Request.QueryString["Id"] + "').addClass('active');</script>";
                }
                if (Request.QueryString["Id"] != null && db.Categories.Any(x => x.catId == int.Parse((Request.QueryString["Id"]))))
                {
                    //retrieve category id
                    int catid = int.Parse((Request.QueryString["Id"]));
                    var food = from s in db.Foods
                               where s.catId == catid && s.status == 'T'
                               select new
                               {
                                   s.foodId,
                                   s.image,
                                   s.name,
                                   s.price
                               };
                    lvFood.DataSource = food;
                }
                else
                {
                    //this is for default, all selection
                    var food = from s in db.Foods
                               where s.status == 'T' && s.Category.status == 'T' && s.quantity > 0
                               select new
                               {
                                   s.foodId,
                                   s.image,
                                   s.name,
                                   s.price
                               };
                    lvFood.DataSource = food;
                }
                lvFood.DataBind();
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

            //extend the session time
            Session.Timeout = 1440;
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
            }
            lblTotalAmount.Text = String.Format("{0:0.00}", totalAmount);
            //END OF SHOPPING CART
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            //clear the cart, clear the session
            Session["cart"] = null;
            Response.Redirect("Products.aspx");
        }

        protected void btnChkOut_Click(object sender, EventArgs e)
        {
            if(Session["cart"] != null)
            {
                if(((ShoppingCart)Session["cart"]).getNumberOfItem() != 0)
                {
                    //does not contain any product
                    Response.Redirect("ShoppingCart.aspx");
                }
            }
            else
            {
                Response.Redirect("ShoppingCart.aspx");
            }
        }

        [WebMethod]
        public static string getFoodDetails(int foodId)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            if (db.Foods.Any(x => x.foodId == foodId))
            {
                Food f = db.Foods.SingleOrDefault(x => x.foodId == foodId);
                Food newFood = new Food
                {
                    foodId = f.foodId,
                    name = f.name,
                    image = f.image,
                    description = f.description,
                    quantity = f.quantity,
                    price = f.price,
                    timeUsedSec = f.timeUsedSec
                };
                return JsonConvert.SerializeObject(newFood);
            }
            else
            {
                return null;
            }
        }

        [WebMethod]
        public static void addToCart(int id, int qty, string desc)
        {
            ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["cart"];
            if (cart == null)
            {
                //create a new cart
                cart = new ShoppingCart();
            }

            //add to cart
            cart.addItem(id, qty, desc);

            //save to session
            HttpContext.Current.Session["cart"] = cart;
        }

        [WebMethod]
        public static void uptToCart(int id, int qty, string desc)
        {
            ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["cart"];
            if (cart != null)
            {
                cart.updateItem(id, qty, desc);
            }

            //save to session
            HttpContext.Current.Session["cart"] = cart;
        }

        [WebMethod]
        public static void delToCart(int id)
        {
            ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["cart"];
            if (cart != null)
            {
                cart.removeItem(id);
            }

            //save to session
            HttpContext.Current.Session["cart"] = cart;
        }

        [WebMethod]
        public static string getCartDetails(int id)
        {
            ShoppingCart cart = (ShoppingCart)HttpContext.Current.Session["cart"];
            if (cart != null)
            {
                Order_list ordLst = cart.getOrderListById(id);
                if (ordLst != null)
                {
                    return JsonConvert.SerializeObject(ordLst);
                }
            }
            return null;
        }

        [WebMethod]
        public static void SetFaceVerifyResult(string id, string identical, string confidence)
        {
            string[] imgVerify = { id, identical, confidence };
            HttpContext.Current.Session["imgVerify"] = imgVerify;
        }
    }
}