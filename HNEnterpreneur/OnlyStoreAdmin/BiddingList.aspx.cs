using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyStoreAdmin
{
    public partial class BiddingList : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
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
                        bidder = db.Quotations.Count(y => y.bidID == x.bidID)
                    };
            b.OrderBy(x => x.date);
            dlBid.DataSource = b;
            dlBid.DataBind();
        }
    }
}