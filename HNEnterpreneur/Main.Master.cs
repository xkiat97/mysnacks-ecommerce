using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

            User u = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name);
            //if it is logged in
            if (u != null)
            {
                if(u.userType != "Member")
                {
                    Response.Redirect("index.aspx");
                }
                lblUserName.Text = "<i class='fa fa-user-circle-o'></i><a href='ProfileMyOrders.aspx"
                    + "'> " + Page.User.Identity.Name + "</a>"
                    + "<a href='SystemLogout.aspx'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout </a><i class='fa fa-sign-out'></i>";
            }
            else
            {
                lblUserName.Text = "<i class='glyphicon glyphicon-log-in' aria-hidden='true'></i><a href='SystemLogin.aspx'>Login</a>"
                    + "<li><i class='glyphicon glyphicon-book' aria-hidden='true'></i><a href='SystemRegister.aspx'>Register</a></li>";
            }

            //if shopping cart not null
            if(Session["cart"] != null)
            {
                //initialize shopping cart quantity
                lblTotalCart.InnerHtml = "RM " + ((ShoppingCart)Session["cart"]).getTotalShoppingCartAmount().ToString();
                lblCartQty.InnerHtml = ((ShoppingCart)Session["cart"]).getNumberOfItem().ToString();
            }
            else
            {
                lblTotalCart.InnerHtml = "RM 0";
                lblCartQty.InnerHtml = "0";
            }
        }
    }
}