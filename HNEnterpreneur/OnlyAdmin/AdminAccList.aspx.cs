using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminAccList : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //check what is the acc that wanted to view
            //get it from url
            string accType = Request.QueryString["usrTyp"];
            if (isAnAccountType(accType))
            {

                lblAccTyp1.Text = lblAccTyp2.Text = accType;

                //display all the acc based on the acc type information in to datalist
                var resultItems = from x in db.Users
                                  where x.userType == accType && x.status == 'T'
                                  select new
                                  {
                                      x.userId,
                                      x.name,
                                      x.email,
                                      RegistedID = x.regUserId
                                  };
                dlAcc.DataSource = resultItems;
                dlAcc.DataBind();
            }
            else
            {
                Response.Redirect("AdminAccList.aspx?usrTyp=Admin");
            }
        }
        public static bool isAnAccountType(string type)
        {
            if (type == "Admin" || type == "Member" || type == "Supplier" || type == "CStaff" || type == "DStaff" || type == "PStaff" || type == "StoreAdmin")
            {
                return true;
            }
            return false;
        }
    }
}