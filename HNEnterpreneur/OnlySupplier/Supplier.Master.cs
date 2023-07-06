using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlySupplier
{
    public partial class Supplier : System.Web.UI.MasterPage
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            HNEnterpreneurSecurity.updateBidding();
        }
    }
}