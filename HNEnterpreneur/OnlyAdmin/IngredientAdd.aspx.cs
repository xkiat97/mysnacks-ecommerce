using Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class IngredientAdd : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //get the quere value from url
            bool success = Request.QueryString["success"] == "true" ? true : false;

            //if success, then prompt a message
            if (success && !Page.IsPostBack)
            {
                lblSuccess.Text = "<div class='alert alert-success'>Register Successfully.</div>";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (db.Ingredients.Any(x => x.name.ToLower() == txtFoodName.Value.ToLower()))
                {
                    errname.Text = "<div class='alert alert-danger col-sm-12'>Ingredient name has been used. </div>";
                }
                else
                {
                    //set the user who register this account
                    int registedUserId = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;

                    //default a file name
                    string filename = "noImg.jpg";

                    //if the image is contain value
                    if (imgInp.HasFile)
                    {
                        //handle image here
                        string path = MapPath("~/Images/IngredientImg/");
                        filename = Guid.NewGuid().ToString("N") + ".jpg";

                        SimpleImage img = new SimpleImage(imgInp.FileContent);
                        img.Square();
                        img.Resize(400);
                        img.SaveAs(path + filename);
                    }

                    // create object to store all the user information
                    Ingredient i = new Ingredient
                    {
                        name = txtFoodName.Value,
                        img = filename,
                        desc = txtDesc.Value,
                        balance = Math.Round(float.Parse(txtQuantity.Value), 2),
                        balanceType = selbtTyp.Value,
                        marketPrice = Math.Round(float.Parse(txtMPrice.Value), 2),
                        status = 'T'
                        //set the modified time & date
                        //modifiedTime = DateTime.Now.TimeOfDay,
                        //modifiedDate = DateTime.Now,
                        //modifiedUser = registedUserId,
                        //catId = int.Parse(dlFoodCategory.Text.ToString())
                    };

                    // save entire new registed user object into database
                    db.Ingredients.InsertOnSubmit(i);
                    db.SubmitChanges();

                    //redirect page
                    Response.Redirect("IngredientAdd.aspx?success=true");
                }
            }
            else
            {
                Response.Redirect("IngredientList.aspx");
            }
        }
    }
}