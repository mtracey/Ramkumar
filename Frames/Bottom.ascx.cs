using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Ionic.Zip;

namespace SMEPayroll.Frames
{
    public partial class Bottom : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string sqlStr = "";
            string emp_code = Session["EmpCode"].ToString();
            DataSet data;
            sqlStr = "SELECT Company.Company_Name FROM EMPLOYEE INNER JOIN COMPANY ";
            sqlStr  =sqlStr  + "ON EMPLOYEE.Company_Id=COMPANY.Company_Id WHERE EMP_CODE='" + emp_code +"'";
            data = GetData(sqlStr);
            if (data.Tables[0].Rows[0][0] != null)
            {
                CompanyName.Text = data.Tables[0].Rows[0][0].ToString();
            }
            //EmployeeName
            sqlStr = "SELECT EMP_NAME + '' + EMP_LNAME AS Name,EG.GROUPNAME,USERNAME FROM EMPLOYEE E INNER JOIN usergroups EG ON E.GroupID=EG.GroupID WHERE EMP_CODE = '" + emp_code + "' AND E.COMPANY_iD like '" + Utility.ToString(Session["Compid"]) + "'";
            data = GetData(sqlStr);
            if (data.Tables[0].Rows[0][0] != null)
            {
                EmployeeName.Text = data.Tables[0].Rows[0][0].ToString();
            }
            if (data.Tables[0].Rows[0][1] != null)
            {
                EmployeeGroup.Text = data.Tables[0].Rows[0][1].ToString();
            }
            if (data.Tables[0].Rows[0][2] != null)
            {
                UserName.Text = data.Tables[0].Rows[0][2].ToString();
            }

            //To Show Number Of Days when last bacup is taken
            //sqlStr = "SELECT TOP 1 LogTime FROM VIEW_GET_DATABASE_LOG_DETAILS";
            sqlStr = "select TOP 1 LogTime from VIEW_GET_DATABASE_LOG_DETAILS order by LogTime desc";
            data = GetData(sqlStr);
            if (data.Tables.Count > 0)
            {
                if (data.Tables[0].Rows.Count > 0)
                {
                    if (data.Tables[0].Rows[0][0] != null)
                    {
                        if (data.Tables[0].Rows[0][0].ToString() != "0")
                        {
                            string strDateTime = data.Tables[0].Rows[0][0].ToString();
                            DateTime myDateTime = DateTime.Parse(strDateTime);
                            dbBackup.Text = myDateTime.Date.ToShortDateString();
                        }
                    }
                }
                else
                {
                        dbBackup.Text = "No Backup Taken";
                }
            }
            //Show If Backup is taken before 3 days

