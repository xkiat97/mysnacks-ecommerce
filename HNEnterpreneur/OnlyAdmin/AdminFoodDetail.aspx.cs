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
    public partial class AdminFoodDetail : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 5)
                {

                    //get the value from url, which contains user ID that want to view
                    int foodid = int.Parse(Request.QueryString["Id"]);

                    if (db.Foods.Any(x => x.foodId == foodid))
                    {
                        //retrieve data from linq db
                        Food u = db.Foods.SingleOrDefault(x => x.foodId == foodid);

                        bool status = u.status == 'T' ? true : false;

                        //pull data into web form
                        lblFoodID.Text = u.foodId.ToString();
                        User u1 = db.Users.SingleOrDefault(x1 => x1.userId == u.modifiedUser);
                        hlUserDetail.Text = u1.name;
                        hlUserDetail.NavigateUrl = "AdminAccDetail.aspx?Id=" + u.modifiedUser.ToString();
                        lblModTim.Text = u.modifiedDate.ToShortDateString() + " " + u.modifiedTime.ToString(@"hh\:mm\:ss");
                        lblFoodSts.Text = status ? "Unbanned" : "Banned";
                        lblFoodSts.CssClass = status ? "alert alert-success" : "alert alert-danger";

                        imgupload.Src = "~/Images/FoodImg/" + u.image;
                        txtFoodName.Value = u.name;
                        txtTimeUsed.Value = u.timeUsedSec.ToString();
                        txtQuantity.Value = u.quantity.ToString();
                        txtMQty.Value = u.reservedQty.ToString();
                        txtPrice.Value = String.Format("{0:0.00}", u.price);
                        dlFoodCategory.Text = u.catId.ToString();
                        txtDesc.Value = u.description;


                        //if it is banned, then change button text to unbanned
                        btnBan.Text = status ? "Ban Food" : "Unban Food";

                        //if user wants to view only
                        if (Request.QueryString["M"] == null)
                        {
                            //disable the input tag, so that user cannot modified at here
                            txtFoodName.Disabled = txtTimeUsed.Disabled = txtQuantity.Disabled = txtPrice.Disabled = txtDesc.Disabled = txtMQty.Disabled = true;
                            dlFoodCategory.Enabled = imgInp.Enabled = false;
                        }
                        else
                        {
                            txtFoodName.Disabled = txtTimeUsed.Disabled = txtQuantity.Disabled = txtPrice.Disabled = txtDesc.Disabled = txtMQty.Disabled = false;
                            dlFoodCategory.Enabled = imgInp.Enabled = true;
                            //change the button text to update
                            btnModify.Text = "Update";
                        }
                    }
                    else
                    {
                        //if there are error in get the quere string or record not match
                        //redirect the page
                        Response.Redirect("AdminFoodList.aspx");
                    }
                }
                else
                {
                    //if there are error in get the quere string or record not match
                    //redirect the page
                    Response.Redirect("AdminFoodList.aspx");
                }
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            //if it is going to modify
            //when user click modify button
            if (btnModify.Text == "Modify")
            {
                Response.Redirect("AdminFoodDetail.aspx?M=T&Id=" + lblFoodID.Text);
            }
            else
            {
                //when user click update button
                //this means user want to update to db

                //if there is no any error
                if (Page.IsValid)
                {
                    //check food name exist
                    if (db.Foods.Any(x => x.name.ToLower() == txtFoodName.Value.ToLower() && x.foodId != int.Parse(lblFoodID.Text)))
                    {
                        errname.Text = "<div class='alert alert-danger col-sm-12'>Food name has been used. </div>";
                    }
                    else
                    {

                        //set the user who register this account
                        int registedUserId = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;

                        //get the user id and retrieve data from db
                        Food u = db.Foods.SingleOrDefault(x => x.foodId == int.Parse(lblFoodID.Text));

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
                                if (u.image != "noImg.jpg")
                                {
                                    //remove the file from db
                                    File.Delete(path + u.image);
                                }

                                //save the file to db
                                u.image = filename;
                            }
                            u.description = txtDesc.Value;
                            u.timeUsedSec = int.Parse(txtTimeUsed.Value);
                            u.quantity = int.Parse(txtQuantity.Value);
                            u.reservedQty = int.Parse(txtMQty.Value);
                            u.price = Math.Round(float.Parse(txtPrice.Value), 2);
                            u.status = 'T';
                            //set the modified time & date
                            u.modifiedTime = DateTime.Now.TimeOfDay;
                            u.modifiedDate = DateTime.Now;
                            u.modifiedUser = registedUserId;
                            u.catId = int.Parse(dlFoodCategory.Text.ToString());

                            db.SubmitChanges();
                            Response.Redirect("AdminFoodDetail.aspx?Id=" + u.foodId);
                        }
                    }
                }
            }
        }

        protected void btnBan_Click(object sender, EventArgs e)
        {
            Food u = db.Foods.SingleOrDefault(x => x.foodId == int.Parse(lblFoodID.Text));
            if (u != null)
            {
                u.status = btnBan.Text == "Ban Food" ? 'F' : 'T';

                db.SubmitChanges();
                Response.Redirect("AdminFoodDetail.aspx?Id=" + u.foodId);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminFoodList.aspx");
        }

        protected void btnAnalyst_Click(object sender, EventArgs e)
        {
            Food u = db.Foods.SingleOrDefault(x => x.foodId == int.Parse(lblFoodID.Text));
            if (u != null)
            {
                Response.Redirect("ProductAnalyst.aspx?Id=" + u.foodId);
            }
            Response.Redirect("AdminFoodList.aspx");
        }
    }
}