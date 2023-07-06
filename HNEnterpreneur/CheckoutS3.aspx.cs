using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class CheckoutS3 : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!db.Users.Any(x => x.email == Page.User.Identity.Name && x.userType == "Member" && x.status == 'T'))
            {
                Response.Redirect("Home.aspx");
            }
            int orderID;

            if(int.TryParse(Request.QueryString["Id"], out orderID))
            {
                User usr = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name);

                //company details
                Setting setting = db.Settings.SingleOrDefault(x => x.settingId == 9001);
                lblCompanyAddress.Text = setting.companyAddress;
                lblCompanyEmail.Text = setting.companyEmail;
                lblCompanyName.Text = setting.companyName;
                lblCompanyPhone.Text = setting.companyPhone;

                //order details
                Order o = db.Orders.SingleOrDefault(x => x.orderId == orderID);
                lblCharges.Text = String.Format("{0:0.00}", o.charges);
                lblDiscount.Text = String.Format("{0:0.00}", o.discountPrice);
                lblDate.Text = o.orderDate.ToShortDateString();
                lblSubTotal.Text = String.Format("{0:0.00}", o.total);
                lblTotal.Text = String.Format("{0:0.00}", o.total + o.charges - o.discountPrice);
                lblOrderId.Text = o.orderId.ToString();

                //order address details
                Address a = o.Address;
                lblAddress.Text = a.line1
                    + "<br />"
                    + a.line2
                    + "<br />"
                    + a.city
                    + "<br />"
                    + a.state
                    + "<br />"
                    + a.postcode
                    + "<br />"
                    + a.country
                    + "<br />";
                lblName.Text = a.name;
                lblPhone.Text = a.contact;

                var ordLst = from x in db.Order_lists
                             where x.orderId == orderID
                             select x;
                dlOrderList.DataSource = ordLst;
                dlOrderList.DataBind();
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
}