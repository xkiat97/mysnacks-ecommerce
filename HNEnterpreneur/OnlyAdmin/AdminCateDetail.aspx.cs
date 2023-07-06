using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminCateDetail : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 5)
                {

                    //get the value from url, which contains user ID that want to view
                    int catid = int.Parse(Request.QueryString["Id"]);

                    if (db.Categories.Any(x => x.catId == catid))
                    {
                        //retrieve data from linq db
                        Category u = db.Categories.SingleOrDefault(x => x.catId == catid);

                        bool status = u.status == 'T' ? true : false;

                        //pull data into web form
                        lblCateID.Text = u.catId.ToString();
                        User u1 = db.Users.SingleOrDefault(x1 => x1.userId == u.modifiedUser);
                        hlUserDetail.Text = u1.name;
                        hlUserDetail.NavigateUrl = "AdminAccDetail.aspx?Id=" + u.modifiedUser.ToString();
                        lblModTim.Text = u.modifiedDate.ToShortDateString() + " " + u.modifiedTime.ToString(@"hh\:mm\:ss");
                        lblSts.Text = status ? "Unbanned" : "Banned";
                        lblSts.CssClass = status ? "alert alert-success" : "alert alert-danger";

                        txtCateName.Value = u.name;
                        txtDesc.Value = u.description;


                        //if it is banned, then change button text to unbanned
                        btnBan.Text = status ? "Ban Category" : "Unban Category";

                        //if user wants to view only
                        if (Request.QueryString["M"] == null)
                        {
                            //disable the input tag, so that user cannot modified at here
                            txtCateName.Disabled = txtDesc.Disabled = true;
                        }
                        else
                        {
                            txtCateName.Disabled = txtDesc.Disabled = false;
                            //change the button text to update
                            btnModify.Text = "Update";
                        }
                    }
                    else
                    {
                        //if there are error in get the quere string or record not match
                        //redirect the page
                        Response.Redirect("AdminCateList.aspx");
                    }
                }
                else
                {
                    //if there are error in get the quere string or record not match
                    //redirect the page
                    Response.Redirect("AdminCateList.aspx");
                }
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            //if it is going to modify
            //when user click modify button
            if (btnModify.Text == "Modify")
            {
                Response.Redirect("AdminCateDetail.aspx?M=T&Id=" + lblCateID.Text);
            }
            else
            {
                //when user click update button
                //this means user want to update to db

                //if there is no any error
                if (Page.IsValid)
                {
                    if (db.Categories.Any(x => x.name.ToLower() == txtCateName.Value.ToLower() && x.catId != int.Parse(lblCateID.Text)))
                    {
                        errname.Text = "<div class='alert alert-danger col-sm-12'>Category name has been used. </div>";
                    }
                    else
                    {
                        //set the user who register this account
                        int registedUserId = db.Users.SingleOrDefault(x => x.email == Page.User.Identity.Name).userId; ;

                        //get the user id and retrieve data from db
                        Category u = db.Categories.SingleOrDefault(x => x.catId == int.Parse(lblCateID.Text));

                        //as long as the records is found
                        if (u != null)
                        {
                            u.name = txtCateName.Value;
                            u.description = txtDesc.Value;
                            //set the modified time & date
                            u.modifiedTime = DateTime.Now.TimeOfDay;
                            u.modifiedDate = DateTime.Now;
                            u.modifiedUser = registedUserId;

                            db.SubmitChanges();
                            Response.Redirect("AdminCateDetail.aspx?Id=" + u.catId);
                        }
                    }
                }
            }
        }

        protected void btnBan_Click(object sender, EventArgs e)
        {
            Category u = db.Categories.SingleOrDefault(x => x.catId == int.Parse(lblCateID.Text));
            if (u != null)
            {
                u.status = btnBan.Text == "Ban Category" ? 'F' : 'T';

                db.SubmitChanges();
                Response.Redirect("AdminCateDetail.aspx?Id=" + u.catId);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCateList.aspx");
        }
    }
}