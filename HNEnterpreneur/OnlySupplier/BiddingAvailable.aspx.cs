using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlySupplier
{
    public partial class BiddingAvailable : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //get current logined user id
            int userID = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;
            var b = from x in db.Biddings
                    where x.status == 'T' && x.deliveryDate >= DateTime.Now
                    select new
                    {
                        x.date,
                        x.Ingredient,
                        x.quantity,
                        x.maxPrice,
                        x.urgency,
                        x.deliveryDate,
                        x.bidID,
                        lowestPrice = HNEnterpreneurSecurity.lowPrice(x.bidID),
                        bidder = db.Quotations.Count(y => y.bidID == x.bidID),
                        delivery = HNEnterpreneurSecurity.deliveryDate(x.deliveryDate, x.urgency),
                        bidded = db.Quotations.Any(y => y.bidID == x.bidID && y.usrID == userID && y.status == 'T') ?
                        "<a href=\"SupplierBiddingDetail.aspx?Id="
                        + db.Quotations.FirstOrDefault(y => y.bidID == x.bidID && y.usrID == userID && y.status == 'T').quoID
                        + "\" class=\"btn btn-sm btn-outline-warning btn-block\">Bidded</a>" :
                        "<a href=\"SupplierBiddingAdd.aspx?Id=" + x.bidID + "\" class=\"btn btn-sm btn-outline-primary btn-block\">Bid It</a>"
                    };
            b.OrderBy(x => x.date);
            dlBid.DataSource = b;
            dlBid.DataBind();
        }
    }
}