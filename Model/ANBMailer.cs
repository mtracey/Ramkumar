using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

namespace SMEPayroll.Model
{
    public class ANBMailer
    {
        private int iCompID = 0;
        public string To = "";
        public string ToName = "";
        public string From = "";
        public string FromName = "";
        public string Cc = "";
        public string CcName = "";
        public string Subject = "";
        public string MailBody = "";
        public string SMTPHost = "";
        public string SMTPUserID = "";
        public string SMTPPassword = "";
        public string ssl_required = "";

        private Chilkat.MailMan mailman = new Chilkat.MailMan();
        private Chilkat.Email email = new Chilkat.Email();

        public ANBMailer(int comp_id)
        {
            try
            {
                int smtp_port = 0;
                iCompID = comp_id;

                string sSQL = "sp_submit_email1";
                SqlParameter[] parm = new SqlParameter[1];
                parm[0] = new SqlParameter("@comp_id", iCompID);
                SqlDataReader dr1 = DataAccess.ExecuteReader(CommandType.StoredProcedure, sSQL, parm);

                while (dr1.Read())
                {                    
                     mailman.SmtpHost = Utility.ToString(dr1.GetValue(0));
                     mailman.SmtpUsername = Utility.ToString(dr1.GetValue(1));                    
                     mailman.SmtpPassword = Utility.ToString(dr1.GetValue(2));
                     email.FromName = Utility.ToString(dr1.GetValue(3));
                     smtp_port = Utility.ToInteger(dr1.GetValue(4));
                    //Added By Raja--(19/12/2008)
                    ssl_required = Utility.ToString(dr1.GetValue(7));

                     if (ssl_required == "Yes")
                     {
                         mailman.SmtpSsl = true;
                     }
                     
                     if (smtp_port > 0)
                        mailman.SmtpPort = smtp_port;                     

                     if (email.From == "")
                        email.From = Utility.ToString(dr1.GetValue(6));
                }
            }
            catch (Exception ex)
            {
                string sTemp = ex.Message.ToString(); // to be rendered later
            }
        }

        public ANBMailer(string smtp_server, string smtp_uid, string smtp_pwd, string s_from, string s_from_name, int smtp_port, string ssl)
        {
            mailman.SmtpHost = smtp_server;
            mailman.SmtpUsername = smtp_uid;
            mailman.SmtpPassword = smtp_pwd;

            if (ssl == "" || ssl == "No")
            {
                mailman.SmtpSsl = false;
            }
            else
            {
                mailman.SmtpSsl = true;
            }

            
            email.From = s_from;
            email.FromName = s_from_name;
            
            if (smtp_port > 0)
                mailman.SmtpPort = smtp_port;
        }

        public string Attachment = "";
        public ArrayList alAttachment = null;

        public void CleanMail()
        {
            this.DropAttachment();
            this.ClearAllToCCBCC();
        }

        public void DropAttachment()
        {
            email.DropAttachments();
        }
        public void ClearAllToCCBCC()
        {
            email.ClearBcc();
            email.ClearCC();
            email.ClearTo();
        }

        public string SendMail()
        {
            try
            {                
                string contentType = "";
                bool success = mailman.UnlockComponent("ADVANCMAILQ_uoDUcdqd6Z7D");

                if (this.From == "")
                    return "FROM parameter is not set.";

                if (this.To == "")
                    return "TO parameter is not set.";
                if (this.FromName == "")
                    this.FromName = this.From;

                if (this.ToName == "")
                    this.ToName = this.To;

                if (this.CcName == "")
                    this.CcName = this.Cc;

                email.From = this.From;
                email.FromName = this.FromName;
                email.AddTo(this.ToName, this.To);
                if (this.Cc != "")
                {
                    email.AddCC(this.CcName, this.Cc);
                }
                email.Subject = this.Subject;
                email.Body = this.MailBody;
                email.ReplyTo = email.From;

                mailman.SmtpAuthMethod = "LOGIN";

                //mailman.SmtpSsl = true;     // for Vishal only.

                // attach single file
                if (this.Attachment != "")
                {
                    contentType = email.AddFileAttachment(this.Attachment);
                    if (contentType == null)
                        return "Can not attach file. " + this.Attachment;
                }

                // attach multiple files
                if (this.alAttachment != null)
                {
                    for (int i = 0; i < alAttachment.Count - 1; i++)
                    {
                        contentType = email.AddFileAttachment(alAttachment[i].ToString());
                        if (contentType == null)
                            return "Can not attach file. " + alAttachment[i].ToString();
                    }
                }
                
                success = mailman.SendEmail(email);

                if (success != true)
                    return mailman.LastErrorText;

                success = mailman.CloseSmtpConnection();
                if (success != true)
                    return mailman.LastErrorText;

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

    }
}
