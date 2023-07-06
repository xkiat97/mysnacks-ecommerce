using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyPStaff
{
    public partial class PreparationHistory : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] != null)
            {
                int ordID;
                if (int.TryParse(Request.QueryString["Id"], out ordID))
                {
                    string userName = Page.User.Identity.Name;

                    //if the order is made by that particular preparation staff
                    // and it is not exceed the 24hrs
                    // and the status is in P which is still in preparing
                    Order o = db.Orders.SingleOrDefault(x => x.orderId == ordID
                    && x.status == 'P'
                    && x.preparationUserId == db.Users.SingleOrDefault(y => y.email == Page.User.Identity.Name).userId);

                    //if it is a correct user loged in and role
                    User u = db.Users.SingleOrDefault(x => x.email == userName && x.userType == "PStaff");
                    if (o != null && u != null)
                    {
                        o.preparationDate = null;
                        o.preparationUserId = null;
                        o.status = 'W';
                        db.SubmitChanges();
                        Response.Redirect("PreparationHistory.aspx?success=" + ordID);
                    }
                }
                Response.Redirect("PreparationHistory.aspx");
            }
            if (!Page.IsPostBack)
            {
                var s = from x in db.Orders
                        where x.status == 'P' &&
                        x.preparationDate.Value.AddDays(1) >= DateTime.Now &&
                        x.preparationUserId == db.Users.SingleOrDefault(y => y.email == Page.User.Identity.Name).userId
                select new
                        {
                            x.orderId,
                            x.orderDate,
                            x.Address,
                            timeCompleted = x.preparationDate
                        };
                dlPreparation.DataSource = s;
                dlPreparation.DataBind();
            }
        }
    }
}