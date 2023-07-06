using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlySupplier
{
    public partial class SupplierBiddingDetail : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 6)
                {
                    //get the value from url, which contains user ID that want to view
                    int quoID = int.Parse(Request.QueryString["Id"]);
                    double priceReduce = 0.10;
                    //set the html a quotation id in hidden field
                    txtQuoId.Value = quoID.ToString();

                    //status t = it is bidding, a = accept by customer, r = reject by customer
                    Quotation u = db.Quotations.SingleOrDefault(x => x.quoID == quoID && x.status == 'T' && x.Bidding.status == 'T');

                    if (u != null)
                    {
                        //pull data into web form
                        lblBidId.Text = u.bidID.ToString();

                        //initialize max price as a starting lowest price
                        double lowestPrice = u.Bidding.maxPrice;

                        //check whether exist other lower price
                        Quotation q = db.Quotations.OrderBy(x => x.price).FirstOrDefault(x => x.bidID == u.bidID);
                        if (q != null)
                        {
                            lowestPrice = q.price;
                        }

                        //retrieve data from linq db
                        //if it is the lowest price quotation, display it win
                        bool status = quoID == q.quoID ? true : false;

                        //pull data into web form
                        lblBidStatus.Text = status ? "Owned" : "Unowned";
                        lblBidStatus.CssClass = status ? "alert alert-success" : "alert alert-danger";

                        //initialize ingredient profile
                        imgIngImg.Src = "~/Images/IngredientImg/" + u.Bidding.Ingredient.img;
                        lblIngId.Text = u.Bidding.Ingredient.ingID.ToString();
                        lblIngName.Text = u.Bidding.Ingredient.name;
                        lblDesc.Text = u.Bidding.Ingredient.desc;

                        //initialize bidding details
                        lblEndDate.Text = u.Bidding.deliveryDate.ToString();
                        lblDeliveryDate.Text = HNEnterpreneurSecurity.deliveryDate(u.Bidding.deliveryDate, u.Bidding.urgency).ToShortDateString();
                        lblBDesc.Text = u.desc;
                        lblLowPrice.Text = lowestPrice.ToString();
                        lblQty.Text = u.quantity.ToString() + " " + u.Bidding.Ingredient.balanceType;

                        double max = u.Bidding.maxPrice;
                        Quotation q1 = db.Quotations.OrderBy(x => x.price).FirstOrDefault(x => x.bidID == u.bidID && x.quoID != quoID);
                        if (q1 != null)
                        {
                            max = q1.price - priceReduce;
                        }

                        //initialize bidder price
                        rvBidPrice.ErrorMessage = "Price must between 0.01 and " + max.ToString();
                        rvBidPrice.MinimumValue = "0.01";
                        //and also escape the same quo id
                        rvBidPrice.MaximumValue = max.ToString();
                        txtBidPrice.Value = u.price.ToString();
                        txtDesc.Value = u.desc;

                        //for update purpose
                        //if user wants to view only
                        if (Request.QueryString["M"] == null)
                        {
                            //disable the input tag, so that user cannot modified at here
                            txtBidPrice.Disabled = txtDesc.Disabled = true;
                            rvBidPrice.Enabled = false;
                        }
                        else
                        {
                            txtBidPrice.Disabled = txtDesc.Disabled = false;
                            rvBidPrice.Enabled = true;

                            //change the button text to update
                            btnModify.Text = "Update";
                        }
                    }
                    else
                    {
                        //if there are error in get the quere string or record not match
                        //redirect the page
                        Response.Redirect("BiddingAvailable.aspx");
                    }
                }
                else
                {
                    //if there are error in get the quere string or record not match
                    //redirect the page
                    Response.Redirect("BiddingAvailable.aspx");
                }
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            //if it is going to modify
            //when user click modify button
            if (btnModify.Text == "Modify")
            {
                Response.Redirect("SupplierBiddingDetail.aspx?M=T&Id=" + txtQuoId.Value);
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
                    Quotation u = db.Quotations.SingleOrDefault(x => x.quoID == int.Parse(txtQuoId.Value));

                    //as long as the records is found
                    if (u != null)
                    {
                        //initialize bidding details
                        u.date = DateTime.Now;
                        u.price = Math.Round(float.Parse(txtBidPrice.Value), 2);
                        u.desc = txtDesc.Value;
                        u.status = 'T';
                        //set the modified time & date
                        //u.modifiedTime = DateTime.Now.TimeOfDay;
                        //u.modifiedDate = DateTime.Now;
                        //u.modifiedUser = registedUserId;

                        db.SubmitChanges();
                        Response.Redirect("SupplierBiddingDetail.aspx?Id=" + u.quoID);
                    }
                }
            }
        }

        protected void btnBan_Click(object sender, EventArgs e)
        {
            Quotation u = db.Quotations.SingleOrDefault(x => x.quoID == int.Parse(txtQuoId.Value));
            if (u != null)
            {
                db.Quotations.DeleteOnSubmit(u);
                db.SubmitChanges();
                Response.Redirect("SupplierBiddingDetail.aspx?Id=" + txtQuoId.Value);
            }
            Response.Redirect("BiddingAvailable.aspx?Id=" + u.quoID);
        }
    }
}