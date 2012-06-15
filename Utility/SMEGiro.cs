using System;
using System.Data;
using Microsoft.VisualBasic;
using System.Text;
using System.IO;
using System.Web;
using System.Data.SqlClient;

namespace SMEPayroll
{
    public class SMEGiro
    {
        public int SalMonth;
        public int SalYear;
        public int CompanyID;
        public int GiroBankID;
        public int SenderBank;
        public string SenderAccountNo;
        public string LogFileName;
        public string LogFilePath;
        public string sEmployeeList;
        public bool StillExecuting;
        public bool isHash=false;
        public int ValueDate;
        private static DataSet GetDataSet(string query)
        {
            DataSet ds = new DataSet();
            ds = DataAccess.FetchRS(CommandType.Text, query, null);
            return ds;
        }

        #region Deleted
        //private string GetReceivingAccountName(int EmployeeID, int intMask)
        //{
        //    string functionReturnValue = null;
        //    string sSQL = null;
        //    string sRetVal = null;
        //    DataSet ds = new DataSet();
        //    sSQL = "SELECT giro_acc_name FROM employee WHERE emp_code = " + EmployeeID;
        //    ds = GetDataSet(sSQL);
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {

        //        functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["giro_acc_name"].ToString().Trim());

        //        if (functionReturnValue != "")
        //        {
        //            if (intMask > 0)
        //            {
        //                functionReturnValue = MaskString(functionReturnValue, intMask);
        //            }
        //        }
        //        else
        //        {
        //            functionReturnValue = "Account Name not found in the database.";
        //        }
        //    }
        //    return functionReturnValue;
        //}

        //private string GetReceivingAccountNo(int EmployeeID, int intMask)
        //{
        //    string functionReturnValue = null;
        //    string sSQL = null;
        //    string sRetVal = null;
        //    DataSet ds = new DataSet();
        //    sSQL = "SELECT giro_acct_number FROM employee WHERE emp_code = " + EmployeeID;
        //    ds = GetDataSet(sSQL);
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {

        //        functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["giro_acct_number"].ToString().Trim());

        //        if (functionReturnValue != "")
        //        {
        //            if (intMask > 0)
        //            {
        //                functionReturnValue = MaskString(functionReturnValue, intMask);
        //            }
        //        }
        //        else
        //        {
        //            functionReturnValue = "Account No not found in the database.";
        //        }
        //    }
        //    return functionReturnValue;
        //}

        //private string GetReceivingBranchNo(int EmployeeID, int intMask)
        //{
        //    string functionReturnValue = null;
        //    string sSQL = null;
        //    string sRetVal = null;
        //    DataSet ds = new DataSet();
        //    sSQL = "SELECT giro_branch FROM employee WHERE emp_code = " + EmployeeID;
        //    ds = GetDataSet(sSQL);
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {

        //        functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["giro_branch"].ToString().Trim());

        //        if (functionReturnValue != "")
        //        {
        //            if (intMask > 0)
        //            {
        //                functionReturnValue = MaskString(functionReturnValue, intMask);
        //            }
        //        }
        //        else
        //        {
        //            functionReturnValue = "Giro Branch No not found in the database.";
        //        }
        //    }
        //    return functionReturnValue;
        //}

        //private string GetReceivingBankNo(int EmployeeID, int intMask)
        //{
        //    string functionReturnValue = null;
        //    string sSQL = null;
        //    string sRetVal = null;
        //    DataSet ds = new DataSet();
        //    sSQL = "SELECT giro_bank FROM employee WHERE emp_code = " + EmployeeID;
        //    ds = GetDataSet(sSQL);
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {

        //        functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["giro_bank"].ToString().Trim());

        //        if (functionReturnValue != "")
        //        {
        //            if (intMask > 0)
        //            {
        //                functionReturnValue = MaskString(functionReturnValue, intMask);
        //            }
        //        }
        //        else
        //        {
        //            functionReturnValue = "Bank Code not found in the database.";
        //        }
        //    }
        //    return functionReturnValue;
        //}
        #endregion Deleted

        private double GetAccountHash(string sReceivingAccountNo)
        {
            string sOrigLeft = null;
            string sOrigRight = null;
            string sRecLeft = null;
            string sReRight = null;
            double sA;
            double sB;

            string sOriginatingAccountNo = null;

            sOriginatingAccountNo = Replace(SenderAccountNo, "-", "");
            sReceivingAccountNo = Replace(sReceivingAccountNo, "-", "");

            sOriginatingAccountNo = sOriginatingAccountNo + Strings.Space(11 - Strings.Len(Strings.Left(sOriginatingAccountNo.ToString().Trim(), 11)));
            sReceivingAccountNo = sReceivingAccountNo + Strings.Space(11 - Strings.Len(Strings.Left(sReceivingAccountNo.ToString().Trim(), 11)));

            sOriginatingAccountNo = Replace(sOriginatingAccountNo, " ", "0");
            sReceivingAccountNo = Replace(sReceivingAccountNo, " ", "0");

            sOrigLeft = Strings.Left(sOriginatingAccountNo, 6);
            sOrigRight = Strings.Right(sOriginatingAccountNo, 5);

            sRecLeft = Strings.Left(sReceivingAccountNo, 6);
            sReRight = Strings.Right(sReceivingAccountNo, 5);

            sA = Utility.ToDouble(sRecLeft) - Utility.ToDouble(sReRight);
            sB = Utility.ToDouble(sOrigLeft) - Utility.ToDouble(sOrigRight);

            return System.Math.Abs(sA - sB);
        }

        private string GetOriginatingAccountNumber(int intMask)
        {
            string functionReturnValue = null;
            string sSQL = null;
            //string sRetVal = null;
            DataSet ds = new DataSet();
            sSQL = "SELECT bank_accountno FROM girobanks WHERE bank_id = " + SenderBank + " AND bank_accountno = '" + SenderAccountNo + "' And Company_ID=" + CompanyID.ToString();
            ds = GetDataSet(sSQL);

            if (ds.Tables[0].Rows.Count > 0)
            {
                functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["bank_accountno"].ToString().Trim());

                if (functionReturnValue != "")
                {
                    if (intMask > 0)
                    {
                        functionReturnValue = MaskString(functionReturnValue, intMask);
                    }
                }
                else
                {
                    functionReturnValue = "Bank Account No not found in the database.";
                }
            }
            return functionReturnValue;
        }

        private string GetOriginatingBankCode(int intMask)
        {
            string functionReturnValue = null;
            string sSQL = null;
            //string sRetVal = null;
            DataSet ds = new DataSet();
            sSQL = "SELECT bank_code FROM Bank Where id=" + SenderBank;
            ds = GetDataSet(sSQL);
            if (ds.Tables[0].Rows.Count > 0)
            {
                functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["bank_code"].ToString().Trim());

                if (functionReturnValue != "")
                {
                    functionReturnValue = MaskNumber(Utility.ToDouble(functionReturnValue), 3);
                }
                else
                {
                    functionReturnValue = "Bank branch Code not found in the database.";
                }
            }
            return functionReturnValue;
        }

        private string GetOriginatingBranchNumber(int intMask)
        {
            string functionReturnValue = null;
            string sSQL = null;
            //string sRetVal = null;
            DataSet ds = new DataSet();
            sSQL = "SELECT bank_branch FROM girobanks WHERE bank_id = " + SenderBank + " AND bank_accountno = '" + SenderAccountNo + "' And Company_ID=" + CompanyID.ToString();
            ds = GetDataSet(sSQL);
            if (ds.Tables[0].Rows.Count > 0)
            {
                functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["bank_branch"].ToString().Trim());

                if (functionReturnValue != "")
                {
                    functionReturnValue = MaskNumber(Utility.ToDouble(functionReturnValue), 3);
                }
                else
                {
                    functionReturnValue = "Bank branch not found in the database.";
                }
            }
            return functionReturnValue;
        }

        private string GetOriginatorName(int intMask)
        {
            string functionReturnValue = null;
            string sSQL = null;
            //string sRetVal = null;
            DataSet ds = new DataSet();
            sSQL = "SELECT giro_acc_name FROM girobanks WHERE bank_id = " + SenderBank + " AND bank_accountno = '" + SenderAccountNo + "' And Company_ID=" + CompanyID.ToString();
            ds = GetDataSet(sSQL);
            if (ds.Tables[0].Rows.Count > 0)
            {

                functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["giro_acc_name"].ToString().Trim());

                if (functionReturnValue != "")
                {
                    if (intMask > 0)
                    {
                        functionReturnValue = MaskString(functionReturnValue, intMask);
                    }
                }
                else
                {
                    functionReturnValue = "Originator Name not found in the database.";
                }
            }
            return functionReturnValue;
        }