            //To Show Number Of Days when last bacup is taken
            string sSQL = "sp_GetLastDatbaseLogDay";
            DataSet ds;
            ds = DataAccess.FetchRS(CommandType.StoredProcedure, sSQL, null);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0][0] != null)
                    {
                        if (ds.Tables[0].Rows[0][0].ToString() == "0")
                        {
                            //lblbkp.Text = "Last Dackup Taken Today";
                            imgNotice1.Visible = false;
                            img3.Visible = true;
                        }
                        else
                        {
                            if (ds.Tables[0].Rows[0][0].ToString() !="")
                            {
                                int backupTaken = (int)ds.Tables[0].Rows[0][0];
                                if (backupTaken > 3)
                                {
                                    imgNotice1.Visible = true;
                                    img3.Visible = false;
                                }
                            }
                            if (dbBackup.Text == "No Backup Taken")
                            {
                                imgNotice1.Visible = true;
                                img3.Visible = false;
                            }
                            //lblbkp.Text = "Last Backup Taken Before : " + ds.Tables[0].Rows[0][0].ToString() + " Days";

                            if (imgNotice1.Visible == true)
                            {
                                img3.Visible = false;
                            }
                            else
                            {
                                img3.Visible =true;
                            }
                        }
                    }
                }
            }

            //Number Of Licenced 
            ShowLicense();
        }

        //Get Data From Database    
        public DataSet GetData(string sqlStr)
        {   
            DataSet Information = DataAccess.FetchRS(CommandType.Text, sqlStr, null);
            //data[0] = Information.Tables[0].Rows[0][0].ToString();
            return Information;
        }

        /// <summary>
        /// Show Number of Lice
        /// </summary>
        public void ShowLicense()
        {
            int id=0;
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");
            id = Utility.ToInteger(Session["Compid"].ToString());
            int iTotalEmployeesInDB = 0, iTotalEmployeesAllowed;
            string sSQL = "";

            string sKey = System.Configuration.ConfigurationManager.AppSettings["SYS_CONFIG"];
           
            string[] skey = new string[4];
            skey[0] = "0x59185499C345D05F92CED";
            skey[1] = "1FC2CF2BD2C8BCE8D3462EF";
            skey[2] = "0749EF3CDC4096C6EC516D5";
            skey[3] = "10115D05EA097524FB22C22";

            sKey = sKey.ToUpper().ToString();
            for (int i = 0; i <= 3; i++)
            {
                sKey = sKey.Replace(skey[i].ToUpper().ToString(), "");
            }
            sKey = sKey.Replace("X", "");

            iTotalEmployeesAllowed = Utility.ToInteger(sKey.Replace("X", ""));
            sSQL = "SELECT count(DISTINCT ic_pp_number) FROM employee WHERE company_id <> 1 and termination_date is null";
            System.Data.SqlClient.SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sSQL, null);

            while (dr.Read())
            {
                iTotalEmployeesInDB = Utility.ToInteger(dr.GetValue(0));
            }

            if (Session["Certificationinfo"] == null)
            {
                string filePath = "";
                string zipFileName="";
                string TargetDirectory = Utility.ToString(System.Configuration.ConfigurationSettings.AppSettings["TARGET_DIRECTORY"].ToString());
                foreach (string fileName in System.IO.Directory.GetFiles(TargetDirectory))
                {
                    zipFileName = fileName;
                }
                if (System.IO.File.Exists(zipFileName))
                {
                    using (ZipFile zip = ZipFile.Read(zipFileName))
                    {
                        zip.Password = "!Secret1";
                        zip.ExtractAll(TargetDirectory, ExtractExistingFileAction.OverwriteSilently);
                    }

                    foreach (string fileName in System.IO.Directory.GetFiles(TargetDirectory + @"\CERTIFICATE"))
                    {
                        filePath = fileName;
                    }

                    //...Read Data From TextFile and show data in data grid for Certification...
                    DataSet Certificationinfo = Utility.GetDataSetFromTextFile(filePath);
                    Session["Certificationinfo"] = Certificationinfo;
                    //RadGridCertification.DataBind();
                    //Delete Files Once Data Gets in Session
                    try
                    {
                        foreach (string dirName in System.IO.Directory.GetDirectories(TargetDirectory))
                        {
                            if (dirName != zipFileName)
                            {
                                System.IO.Directory.Delete(dirName, true);
                            }
                        }
                    }
                    catch (Exception e)
                    {

                    }
                }
            }
            string LicenseInfo = "";
            if (Session["Certificationinfo"] != null)
            {
                DataSet info = (DataSet)Session["Certificationinfo"];
                string RowsAllowed = info.Tables[0].Rows[12][1].ToString().Trim();
                iTotalEmployeesAllowed = Convert.ToInt32(RowsAllowed);

                LicenseInfo = "License ";
                int LicenseRemaining = iTotalEmployeesAllowed - iTotalEmployeesInDB;
                if (LicenseRemaining < 5)
                {
                    imgNotice2.Visible = true;
                }
                else
                {
                    imgUserLicense.Visible = true;
                
                }
                
               // LicenseInfo = LicenseRemaining + " { " + iTotalEmployeesAllowed.ToString() + " - " + iTotalEmployeesInDB.ToString() + " } ";

                LicenseInfo = iTotalEmployeesAllowed.ToString() + " - " + iTotalEmployeesInDB.ToString() + "=" + LicenseRemaining;
                DateTime dt = new DateTime();
                string cerDate = "";

                if (info.Tables[0].Rows[14][1] != null)
                {
                    cerDate = info.Tables[0].Rows[14][1].ToString();
                    dt=Convert.ToDateTime(cerDate);
                }

                DateTime today = DateTime.Now;
                TimeSpan daysDifferenc = dt.Subtract(today);
                if (info.Tables[0].Rows[14][1] != null)
                {
                    lblMaintenanceDate.Text = info.Tables[0].Rows[14][1].ToString().Trim(); ;
                }
                if (daysDifferenc.Days < 30)
                {
                    img5.Visible = true;
                }
                else
                {
                    img4.Visible = true;
                }                
                Session["Maintain"] = daysDifferenc.Days;                
            }
            UserLicense.Text = LicenseInfo;
        }
    }
}