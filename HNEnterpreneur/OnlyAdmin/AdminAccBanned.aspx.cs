using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminAccBanned : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //display all the acc based on the acc type information in to datalist
            var resultItems = from x in db.Users
                              where x.status != 'T'
                              select new
                              {
                                  x.userId,
                                  x.name,
                                  x.email,
                                  RegistedID = x.regUserId,
                                  x.userType
                              };

            dlAcc.DataSource = resultItems;
            dlAcc.DataBind();
        }
    }
}