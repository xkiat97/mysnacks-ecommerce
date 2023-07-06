using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HNEnterpreneur
{
    public partial class SystemForgotPassword : System.Web.UI.Page
    {
        HNEnterpreneurDBDataContext db = new HNEnterpreneurDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblErr.Visible = false;
            lblMsg.Visible = false;
        }

        protected void btnResetPass_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Value;

            string companyName = "H&N Enterprise";// db.Settings.SingleOrDefault(x => x.settingId == 9001).companyName;
            string companyEmail = "ftcation@gmail.com";//db.Settings.SingleOrDefault(x => x.settingId == 9001).companyEmail;
            string companyEmailPass = "fteducation12345";//db.Settings.SingleOrDefault(x => x.settingId == 9001).companyEmailPass;
            User u = db.Users.SingleOrDefault(x => x.email == email);

            if (u != null)
            {
                string resetURL = "https://mysnacks.azurewebsites.net/SystemResetPassword.aspx?q=";
                SmtpClient client = new SmtpClient();
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.EnableSsl = true;
                client.Host = "smtp.gmail.com";
                client.Port = 587;

                // setup Smtp authentication
                System.Net.NetworkCredential credentials =
                new System.Net.NetworkCredential(companyEmail, companyEmailPass);
                client.UseDefaultCredentials = false;
                client.Credentials = credentials;

                MailMessage msg = new MailMessage();
                msg.From = new MailAddress(companyEmail);
                msg.To.Add(new MailAddress(email));

                msg.Subject = companyName + " System reset you password";
                msg.IsBodyHtml = true;
                msg.Body = string.Format("<html><head></head><body>" +
                    "<h3>This message solely for education demostration purpose.</h3>" +
                    "<p>Kindly please click on this link to " +
                    "<a href='" + resetURL + Server.UrlEncode(u.password) + "&w=" + u.userId + "'>reset your password</a>" +
                    ", if it is not your account please ignore it.</p>" +
                    "</body></html>");

                try
                {
                    client.Send(msg);
                    lblMsg.Visible = true;
                    lblMsg.Text = "Your message has been successfully sent, please check your email.";
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error occured while sending your message." + ex.Message;
                }
            }
            else
            {
                lblErr.Visible = true;
            }
        }
    }
}