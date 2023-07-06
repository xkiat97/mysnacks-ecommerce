using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlySupplier
{
    public partial class DeliveryScheduling : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //get current logined user id
            int userID = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;
            var o = from x in db.Transactions
                    where x.status == 'N' && x.Quotation.usrID == userID && x.Quotation.status == 'A' && x.receivedTime == null
                    select new
                    {
                        x.Quotation,
                        deliveryDate = HNEnterpreneurSecurity.deliveryDate(x.Quotation.Bidding.deliveryDate, x.Quotation.Bidding.urgency),
                        timeLeft = HNEnterpreneurSecurity.timeLeft(x.Quotation.Bidding.deliveryDate, x.Quotation.Bidding.urgency)
                    };
            o.OrderBy(x => x.deliveryDate);
            dlOrd.DataSource = o;
            dlOrd.DataBind();
        }
    }
}