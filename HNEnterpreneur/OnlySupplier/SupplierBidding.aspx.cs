using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlySupplier
{
    public partial class SupplierBidding : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //get current logined user id
            int userID = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;
            var q = from x in db.Quotations
                    where x.usrID == userID
                    && x.status == 'T'
                    && x.Bidding.status == 'T'
                    && x.Bidding.deliveryDate >= DateTime.Now
                    && x.quoID == db.Quotations.OrderBy(z => z.price).FirstOrDefault(y => y.bidID == x.bidID).quoID
                    orderby x.date
                    select new
                    {
                        x.date,
                        x.Bidding.Ingredient,
                        x.quantity,
                        x.Bidding.deliveryDate,
                        x.bidID,
                        lowestPrice = x.price,
                        bidder = db.Quotations.Count(y => y.bidID == x.bidID),
                        delivery = HNEnterpreneurSecurity.deliveryDate(x.Bidding.deliveryDate, x.Bidding.urgency),
                        bidded = "<a href=\"SupplierBiddingDetail.aspx?Id="
                        + x.quoID
                        + "\" class=\"btn btn-sm btn-outline-success btn-block\">Details</a>"
                    };
            dlBid.DataSource = q;
            dlBid.DataBind();
        }
    }
}