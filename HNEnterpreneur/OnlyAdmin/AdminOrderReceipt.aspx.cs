using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminOrderReceipt : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            int orderID;

            if (int.TryParse(Request.QueryString["Id"], out orderID))
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
                lblTotal1.Text = lblTotal.Text;
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
                lblEmail.Text = a.User.email;

                lblPDate.Text = o.preparationDate == null ? " - " : o.preparationDate.Value.ToShortDateString();
                lblDDate.Text = o.deliveryDate == null ? " - " : o.deliveryDate.Value.ToShortDateString();

                lblPStaff.Text = o.preparationUserId == null ? " - " : db.Users.SingleOrDefault(x => x.userId == o.preparationUserId).email;
                lblDStaff.Text = o.User == null ? " - " : o.User.email;

                var ordLst = from x in db.Order_lists
                             where x.orderId == orderID
                             select x;
                dlOrderList.DataSource = ordLst;
                dlOrderList.DataBind();
            }
            else
            {
                Response.Redirect("AdminOrderList.aspx");
            }
        }
    }
}