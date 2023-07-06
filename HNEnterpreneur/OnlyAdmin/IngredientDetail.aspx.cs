using Helpers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class IngredientDetail : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        //this value is for chartData in js
        public string headerjschartData = "<script> var chartData = [ ";
        public string footerjschartData = " ]; </script>";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 6)
                {

                    //get the value from url, which contains user ID that want to view
                    int ingredientid = int.Parse(Request.QueryString["Id"]);

                    if (db.Ingredients.Any(x => x.ingID == ingredientid))
                    {
                        //retrieve data from linq db
                        Ingredient u = db.Ingredients.SingleOrDefault(x => x.ingID == ingredientid);

                        bool status = u.status == 'T' ? true : false;

                        //pull data into web form
                        lblFoodID.Text = u.ingID.ToString();
                        lblFoodSts.Text = status ? "Active" : "Inactive";
                        lblFoodSts.CssClass = status ? "alert alert-success" : "alert alert-danger";

                        imgupload.Src = "~/Images/IngredientImg/" + u.img;
                        txtFoodName.Value = u.name;
                        txtQuantity.Value = u.balance.ToString();
                        selbtTyp.Value = u.balanceType.ToString();
                        txtMPrice.Value = u.marketPrice.ToString();
                        txtDesc.Value = u.desc;


                        //if it is banned, then change button text to unbanned
                        btnBan.Text = status ? "Inactive" : "Active";

                        //if user wants to view only
                        if (Request.QueryString["M"] == null)
                        {
                            //disable the input tag, so that user cannot modified at here
                            txtFoodName.Disabled = txtQuantity.Disabled = txtMPrice.Disabled = txtDesc.Disabled = selbtTyp.Disabled = true;
                            imgInp.Enabled = false;
                        }
                        else
                        {
                            txtFoodName.Disabled = txtQuantity.Disabled = txtMPrice.Disabled = txtDesc.Disabled = selbtTyp.Disabled = false;
                            imgInp.Enabled = true;
                            //change the button text to update
                            btnModify.Text = "Update";
                        }
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

        protected void btnModify_Click(object sender, EventArgs e)
        {
            //if it is going to modify
            //when user click modify button
            if (btnModify.Text == "Modify")
            {
                Response.Redirect("IngredientDetail.aspx?M=T&Id=" + lblFoodID.Text);
            }
            else
            {
                //when user click update button
                //this means user want to update to db

                //if there is no any error
                if (Page.IsValid)
                {
                    //check food name exist
                    if (db.Ingredients.Any(x => x.name.ToLower() == txtFoodName.Value.ToLower() && x.ingID != int.Parse(lblFoodID.Text)))
                    {
                        errname.Text = "<div class='alert alert-danger col-sm-12'>Food name has been used. </div>";
                    }
                    else
                    {

                        //set the user who register this account
                        //int registedUserId = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;

                        //get the user id and retrieve data from db
                        Ingredient u = db.Ingredients.SingleOrDefault(x => x.ingID == int.Parse(lblFoodID.Text));

                        //as long as the records is found
                        if (u != null)
                        {
                            u.name = txtFoodName.Value;
                            if (imgInp.HasFile)
                            {
                                //handle image here
                                string path = MapPath("~/Images/FoodImg/");
                                string filename = Guid.NewGuid().ToString("N") + ".jpg";

                                SimpleImage img = new SimpleImage(imgInp.FileContent);
                                img.Square();
                                img.Resize(400);
                                img.SaveAs(path + filename);

                                //if it is not noImg.jpg, the remove the image
                                if (u.img != "noImg.jpg")
                                {
                                    //remove the file from db
                                    File.Delete(path + u.img);
                                }

                                //save the file to db
                                u.img = filename;
                            }
                            u.desc = txtDesc.Value;
                            u.balance = Math.Round(float.Parse(txtQuantity.Value), 2);
                            u.balanceType = selbtTyp.Value;
                            u.marketPrice = Math.Round(float.Parse(txtMPrice.Value), 2);
                            u.status = 'T';
                            //set the modified time & date
                            //u.modifiedTime = DateTime.Now.TimeOfDay;
                            //u.modifiedDate = DateTime.Now;
                            //u.modifiedUser = registedUserId;

                            db.SubmitChanges();
                            Response.Redirect("IngredientDetail.aspx?Id=" + u.ingID);
                        }
                    }
                }
            }
        }

        protected void btnBan_Click(object sender, EventArgs e)
        {
            Ingredient u = db.Ingredients.SingleOrDefault(x => x.ingID == int.Parse(lblFoodID.Text));
            if (u != null)
            {
                u.status = btnBan.Text == "Inactive" ? 'F' : 'T';

                db.SubmitChanges();
                Response.Redirect("IngredientDetail.aspx?Id=" + u.ingID);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("IngredientList.aspx");
        }

        protected void btnLinkFood_Click(object sender, EventArgs e)
        {
            Response.Redirect("IngredientFoodLink.aspx?Id=" + lblFoodID.Text);
        }

        protected void btnAst_Click(object sender, EventArgs e)
        {
            Response.Redirect("IngredientAnalyst.aspx?Id=" + lblFoodID.Text);
        }
    }
}