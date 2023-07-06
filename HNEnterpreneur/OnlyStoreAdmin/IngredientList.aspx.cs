using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyStoreAdmin
{
    public partial class IngredientList : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            var i = from x in db.Ingredients
                    where x.status == 'T'
                    select new
                    {
                        x.ingID,
                        x.name,
                        x.desc,
                        x.balance,
                        x.balanceType,
                        balanceRate = HNEnterpreneurSecurity.shortageRate(x.balance, x.ingID),
                        qtyNeed = HNEnterpreneurSecurity.calTotalIngredientNeeded(x.ingID),
                        shortage = HNEnterpreneurSecurity.minus(HNEnterpreneurSecurity.calTotalIngredientNeeded(x.ingID), x.balance)
                    };

            dlIng.DataSource = i;
            dlIng.DataBind();
        }
    }
}