using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlySupplier
{
    public partial class SupplierOrderHistory : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //get current logined user id
            int userID = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;
            var o = from x in db.Transactions
                    where x.status == 'D' && x.Quotation.usrID == userID && x.Quotation.status == 'A' && x.receivedTime != null
                    select new
                    {
                        x.Quotation,
                        x.receivedTime,
                        deliveryDate = HNEnterpreneurSecurity.deliveryDate(x.Quotation.Bidding.deliveryDate, x.Quotation.Bidding.urgency).ToShortDateString()
                    };
            dlOrd.DataSource = o;
            dlOrd.DataBind();
        }
    }
}