using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyDStaff
{
    public partial class DSRouting : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
        public static string mapAddresses = "";
        public static string myAddresses = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            mapAddresses = "";
            var add = from x in db.Orders
                      where x.status == 'D'
                      select x;
            int count = 0;
            foreach(var y in add)
            {
                mapAddresses += "{location:'" + "("+ y.orderId +")" +
                    y.Address.line1 + ", " +
                    y.Address.line2 + ", " +
                    y.Address.city + ", " +
                    y.Address.postcode + ", " +
                    y.Address.state + ", " +
                    y.Address.country + 
                    "', stopover: true},";
                count++;
                if(count > 10)
                {
                    break;
                }
            }
            myAddresses = db.Settings.SingleOrDefault(x => x.settingId == 9001).companyAddress;
        }
    }
}