using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class IngredientFoodLink : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 6)
                {
                    //get the value from url, which contains user ID that want to view
                    int ingredientid = int.Parse(Request.QueryString["Id"]);

                    //store ingredient id into session for linking purpose
                    Session["IngredientID"] = ingredientid;
                    Session.Timeout = 24 * 60;
                    Ingredient u = db.Ingredients.SingleOrDefault(x => x.ingID == ingredientid);
                    if (u != null)
                    {
                        //retrieve data from linq db
                        bool status = u.status == 'T' ? true : false;

                        //pull data into web form
                        lblFoodID.Text = u.ingID.ToString();
                        lblFoodName.Text = u.name.ToString();
                        lblFoodSts.Text = status ? "Active" : "Inactive";
                        lblFoodSts.CssClass = status ? "alert alert-success" : "alert alert-danger";

                        //manually bind the unlinked data table
                        var v = from x in db.Foods
                                where x.status == 'T' && !db.Ing_lists.Any(y => y.ingID == ingredientid && y.foodID == x.foodId)
                                select x;
                        dlFood.DataSource = v;
                        dlFood.DataBind();
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
    }
}