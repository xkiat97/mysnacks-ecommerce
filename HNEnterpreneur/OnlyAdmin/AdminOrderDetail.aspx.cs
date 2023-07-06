using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminOrderDetail : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 5)
                {

                    //get the value from url, which contains user ID that want to view
                    int orderid = int.Parse(Request.QueryString["Id"]);

                    if (db.Orders.Any(x => x.orderId == orderid))
                    {
                        //retrieve data from linq db
                        Order u = db.Orders.SingleOrDefault(x => x.orderId == orderid);

                        if (u.status == 'C')
                        {
                            btnBan.Visible = true;
                        }
                        else
                        {
                            btnBan.Visible = false;
                        }
                        //pull data into web form
                        lblOrderId.Text = u.orderId.ToString();
                        if (u.Address.User.userId != 0)
                        {
                            lblMember.Text = "<a href=\"AdminMemDetail.aspx?Id=" + u.Address.User.userId + "\">" + u.Address.User.userId + "</a>";
                        }
                        else
                        {
                            lblMember.Text = "-";
                        }
                        lbldate.Text = u.orderDate.ToShortDateString();
                        lblPrice.Text = u.total.ToString();
                        if (u.status == 'F')
                        {
                            btnBan.Text = "Restore";
                        }
                    }
                }
                else
                {
                    //if there are error in get the quere string or record not match
                    //redirect the page
                    Response.Redirect("AdminOrderList.aspx");
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminOrderList.aspx");
        }
        protected void btnBan_Click(object sender, EventArgs e)
        {
            Order u = db.Orders.SingleOrDefault(x => x.orderId == int.Parse(lblOrderId.Text) && x.status == 'D');
            if (u != null)
            {
                u.status = btnBan.Text == "Restore" ? 'C' : 'F';
                db.SubmitChanges();
            }
            Response.Redirect("AdminOrderDetail.aspx?Id=" + lblOrderId);
        }
    }
}