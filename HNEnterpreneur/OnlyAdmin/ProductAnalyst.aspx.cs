using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class ProductAnalyst : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
        public string AGorderdemandDATA = "";
        public string PCIngDATA = "";
        public string PCIngPriceDATA = "";
        public string PCHotSalesAreaDATA = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 6)
                {
                    //get the value from url, which contains user ID that want to view
                    int foodId;
                    if (int.TryParse(Request.QueryString["Id"], out foodId))
                    {
                        Food f = db.Foods.SingleOrDefault(x => x.foodId == foodId);
                        if(f != null)
                        {
                            double ProducedCosts = 0;
                            double sellingPrice = f.price;
                            //for order demand
                            var AGorderdemandDATAG = from x in db.Order_lists
                                                     where x.foodId == f.foodId
                                                     group x by new { x.Order.orderDate.Date } into g
                                                     select new
                                                     {
                                                         date = g.Key.Date,
                                                         value = g.Sum(y => y.quantity)
                                                     };
                            foreach (var a in AGorderdemandDATAG)
                            {
                                AGorderdemandDATA += "{\"date\": \"" + a.date.ToShortDateString() + " \", \"value\": " + a.value + "},";
                            }

                            //for ingredient list
                            var PCIngDATAG = from x in db.Ing_lists
                                             where x.foodID == f.foodId
                                             select x;
                            foreach (var a in PCIngDATAG)
                            {
                                PCIngDATA += "{\"name\": \"" + a.Ingredient.name + " \", \"value\": " + a.qtyNeeded + "},";
                            }

                            //for ingredient value
                            var PCIngPriceDATAG = from x in db.Ing_lists
                                                  where x.foodID == f.foodId
                                                  select new
                                                  {
                                                      x.Ingredient.name,
                                                      value = (x.qtyNeeded * x.Ingredient.marketPrice)
                                                  };
                            foreach (var a in PCIngPriceDATAG)
                            {
                                PCIngPriceDATA += "{\"name\": \"" + a.name + " \", \"value\": " + a.value + "},";
                                //sum up all the price
                                ProducedCosts += a.value.Value;
                            }

                            //for hot selling areas
                            var PCHotSalesAreaDATAG = from x in db.Order_lists
                                                  where x.foodId == f.foodId
                                                  group x by new { x.Order.Address.state } into g
                                                  select new
                                                  {
                                                      name = g.Key.state,
                                                      value = g.Sum(y => y.quantity)
                                                  };
                            foreach (var a in PCHotSalesAreaDATAG)
                            {
                                PCHotSalesAreaDATA += "{\"name\": \"" + a.name + " \", \"value\": " + a.value + "},";
                            }

                            lblPCost.Text = Math.Round(ProducedCosts, 2).ToString("0.00");
                            lblPEarn.Text = Math.Round(sellingPrice - ProducedCosts, 2).ToString("0.00");
                            lblSPrice.Text = Math.Round(sellingPrice).ToString("0.00");
                        }
                        else
                        {
                            Response.Redirect("AdminFoodList.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect("AdminFoodList.aspx");
                    }
                }
                else
                {
                    Response.Redirect("AdminFoodList.aspx");
                }
            }
        }
    }
}