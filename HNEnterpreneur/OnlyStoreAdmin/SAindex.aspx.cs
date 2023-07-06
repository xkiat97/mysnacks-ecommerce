using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyStoreAdmin
{
    public partial class SAindex : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        //this value is for chartData in js
        public string headerjschartData = "<script> var chartData = [ ";
        public string footerjschartData = " ]; </script>";

        //this value is for dataChartPie in js
        public string headerjsdataChartPie = "<script> var dataChartPie = [ ";
        public string footerjsdataChartPie = " ]; </script>";

        //this value is for dataChartPie in js
        public string headerjseventData = "<script> var eventData = [ ";
        public string footerjseventData = " ]; </script>";

        protected void Page_Load(object sender, EventArgs e)
        {
            //initial the value for 4 card
            lblNSupplier.Text = db.Users.Count(x => x.status == 'T' && x.userType == "Supplier").ToString();
            lblNOrder.Text = db.Transactions.Count(x => x.status == 'N' && x.Quotation.status == 'A').ToString();
            lblNBPending.Text = db.Biddings.Count(x => x.status == 'T' && !db.Quotations.Any(y => y.bidID == x.bidID)).ToString();
            lblNBExpired.Text = db.Biddings.Count(x => x.status == 'N').ToString();

            //this section is for ingredient stock level data table
            var i = from x in db.Ingredients
                    where x.status == 'T' && db.Ing_lists.Any(y => y.ingID == x.ingID)
                    select new
                    {
                        x.ingID,
                        x.name,
                        x.balanceType,
                        x.balance,
                        qtyNeeded = HNEnterpreneurSecurity.calTotalIngredientNeeded(x.ingID),
                        shortage = HNEnterpreneurSecurity.shortageRate(x.balance, x.ingID),
                        shortageV = HNEnterpreneurSecurity.minus(HNEnterpreneurSecurity.calTotalIngredientNeeded(x.ingID), x.balance)
                    };
            rchartData.DataSource = i.ToList().OrderBy(x => x.shortage).Take(5);
            rchartData.DataBind();

            dlIng.DataSource = i.ToList().OrderBy(x => x.shortage).Take(5);
            dlIng.DataBind();
            //END THIS

            //this section is for supplier delivery dalay pie chart
            var b = from x in db.Bidders
                    where x.User.status == 'T'
                    select new
                    {
                        title = x.name,
                        value = x.delayTime
                    };

            rdataChartPie.DataSource = b;
            rdataChartPie.DataBind();
            //END THIS

            //this section is for event calendar
            var t = from x in db.Transactions
                    where x.status == 'N'
                    select new
                    {
                        x.Quotation.Bidding.quantity,
                        x.Quotation.Bidding.Ingredient.balanceType,
                        title = x.Quotation.Bidding.Ingredient.name,
                        start = HNEnterpreneurSecurity.deliveryDate(x.Quotation.Bidding.deliveryDate, x.Quotation.Bidding.urgency).AddDays(1).ToShortDateString(),
                        url = "OrderNew.aspx"
                    };
            reventData.DataSource = t;
            reventData.DataBind();
            //END THIS
        }
        
    }
}