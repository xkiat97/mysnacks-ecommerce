using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlySupplier
{
    public partial class SupplierBiddingAdd : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //get the quere value from url
                bool success = Request.QueryString["success"] == "true" ? true : false;

                //if success, then prompt a message
                if (success)
                {
                    lblSuccess.Text = "<div class='alert alert-success'>Register Successfully.</div>";
                }

                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 6)
                {
                    //get the value from url, which contains user ID that want to view
                    int bidID = int.Parse(Request.QueryString["Id"]);
                    Bidding u = db.Biddings.SingleOrDefault(x => x.bidID == bidID && x.status == 'T');

                    if (u != null)
                    {
                        //retrieve data from linq db
                        bool status = u.status == 'T' ? true : false;

                        //pull data into web form
                        lblBidId.Text = u.bidID.ToString();

                        //initialize max price as a starting lowest price
                        double lowestPrice = u.maxPrice;

                        //check whether exist other lower price
                        Quotation q = db.Quotations.OrderBy(x => x.price).FirstOrDefault(x => x.bidID == u.bidID);
                        if (q != null)
                        {
                            lowestPrice = q.price;
                        }

                        //initialize ingredient profile
                        imgIngImg.Src = "~/Images/IngredientImg/" + u.Ingredient.img;
                        lblIngId.Text = u.Ingredient.ingID.ToString();
                        lblIngName.Text = u.Ingredient.name;
                        lblDesc.Text = u.Ingredient.desc;

                        //initialize bidding details
                        lblEndDate.Text = u.deliveryDate.ToString();
                        lblDeliveryDate.Text = HNEnterpreneurSecurity.deliveryDate(u.deliveryDate, u.urgency).ToLongDateString();
                        lblBDesc.Text = u.desc;
                        lblLowPrice.Text = lowestPrice.ToString();
                        lblQty.Text = u.quantity.ToString() + " " + u.Ingredient.balanceType;

                        //initialize bidder price
                        rvBidPrice.ErrorMessage = "The price must between 0.01 and " + (lowestPrice - 0.01).ToString();
                        rvBidPrice.MinimumValue = "0.01";
                        rvBidPrice.MaximumValue = (lowestPrice - 0.01).ToString();
                        txtBidPrice.Value = (lowestPrice - 0.01).ToString();
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

        protected void btnBid_Click(object sender, EventArgs e)
        {
            int bidID;
            int usrID = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;

            if (Page.IsValid && int.TryParse(lblBidId.Text, out bidID))
            {
                Bidding b = db.Biddings.SingleOrDefault(x => x.bidID == bidID && x.status == 'T');
                if (b != null && !db.Quotations.Any(x => x.usrID == usrID && x.bidID == bidID))
                {
                    //create new object
                    Quotation q = new Quotation
                    {
                        date = DateTime.Now,
                        quantity = b.quantity,
                        price = Math.Round(float.Parse(txtBidPrice.Value)),
                        status = 'T',
                        bidID = bidID,
                        usrID = usrID,
                        desc = txtDesc.Value
                    };
                    db.Quotations.InsertOnSubmit(q);
                    db.SubmitChanges();

                    Response.Redirect("SupplierBiddingAdd.aspx?success=true");

                }
            }
            Response.Redirect("BiddingAvailable.aspx");
        }
    }
}