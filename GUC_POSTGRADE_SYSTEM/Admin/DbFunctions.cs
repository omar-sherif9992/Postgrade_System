using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace GUC_POSTGRADE_SYSTEM.Admin
{
    public class DbFunctions
    {

        private static String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
        public static DataTable GetAllSupervisors()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand sup_proc = new SqlCommand("AdminListSup", conn);
                DataTable result = new DataTable();
                conn.Open();
                result.Load(sup_proc.ExecuteReader());
                return result;
            }
        }
        public static DataTable GetAllTheses()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand thesis_proc = new SqlCommand("AdminViewAllTheses", conn);
                DataTable result = new DataTable();
                conn.Open();
                result.Load(thesis_proc.ExecuteReader());
                /*foreach(DataRow row in result.Rows)
                {
                    var grade = row["grade"];
                    if (grade != null && grade.Equals(-1m))
                    {
                        row["grade"] = DBNull.Value;
                    }
                }*/
                return result;
            }
        }
        public static String GetOnGoingTheses()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand thesisCount_proc = new SqlCommand("AdminViewOnGoingTheses ", conn);
                thesisCount_proc.CommandType = CommandType.StoredProcedure;
                SqlParameter thesesCount = thesisCount_proc.Parameters.Add("@thesesCount", SqlDbType.Int);
                thesesCount.Direction = ParameterDirection.Output;
                conn.Open();
                thesisCount_proc.ExecuteNonQuery();
                return thesesCount.Value.ToString();
            }
        }


        public static bool IssueThesisPayment(int serialNumber, decimal amount, int noInstallments, decimal fundPercentage)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand issuePayment_proc = new SqlCommand("AdminIssueThesisPayment", conn);
                issuePayment_proc.CommandType = CommandType.StoredProcedure;

                issuePayment_proc.Parameters.Add(new SqlParameter("@ThesisSerialNo", serialNumber));
                issuePayment_proc.Parameters.Add(new SqlParameter("@amount", amount));
                issuePayment_proc.Parameters.Add(new SqlParameter("@noOfInstallments", noInstallments));
                issuePayment_proc.Parameters.Add(new SqlParameter("@fundPercentage", fundPercentage));

                SqlParameter success = issuePayment_proc.Parameters.Add("@Success_bit", SqlDbType.Bit);
                success.Direction = ParameterDirection.Output;
                conn.Open();
                issuePayment_proc.ExecuteNonQuery();
                return (bool)success.Value;
            }
        }

        public static bool IssueInstallments(int paymentID, DateTime startDate)
        {
           
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand issueInstallment_proc = new SqlCommand("AdminIssueInstallPayment", conn);
                issueInstallment_proc.CommandType = CommandType.StoredProcedure;
                issueInstallment_proc.Parameters.Add(new SqlParameter("@paymentID", paymentID));
                issueInstallment_proc.Parameters.Add(new SqlParameter("@InstallStartDate", startDate));
                SqlParameter success = issueInstallment_proc.Parameters.Add("@success", SqlDbType.Bit);
                success.Direction = ParameterDirection.Output;
                conn.Open();
                issueInstallment_proc.ExecuteNonQuery();
                return (bool)success.Value;
            }
        }

        public static bool UpdateNumberOfExtensions(int serialNumber)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand updateExtensions_proc = new SqlCommand("AdminUpdateExtension", conn);
                updateExtensions_proc.CommandType = CommandType.StoredProcedure;
                updateExtensions_proc.Parameters.Add(new SqlParameter("@ThesisSerialNo", serialNumber));
                SqlParameter success = updateExtensions_proc.Parameters.Add("@success", SqlDbType.Bit);
                success.Direction = ParameterDirection.Output;
                conn.Open();
                updateExtensions_proc.ExecuteNonQuery();
                return (bool)success.Value;
            }
        }

        

    }
}