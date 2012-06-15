//http://social.msdn.microsoft.com/forums/en-US/vblanguage/thread/6f145da3-6fc6-4b10-bc6e-de6765777637/
//http://weblogs.asp.net/guystarbuck/archive/2008/05/13/automated-search-and-replace-in-multiple-word-2007-documents-with-c.aspx

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

using System.Data.SqlClient;
using Telerik.Web.UI;
using System.Net.Mail;
using System.Drawing;
using System.IO;
using System.Text;


using System.Net;
using System.Data;
//using Microsoft.Office.Interop.Word;

namespace SMEPayroll.Management
{
    public partial class HRLetter : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //string EmpCode = Request.QueryString["name"].ToString();

            SqlDataSource1.ConnectionString = @"Data Source=DEVELOPMENT4\RAMKUMAR;Initial Catalog=PSL;User ID=sa;Password=anb@payroll";

            Session["Compid"] = 3;
        }

        //Generate Button
        protected void btn_generate_Click(object sender, EventArgs e)
        {
            foreach (Telerik.Web.UI.GridItem item in RadGrid1.MasterTableView.Items)
            {
                if (item is GridItem)
                {
                    GridDataItem dataItem = (GridDataItem)item;
                    CheckBox chkBox = (CheckBox)dataItem["GridClientSelectColumn"].Controls[0];
                    if (chkBox.Checked == true)
                    {

                        int empid = Utility.ToInteger(this.RadGrid1.MasterTableView.Items[dataItem.ItemIndex].GetDataKeyValue("EMP_CODE"));


                        #region Generate Word Doc based on checkbox select

                            List<MYList> _mylist = new List<MYList>();
                            _mylist = GetNameToReplace(empid);

                            //string input = @"D:\RAMU\PROJECTS\VSTO\First\ConsoleApplication1\template1.docx";
                            //string output = @"D:\\RAMU\\PROJECTS\\VSTO\\First\\ConsoleApplication1\\" + empid + ".doc";

                            string input = @"c:\template1.docx";
                            string output = @"c:\\" + empid + ".doc";
                           
                            DoSearchAndReplaceInWord(input, output, _mylist);

                            Response.Write("Generation completed for the Emp=" + empid);

                        #endregion

                    }
                }
            }
        }

      


        #region Maintance Region
            string Emp_Name, probation_period;
            private List<MYList> GetNameToReplace(int empid)
            {
                List<MYList> _mylist = new List<MYList>();
                try
                {
                    #region Get Employee details from Employee table

                        string sqlup = @"select  EMP_CODE, (isnull(emp_name,'') + ' ' + isnull(emp_lname,'')) 'EMP_NAME',* from Employee where company_id='3'";
                        SqlDataReader dr = DataAccess.ExecuteReader(CommandType.Text, sqlup, null);
                        while (dr.Read())
                        {
                            Emp_Name = dr.GetString(dr.GetOrdinal("EMP_NAME"));
                            probation_period = Convert.ToString((dr.GetOrdinal("probation_period")));
                        }

                    #endregion

                        _mylist.Add(new MYList("#EmpID#", "3333"));
                        _mylist.Add(new MYList("#name#", "Tet Name"));
                        _mylist.Add(new MYList("#probation_period#", "6"));

                        //_mylist.Add(new MYList("#EmpID#", empid.ToString()));
                        //_mylist.Add(new MYList("#name#", Emp_Name));
                        //_mylist.Add(new MYList("#probation_period#", probation_period));

                }
                catch (Exception e)
                {
                    throw;
                    //error message
                }

               
                return _mylist;
            }
        #endregion


        #region Code which Find and replace Text in Word Document
         internal static void DoSearchAndReplaceInWord(string inputFile, string OutputFile, List<MYList> _mylist)
        {
            // Create the Word application and declare a document
            Microsoft.Office.Interop.Word.Application word = new Microsoft.Office.Interop.Word.Application();
            Microsoft.Office.Interop.Word.Document doc = new Microsoft.Office.Interop.Word.Document();

            // Define an object to pass to the API for missing parameters
            object missing = System.Type.Missing;

            try
            {
                // Everything that goes to the interop must be an object
                //object fileName = @"D:\RAMU\PROJECTS\VSTO\First\ConsoleApplication1\template1.docx";
                object fileName = inputFile;

                // Open the Word document.
                doc = word.Documents.Open(ref fileName,
                    ref missing, ref missing, ref missing, ref missing,
                    ref missing, ref missing, ref missing, ref missing,
                    ref missing, ref missing, ref missing, ref missing,
                    ref missing, ref missing, ref missing);

                // Activate the document
                doc.Activate();


                //findAndReplace(word, "#name#", "1111111111");
                //findAndReplace(word, "#name1#", "222222222222222");
                //findAndReplace(word, "#name2#", "33333333333333");
                foreach (MYList ml in _mylist)
                {
                    findAndReplace(word, ml.FindName, ml.ReplaceName);
                }




                // Save the changes in the template it self//
                //  doc.Save();

                //With out password protect//
                // doc.SaveAs("D:\\RAMU\\PROJECTS\\VSTO\\First\\ConsoleApplication1\\testnew.doc");
                doc.SaveAs(OutputFile);

                //Save with password protect
                //doc.SaveAs(FileName: OutputFile, Password: "abc");

                
               
                

                // Close the doc and exit the app
                doc.Close(ref missing, ref missing, ref missing);
                word.Application.Quit(ref missing, ref missing, ref missing);


            }
            catch (Exception ex)
            {
                doc.Close(ref missing, ref missing, ref missing);
                word.Application.Quit(ref missing, ref missing, ref missing);
            }


        }
         private static void findAndReplace(Microsoft.Office.Interop.Word.Application word, object findText, object replaceWithtext)
        {
            //http://www.techrepublic.com/blog/howdoi/how-do-i-modify-word-documents-using-c/190
            object matchCase = true;
            object matchWholeWord = true;
            object matchWildCards = false;
            object matchSoundsLike = false;
            object nmatchAllWordForms = false;
            object forward = true;
            object format = false;
            object matchkasdia = false;
            object matchDiacrities = false;
            object matchAlefHamza = false;
            object matchcontrol = false;
            object read_only = false;
            object visible = true;
            object replace = 2;
            object wrap = 1;

            word.Selection.Find.Execute(ref findText,
                ref matchCase, ref matchWholeWord,
                ref matchWildCards, ref matchSoundsLike,
                ref nmatchAllWordForms, ref forward,
                ref wrap, ref format, ref replaceWithtext,
                ref replace, ref matchkasdia,
                ref matchDiacrities, ref matchAlefHamza,
                ref matchcontrol);


        }
        #endregion



    }


    class MYList
    {
        #region Private Member
        private string _findName;
        private string _replaceName;
        #endregion

        #region Constructor

        public MYList(string findName, string replaceName)
        {
            // TODO: Complete member initialization
            this._findName = findName;
            this._replaceName = replaceName;
        }
        #endregion

        #region Property

        public string FindName
        {
            get { return _findName; }
            set { _findName = value; }
        }

        public string ReplaceName
        {
            get
            {
                if (string.IsNullOrEmpty(_replaceName))
                {
                    return _replaceName + "### There is no value ###";
                }
                else
                {
                    return _replaceName;
                }
            }
            set
            {
                _replaceName = value;
            }
        }

        #endregion
    }
    

 
}

