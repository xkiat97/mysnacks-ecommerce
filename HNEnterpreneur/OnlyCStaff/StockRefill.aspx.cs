using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyCStaff
{
    public partial class StockRefill : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
        public static int maxQty = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int foodID, shortage;
            if (Request.QueryString["Id"] != null)
            {
                if(int.TryParse(Request.QueryString["Id"], out foodID))
                {
                    Food f = db.Foods.SingleOrDefault(x => x.foodId == foodID);
                    if(f != null)
                    {
                        maxQty = 0;
                        maxQty = HNEnterpreneurSecurity.getCookAvailable(f.foodId);
                        shortage = f.reservedQty.Value - f.quantity.Value;

                        lblFoodID1.Text = f.foodId.ToString();
                        lblFoodName1.Text = f.name;
                        lblBalance.Text = f.quantity.ToString();
                        lblMax.Text = f.reservedQty.ToString();
                        lblShortage.Text = shortage.ToString();
                        lblAvailable.Text = maxQty.ToString();
                        
                        if(maxQty > shortage)
                        {
                            maxQty = shortage;
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int foodID = int.Parse(lblFoodID1.Text);
            Ingredient i;

            if (db.Ing_lists.Any(x => x.foodID == foodID))
            {
                //add in the quantity
                Food food = db.Foods.SingleOrDefault(x => x.foodId == foodID);
                if(food != null)
                {
                    int qty = int.Parse(txtQtyAdd.Value);
                    int quantityAdd = HNEnterpreneurSecurity.getCookAvailable(foodID);
                    int shortage = food.reservedQty.Value - food.quantity.Value;

                    if (qty <= quantityAdd && qty <= shortage)
                    {
                        food.quantity += qty;
                        db.SubmitChanges();

                        var fooding = from x in db.Ing_lists
                                      where x.foodID == food.foodId
                                      select x;
                        foreach (var f in fooding)
                        {
                            //reduce the ingredient
                            i = db.Ingredients.SingleOrDefault(x => x.ingID == f.ingID);
                            if (i != null)
                            {
                                i.balance -= (f.qtyNeeded * qty);
                            }
                            db.SubmitChanges();
                        }
                        //every done
                        Response.Redirect("index.aspx");
                    }
                }
            }
        }
    }
}