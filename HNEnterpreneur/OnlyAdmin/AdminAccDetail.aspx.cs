using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur.OnlyAdmin
{
    public partial class AdminAccDetail : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Request.QueryString["Id"] != null && Request.QueryString["Id"].Length < 5)
                {
                    //get the value from url, which contains user ID that want to view
                    int userid = int.Parse(Request.QueryString["Id"]);

                    if (db.Users.Any(x => x.userId == userid))
                    {
                        //retrieve data from linq db
                        User u = db.Users.SingleOrDefault(x => x.userId == userid);

                        bool status = u.status == 'T' ? true : false;

                        //pull data into web form
                        lblUsrID.Text = u.userId.ToString();
                        lblUsrSts.Text = status ? "Unbanned" : "Banned";
                        lblUsrSts.CssClass = status ? "alert alert-success" : "alert alert-danger";
                        txtEmail.Value = u.email;
                        hlUserDetail.NavigateUrl = "AdminAccDetail.aspx?Id=" + u.regUserId.ToString();

                        User u1 = db.Users.SingleOrDefault(x1 => x1.userId == u.regUserId);
                        hlUserDetail.Text = u1.name == null ? "" : u1.name + " ( " + u1.email + " ) ";

                        //if it is banned, then change button text to unbanned
                        btnBan.Text = status ? "Ban Account" : "Unban Account";
                        
                        //if user wants to view only
                        if (Request.QueryString["M"] == null)
                        {
                            txtInputName.Value = u.name;
                            selAccTyp.Value = u.userType;

                            //disable the input tag, so that user cannot modified at here
                            txtInputName.Disabled = txtEmail.Disabled = selAccTyp.Disabled = pwdPassword1.Disabled = pwdPassword2.Disabled = true;
                            revInputName.Enabled = false;
                        }
                        else
                        {
                            txtInputName.Value = u.name;
                            selAccTyp.Value = u.userType;
                            txtEmail.Disabled = true;
                            pwdPassword1.Disabled = pwdPassword2.Disabled = false;
                            //if user wants to modify
                            //change the button text to update
                            btnModify.Text = "Update";
                        }
                        if (u.userType == "SuperAdmin")
                        {
                            btnBan.Visible = false;
                            btnModify.Visible = false;
                        }
                    }
                    else
                    {
                        //if there are error in get the quere string or record not match
                        //redirect the page
                        Response.Redirect("AdminAccList.aspx");
                    }
                }
                else
                {
                    //if there are error in get the quere string or record not match
                    //redirect the page
                    Response.Redirect("AdminAccList.aspx");
                }
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            //if it is going to modify
            //when user click modify button
            if (btnModify.Text == "Modify")
            {
                Response.Redirect("AdminAccDetail.aspx?M=T&Id=" + lblUsrID.Text);
            }
            else
            {
                //when user click update button
                //this means user want to update to db

                //if there is no any error
                if (Page.IsValid)
                {
                        //get the user id and retrieve data from db
                        User u = db.Users.SingleOrDefault(x => x.userId == int.Parse(lblUsrID.Text));

                        //as long as the records is found
                        if (u != null)
                        {
                            //ERROR: connot get the value and store into db if it has been initialized a value
                            u.name = txtInputName.Value;
                            u.userType = selAccTyp.Value;
                            u.password = HNEnterpreneurSecurity.GetHash(pwdPassword2.Value);

                            db.SubmitChanges();

                            if (selAccTyp.Value == "Supplier")
                            {
                                if (!db.Bidders.Any(x => x.usrID == u.userId))
                                {
                                    Bidder b = new Bidder
                                    {
                                        usrID = u.userId,
                                        name = "Empty",
                                        delayTime = 0
                                    };
                                    db.Bidders.InsertOnSubmit(b);
                                    db.SubmitChanges();
                                }
                            }
                        Response.Redirect("AdminAccDetail.aspx?Id=" + u.userId);
                        }
                }
            }
        }

        protected void btnBan_Click(object sender, EventArgs e)
        {
            User u = db.Users.SingleOrDefault(x => x.userId == int.Parse(lblUsrID.Text));
            if (u != null)
            {
                //ERROR: connot get the value and store into db if it has been initialized a value
                u.status = btnBan.Text == "Ban Account" ? 'F' : 'T';

                db.SubmitChanges();
                Response.Redirect("AdminAccDetail.aspx?Id=" + u.userId);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string type = null;
            User u = db.Users.SingleOrDefault(x => x.userId == int.Parse(lblUsrID.Text));
            if (u != null)
                type = u.userType;
            Response.Redirect("AdminAccList.aspx?usrTyp=" + type);
        }
    }
}