using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyStoreAdmin
{
    public partial class BiddingDetail : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 6)
                {
                    //get the value from url, which contains user ID that want to view
                    int bidID = int.Parse(Request.QueryString["Id"]);
                    Bidding u = db.Biddings.SingleOrDefault(x => x.bidID == bidID);

                    if (u != null)
                    {
                        lblBidId.Text = u.bidID.ToString();

                        //initialize ingredient profile
                        imgIngImg.Src = "~/Images/IngredientImg/" + u.Ingredient.img;
                        lblIngId.Text = u.Ingredient.ingID.ToString();
                        lblIngName.Text = u.Ingredient.name;
                        lblBalance.Text = u.Ingredient.balance.ToString() + " " + u.Ingredient.balanceType;
                        lblmPrice.Text = u.Ingredient.marketPrice.ToString();
                        lblDesc.Text = u.Ingredient.desc;

                        //initialize bidding details
                        txtMaxPrice.Value = u.maxPrice.ToString();
                        txtQuantity.Value = u.quantity.ToString();
                        txtDateTime.Value = u.deliveryDate.ToString("MM/dd/yyyy h:mm tt");
                        selUrgency.Value = u.urgency;
                        txtDesc.Value = u.desc;

                        //retrieve data from linq db
                        bool status = u.status == 'T' ? true : false;
                        //if it is banned, then change button text to unbanned
                        btnBan.Text = u.status == 'F' ? "Restore" : "Remove";

                        //if it is a non user expired bidding
                        if (u.status == 'N')
                        {
                            //pull data into web form
                            lblBidStatus.Text = "Expired";
                            lblBidStatus.CssClass = "alert alert-danger";
                            btnBidder.InnerText = "No Bidder";
                            btnBidder.Disabled = true;
                        }
                        else
                        {
                            //pull data into web form
                            lblBidStatus.Text = status ? "Active" : "Inactive";
                            lblBidStatus.CssClass = status ? "alert alert-success" : "alert alert-danger";

                            //initialize button
                            btnBidder.InnerText = "Bidder(" + db.Quotations.Count(y => y.bidID == u.bidID).ToString() + ")";
                        }

                        //if user wants to view only
                        if (Request.QueryString["M"] == null)
                        {
                            //disable the input tag, so that user cannot modified at here
                            txtMaxPrice.Disabled = txtQuantity.Disabled = txtDateTime.Disabled = txtDesc.Disabled = selUrgency.Disabled = true;
                        }
                        else
                        {
                            if (Request.QueryString["M"] == "R")
                            {
                                //if it is re bid status then clear the date input text
                                txtDateTime.Value = "";
                            }
                            txtMaxPrice.Disabled = txtQuantity.Disabled = txtDateTime.Disabled = txtDesc.Disabled = selUrgency.Disabled = false;
                            //change the button text to update
                            btnModify.Text = "Update";
                        }

                        //if it is a history which cant be edited
                        if (u.status == 'D')
                        {
                            //hide and disable the button
                            btnModify.Enabled = btnBan.Enabled = false;
                            btnModify.Visible = btnBan.Visible = false;
                            script.InnerHtml = "<script>$(document).ready(function (){$(\".bidRemove\").css(\"display\", \"none\");}); </script>";

                            lblBidStatus.Text = "Complete";
                            lblBidStatus.CssClass = "alert alert-success";
                        }
                    }
                    else
                    {
                        //if there are error in get the quere string or record not match
                        //redirect the page
                        Response.Redirect("BiddingList.aspx");
                    }
                }
                else
                {
                    //if there are error in get the quere string or record not match
                    //redirect the page
                    Response.Redirect("BiddingList.aspx");
                }
            }
        }
        protected void btnModify_Click(object sender, EventArgs e)
        {
            //if it is going to modify
            //when user click modify button
            if (btnModify.Text == "Modify")
            {
                Response.Redirect("BiddingDetail.aspx?M=T&Id=" + lblBidId.Text);
            }
            else
            {
                //when user click update button
                //this means user want to update to db

                //if there is no any error
                if (Page.IsValid)
                {
                    //set the user who register this account
                    //int registedUserId = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;

                    //get the user id and retrieve data from db
                    Bidding u = db.Biddings.SingleOrDefault(x => x.bidID == int.Parse(lblBidId.Text));

                    //as long as the records is found
                    if (u != null)
                    {
                        //initialize bidding details
                        u.maxPrice = Math.Round(float.Parse(txtMaxPrice.Value), 2);
                        u.quantity = Math.Round(float.Parse(txtQuantity.Value));
                        u.deliveryDate = DateTime.ParseExact(txtDateTime.Value, "MM/dd/yyyy h:mm tt", new CultureInfo("en-US"));
                        u.urgency = selUrgency.Value;
                        u.desc = txtDesc.Value;
                        u.status = 'T';
                        //set the modified time & date
                        //u.modifiedTime = DateTime.Now.TimeOfDay;
                        //u.modifiedDate = DateTime.Now;
                        //u.modifiedUser = registedUserId;

                        db.SubmitChanges();
                        Response.Redirect("BiddingDetail.aspx?Id=" + u.bidID);
                    }
                }
            }
        }

        protected void btnBan_Click(object sender, EventArgs e)
        {
            Bidding u = db.Biddings.SingleOrDefault(x => x.bidID == int.Parse(lblBidId.Text));
            if (u != null)
            {
                u.status = btnBan.Text == "Remove" ? 'F' : 'T';

                db.SubmitChanges();
                Response.Redirect("BiddingDetail.aspx?Id=" + u.bidID);
            }
        }
        [WebMethod]
        public static void delQuo(int quoID)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
            Quotation q = db.Quotations.SingleOrDefault(x => x.quoID == quoID);

            if (q != null)
            {
                db.Quotations.DeleteOnSubmit(q);
                db.SubmitChanges();
            }
        }
    }
}