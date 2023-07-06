using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class IngredientAnalyst : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        //this value is for chartData in js
        public string headerjschartData = "<script> var chartData = [ ";
        public string footerjschartData = " ]; </script>";
        public string flowOfPriceChartData = "";
        public string monthlyOrderChartData = "";
        public string soldByCompanyChartData = "";
        public string usedByFoodChartData = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 6)
                {
                    //get the value from url, which contains user ID that want to view
                    int ingredientid = int.Parse(Request.QueryString["Id"]);

                    if (db.Ingredients.Any(x => x.ingID == ingredientid))
                    {
                        //retrieve data from linq db
                        Ingredient u = db.Ingredients.SingleOrDefault(x => x.ingID == ingredientid);

                        bool status = u.status == 'T' ? true : false;

                        //pull data into web form
                        lblFoodID.Text = u.ingID.ToString();
                        lblFoodSts.Text = status ? "Active" : "Inactive";
                        lblFoodSts.CssClass = status ? "alert alert-success" : "alert alert-danger";

                        //making graph (stock level flow)
                        double initalizeQuantity = 0; //HawkerFoodSecurity.calTotalIngredientNeeded(u.ingID);
                        var graph = from x in db.Order_lists
                                    where db.Ing_lists.Any(y => y.foodID == x.Food.foodId && y.ingID == u.ingID)
                                    group x by new { x.Order.orderDate } into g
                                    select new
                                    {
                                        date = g.Key.orderDate.ToShortDateString(),
                                        value = g.Sum(s => -s.quantity * db.Ing_lists.SingleOrDefault(y => y.foodID == s.foodId && y.ingID == u.ingID).qtyNeeded)
                                    };

                        var graph1 = from x in db.Transactions
                                     where x.Quotation.Bidding.ingID == u.ingID && x.status == 'D'
                                     group x by new { x.receivedTime } into g
                                     select new
                                     {
                                         date = ((DateTime)g.Key.receivedTime).ToShortDateString(),
                                         value = g.Sum(s => s.Quotation.quantity)
                                     };
                        var gra = graph.Union(graph1);
                        string jsData = "";
                        foreach (var a in gra)
                        {
                            initalizeQuantity += a.value;
                            jsData += "{\"date\": \"" + a.date + " \", \"value\": " + initalizeQuantity + "},";
                        }
                        headerjschartData += jsData;

                        //making graph (monthly stock order)
                        var graph2 = from x in db.Transactions
                                     where x.Quotation.Bidding.ingID == u.ingID && x.status == 'D'
                                     group x by new { x.receivedTime.Value.Month } into g
                                     select new
                                     {
                                         month = g.Key.Month,
                                         amount = g.Sum(s => s.Quotation.price)
                                     };

                        foreach (var a in graph2)
                        {
                            monthlyOrderChartData += "{\"month\": \"" + DateTimeFormatInfo.CurrentInfo.GetAbbreviatedMonthName(a.month) + " \", \"Total\": " + a.amount.ToString() + "},";
                        }

                        //making graph (flow of bidding price)
                        var graph3 = from x in db.Transactions
                                     where x.Quotation.Bidding.ingID == u.ingID && x.status == 'D'
                                     select new
                                     {
                                         date = x.receivedTime.Value,
                                         price = HNEnterpreneurSecurity.divide(x.Quotation.price, x.Quotation.Bidding.quantity)
                                     };
                        foreach (var a in graph3)
                        {
                            flowOfPriceChartData += "{\"date\": \"" + a.date.ToShortDateString() + " \", \"value\": " + a.price + "},";
                        }
                        //END

                        //making graph (sold by company)
                        var graph4 = from x in db.Transactions
                                     where x.Quotation.Bidding.ingID == u.ingID && x.status == 'D'
                                     group x by new { x.Quotation.Bidder.name } into g
                                     select new
                                     {
                                         name = g.Key.name,
                                         value = g.Sum(s => s.Quotation.quantity)
                                     };
                        foreach (var a in graph4)
                        {
                            soldByCompanyChartData += "{\"name\": \"" + a.name + " \", \"value\": " + a.value + "},";
                        }
                        //END

                        //making graph (used by food)
                        var graph5 = from x in db.Ing_lists
                                     where x.Food.status == 'T' && x.Ingredient.status == 'T' && x.ingID == u.ingID
                                     select new
                                     {
                                         name = x.Food.name,
                                         value = x.qtyNeeded
                                     };
                        foreach (var a in graph5)
                        {
                            usedByFoodChartData += "{\"name\": \"" + a.name + " \", \"value\": " + a.value + "},";
                        }
                        //END
                    }
                    else
                    {
                        Response.Redirect("IngredientList.aspx");
                    }
                }
                else
                {
                    Response.Redirect("IngredientAnalyst.aspx?Id=21000");
                    Response.Redirect("IngredientList.aspx");
                }
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("IngredientList.aspx");
        }
    }
}