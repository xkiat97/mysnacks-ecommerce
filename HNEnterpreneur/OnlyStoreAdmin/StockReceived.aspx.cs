using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyStoreAdmin
{
    public partial class StockReceived : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //get the transaction id from url
            int traID;
            if (int.TryParse(Request.QueryString["Id"], out traID))
            {
                //check the traID is valid or not and the status is new
                Transaction t = db.Transactions.SingleOrDefault(x => x.traID == traID && x.status == 'N');
                if (t != null)
                {
                    //insert data to transaction 
                    t.receivedTime = DateTime.Now;
                    t.receivedUser = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;
                    t.status = 'D';

                    //check supplier delay day
                    int delayTime = ((DateTime)t.receivedTime).Subtract(HNEnterpreneurSecurity.deliveryDate(t.Quotation.Bidding.deliveryDate, t.Quotation.Bidding.urgency)).Days;

                    //if the day is more than 0 then consider delay, store it in company profile
                    if (delayTime > 0)
                    {
                        t.Quotation.Bidder.delayTime += delayTime;
                    }
                    //increase the quantity of ingredient
                    t.Quotation.Bidding.Ingredient.balance += t.Quotation.quantity;

                    //save the changes
                    db.SubmitChanges();

                }
            }
            //redirect the page to new order
            Response.Redirect("OrderNew.aspx");
        }
    }
}