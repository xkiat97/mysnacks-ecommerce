using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class CheckoutS1 : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!db.Users.Any(x => x.email == Page.User.Identity.Name && x.userType == "Member" && x.status == 'T'))
            {
                Response.Redirect("Home.aspx");
            }
            if (!Page.IsPostBack)
            {
                if (Session["cart"] == null)
                {
                    Response.Redirect("Products.aspx");
                }
                else if (((ShoppingCart)Session["cart"]).getNumberOfItem() == 0)
                {
                    Response.Redirect("Products.aspx");
                }

                Address saveAddress = db.Addresses.SingleOrDefault(x => x.User.email == Page.User.Identity.Name && x.status == 'R');
                //insert the user address
                if (Session["address"] != null) 
                {
                    //initial the value
                    Address a = (Address)Session["address"];
                    txtLine1.Value = a.line1;
                    txtLine2.Value = a.line2;
                    txtCity.Value = a.city;
                    txtState.Value = a.state;
                    txtPostcode.Value = a.postcode;
                    txtCountry.Value = a.country;
                    txtphone1.Value = a.contact.Substring(0, 5);
                    txtphone2.Value = a.contact.Substring(5, a.contact.Length - 5);
                    txtName.Value = a.name;
                }else if(saveAddress != null)
                {
                    Address a = saveAddress;
                    txtLine1.Value = a.line1;
                    txtLine2.Value = a.line2;
                    txtCity.Value = a.city;
                    txtState.Value = a.state;
                    txtPostcode.Value = a.postcode;
                    txtCountry.Value = a.country;
                    txtphone1.Value = a.contact.Substring(0, 5);
                    txtphone2.Value = a.contact.Substring(5, a.contact.Length - 5);
                    txtName.Value = a.name;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShoppingCart.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            //validation checking
            if (txtphone2.Value.Length > 8 || txtphone2.Value.Length < 7)
            {
                lblPhoneErr.Visible = true;
            }
            else
            {
                Address a = new Address
                {
                    line1 = txtLine1.Value,
                    line2 = txtLine2.Value,
                    city = txtCity.Value,
                    state = txtState.Value,
                    postcode = txtPostcode.Value,
                    country = txtCountry.Value,
                    contact = txtphone1.Value + txtphone2.Value,
                    name = txtName.Value
                };
                Session["address"] = a;
                //if valid then redirect to next process
                Response.Redirect("CheckoutS2.aspx");
            }
        }
    }
}