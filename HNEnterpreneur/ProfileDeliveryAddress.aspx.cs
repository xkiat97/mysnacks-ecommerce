using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class ProfileDeliveryAddress : System.Web.UI.Page
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
                Address saveAddress = db.Addresses.SingleOrDefault(x => x.User.email == Page.User.Identity.Name && x.status == 'R');
                //initial the user address
                if (saveAddress != null)
                {
                    //initial the value
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Address saveAddress = db.Addresses.SingleOrDefault(x => x.User.email == Page.User.Identity.Name && x.status == 'R');
            Address a = new Address
            {
                line1 = txtLine1.Value,
                line2 = txtLine2.Value,
                city = txtCity.Value,
                state = txtState.Value,
                postcode = txtPostcode.Value,
                country = txtCountry.Value,
                contact = txtphone1.Value + txtphone2.Value,
                name = txtName.Value,
                status = 'R',
                memId = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId
            };
            if (saveAddress != null)
            {
                saveAddress.line1 = a.line1;
                saveAddress.line2 = a.line2;
                saveAddress.city = a.city;
                saveAddress.state = a.state;
                saveAddress.postcode = a.postcode;
                saveAddress.country = a.country;
                saveAddress.contact = a.contact;
                saveAddress.name = a.name;
            }
            else
            {
                db.Addresses.InsertOnSubmit(a);
            }
            db.SubmitChanges();
        }
    }
}