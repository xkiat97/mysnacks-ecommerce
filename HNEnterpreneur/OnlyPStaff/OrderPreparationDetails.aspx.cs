using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyPStaff
{
    public partial class OrderPreparationDetails : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 8)
                {
                    //get the value from url, which contains user ID that want to view
                    int orderid = int.Parse(Request.QueryString["Id"]);

                    Order u = db.Orders.SingleOrDefault(x => x.orderId == orderid && x.status == 'W');
                    if (u != null)
                    {
                        //pull data into web form
                        lblOrderId.Text = u.orderId.ToString();
                        if (u.Address.User.userId != 0)
                        {
                            lblMember.Text = u.Address.name;
                        }
                        else
                        {
                            lblMember.Text = "-";
                        }
                        lbldate.Text = u.orderDate.ToShortDateString();
                        lblPrice.Text = u.total.ToString();
                    }
                    else
                    {
                        Response.Redirect("index.aspx");
                    }
                }
                else
                {
                    //if there are error in get the quere string or record not match
                    //redirect the page
                    Response.Redirect("index.aspx");
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            int orderId = int.Parse(lblOrderId.Text);
            Order o = db.Orders.SingleOrDefault(x => x.orderId == orderId && x.status == 'W');
            o.status = 'P';
            o.preparationUserId = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId;
            o.preparationDate = DateTime.Now;
            db.SubmitChanges();

            Response.Redirect("index.aspx");
        }
    }
}