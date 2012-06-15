using SMEPayroll.employee;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;

namespace SMETEST
{
    
    
    /// <summary>
    ///This is a test class for AddEditEmployeeTest and is intended
    ///to contain all AddEditEmployeeTest Unit Tests
    ///</summary>
    [TestClass()]
    public class AddEditEmployeeTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for AddEditEmployee Constructor
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        public void AddEditEmployeeConstructorTest()
        {
            AddEditEmployee target = new AddEditEmployee();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for AddEditEmployee_PreRender
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void AddEditEmployee_PreRenderTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for AddEmployee_DataBinding
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void AddEmployee_DataBindingTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for AllowTermination
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void AllowTerminationTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for BindChildleavepolicyNormal
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void BindChildleavepolicyNormalTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for BindResults
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void BindResultsTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for BindleavepolicyNormal
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void BindleavepolicyNormalTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for ButtonAdd_Click
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void ButtonAdd_ClickTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for CPFChange
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        public void CPFChangeTest()
        {
            AddEditEmployee target = new AddEditEmployee(); // TODO: Initialize to an appropriate value
            string cpf = string.Empty; // TODO: Initialize to an appropriate value
            string PRDate = string.Empty; // TODO: Initialize to an appropriate value
            int empgroup = 0; // TODO: Initialize to an appropriate value
            string dob = string.Empty; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = target.CPFChange(cpf, PRDate, empgroup, dob);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CustomizeDay
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void CustomizeDayTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for DisplayMessage
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void DisplayMessageTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for EmpAutoAddANB
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void EmpAutoAddANBTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for EmpSave
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void EmpSaveTest()
        {

            Assert.IsTrue(true);
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for InitializeComponent
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void InitializeComponentTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for LoadBankGrid
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void LoadBankGridTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for LoadFormValues
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void LoadFormValuesTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for NRIC_Check
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4455/LoginWMS.aspx")]
        public void NRIC_CheckTest()
        {

            //value="1" NRIC
            //value="2" FIN
            AddEditEmployee target = new AddEditEmployee(); // TODO: Initialize to an appropriate value
            string nricType = "55"; // TODO: Initialize to an appropriate value
            string nricVal = "S8174232D"; // TODO: Initialize to an appropriate value
            string expected = "yes"; // TODO: Initialize to an appropriate value
            string actual;
            actual = target.NRIC_Check(nricType, nricVal);
            Assert.AreEqual(expected, actual);
            //Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for NumberDecimalPlaces
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void NumberDecimalPlacesTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for OnInit
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void OnInitTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for Page_Load
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void Page_LoadTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for Page_Unload
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void Page_UnloadTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid10_DeleteCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid10_DeleteCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid1_DeleteCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid1_DeleteCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid1_ItemCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid1_ItemCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid1_ItemDataBound
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid1_ItemDataBoundTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid2_DeleteCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid2_DeleteCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid2_ItemCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid2_ItemCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid2_ItemDataBound
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid2_ItemDataBoundTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid3_DeleteCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid3_DeleteCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid3_ItemDataBound
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid3_ItemDataBoundTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid4_DeleteCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid4_DeleteCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid4_ItemInserted
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid4_ItemInsertedTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid4_ItemUpdated
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid4_ItemUpdatedTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid5_DeleteCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid5_DeleteCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid5_ItemCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid5_ItemCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid5_ItemDataBound
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid5_ItemDataBoundTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid6_DeleteCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid6_DeleteCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid6_ItemDataBound
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid6_ItemDataBoundTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid7_ItemCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid7_ItemCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid7_ItemCreated
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid7_ItemCreatedTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for RadGrid7_ItemDataBound
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void RadGrid7_ItemDataBoundTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for ShowMessageBox
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        public void ShowMessageBoxTest()
        {
            string message = string.Empty; // TODO: Initialize to an appropriate value
            AddEditEmployee.ShowMessageBox(message);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for btnAddHistory_Click
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void btnAddHistory_ClickTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for btnBulkInsert_Click
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void btnBulkInsert_ClickTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for btnLeaveUpdate_Click
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void btnLeaveUpdate_ClickTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for btnSB_Click
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void btnSB_ClickTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for btnYOSUpdate_Click
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void btnYOSUpdate_ClickTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for btnsave5_Click1
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void btnsave5_Click1Test()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for buttonDelete_Click
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void buttonDelete_ClickTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for buttonSubmit_Click
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void buttonSubmit_ClickTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for calculate_DailyRate
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        public void calculate_DailyRateTest()
        {
            AddEditEmployee target = new AddEditEmployee(); // TODO: Initialize to an appropriate value
            float payrate = 0F; // TODO: Initialize to an appropriate value
            float workingdays = 0F; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = target.calculate_DailyRate(payrate, workingdays);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for calculate_fund
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        public void calculate_fundTest()
        {
            AddEditEmployee target = new AddEditEmployee(); // TODO: Initialize to an appropriate value
            string payfrequency = string.Empty; // TODO: Initialize to an appropriate value
            string emptype = string.Empty; // TODO: Initialize to an appropriate value
            int payrate = 0; // TODO: Initialize to an appropriate value
            string race = string.Empty; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = target.calculate_fund(payfrequency, emptype, payrate, race);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for drpYear_SelectedIndexChanged
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void drpYear_SelectedIndexChangedTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for getDataSet
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void getDataSetTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for nric_change
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void nric_changeTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for radItemIssued_DeleteCommand
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void radItemIssued_DeleteCommandTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for radItemIssued_ItemDataBound
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void radItemIssued_ItemDataBoundTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for radItemIssued_ItemInserted
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void radItemIssued_ItemInsertedTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for radItemIssued_ItemUpdated
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void radItemIssued_ItemUpdatedTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for sendemail
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        [DeploymentItem("SMEPayroll.dll")]
        public void sendemailTest()
        {
            // Creation of the private accessor for 'Microsoft.VisualStudio.TestTools.TypesAndSymbols.Assembly' failed
            Assert.Inconclusive("Creation of the private accessor for \'Microsoft.VisualStudio.TestTools.TypesAndSy" +
                    "mbols.Assembly\' failed");
        }

        /// <summary>
        ///A test for Dataitem
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("F:\\PROJECTS\\SHASHANK\\SME_TFS_2012\\SMPPAYROLL_WORKING\\SMEPayroll", "/")]
        [UrlToTest("http://localhost:4433/")]
        public void DataitemTest()
        {
            AddEditEmployee target = new AddEditEmployee(); // TODO: Initialize to an appropriate value
            object expected = null; // TODO: Initialize to an appropriate value
            object actual;
            target.Dataitem = expected;
            actual = target.Dataitem;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }
    }
}
