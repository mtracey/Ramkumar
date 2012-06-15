using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DataStreams.Csv;
using Telerik.WebControls;
using Microsoft.VisualBasic;
using System.Drawing;
using System.IO;

namespace SMEPayroll.TimeSheet
{
    public partial class MAPTimesheet : System.Web.UI.Page
    {
        protected string sHeadingColor = Constants.HEADING_COLOR;
        protected string sBorderColor = Constants.TABLE_BORDER_COLOR;
        protected string sEvenRowColor = Constants.EVEN_ROW_COLOR;
        protected string sOddRowColor = Constants.ODD_ROW_COLOR;
        protected string sBaseColor = Constants.BASE_COLOR;
        int compid;
        string strFile;
        string strtranid;
        string fileType;

        protected void Page_Load(object sender, EventArgs e)
        {
            compid = Utility.ToInteger(Session["Compid"]);
            strtranid = Session["ProcessTranId"].ToString();
            strFile = Session["TS_FileName"].ToString();
            if (Utility.ToString(Session["Username"]) == "")
                Response.Redirect("../SessionExpire.aspx");

            CmdImport.Enabled = true;
            btnSave.Enabled = false;
            btnCancel.Enabled = false;

            btnSave.Click += new EventHandler(btnSave_Click);
            btnCancel.Click += new EventHandler(btnCancel_Click);
            btnExit.Click += new EventHandler(btnExit_Click);

            DataSet ds = new DataSet();
            string sql = "SELECT FileType FROM TS_FileUploaded WHERE TranID='" + Session["TRANSID"].ToString() + "'";
            ds = DataAccess.FetchRS(CommandType.Text, sql, null);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    fileType = ds.Tables[0].Rows[0][0].ToString();
                }
            }

