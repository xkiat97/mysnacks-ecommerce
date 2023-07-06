using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyStoreAdmin
{
    public partial class SAIngredientBid : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 6)
                {
                    //get ingredient id
                    //get the value from url, which contains user ID that want to view
                    int ingredientid = int.Parse(Request.QueryString["Id"]);

                    Ingredient i = db.Ingredients.SingleOrDefault(x => x.ingID == ingredientid);

                    if (i != null)
                    {
                        //initial the value
                        imgIngImg.Src = "~/Images/IngredientImg/" + i.img;
                        lblIngName.Text = i.name;
                        lblIngId.Text = i.ingID.ToString();
                        lblBalance.Text = i.balance.ToString() + " " + i.balanceType;
                        lblmPrice.Text = i.marketPrice.ToString();
                        lblDesc.Text = i.desc;
                    }
                }
                else
                {
                    Response.Redirect("SAIngredientList.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int ingID = int.Parse(lblIngId.Text);
            float maxPrice = float.Parse(txtMaxPrice.Value);
            float quantity = float.Parse(txtQuantity.Value);
            string urgency = selUrgency.Value;
            string desc = txtDesc.Value;
            DateTime dt = DateTime.ParseExact(txtDateTime.Value, "MM/dd/yyyy h:mm tt", new CultureInfo("en-US"));

            //store in db
            Bidding b = new Bidding
            {
                ingID = ingID,
                maxPrice = Math.Round(maxPrice),
                quantity = Math.Round(quantity),
                urgency = urgency,
                desc = desc,
                deliveryDate = dt,
                date = DateTime.Now,
                status = 'T'
            };

            db.Biddings.InsertOnSubmit(b);
            db.SubmitChanges();

            //redirect
            Response.Redirect("SAIngredientList.aspx");
        }
    }
}