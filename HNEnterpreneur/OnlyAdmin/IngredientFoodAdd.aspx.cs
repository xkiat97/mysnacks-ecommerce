using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class IngredientFoodAdd : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //get food id from query string
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 5 && Session["IngredientID"] != null)
                {
                    //get the value from url, which contains user ID that want to view
                    int ingredientid = int.Parse(Session["IngredientID"].ToString());
                    int foodid = int.Parse(Request.QueryString["Id"]);

                    //retrieve data from linq db
                    Ingredient i = db.Ingredients.SingleOrDefault(x => x.ingID == ingredientid);
                    Food f = db.Foods.SingleOrDefault(x => x.foodId == foodid);

                    if (i != null && f != null)
                    {
                        //pull data into web form
                        lblFoodID.Text = i.ingID.ToString();
                        lblFoodName.Text = i.name.ToString();

                        lblFoodID1.Text = f.foodId.ToString();
                        lblFoodName1.Text = f.name.ToString();
                    }
                    else
                    {
                        //if there are error in get the quere string or record not match
                        //redirect the page
                        Response.Redirect("IngredientList.aspx");
                    }
                }
                else
                {
                    //if there are error in get the quere string or record not match
                    //redirect the page
                    Response.Redirect("IngredientList.aspx");
                }
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int ingId = int.Parse(lblFoodID.Text);
            int foodId = int.Parse(lblFoodID1.Text);
            float qty = float.Parse(txtQtyUsed.Value);

            if (!db.Ing_lists.Any(x => x.ingID == ingId && x.foodID == foodId))
            {
                //insert into DB
                Ing_list il = new Ing_list
                {
                    ingID = ingId,
                    foodID = foodId,
                    qtyNeeded = Math.Round(qty, 2)
                };

                db.Ing_lists.InsertOnSubmit(il);
                db.SubmitChanges();
            }
            Response.Redirect("IngredientFoodLink.aspx?Id=" + ingId);
        }
    }
}