            if (!Page.IsPostBack)
            {
                if (Session["ProcessTranId"] != null)
                {
                    lblDocNo.Text = "Doc No: " + Session["ProcessTranId"].ToString();


                    FileStream fileStream = new FileStream(strFile, FileMode.Open);
                    CSVReader reader = new CSVReader(fileStream);
                    string[] headers = reader.GetCSVLine();
                    DataTable dt = new DataTable();
                    //add headers
                    int iCount = 0;
                   
                    if (fileType.ToUpper() == "M")
                    {

                        userid.Items.Insert(iCount, new ListItem("Select", "Select"));
                        timeentry.Items.Insert(iCount, new ListItem("Select", "Select"));
                        eventid.Items.Insert(iCount, new ListItem("Select", "Select"));
                        terminalsn.Items.Insert(iCount, new ListItem("Select", "Select"));

                        rowSingle.Visible = false;
                        rowMulti.Visible = true;

                        row1.Visible = true;
                        row2.Visible = true;
                        row3.Visible = true;
                        row4.Visible = true;

                        row5.Visible = false;
                        row6.Visible = false;
                        row7.Visible = false;
                        row8.Visible = false;    
                        row9.Visible = false;
                        row10.Visible = false;
                        row11.Visible = false;

                        foreach (string strHeader in headers)
                        {
                            iCount = iCount + 1;
                            userid.Items.Insert(iCount, strHeader);
                            timeentry.Items.Insert(iCount, strHeader);
                            eventid.Items.Insert(iCount, strHeader);
                            terminalsn.Items.Insert(iCount, strHeader);
                        }
                        fileStream.Close();
                        fileStream = null;
                    }
                    else if (fileType.ToUpper() == "S")
                    {

                        drpUserid.Items.Insert(iCount, new ListItem("Select", "Select"));
                        drpProjectSingle.Items.Insert(iCount, new ListItem("Select", "Select"));
                        drptimesheetdateSingle.Items.Insert(iCount, new ListItem("Select", "Select"));
                        drptimesheettimeInSingle.Items.Insert(iCount, new ListItem("Select", "Select"));
                        drptimesheettimeOutSingle.Items.Insert(iCount, new ListItem("Select", "Select"));
                        drptimesheetdateoutSingle.Items.Insert(iCount, new ListItem("Select", "Select"));
                        drpTimeSheetDate.Items.Insert(iCount, new ListItem("Select", "Select"));

                        rowSingle.Visible = true;
                        rowMulti.Visible = false;

                        row1.Visible = false;
                        row2.Visible = false;
                        row3.Visible = false;
                        row4.Visible = false;

                        row5.Visible = true;
                        row6.Visible = true;
                        row7.Visible = true;
                        row8.Visible = true;    
                        row9.Visible = true;
                        row10.Visible = true;
                        row11.Visible = true;
                        foreach (string strHeader in headers)
                        {
                            iCount = iCount + 1;
                            drpUserid.Items.Insert(iCount, strHeader);
                            drpProjectSingle.Items.Insert(iCount, strHeader);
                            drptimesheetdateSingle.Items.Insert(iCount, strHeader);
                            drptimesheettimeInSingle.Items.Insert(iCount, strHeader);
                            drptimesheettimeOutSingle.Items.Insert(iCount, strHeader);
                            drptimesheetdateoutSingle.Items.Insert(iCount, strHeader);
                            drpTimeSheetDate.Items.Insert(iCount, strHeader);
                            
                        }
                        fileStream.Close();
                        fileStream = null;
                    }
                }
            }
        }

        void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("TimeSheetDocument.aspx");
        }

        void btnCancel_Click(object sender, EventArgs e)
        {
            string sSQL = "";
            if (fileType.ToUpper() == "M")
            {
                sSQL = "DELETE FROM [TS_FileUploaded] WHERE [TranID] ='" + Session["TRANSID"].ToString() + "';DELETE FROM [ACTATEK_LOGS] where Company_Id='" + compid + "' And tranid='" + Session["TRANSID"].ToString() + "';DELETE FROM [ACTATEK_LOGS_BC] WHERE [tranID] ='" + Session["TRANSID"].ToString() + "';";
            }
            else if (fileType.ToUpper() == "S")
            {
                sSQL = "DELETE FROM [TS_FileUploaded] WHERE [TranID] ='" + Session["TRANSID"].ToString() + "';DELETE FROM [ACTATEK_LOGS] where Company_Id='" + compid + "' And tranid='" + Session["TRANSID"].ToString() + "';DELETE FROM [ACTATEK_LOGS_TEMP] WHERE [tranID] ='" + Session["TRANSID"].ToString() + "';";
            }
            int retVal = DataAccess.ExecuteStoreProc(sSQL);
            if (retVal >= 1)
            {

                string sSQL1 = "Update [TS_FileUploaded] set Status=0 WHERE [TranID] ='" + strtranid + "'";
                int retVal1 = DataAccess.ExecuteStoreProc(sSQL1);

                lblMsg.InnerHtml = "Doc No: " + strtranid + " deleted successfully";
                Session["TRANSID"] = null;
                Response.Redirect("TimeSheetDocument.aspx");
            }
        }

        void btnSave_Click(object sender, EventArgs e)
        {
            //throw new Exception("The method or operation is not implemented.");
            if (fileType.ToUpper() == "M")
            {
                saveData("M");
            }
            else if (fileType.ToUpper() == "S")
            {
                saveData("S");
                
            }
            lblMsg.InnerHtml = "";
            CmdImport.Enabled = false;
            btnCancel.Enabled = false;
            btnSave.Enabled = false;
        }

        protected void CmdImport_Click(object sender, EventArgs e)
        {
            if (fileType.ToUpper() == "M")
            {
                string strDrpCol1 = userid.SelectedItem.Text;
                string strDrpCol2 = timeentry.SelectedItem.Text;
                string strDrpCol3 = eventid.SelectedItem.Text;
                string strDrpCol4 = terminalsn.SelectedItem.Text;
                lblMsg.InnerHtml = "";

                if ((strDrpCol1 == strDrpCol2) || (strDrpCol1 == strDrpCol3) || (strDrpCol1 == strDrpCol4))
                {
                    lblMsg.InnerHtml = strDrpCol1 + " is selected more than once";
                }
                if ((strDrpCol2 == strDrpCol3) || (strDrpCol2 == strDrpCol4))
                {
                    if (lblMsg.InnerHtml.ToString().IndexOf(strDrpCol2) < 0)
                    {
                        lblMsg.InnerHtml = lblMsg.InnerHtml + "<br/>" + strDrpCol2 + " is selected more than once";
                    }
                }
                if ((strDrpCol3 == strDrpCol2) || (strDrpCol3 == strDrpCol4))
                {
                    if (lblMsg.InnerHtml.ToString().IndexOf(strDrpCol3) < 0)
                    {
                        lblMsg.InnerHtml = lblMsg.InnerHtml + "<br/>" + strDrpCol3 + " is selected more than once";
                    }
                }
            }
            else if (fileType.ToUpper() == "S")
            {

                lblMsg.InnerHtml = "";

                string strDrpCol1 = drpUserid.SelectedItem.Text;
                string strDrpCol2 = drpProjectSingle.SelectedItem.Text;
                string strDrpCol3 = drptimesheetdateSingle.SelectedItem.Text;
                string strDrpCol4 = drptimesheettimeInSingle.SelectedItem.Text;
                string strDrpCol5 = drptimesheettimeOutSingle.SelectedItem.Text;
                string strDrpCol6 = drptimesheetdateoutSingle.SelectedItem.Text;
                //string strDrpCol7 = drpTimeSheetDate.SelectedItem.Text;


                if ((strDrpCol1 == strDrpCol2) || (strDrpCol1 == strDrpCol3) || (strDrpCol1 == strDrpCol4) || (strDrpCol1 == strDrpCol5) || (strDrpCol1 == strDrpCol6) )
                {
                    lblMsg.InnerHtml = strDrpCol1 + " is selected more than once";
                }
                if ( (strDrpCol2 == strDrpCol3) || (strDrpCol2 == strDrpCol4) || (strDrpCol2 == strDrpCol5) || (strDrpCol2 == strDrpCol6) )
                {
                    if (lblMsg.InnerHtml.ToString().IndexOf(strDrpCol2) < 0)
                    {
                        lblMsg.InnerHtml = lblMsg.InnerHtml + "<br/>" + strDrpCol2 + " is selected more than once";
                    }
                }
                if ((strDrpCol3 == strDrpCol4) || (strDrpCol3 == strDrpCol5) || (strDrpCol3 == strDrpCol6) )
                {
                    if (lblMsg.InnerHtml.ToString().IndexOf(strDrpCol3) < 0)
                    {
                        lblMsg.InnerHtml = lblMsg.InnerHtml + "<br/>" + strDrpCol3 + " is selected more than once";
                    }
                }
                if ((strDrpCol4 == strDrpCol5) || (strDrpCol4 == strDrpCol6) )
                {
                    if (lblMsg.InnerHtml.ToString().IndexOf(strDrpCol4) < 0)
                    {
                        lblMsg.InnerHtml = lblMsg.InnerHtml + "<br/>" + strDrpCol4 + " is selected more than once";
                    }
                }
                if ((strDrpCol5 == strDrpCol6))
                {
                    if (lblMsg.InnerHtml.ToString().IndexOf(strDrpCol5) < 0)
                    {
                        lblMsg.InnerHtml = lblMsg.InnerHtml + "<br/>" + strDrpCol5 + " is selected more than once";
                    }
                }
            }

            if (lblMsg.InnerHtml.ToString().Length == 0)
            {
                
                FileStream fileStream = new FileStream(strFile, FileMode.Open);
                CSVReader reader = new CSVReader(fileStream);
                //get the header
                string[] headers = reader.GetCSVLine();
                DataTable dt = new DataTable();

                //add headers
                foreach (string strHeader in headers)
                {
                    dt.Columns.Add(strHeader.ToString().Trim());
                }

                string[] data;
                int introw=0;

                dt.Columns.Add("Company_Id");
                dt.Columns.Add("TranId");

                if (fileType.ToUpper() == "M")
                {
                    
                    while ((data = reader.GetCSVLine()) != null)
                    {
                        dt.Rows.Add(data);
                        dt.Rows[introw]["Company_Id"] = Convert.ToString(compid);
                        dt.Rows[introw]["TranId"] = strtranid.ToString().Trim();
                        introw = introw + 1;
                    }
                }
                else if (fileType.ToUpper() == "S")
                {
                    while ((data = reader.GetCSVLine()) != null)
                    {
                        dt.Rows.Add(data);
                        dt.Rows[introw]["Company_Id"] = Convert.ToString(compid);
                        dt.Rows[introw]["TranId"] = strtranid.ToString().Trim();
                        introw = introw + 1;
                    }
                }
                try
                {
                    
                    if (fileType.ToUpper() == "M")
                    {

                        using (SqlBulkCopy bulkCopy = new SqlBulkCopy(Constants.CONNECTION_STRING))
                        {
                            bulkCopy.DestinationTableName = "ACTATEK_LOGS_BC";
                            bulkCopy.ColumnMappings.Add(userid.SelectedItem.Text.ToString().Trim(), 1);
                            bulkCopy.ColumnMappings.Add(timeentry.SelectedItem.Text.ToString(), 2);
                            bulkCopy.ColumnMappings.Add(eventid.SelectedItem.Text.ToString().Trim(), 3);
                            bulkCopy.ColumnMappings.Add(terminalsn.SelectedItem.Text.ToString().Trim(), 4);
                            bulkCopy.ColumnMappings.Add("Company_Id", 6);
                            bulkCopy.ColumnMappings.Add("TranId", 7);
                            
                            bulkCopy.WriteToServer(dt);
                            //update and Redirect to prev page...
                            lblMsg.InnerHtml = lblDocNo.Text + " Imported Sucessfully";
                            //if (retVal == 1)
                            //{
                            //    CmdImport.Enabled = false;
                            //    btnCancel.Enabled = true;
                            //    btnSave.Enabled = true;
                            //}
                        }

                        //Show Number Of Rows In Grid Which are not valid
                        string sSQL1 = "";
                        sSQL1 = "SELECT * FROM ACTATEK_LOGS_BC  WHERE   LEN(timeentry)<=0  OR LEN(tranid)<=0   OR convert(varchar, timeentry, 100) IS  NULL";
                        DataSet ds1 = new DataSet();
                        ds1 = DataAccess.FetchRS(CommandType.Text, sSQL1, null);
                        RadGrid1.DataSource = ds1;
                        RadGrid1.DataBind();

                        if (ds1.Tables[0].Rows.Count > 0)
                        {
                            RadGrid1.Visible = true;
                            string sql1 = "SELECT count(*) FROM ACTATEK_LOGS_BC  WHERE  Len(eventID)>0 AND LEN(timeentry)>0  AND LEN(tranid)>0  AND convert(varchar, timeentry, 100) IS NOT NULL";
                            int cnt = DataAccess.ExecuteScalar(sql1);

                            string strMessage = "";
                            //int InvalidRows = cnt - ds1.Tables[0].Rows.Count;
                            strMessage = "Number of Valid Rows " + cnt.ToString();
                            strMessage = strMessage + " <br/> Number of Invalid Rows " + ds1.Tables[0].Rows.Count.ToString() +"  <br/> Invalid Rows Displayed Below.";
                            strMessage = strMessage + "<br/> **************** Action ****************<br/> ";
                            strMessage = strMessage + "To Import : Click On continue Import Leaving Invalid Rows <br/>";
                            strMessage = strMessage + "This Will not import invalid rows displayed below <br/> To Cancel :";
                            strMessage = strMessage + "Click on Cancel Import this will delete the import data,User can fix the rows and re import data";

                            //lblMsg.InnerHtml = "Number of Valid Rows " + cnt.ToString() + "  <br/> Below are invalid rows. <br/> Please Click on Save Button to insert Valid data.<br/> Press Cancel to Upload File Again";
                            lblMsg.InnerHtml = strMessage;

                            CmdImport.Enabled = false;
                            btnCancel.Enabled = true;
                            btnSave.Enabled = true;
                        }
                        else
                        {
                            saveData("M");
                            //lblMsg.InnerHtml = "Data Uploaded Successfully";
                        }
                    }else if (fileType.ToUpper() == "S")
                    {
                        try
                        {
                            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(Constants.CONNECTION_STRING))
                            {
                                bulkCopy.DestinationTableName = "ACTATEK_LOGS_TEMP";                                
                                bulkCopy.ColumnMappings.Add(drpUserid.SelectedItem.Text.ToString(), 0);                                
                                bulkCopy.ColumnMappings.Add(drpProjectSingle.SelectedItem.Text.ToString().Trim(), 1);
                                bulkCopy.ColumnMappings.Add(drptimesheetdateSingle.SelectedItem.Text.ToString().Trim(), 2);
                                bulkCopy.ColumnMappings.Add(drptimesheettimeInSingle.SelectedItem.Text.ToString().Trim(), 3);
                                bulkCopy.ColumnMappings.Add(drptimesheetdateoutSingle.SelectedItem.Text.ToString().Trim(), 4);
                                bulkCopy.ColumnMappings.Add(drptimesheettimeOutSingle.SelectedItem.Text.ToString().Trim(), 5);
                                bulkCopy.ColumnMappings.Add("Company_Id", 6);
                                bulkCopy.ColumnMappings.Add("TranId", 7);
                                //bulkCopy.ColumnMappings.Add(drpTimeSheetDate.SelectedItem.Text.ToString().Trim(), 8);
                                bulkCopy.WriteToServer(dt);
                                //update and Redirect to prev page...
                                lblMsg.InnerHtml = lblDocNo.Text + " Imported Sucessfully";
                                //if (retVal == 1)
                                //{
                                //    CmdImport.Enabled = false;
                                //    btnCancel.Enabled = true;
                                //    btnSave.Enabled = true;
                                //}
                            }

                            //Save Data in Data base for 

                            //Upload File And sp_BulkInsert_TimeSheet and show Summary : Number of Rows Valid
                            // and number of rows which are not valid and ask user if they want to upload remaining
                            // rows or not....

                            int i = 0;
                            SqlParameter[] parms = new SqlParameter[1];                            
                            parms[i++] = new SqlParameter("@compid", Utility.ToInteger(Session["Compid"]));

                            string sSQL = "sp_BulkInsert_TimeSheet";
                            try
                            {
                                DataSet ds = new DataSet();
                                ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                                RadGrid2.DataSource = ds;
                                RadGrid2.DataBind();
                                RadGrid2.Rebind();

                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    RadGrid2.Visible = true;
                                    //Show Data in 
                                    string sql = "SELECT Count(*) FROM ACTATEK_LOGS_TEMP WHERE LEN(TimeIn)=8 AND LEN([TimeOut])=8";

                                    int cnt = DataAccess.ExecuteScalar(sql);

                                    string strMessage = "";
                                    //int InvalidRows = cnt - ds1.Tables[0].Rows.Count;
                                    strMessage = "Number of Valid Rows " + cnt.ToString();
                                    strMessage = strMessage + " <br/> Number of Invalid Rows " + ds.Tables[0].Rows.Count.ToString() + "  <br/> Invalid Rows Displayed Below.";
                                    strMessage = strMessage + "<br/> ******************* Action *************<br/> ";
                                    strMessage = strMessage + "To Import : Click On continue Import Leaving Invalid Rows <br/>";
                                    strMessage = strMessage + "This Will not import invalid rows displayed below <br/> To Cancel :";
                                    strMessage = strMessage + "Click on Cancel Import this will delete the import data,User can fix the rows and re import data";

                                    //lblMsg.InnerHtml = "Number of Valid Rows " + cnt.ToString() + "  <br/> Below are invalid rows. <br/> Please Click on Save Button to insert Valid data.<br/> Press Cancel to Upload File Again";
                                    lblMsg.InnerHtml = strMessage;
                                    CmdImport.Enabled = false;
                                    btnCancel.Enabled = true;
                                    btnSave.Enabled = true;
                                }
                                else
                                {
                                    saveData("S");
                                    //lblMsg.InnerHtml = "Data Uploaded Successfully";
                                }
                            }
                            catch (Exception ex)
                            {
                                lblMsg.InnerHtml = "Error In Uploading File Please Try again";
                            }                            
                        }
                        catch (Exception ex)
                        {
                           lblMsg.InnerHtml = ex.Message;

                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.InnerHtml= ex.Message;
                    string sSQL = "Update [TS_FileUploaded] set Status=100, ErrorMsg ='" + ex.Message.Replace("'", "") + " " + ex.Source + "' WHERE [TranID] ='" + strtranid + "'";
                    int retVal = DataAccess.ExecuteStoreProc(sSQL);
                    if (retVal == 1)
                    {
                        Session["ProcessTranId"] = null;
                        Response.Redirect("TimeSheetDocument.aspx");
                    }
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public void saveData(string FileType)
        {

            if (FileType == "M")
            {
                int i = 0;
                SqlParameter[] parms = new SqlParameter[1];
                //parms[i++] = new SqlParameter("@Company_ID", compid);
                parms[i++] = new SqlParameter("@transid", Session["TRANSID"].ToString());

                string sSQL = "sp_Save_Data_ACTATEK_LOGS";
                try
                {
                    int retVal = DataAccess.ExecuteStoreProc(sSQL, parms);

                    string sql1 = "SELECT Count(*) FROM ACTATEK_LOGS WHERE tranid = '" + Session["TRANSID"].ToString() + "'";                
                    int cnt = DataAccess.ExecuteScalar(sql1);

                    btnCancel.Enabled = false;
                    btnSave.Enabled = false;
                    CmdImport.Enabled = false;
                    rowMulti.Visible = false;
                    rowSingle.Visible = false;

                    lblMsg1.InnerHtml = " </br> " + cnt.ToString() + "Rows Imported Successfully";
                    RadGrid1.Visible = false;
                    RadGrid2.Visible = false;
                    string sSQL1 = "Update [TS_FileUploaded] set Status=1 WHERE [TranID] ='" + strtranid + "'";
                    int retVal1 = DataAccess.ExecuteStoreProc(sSQL1);
                }
                catch (Exception ex)
                {

                    lblMsg.InnerHtml = ex.Message;
                }
            }
            else if (FileType == "S")
            {
                int i = 0;
                SqlParameter[] parms = new SqlParameter[1];
                parms[i++] = new SqlParameter("@flag", "1");
                //string sql1 = "SELECT Count(*) FROM ACTATEK_LOGS_TEMP WHERE LEN(TimeIn)=8 AND LEN([TimeOut])=8";
                //int cnt = DataAccess.ExecuteScalar(sql1);

                string sql = "sp_BulkInsert_ValidTimeSheet_Data";
                try
                {
                    //int cnt = DataAccess.ExecuteScalar(sql);
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sql, parms);                    
                    //lblMsg.InnerHtml = "Data Uploaded Successfully </br> ( " + cnt.ToString() + ") Rows";
                    string sql1 = "SELECT Count(*) FROM ACTATEK_LOGS WHERE tranid = '" + Session["TRANSID"].ToString() + "'";
                    int cnt = DataAccess.ExecuteScalar(sql1);
                    lblMsg1.InnerHtml = " </br> " + cnt.ToString() + " Rows Imported Successfully";

                    rowMulti.Visible = false;
                    rowSingle.Visible = false;
                    RadGrid1.Visible = false;
                    RadGrid2.Visible = false;
                    btnCancel.Enabled = false;
                    btnSave.Enabled = false;
                    CmdImport.Enabled = false;

                    string sSQL1 = "Update [TS_FileUploaded] set Status=1 WHERE [TranID] ='" + strtranid + "'";
                    int retVal1 = DataAccess.ExecuteStoreProc(sSQL1);
                }
                catch(Exception ex )
                {
                    lblMsg.InnerHtml = ex.Message;
                }
            }

            lblMsg.InnerHtml = "";
        }

        protected void Button1_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("TimeSheetDocument.aspx");
        }

    }
}
