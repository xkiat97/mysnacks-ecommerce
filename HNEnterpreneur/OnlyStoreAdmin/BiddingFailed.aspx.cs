using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyStoreAdmin
{
    public partial class BiddingFailed : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            var b = from x in db.Biddings
                    where x.status == 'N'
                    select new
                    {
                        x.date,
                        x.Ingredient,
                        x.quantity,
                        x.maxPrice,
                        x.urgency,
                        x.deliveryDate,
                        x.bidID,
                        bidder = "<a href=\"BiddingDetail.aspx?M=R&Id="
                        + x.bidID
                        + "\" class=\"btn btn-sm btn-primary btn-block\">Bid Again</a>"
                    };
            b.OrderBy(x => x.date);
            dlBid.DataSource = b;
            dlBid.DataBind();
        }
    }
}