using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class IngredientFoodEdit : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //get food id from query string
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 6 && Session["IngredientID"] != null)
                {
                    //get the value from url, which contains user ID that want to view
                    int ingredientid = int.Parse(Request.QueryString["Id"]);
                    int foodid = int.Parse(Request.QueryString["Id1"]);
                    //retrieve data from linq db=

                    Ing_list il = db.Ing_lists.SingleOrDefault(x => x.ingID == ingredientid && x.foodID == foodid);

                    if (il != null)
                    {
                        //pull data into web form
                        lblFoodID.Text = il.ingID.ToString();
                        lblFoodName.Text = il.Ingredient.name.ToString();

                        lblFoodID1.Text = il.foodID.ToString();
                        lblFoodName1.Text = il.Food.name.ToString();

                        //initial the value
                        txtQtyUsed.Value = il.qtyNeeded.ToString();
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
            if (Request.QueryString["Id"] != null && Request.QueryString["Id1"] != null)
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
                else
                {
                    //update the db
                    //db dont have the record
                    Ing_list il = db.Ing_lists.SingleOrDefault(x => x.ingID == ingId && x.foodID == foodId);
                    il.qtyNeeded = Math.Round(qty, 2);

                    db.SubmitChanges();
                }
                Response.Redirect("IngredientFoodLink.aspx?Id=" + ingId);
            }
            Response.Redirect("IngredientList.aspx");
        }
        [WebMethod]
        public static void delFood(int ingID, int foodID)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            Ing_list il = db.Ing_lists.SingleOrDefault(x => x.ingID == ingID && x.foodID == foodID);

            if (il != null)
            {
                db.Ing_lists.DeleteOnSubmit(il);
                db.SubmitChanges();
            }
        }
    }
}