using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace LAB6_GENESIS
{
    class PersonV2 : Person
    {
        private string cellphone;
        private string instagram;

        public string CellPhone
        {
            get
            {
                return cellphone;
            }
            set
            {
                //cellphone = value;
                if (ValidationLibrary.ValidatePhoneNumber(value))
                {
                    cellphone = value;
                }
                else
                {
                    cellphone = $"ERROR: Enter the correct format.";
                }
            }

        }
        public string Instagram
        {
            get
            {
                return instagram;
            }
            set
            {
                instagram = value;
            }

        }
        public string AddAPersonRecord()
        {
            string strResult = "";

            SqlConnection Conn = new SqlConnection();

            Conn.ConnectionString = @"Server=sql.neit.edu\sqlstudentserver, 4500;Database=SE_245_GOliva;User Id=SE245_GOliva;Password=005501789;";

            string strSQL = "INSERT TO PERSONV2 (FirstName, MiddleName, LastName, Street1, City, State, ZipCode, Street2, PhoneNumber, Email, CellPhone, Instagram) VALUES (@FirstName, @MiddleName, @LastName, @Street1, @City, @State, @ZipCode, @Street2, @PhoneNumber, @Email, @CellPhone, @Instagram)";

            SqlCommand comm = new SqlCommand();
            comm.CommandText = strSQL;
            comm.Connection = Conn;

            comm.Parameters.AddWithValue("@FirstName", FirstName);
            comm.Parameters.AddWithValue("@MiddleName", MiddleName);
            comm.Parameters.AddWithValue("@LastName", LastName);

            comm.Parameters.AddWithValue("@Street1", Street1);
            comm.Parameters.AddWithValue("@City", City);
            comm.Parameters.AddWithValue("@State", State);
            comm.Parameters.AddWithValue("@ZipCode", ZipCode);

            comm.Parameters.AddWithValue("@Street2", Street2);

            comm.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
            comm.Parameters.AddWithValue("@Email", Email);

            comm.Parameters.AddWithValue("@CellPhone", CellPhone);
            comm.Parameters.AddWithValue("@Instagram", Instagram);

            try
            {
                Conn.Open();
                int intRecs = comm.ExecuteNonQuery();
                strResult = $"SUCCESS: Inserted {intRecs} records.";
                Conn.Close();
            }
            catch (Exception err)
            {
                strResult = "ERROR: " + err.Message;
            }
            finally
            {

            }
            return strResult;

        }

        public PersonV2() : base()
        {
            cellphone = "";
            instagram = "";

        }


    }
}