        private string GetApproverCode(int intMask)
        {
            string functionReturnValue = null;
            string sSQL = null;
            //string sRetVal = null;
            DataSet ds = new DataSet();
            sSQL = "SELECT approvercode FROM girobanks WHERE bank_id = " + SenderBank + " AND bank_accountno = '" + SenderAccountNo + "' And Company_ID=" + CompanyID.ToString();
            ds = GetDataSet(sSQL);
            if (ds.Tables[0].Rows.Count > 0)
            {
                functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["approvercode"].ToString().Trim());
                if (functionReturnValue != "")
                {
                    if (intMask > 0)
                    {
                        functionReturnValue = MaskString(functionReturnValue, intMask);
                    }
                }
                else
                {
                    functionReturnValue = "Approver Code not found in the database.";
                }
            }
            return functionReturnValue;
        }

        private string GetOperatorCode(int intMask)
        {
            string functionReturnValue = null;
            string sSQL = null;
            //string sRetVal = null;
            DataSet ds = new DataSet();
            sSQL = "SELECT operatorcode FROM girobanks WHERE bank_id = " + SenderBank + " AND bank_accountno = '" + SenderAccountNo + "' And Company_ID=" + CompanyID.ToString();
            ds = GetDataSet(sSQL);
            if (ds.Tables[0].Rows.Count > 0)
            {
                functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["operatorcode"].ToString().Trim());
                if (functionReturnValue != "")
                {
                    if (intMask > 0)
                    {
                        functionReturnValue = MaskString(functionReturnValue, intMask);
                    }
                }
                else
                {
                    functionReturnValue = "Operator Code not found in the database.";
                }
            }
            return functionReturnValue;
        }

        private string GetSenderCompanyID(int intMask)
        {
            string functionReturnValue = null;
            string sSQL = null;
            //string sRetVal = null;
            DataSet ds = new DataSet();
            sSQL = "SELECT company_bankcode FROM girobanks WHERE bank_id = " + SenderBank + " AND bank_accountno = '" + SenderAccountNo + "' And Company_ID=" + CompanyID.ToString();
            ds = GetDataSet(sSQL);
            if (ds.Tables[0].Rows.Count > 0)
            {
                functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["company_bankcode"].ToString().Trim());
                if (functionReturnValue != "")
                {
                    if (intMask > 0)
                    {
                        functionReturnValue = MaskString(functionReturnValue, intMask);
                    }
                }
                else
                {
                    functionReturnValue = "GIRO Company ID not found in the database.";
                }
            }
            return functionReturnValue;
        }

        private string GetCompanyName(int intMask)
        {
            string functionReturnValue = null;
            string sSQL = null;
            //string sRetVal = null;
            DataSet ds = new DataSet();
            sSQL = "SELECT company_name FROM company WHERE company_id = " + this.CompanyID;
            ds = GetDataSet(sSQL);
            if (ds.Tables[0].Rows.Count > 0)
            {

                functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["company_name"].ToString().Trim());

                if (functionReturnValue != "")
                {
                    if (intMask > 0)
                    {
                        functionReturnValue = MaskString(functionReturnValue, intMask);
                    }
                }
                else
                {
                    functionReturnValue = "Company Name not found in the database.";
                }
            }
            return functionReturnValue;
        }

        private string GetValueDate(string strFormatFor)
        {
            string functionReturnValue = null;
            //string sSQL = null;
            //DataSet ds = new DataSet();
            //sSQL = "SELECT value_date FROM girobanks WHERE bank_id = " + SenderBank + " AND bank_accountno = '" + SenderAccountNo + "' And Company_ID=" + CompanyID.ToString();
            //ds = GetDataSet(sSQL);
            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //if (Strings.Len(ToStringConv(ds.Tables[0].Rows[0]["value_date"].ToString())) == 1)
            //{
            //    functionReturnValue = "0" + ToStringConv(ds.Tables[0].Rows[0]["value_date"].ToString().Trim());
            //}
            //else
            //{
            //   functionReturnValue = ToStringConv(ds.Tables[0].Rows[0]["value_date"].ToString().Trim());
            //}
            if (Strings.Len(ToStringConv(this.ValueDate.ToString())) == 1)
            {
                functionReturnValue = "0" + ToStringConv(this.ValueDate.ToString().Trim());
            }
            else
            {
                functionReturnValue = ToStringConv(this.ValueDate.ToString().Trim());
            }

            if (functionReturnValue != "")
            {
                DateTime dt = new DateTime(DateTime.Now.Year, DateTime.Now.Month, Convert.ToInt16(functionReturnValue));
                if (strFormatFor == "1")
                {
                    functionReturnValue = dt.ToString("yyMMdd");
                }
                else if (strFormatFor == "2")
                {
                    functionReturnValue = dt.ToString("dd/MM/yyyy");
                }
                else if (strFormatFor == "3")
                {
                    functionReturnValue = dt.ToString("yyyy-MM-dd");
                }
                else if (strFormatFor == "4")
                {
                    functionReturnValue = dt.ToString("yyyyMMdd");
                }
                else
                {
                    functionReturnValue = dt.ToString("dd/MM/yyyy");
                }

            }
            else
            {
                functionReturnValue = "Value Date not found in the database.";
            }

            //}
            return functionReturnValue;
        }

        public string MaskString(string sSrc, int iLength)
        {
            string sTemp = null;
            int i = 0;
            sTemp = "";
            for (i = 1; i <= iLength - Strings.Len(sSrc); i++)
            {
                sTemp = sTemp + " ";
            }
            return sSrc + sTemp;
        }

        public string MaskStringForward(string sSrc, int iLength, string strValue)
        {
            string sTemp = null;
            int i = 0;
            sTemp = "";
            for (i = 1; i <= iLength - Strings.Len(sSrc); i++)
            {
                sTemp = strValue + sTemp;
            }
            return sTemp + sSrc;
        }


        public string MaskNumber(double iNumber, int iLength)
        {
            string sTemp = null;
            int i = 0;
            sTemp = "";
            for (i = 1; i <= iLength - Strings.Len(iNumber.ToString()); i++)
            {
                sTemp = sTemp + "0";
            }
            return sTemp + iNumber;
        }

        public static String Replace(String strText, String strFind, String strReplace)
        {
            int iPos = strText.IndexOf(strFind);
            String strReturn = "";
            while (iPos != -1)
            {
                strReturn += strText.Substring(0, iPos) + strReplace;
                strText = strText.Substring(iPos + strFind.Length);
                iPos = strText.IndexOf(strFind);
            }
            if (strText.Length > 0)
                strReturn += strText;
            return strReturn;
        }

        public string MaskNumberBack(double iNumber, int iLength)
        {
            string sTemp = null;
            int i = 0;
            sTemp = "";
            for (i = 1; i <= iLength - Strings.Len(iNumber.ToString()); i++)
            {
                sTemp = sTemp + "0";
            }
            return iNumber + sTemp;
        }


        public string ToStringConv(object sParam)
        {
            string functionReturnValue = null;
            if (sParam == null)
            {
                functionReturnValue = "";
            }
            else
            {
                functionReturnValue = Replace(Strings.Trim(sParam.ToString()), "'", "''");
            }
            return functionReturnValue;
        }

        public string GenerateGiroFile_Mizuho()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);

            try
            {
                string strGetValueDate = GetValueDate("4");
                string strGetCompanyName = Strings.Left(GetCompanyName(20), 20);
                string strGetOriginatingAccountNumber = GetOriginatingAccountNumber(11);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);
                string strCustAcNo = "";

                if (strGetOriginatingAccountNumber.Length > 6)
                {
                    strCustAcNo = Strings.Right(strGetOriginatingAccountNumber.ToString().Trim(), 6);
                }
                else
                {
                    strCustAcNo = strGetOriginatingAccountNumber.ToString().Trim();
                }
                string strGetOperatorCode = Strings.Left(GetOperatorCode(14), 14);
                string strGetApproverCode = Strings.Left(GetApproverCode(14), 14);
                fp = File.CreateText(strPath + this.LogFileName.ToString());
                fp.WriteLine("HOG 01" + strGetValueDate + strGetCompanyName + strGetOriginatingAccountNumber + "SGD" + strGetOperatorCode + strGetApproverCode);

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double iTotal = 0;
                            string striTotal;
                            double intA;
                            double intB;
                            double intC;
                            double intD;
                            double intE;
                            double inthashvalue = 0;
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    intA = Utility.ToDouble(row["giro_bank"].ToString());
                                    intB = Utility.ToDouble(row["branch_number"].ToString());
                                    intC = Utility.ToDouble(Strings.Left(row["giro_acct_number"].ToString(), 1));
                                    intD = Utility.ToDouble(Strings.Right(row["giro_acct_number"].ToString(), 1));
                                    intE = Utility.ToDouble(row["netpay"].ToString());
                                    inthashvalue = inthashvalue + ((intA + intB + intC + intD) * intE);


                                    string strgirobank = Strings.Left(MaskString(row["giro_bank"].ToString(), 4), 4);
                                    string strbranchnumber = Strings.Left(MaskString(row["branch_number"].ToString(), 3), 3);
                                    string strgiroaccountno = Strings.Left(MaskString(row["giro_acct_number"].ToString(), 11), 11);
                                    string strreceivingname = Strings.Left(MaskString(row["account_name"].ToString(), 20), 20);
                                    string strCustGetValueDate = GetValueDate("1");
                                    iTotal = iTotal + Utility.ToDouble(row["netpay"].ToString());
                                    string strNetPay = Strings.Left(MaskNumber(Utility.ToDouble(row["netpay"].ToString()), 9), 9);
                                    if (strNetPay.IndexOf(".") > 0)
                                    {
                                        if (strNetPay.IndexOf(".") == 7)
                                        {
                                            if ((strNetPay.Length - (strNetPay.IndexOf(".") + 1)) == 1)
                                            {
                                                strNetPay = "00" + strNetPay + "0";
                                            }
                                        }
                                        else
                                        {
                                            strNetPay = "000" + strNetPay;
                                        }
                                    }
                                    else
                                    {
                                        strNetPay = strNetPay + ".00";
                                    }
                                    string strCon = "D" + strCustAcNo + strgirobank + strbranchnumber + strgiroaccountno + strreceivingname + "22" + strCustGetValueDate + strNetPay + "C";
                                    fp.WriteLine(strCon + "                        ");

                                }
                            }
                            striTotal = Strings.Left(MaskNumber(iTotal, 13), 13);
                            if (striTotal.IndexOf(".") > 0)
                            {
                                striTotal = "000" + striTotal;
                            }
                            else
                            {
                                striTotal = striTotal + ".00";
                            }
                            fp.WriteLine("T" + MaskNumber(Utility.ToDouble(ds.Tables[0].Rows.Count), 4) + striTotal + Convert.ToString(inthashvalue));
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_SMBC()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);

            try
            {
                string strGetValueDate = GetValueDate("4");
                string strGetCompanyName = Strings.Left(GetCompanyName(20), 20);
                string strGetOriginatingAccountNumber = Strings.Left(GetOriginatingAccountNumber(8), 8);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);
                string strCustAcNo = "";

                if (strGetOriginatingAccountNumber.Length > 6)
                {
                    strCustAcNo = Strings.Right(strGetOriginatingAccountNumber.ToString().Trim(), 6);
                }
                else
                {
                    strCustAcNo = strGetOriginatingAccountNumber.ToString().Trim();
                }
                string strGetOperatorCode = Strings.Left(GetOperatorCode(14), 14);
                string strGetApproverCode = Strings.Left(GetApproverCode(14), 14);
                fp = File.CreateText(strPath + this.LogFileName.ToString());
                //fp.WriteLine("HOG 01" + strGetValueDate + strGetCompanyName + strGetOriginatingAccountNumber + "SGD" + strGetOperatorCode + strGetApproverCode);
                fp.WriteLine("ENV,,,,PR,PR,8806,,,CA,00," + strGetOriginatingAccountNumber + ",,SGD,CA,00," + strGetOriginatingAccountNumber + ",,SGD,TA,," + strGetValueDate + ",,SGD,,,,");

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double iTotal = 0;
                            string striTotal;
                            double intA;
                            double intB;
                            double intC;
                            double intD;
                            double intE;
                            double inthashvalue = 0;
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    intA = Utility.ToDouble(row["giro_bank"].ToString());
                                    intB = Utility.ToDouble(row["branch_number"].ToString());
                                    intC = Utility.ToDouble(Strings.Left(row["giro_acct_number"].ToString(), 1));
                                    intD = Utility.ToDouble(Strings.Right(row["giro_acct_number"].ToString(), 1));
                                    intE = Utility.ToDouble(row["netpay"].ToString());
                                    inthashvalue = inthashvalue + ((intA + intB + intC + intD) * intE);


                                    string strgirobank = Strings.Left(MaskString(row["giro_bank"].ToString(), 4), 4);
                                    string strbranchnumber = Strings.Left(MaskString(row["branch_number"].ToString(), 3), 3);
                                    string strgiroaccountno = Strings.Left(MaskString(row["giro_acct_number"].ToString(), 11), 11);
                                    string strreceivingname = Strings.Left(MaskString(row["account_name"].ToString(), 20), 20);
                                    string strreceivingbankname = "";
                                    string strCustGetValueDate = GetValueDate("1");
                                    iTotal = iTotal + Utility.ToDouble(row["netpay"].ToString());
                                    string strNetPay = Utility.ToDouble(row["netpay"].ToString()).ToString();
                                    if (strNetPay.IndexOf(".") > 0)
                                    {
                                        if (strNetPay.IndexOf(".") == 7)
                                        {
                                            if ((strNetPay.Length - (strNetPay.IndexOf(".") + 1)) == 1)
                                            {
                                                strNetPay = "00" + strNetPay + "0";
                                            }
                                        }
                                        else
                                        {
                                            if ((strNetPay.Length - strNetPay.IndexOf(".")) == 2)
                                            {
                                                strNetPay = "00" + strNetPay + "0";
                                            }
                                            else
                                            {
                                                strNetPay = "000" + strNetPay;
                                            }
                                        }
                                    }
                                    else
                                    {
                                        strNetPay = strNetPay + ".00";
                                    }
                                    //string strCon = "D" + strCustAcNo + strgirobank + strbranchnumber + strgiroaccountno + strreceivingname + "22" + strCustGetValueDate + strNetPay + "C";
                                    string strCon = "INS,,," + strreceivingname.Trim() + ",,,,,,,,,,,,," + strreceivingbankname.Trim() + ",," + strgirobank.Trim() + strbranchnumber.Trim() + ",,,SINGAPORE," + strgiroaccountno.Trim() + ",,,,,," + strNetPay + ",,,,,,,,22,,,,,,,,,,,,,,,,,,,,,,,,,,,,,";
                                    fp.WriteLine(strCon);

                                }
                                striTotal = Strings.Left(MaskNumber(iTotal, 13), 13);
                                if (striTotal.IndexOf(".") > 0)
                                {
                                    striTotal = "000" + striTotal;
                                }
                                else
                                {
                                    striTotal = striTotal + ".00";
                                }
                            }
                            //fp.WriteLine("T" + MaskNumber(Utility.ToDouble(ds.Tables[0].Rows.Count), 4) + striTotal + Convert.ToString(inthashvalue));
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_CITI()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);

            try
            {
                string strGetValueDate = GetValueDate("4");
                string strGetCompanyName = Strings.Left(GetCompanyName(0), 35);
                string strGetOriginatingAccountNumber = Strings.Left(GetOriginatingAccountNumber(0), 35);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);
                string strCustAcNo = "";
                int pos = 0;
                char[] trimstr = { '=', '@', '.', ';', ':', '[', ']', '{', '}','#', '%', '$', '^', '&', '*', '(', ')', '+', ',', '/', '>', '<', '~', '`', '_', '?', '!', '|', '"' };
                //char[] trimstr = { '=', '@', '.', ';', ':', '[', ']', '{', '}', '-', '#', '%', '$', '^', '&', '*', '(', ')', '+', ',', '/', '>', '<', '~', '`', '_', '?', '!', '|', '"' };
                while ((pos = strGetCompanyName.IndexOfAny(trimstr)) >= 0)
                {
                    strGetCompanyName = strGetCompanyName.Remove(pos, 1);
                }
                if (strGetOriginatingAccountNumber.Length > 6)
                {
                    strCustAcNo = Strings.Right(strGetOriginatingAccountNumber.ToString().Trim(), 6);
                }
                else
                {
                    strCustAcNo = strGetOriginatingAccountNumber.ToString().Trim();
                }
                string strGetOperatorCode = Strings.Left(GetOperatorCode(14), 14);
                string strGetApproverCode = Strings.Left(GetApproverCode(14), 14);
                fp = File.CreateText(strPath + this.LogFileName.ToString());

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double iTotal = 0;
                            string striTotal;
                            double intA;
                            double intB;
                            double intC;
                            double intD;
                            double intE;
                            double inthashvalue = 0;
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    intA = Utility.ToDouble(row["giro_bank"].ToString());
                                    intB = Utility.ToDouble(row["branch_number"].ToString());
                                    intC = Utility.ToDouble(Strings.Left(row["giro_acct_number"].ToString(), 1));
                                    intD = Utility.ToDouble(Strings.Right(row["giro_acct_number"].ToString(), 1));
                                    intE = Utility.ToDouble(row["netpay"].ToString());
                                    inthashvalue = inthashvalue + ((intA + intB + intC + intD) * intE);
                                    pos = 0;

                                    string strgirobank = Strings.Left(MaskString(row["giro_bank"].ToString(), 4), 4);
                                    string strbranchnumber = Strings.Left(MaskString(row["branch_number"].ToString(), 3), 3);
                                    string strgiroaccountno = Strings.Left(MaskString(row["giro_acct_number"].ToString(), 11), 11);
                                    string strreceivingname = Strings.Left(MaskString(row["account_name"].ToString(), 20), 20);
                                    char[] trim = { '=', '@', '.', ';', ':', '[', ']', '{', '}', '-', '#', '%', '$', '^', '&', '*', '(', ')', '+', ',', '/', '>', '<', '~', '`', '_', '?', '!', '|', '"' };
                                    while ((pos = strreceivingname.IndexOfAny(trim)) >= 0)
                                    {
                                        strreceivingname = strreceivingname.Remove(pos, 1);
                                    }

                                    string strreceivingbankname = "";
                                    string strCustGetValueDate = GetValueDate("1");
                                    iTotal = iTotal + Utility.ToDouble(row["netpay"].ToString());
                                    string strNetPay = Utility.ToDouble(row["netpay"].ToString()).ToString();
                                    string strCon = "PLP@SG@" + strGetOriginatingAccountNumber.Trim() + "@SGD@" + strNetPay.Trim() + "@@" + strGetValueDate + "@@@@@@@" + strGetCompanyName.Trim() + "@@@@@@" + strreceivingname.Trim() + "@@@@@" + strgiroaccountno.Trim() + "@@@@@@@" + strgirobank.Trim() + strbranchnumber.Trim() + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
                                    fp.WriteLine(strCon);

                                }
                                striTotal = Strings.Left(MaskNumber(iTotal, 13), 13);
                                if (striTotal.IndexOf(".") > 0)
                                {
                                    striTotal = "000" + striTotal;
                                }
                                else
                                {
                                    striTotal = striTotal + ".00";
                                }
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_ABN()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);

            try
            {
                string strspace = "";
                string strGetValueDate = GetValueDate("4");
                string strGetCompanyName = Strings.Left(GetCompanyName(0), 35);
                string strGetOriginatingAccountNumber = Strings.Left(GetOriginatingAccountNumber(0), 35);
                strGetOriginatingAccountNumber = MaskNumber(Utility.ToDouble(strGetOriginatingAccountNumber), 12);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);
                int pos = 0;
                char[] trimstr = { '=', '@', '.', ';', ':', '[', ']', '{', '}', '-', '#', '%', '$', '^', '&', '*', '(', ')', '+', ',', '/', '>', '<', '~', '`', '_', '?', '!', '|', '"' };
                while ((pos = strGetCompanyName.IndexOfAny(trimstr)) >= 0)
                {
                    strGetCompanyName = strGetCompanyName.Remove(pos, 1);
                }
                string strGetOperatorCode = Strings.Left(GetOperatorCode(14), 14);
                string strGetApproverCode = Strings.Left(GetApproverCode(14), 14);
                fp = File.CreateText(strPath + this.LogFileName.ToString());

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double iTotal = 0;
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    pos = 0;
                                    string strbankbranch = Strings.Left(MaskString(row["bank_branch"].ToString().Trim(), 3), 3);
                                    string strgirobank = MaskString(Strings.Left(MaskString(row["giro_bank"].ToString().Trim(), 4), 4), 12);
                                    string strbranchnumber = Strings.Left(MaskString(row["branch_number"].ToString().Trim(), 3), 3);
                                    string strgiroaccountno = Strings.Left(MaskString(row["giro_acct_number"].ToString().Trim(), 15), 15);
                                    string strreceivingname = Strings.Left(MaskString(row["account_name"].ToString().Trim(), 20), 20);
                                    char[] trim = { '=', '@', '.', ';', ':', '[', ']', '{', '}', '-', '#', '%', '$', '^', '&', '*', '(', ')', '+', ',', '/', '>', '<', '~', '`', '_', '?', '!', '|', '"' };
                                    while ((pos = strreceivingname.IndexOfAny(trim)) >= 0)
                                    {
                                        strreceivingname = strreceivingname.Remove(pos, 1);
                                    }

                                    strreceivingname = MaskString(strreceivingname.Trim(), 42);
                                    string strCustGetValueDate = GetValueDate("1");
                                    string strNetPay = MaskNumber(Utility.ToInteger(row["netpay"].ToString().Replace(".", "")), 15);
                                    string strCon = strbankbranch + strGetOriginatingAccountNumber.Trim() + strgirobank + strbranchnumber + strgiroaccountno + "DA14SGD" + strNetPay + "SAL" + MaskString(strspace, 18) + strreceivingname + strGetValueDate + MaskString(strspace, 22);
                                    fp.WriteLine(strCon);
                                    iTotal = iTotal + Utility.ToDouble(row["netpay"].ToString());
                                }
                            }

                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                string strreccount = MaskNumber(Utility.ToInteger(ds.Tables[0].Rows.Count.ToString().Replace(".", "")), 5);
                                string strtotpay = MaskNumber(Utility.ToInteger(iTotal.ToString().Replace(".", "")), 15);
                                fp.WriteLine(MaskString(strspace, 45) + "TT" + strreccount + strtotpay + MaskString(strspace, 93));
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_HSBC()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);

            try
            {
                string strspace = "";
                string strGetValueDate = GetValueDate("4");
                string strGetCompanyName = Strings.Left(GetCompanyName(0), 35);
                string strGetOriginatingAccountNumber = Strings.Left(GetOriginatingAccountNumber(0), 35);
                strGetOriginatingAccountNumber = MaskNumber(Utility.ToDouble(strGetOriginatingAccountNumber), 12);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);
                int pos = 0;
                char[] trimstr = { '=', '@', '.', ';', ':', '[', ']', '{', '}', '-', '#', '%', '$', '^', '&', '*', '(', ')', '+', ',', '/', '>', '<', '~', '`', '_', '?', '!', '|', '"' };
                while ((pos = strGetCompanyName.IndexOfAny(trimstr)) >= 0)
                {
                    strGetCompanyName = strGetCompanyName.Remove(pos, 1);
                }
                string strGetOperatorCode = Strings.Left(GetOperatorCode(14), 14);
                string strGetApproverCode = Strings.Left(GetApproverCode(14), 14);
                fp = File.CreateText(strPath + this.LogFileName.ToString());

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double iSingleTotal = 0;
                            double iTotal = 0;
                            double iRowCount = 0;
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    iTotal = iTotal + Utility.ToDouble(row["netpay"].ToString());
                                }
                            }

                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                string strreccount = MaskNumber(Utility.ToInteger(ds.Tables[0].Rows.Count.ToString().Replace(".", "")), 6);
                                string strtotpay = MaskStringForward(iTotal.ToString("#0.00"), 17, "0");
                                string strCon = "1SGHSBC" + strGetOriginatingAccountNumber + "E01" + strreccount + strtotpay + strGetValueDate + "APO" + MaskString(strspace, 78) + "1";
                                fp.WriteLine(strCon);
                            }

                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    iRowCount = iRowCount + 1;
                                    pos = 0;
                                    string strbankbranch = Strings.Left(MaskString(row["bank_branch"].ToString().Trim(), 3), 3);
                                    string strgirobank = MaskString(Strings.Left(MaskString(row["giro_bank"].ToString().Trim(), 4), 4), 4);
                                    string strbranchnumber = Strings.Left(MaskString(row["branch_number"].ToString().Trim(), 3), 3);
                                    string strgiroaccountno = Strings.Left(MaskString(row["giro_acct_number"].ToString().Trim(), 20), 20);
                                    string strreceivingname = Strings.Left(MaskString(row["account_name"].ToString().Trim(), 20), 20);
                                    char[] trim = { '=', '@', '.', ';', ':', '[', ']', '{', '}', '-', '#', '%', '$', '^', '&', '*', '(', ')', '+', ',', '/', '>', '<', '~', '`', '_', '?', '!', '|', '"' };
                                    while ((pos = strreceivingname.IndexOfAny(trim)) >= 0)
                                    {
                                        strreceivingname = strreceivingname.Remove(pos, 1);
                                    }
                                    iSingleTotal = Utility.ToDouble(row["netpay"].ToString());
                                    strreceivingname = MaskString(strreceivingname.Trim(), 42);
                                    string strCustGetValueDate = GetValueDate("1");
                                    string strnetpay = MaskStringForward(iSingleTotal.ToString("#0.00"), 16, "0");
                                    string strCon = "2" + MaskString(iRowCount.ToString(), 12) + MaskString(strspace, 4) + strnetpay + MaskString(strspace, 8) + strgirobank + MaskString(strspace, 4) + strgiroaccountno + MaskString(strspace, 8) + strreceivingname + MaskString(strspace, 16);
                                    fp.WriteLine(strCon);
                                }
                            }


                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_SC()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);
            string sTrx = "";


            try
            {
                string strGetValueDate = GetValueDate("2");
                string strGetOriginatingAccountNumber = GetOriginatingAccountNumber(0);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);

                fp = File.CreateText(strPath + this.LogFileName.ToString());
                fp.WriteLine("H,P,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double dTotalAmt = 0;
                            double iTotal = 0;
                            string strTrailer = "";
                            string strgirobank = "";
                            string strbranchnumber = "";
                            string strgiroaccountno = "";
                            string strreceivingname = "";

                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    strgirobank = row["giro_bank"].ToString();
                                    strbranchnumber = row["branch_number"].ToString();
                                    strgiroaccountno = row["giro_acct_number"].ToString();
                                    strreceivingname = row["account_name"].ToString();
                                    dTotalAmt = dTotalAmt + Utility.ToDouble(row["netpay"].ToString());

                                    iTotal = Utility.ToDouble(row["netpay"].ToString());

                                    sTrx = "P,PAY,BA,,,,SG,SIN,@debit_ac_no,@payment_date,@payee_name,,,,,,@payee_bank_code,@payee_branch_code,,@payee_acc_no,,,,,,,,,,,,,,,,,,SGD, @amount ,C,,,,,,,,,,,,,,,,,,,,,,";
                                    sTrx = Replace(sTrx, "@payee_bank_code", Strings.Mid(strgirobank.Trim().ToString(), 1, 4));
                                    sTrx = Replace(sTrx, "@payee_branch_code", Strings.Mid(strbranchnumber.Trim().ToString(), 1, 3));
                                    sTrx = Replace(sTrx, "@payee_acc_no", Strings.Mid(Replace(strgiroaccountno.Trim().ToString(), "-", ""), 1, 11));
                                    sTrx = Replace(sTrx, "@payee_name", Strings.Mid(strreceivingname.Trim().ToString(), 1, 24));
                                    sTrx = Replace(sTrx, "@payment_date", strGetValueDate.Trim().ToString());
                                    sTrx = Replace(sTrx, "@debit_ac_no", Strings.Mid(Replace(strGetOriginatingAccountNumber.Trim().ToString(), "-", ""), 1, 35));
                                    sTrx = Replace(sTrx, "@amount", row["netpay"].ToString());

                                    fp.WriteLine(sTrx);
                                }

                            }
                            strTrailer = "T,@total_records,@total_amount,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,";
                            strTrailer = Replace(strTrailer, "@total_records", ds.Tables[0].Rows.Count.ToString());
                            strTrailer = Replace(strTrailer, "@total_amount", Convert.ToString(dTotalAmt));
                            fp.WriteLine(strTrailer);
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_Deutsche()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);
            string sTrx = "";


            try
            {
                string strGetValueDate = GetValueDate("3");
                string strGetOriginatingAccountNumber = Strings.Mid(MaskString(Replace(GetOriginatingAccountNumber(0), "-", ""), 11), 1, 35);
                string strCustGetOriginatingAccountNumber = Replace(strGetOriginatingAccountNumber, ";", "");
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);

                fp = File.CreateText(strPath + this.LogFileName.ToString());

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double iTotal = 0;
                            string strgirobank = "";
                            string strbranchnumber = "";
                            string strgiroaccountno = "";
                            string strreceivingname = "";
                            string strempname = "";

                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    strgirobank = Strings.Left(row["giro_bank"].ToString().Trim(), 4);
                                    strbranchnumber = Strings.Left(row["branch_number"].ToString().Trim(), 3);
                                    strgiroaccountno = Strings.Left(row["giro_acct_number"].ToString().Trim(), 11);
                                    strreceivingname = Strings.Left(row["account_name"].ToString().Trim(), 24);
                                    strempname = Strings.Mid(row["emp_name"].ToString().Trim(), 1, 12);


                                    iTotal = Utility.ToDouble(row["netpay"].ToString());

                                    sTrx = strgirobank + ";" + strbranchnumber + ";" + strgiroaccountno + ";" + strreceivingname + ";" + strGetValueDate + ";" + "15;" + "SGD;" + strGetOriginatingAccountNumber + ";SGD;" + strGetOriginatingAccountNumber + ";" + iTotal.ToString() + ";SGD;22;" + strempname;
                                    fp.WriteLine(sTrx);
                                }
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_UOB()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);
            string sTrx = "";


            try
            {

                string strGetValueDate = GetValueDate("2");
                string strGetOriginatingBranchNumber = MaskString(Strings.Left(GetOriginatingBranchNumber(3), 3), 3);
                string strGetOriginatingBankCode = MaskString(Strings.Left(GetOriginatingBankCode(4), 4), 4);
                string strGetOriginatingAccountNumber = MaskString(Replace(GetOriginatingAccountNumber(0), "-", ""), 11);
                string strGetOriginatorName = MaskString(Strings.Left(GetOriginatorName(0), 20), 20);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);


                fp = File.CreateText(strPath + this.LogFileName.ToString());


                //string strUOBHashType = "2";
                double htotal1 = 0;
                double stotal = 0;
                double hsum1 = 0;
                double hsum2 = 0;
                double hsum3 = 0;

                string hsan = Convert.ToString(MaskNumber(Utility.ToDouble(Replace(GetOriginatingAccountNumber(0), "-", "")), 11));
                //ram
                //old
                //string hsbn = Convert.ToString(MaskNumberBack(Utility.ToDouble(Strings.Left(GetOriginatingBranchNumber(3), 3)), 3));
                //new
                string hsbn = Convert.ToString(MaskNumber(Utility.ToDouble(Strings.Left(GetOriginatingBranchNumber(3), 3)), 3));

                string hsbc = Convert.ToString(MaskNumberBack(Utility.ToDouble(Strings.Left(GetOriginatingBankCode(4), 4)), 4));

                if (isHash  == true)
                {
                    hsum1 = (Convert.ToDouble(hsbc.Substring(0, 2)) * 2) + (Convert.ToDouble(hsbn.Substring(0, 2)) * 3) + (Convert.ToDouble(hsan.Substring(0, 2)) * 4) + (Convert.ToDouble(hsan.Substring(4, 2)) * 5) + (Convert.ToDouble(hsan.Substring(8, 2)) * 6);
                    hsum2 = (Convert.ToDouble(hsbc.Substring(2, 2)) * 9) + (Convert.ToDouble(hsbn.Substring(2, 1)) * 8) + (Convert.ToDouble(hsan.Substring(2, 2)) * 7) + (Convert.ToDouble(hsan.Substring(6, 2)) * 6) + (Convert.ToDouble(hsan.Substring(10, 1)) * 5);
                    hsum3 = hsum1 * hsum2;
                    htotal1 = hsum3;

                    fp.WriteLine("1IBGINORM  " + strGetOriginatingBankCode + strGetOriginatingBranchNumber + strGetOriginatingAccountNumber + strGetOriginatorName + DateTime.Today.ToString("yyyyMMdd") + GetValueDate("4") + Strings.Space(5) + "2" + Strings.Space(9));
                }
                else
                {
                    fp.WriteLine("1IBGINORM  " + strGetOriginatingBankCode + strGetOriginatingBranchNumber + strGetOriginatingAccountNumber + strGetOriginatorName + DateTime.Today.ToString("yyyyMMdd") + GetValueDate("4") + Strings.Space(5) + Strings.Space(1) + Strings.Space(9));
                }

                //working on UOB
                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double dTotalAmt = 0;
                            double iTotal = 0;
                            string strTrailer = "";
                            string strgirobank = "";
                            string strbranchnumber = "";
                            string strgiroaccountno = "";
                            string strreceivingname = "";
                            string strnetpay = "";

                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    strgirobank = MaskNumber(Utility.ToDouble(Strings.Left(row["giro_bank"].ToString().Trim(), 4)), 4);
                                    strbranchnumber = MaskStringForward(Utility.ToString(Strings.Left(row["branch_number"].ToString().Trim(), 3)), 3, "0");
                                    strgiroaccountno = MaskString(Replace(row["giro_acct_number"].ToString().Trim(), "-", ""), 11);
                                    strreceivingname = MaskString(Strings.Left(row["account_name"].ToString().Trim(), 20), 20);
                                    dTotalAmt = dTotalAmt + Utility.ToDouble(row["netpay"].ToString());
                                    iTotal = Utility.ToDouble(row["netpay"].ToString());
                                    strnetpay = MaskNumber(iTotal * 100, 11);

                                    double dtotal1 = 0;
                                    double dtotal2 = 0;
                                    double dsum1 = 0;
                                    double dsum2 = 0;
                                    double dsum3 = 0;

                                    string dsan = Convert.ToString(MaskString(Utility.ToString(Replace(row["giro_acct_number"].ToString().Trim(), "-", "")), 11));
                                    string dsbn = strbranchnumber;
                                    string dsbc = Convert.ToString(MaskNumberBack(Utility.ToDouble(Strings.Left(row["giro_bank"].ToString().Trim(), 4)), 4));
                                    string sttotalamt = strnetpay; //Convert.ToString(MaskNumber(dTotalAmt,11));
                                    dsan = dsan.Replace(" ", "0");

                                    if (isHash == true)
                                    {
                                        dsum1 = (Utility.ToDouble(dsbc.Substring(0, 2)) * 1) + (Utility.ToDouble(dsbn.Substring(0, 2)) * 2) + (Utility.ToDouble(dsan.Substring(0, 2)) * 3) + (Utility.ToDouble(dsan.Substring(4, 2)) * 4) + (Utility.ToDouble(dsan.Substring(8, 2)) * 5) + (Utility.ToDouble("2") * 6) + (Utility.ToDouble(sttotalamt.Substring(0, 2)) * 7) + (Utility.ToDouble(sttotalamt.Substring(4, 2)) * 8) + (Utility.ToDouble(sttotalamt.Substring(8, 2)) * 9);
                                        dsum2 = (Utility.ToDouble(dsbc.Substring(2, 2)) * 9) + (Utility.ToDouble(dsbn.Substring(2, 1)) * 8) + (Utility.ToDouble(dsan.Substring(2, 2)) * 7) + (Utility.ToDouble(dsan.Substring(6, 2)) * 6) + (Utility.ToDouble(dsan.Substring(10, 1)) * 5) + (Utility.ToDouble("2") * 4) + (Utility.ToDouble(sttotalamt.Substring(2, 2)) * 3) + (Utility.ToDouble(sttotalamt.Substring(6, 2)) * 2) + (Utility.ToDouble(sttotalamt.Substring(10, 1)) * 1);
                                        dsum3 = (dsum1 * dsum2);

                                        stotal = stotal + dsum3;
                                        sTrx = "2" + strgirobank + strbranchnumber + strgiroaccountno + strreceivingname + "22" + strnetpay + Strings.Space(12) + Strings.Space(12) + Strings.Space(4);
                                    }
                                    else
                                    {
                                        sTrx = "2" + strgirobank + strbranchnumber + strgiroaccountno + strreceivingname + "22" + strnetpay + Strings.Space(12) + Strings.Space(12) + Strings.Space(4);
                                    }
                                    fp.WriteLine(sTrx);

                                }
                            }
                            if (isHash == true)
                            {
                                double eventot = stotal + htotal1;
                                //ram
                                //old
                                //strTrailer = "90000000000000" + MaskNumber((dTotalAmt * 100), 13) + "0000000" + MaskNumber(ds.Tables[0].Rows.Count, 7) + Strings.Space(13) + Utility.ToString(MaskNumber(Math.Round(eventot, 0), 13)) + Strings.Space(13);
                                //new 
                                strTrailer = "90000000000000" + MaskNumber((dTotalAmt * 100), 13) + "0000000" + MaskNumber(ds.Tables[0].Rows.Count, 7) + "0000000000000" + Utility.ToString(MaskNumber(Math.Round(eventot, 0), 13)) + Strings.Space(13);
                            }
                            else
                            {
                                strTrailer = "90000000000000" + MaskNumber((dTotalAmt * 100), 13) + "0000000" + MaskNumber(ds.Tables[0].Rows.Count, 7) + Strings.Space(13) + Strings.Space(13) + Strings.Space(13);
                            }
                            fp.WriteLine(strTrailer);
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_DBS()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);
            string sTrx = "";

            try
            {
                string strGetValueDate = GetValueDate("1");
                string strGetOriginatingBranchNumber = MaskString(Strings.Left(GetOriginatingBranchNumber(3), 3), 3);
                string strGetOriginatingBankCode = MaskString(Strings.Left(GetOriginatingBankCode(4), 4), 4);
                string strGetOriginatingAccountNumber = MaskString(Replace(GetOriginatingAccountNumber(0), "-", ""), 11);
                string strGetOriginatorName = MaskString(Strings.Left(GetOriginatorName(0), 20), 20);
                string strGetSenderCompanyID = GetSenderCompanyID(8);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);
                double AccountHashTotal = 0;

                fp = File.CreateText(strPath + this.LogFileName.ToString());
                fp.WriteLine(strGetValueDate + Strings.Space(45) + strGetOriginatingBankCode + strGetOriginatingBranchNumber + strGetOriginatingAccountNumber + Strings.Space(2) + strGetOriginatorName + "00001" + strGetSenderCompanyID + Strings.Space(9) + "0");

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));


                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double dTotalAmt = 0;
                            double iTotal = 0;
                            string strTrailer = "";
                            string strgirobank = "";
                            string strbranchnumber = "";
                            string strgiroaccountno = "";
                            string strreceivingname = "";
                            string strnetpay = "";

                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    strgirobank = MaskNumber(Utility.ToDouble(Strings.Left(row["giro_bank"].ToString().Trim(), 4)), 4);
                                    strbranchnumber = MaskNumber(Utility.ToDouble(Strings.Left(row["branch_number"].ToString().Trim(), 3)), 3);
                                    strgiroaccountno = MaskString(Replace(row["giro_acct_number"].ToString().Trim(), "-", ""), 11);
                                    strreceivingname = MaskString(Strings.Left(row["account_name"].ToString().Trim(), 20), 20);
                                    dTotalAmt = dTotalAmt + Utility.ToDouble(row["netpay"].ToString());
                                    iTotal = Utility.ToDouble(row["netpay"].ToString());
                                    strnetpay = MaskNumber(iTotal * 100, 11);
                                    AccountHashTotal = AccountHashTotal + GetAccountHash(Strings.Left(Replace(row["giro_acct_number"].ToString().Trim(), "-", ""), 11));

                                    sTrx = strgirobank + strbranchnumber + strgiroaccountno + strreceivingname + "22" + strnetpay + Strings.Space(38) + Strings.Space(12) + Strings.Space(12) + "1";
                                    fp.WriteLine(sTrx);

                                }
                            }
                            strTrailer = MaskNumber(ds.Tables[0].Rows.Count, 8) + MaskNumber((dTotalAmt * 100), 11) + Strings.Space(5) + "0000000000000000000" + Strings.Space(26) + MaskNumber(AccountHashTotal, 11) + Strings.Space(33) + "9";
                            fp.WriteLine(strTrailer);
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_OCBC()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);
            string sTrx = "";

            try
            {
                string strGetValueDate = GetValueDate("1");
                string strGetOriginatingBranchNumber = MaskString(Strings.Left(GetOriginatingBranchNumber(3), 3), 3);
                string strGetOriginatingAccountNumber = MaskString(Replace(Strings.Left(GetOriginatingAccountNumber(0), 9), "-", ""), 9);
                string strGetOriginatorName = MaskString(Strings.Left(GetOriginatorName(0), 20), 20);
                string strGetSenderCompanyID = GetSenderCompanyID(8);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);
                double AccountHashTotal = 0;

                fp = File.CreateText(strPath + this.LogFileName.ToString());
                fp.WriteLine("OVERSEA-CHINESE BANKING CORP GROUP" + Strings.Space(24) + "&&&&&&&&&&&&&&&&&&&&&&&&");
                fp.WriteLine(strGetOriginatingBranchNumber + strGetOriginatingAccountNumber + DateTime.Today.ToString("yyyyMMdd") + "001" + strGetOriginatorName + GetValueDate("4") + Strings.Space(31));

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double dTotalAmt = 0;
                            double iTotal = 0;
                            string strgirobank = "";
                            string strbranchnumber = "";
                            string strgiroaccountno = "";
                            string strreceivingname = "";
                            string strnetpay = "";
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    strgirobank = MaskNumber(Utility.ToDouble(Strings.Left(row["giro_bank"].ToString().Trim(), 4)), 4);
                                    strbranchnumber = MaskNumber(Utility.ToDouble(Strings.Left(row["branch_number"].ToString().Trim(), 3)), 3);
                                    strgiroaccountno = MaskString(Strings.Left(Replace(row["giro_acct_number"].ToString().Trim(), "-", ""), 11), 11);
                                    strreceivingname = MaskString(Strings.Left(row["account_name"].ToString().Trim(), 20), 20);
                                    dTotalAmt = dTotalAmt + Utility.ToDouble(row["netpay"].ToString());
                                    iTotal = Utility.ToDouble(row["netpay"].ToString());
                                    strnetpay = MaskNumber(iTotal * 100, 11);
                                    AccountHashTotal = AccountHashTotal + GetAccountHash(Replace(row["giro_acct_number"].ToString().Trim(), "-", ""));

                                    sTrx = "00001" + strgirobank + strbranchnumber + strgiroaccountno + strreceivingname + "22" + Strings.Space(3) + Strings.Space(9) + Strings.Space(12) + strnetpay + Strings.Space(2);
                                    fp.WriteLine(sTrx);
                                }

                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_MAY()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);
            string sTrx = "";

            try
            {
                string strGetValueDate = GetValueDate("1");
                string strGetOriginatingBranchNumber = MaskString(Strings.Left(GetOriginatingBranchNumber(3), 3), 3);
                string strGetOriginatingBankCode = MaskString(Strings.Left(GetOriginatingBankCode(4), 4), 4);
                string strGetOriginatingAccountNumber = MaskString(Replace(GetOriginatingAccountNumber(0), "-", ""), 11);
                string strGetOriginatorName = MaskString(Strings.Left(GetOriginatorName(0), 20), 20);
                string strGetSenderCompanyID = GetSenderCompanyID(8);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);
                double AccountHashTotal = 0;

                fp = File.CreateText(strPath + this.LogFileName.ToString());
                //fp.WriteLine(strGetValueDate + Strings.Space(45) + strGetOriginatingBankCode + strGetOriginatingBranchNumber + strGetOriginatingAccountNumber + Strings.Space(2) + strGetOriginatorName + "00001" + strGetSenderCompanyID + Strings.Space(9) + "0");

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double dTotalAmt = 0;
                            double iTotal = 0;
                            string strTrailer = "";
                            string strgirobank = "";
                            string strbranchnumber = "";
                            string strgiroaccountno = "";
                            string strreceivingname = "";
                            string strnetpay = "";

                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    strgirobank = MaskNumber(Utility.ToDouble(Strings.Left(row["giro_bank"].ToString().Trim(), 4)), 4);
                                    strbranchnumber = MaskNumber(Utility.ToDouble(Strings.Left(row["branch_number"].ToString().Trim(), 3)), 3);
                                    strgiroaccountno = MaskString(Replace(row["giro_acct_number"].ToString().Trim(), "-", ""), 11);
                                    strreceivingname = MaskString(Strings.Left(row["account_name"].ToString().Trim(), 20), 20);
                                    dTotalAmt = dTotalAmt + Utility.ToDouble(row["netpay"].ToString());
                                    iTotal = Utility.ToDouble(row["netpay"].ToString());

                                    sTrx = strgirobank + "," + strbranchnumber + "," + strgiroaccountno + "," + iTotal.ToString("#0.00") + "," + strreceivingname.ToString().Trim() + ",-";
                                    fp.WriteLine(sTrx);

                                }
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }

        public string GenerateGiroFile_BTMU()
        {
            string rt;
            StreamWriter fp = default(StreamWriter);
            string sTrx = "";

            try
            {
                string strGetValueDate = GetValueDate("1");
                string strGetOriginatingBranchNumber = MaskString(Strings.Left(GetOriginatingBranchNumber(3), 3), 3);
                string strGetOriginatingBankCode = MaskString(Strings.Left(GetOriginatingBankCode(4), 4), 4);
                string strGetOriginatingAccountNumber = MaskString(Strings.Left(Replace(GetOriginatingAccountNumber(0), "-", ""), 6), 6);
                string strGetOriginatorName = MaskString(Strings.Left(GetOriginatorName(0), 20), 20);
                string strGetSenderCompanyID = GetSenderCompanyID(8);
                string strPath = System.Web.HttpContext.Current.Server.MapPath(this.LogFilePath);
                double AccountHashTotal = 0;

                fp = File.CreateText(strPath + this.LogFileName.ToString());
                //fp.WriteLine(strGetValueDate + Strings.Space(45) + strGetOriginatingBankCode + strGetOriginatingBranchNumber + strGetOriginatingAccountNumber + Strings.Space(2) + strGetOriginatorName + "00001" + strGetSenderCompanyID + Strings.Space(9) + "0");

                int i = 0;
                SqlParameter[] parms = new SqlParameter[7];
                parms[i++] = new SqlParameter("@company_id", Utility.ToInteger(this.CompanyID));
                parms[i++] = new SqlParameter("@month", Utility.ToInteger(this.SalMonth));
                parms[i++] = new SqlParameter("@year", Utility.ToInteger(this.SalYear));
                parms[i++] = new SqlParameter("@bank", Utility.ToInteger(this.SenderBank));
                parms[i++] = new SqlParameter("@bankaccno", Utility.ToString(this.SenderAccountNo));
                parms[i++] = new SqlParameter("@emp_list", Utility.ToString(this.sEmployeeList));
                parms[i++] = new SqlParameter("@valuedate", Utility.ToInteger(this.ValueDate));

                string sSQL = "sp_online_giro";
                try
                {
                    DataSet ds = new DataSet();
                    ds = DataAccess.ExecuteSPDataSet(sSQL, parms);
                    if (ds != null)
                    {
                        if (ds.Tables.Count > 0)
                        {
                            double dTotalAmt = 0;
                            double iTotal = 0;
                            string strTrailer = "";
                            string strgirobank = "";
                            string strbranchnumber = "";
                            string strgiroaccountno = "";
                            string strreceivingname = "";
                            string strnetpay = "";
                            double iRowCount = 0;
                            string strreccount = "";
                            string strtotpay = "";
                            iTotal = 0;
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    iTotal = iTotal + Convert.ToDouble(row["netpay"].ToString());
                                }
                            }

                            if (ds.Tables[0].Rows.Count > 0)
                            {

                                strreccount = MaskStringForward(Utility.ToString(ds.Tables[0].Rows.Count.ToString().Replace(".", "")),3,"0");
                                strtotpay = MaskStringForward(Utility.ToString(iTotal.ToString("#0.00").Replace(".", "")), 13, "0");
                                string strCon = "FD000000001   DMA000SALD 511" + strGetOriginatingAccountNumber + strGetValueDate + strGetValueDate + "001               " + strreccount + strtotpay + "SGD" + Strings.Space(45);
                                fp.WriteLine(strCon);
                            }

                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                if (row["giro_bank"].ToString() != "")
                                {
                                    iRowCount = iRowCount + 1;
                                    strgirobank = MaskNumber(Convert.ToDouble(Strings.Left(row["giro_bank"].ToString().Trim(), 4)), 4);
                                    strbranchnumber = MaskNumber(Convert.ToDouble(Strings.Left(row["branch_number"].ToString().Trim(), 3)), 3);
                                    strgiroaccountno = MaskString(Replace(row["giro_acct_number"].ToString().Trim(), "-", ""), 11);
                                    strreceivingname = MaskString(Strings.Left(row["account_name"].ToString().Trim(), 20), 20);
                                    dTotalAmt = dTotalAmt + Convert.ToDouble(row["netpay"].ToString());
                                    iTotal = Convert.ToDouble(row["netpay"].ToString());
                                    strnetpay = MaskStringForward(Utility.ToString(iTotal.ToString("#0.00").Replace(".", "")), 11, "0");
                                    sTrx = "FD000000001   DMB" + MaskStringForward(iRowCount.ToString(), 3, "0") + strreceivingname + strnetpay + strgiroaccountno + strgirobank + strbranchnumber + Strings.Space(59);
                                    fp.WriteLine(sTrx);

                                }
                            }
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                iRowCount = ds.Tables[0].Rows.Count + 1;
                                strreccount = MaskStringForward(Utility.ToString(iRowCount.ToString().Replace(".", "")), 3, "0");
                                sTrx = "FD000000001   DMC999" + strtotpay + Strings.Space(95);
                                fp.WriteLine(sTrx);
                            }

                        }
                    }
                }
                catch (Exception e)
                {
                    rt = "File Creation failed. Reason is as follows : " + e.Message;
                }
                finally
                {
                }


                //fp.WriteLine("D" + strCustAcNo +  );
                rt = "File Succesfully created!";
                fp.Close();
            }
            catch (Exception err)
            {
                rt = "File Creation failed. Reason is as follows : " + err.Message;
            }
            finally
            {
            }
            return rt;
        }
    }
}
