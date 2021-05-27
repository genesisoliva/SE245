using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace ACTIVITY8_GENESIS
{
    class Ebook: Book
    {
        private DateTime dateRentalExpires;
        private int bookmarkPage;

        public DateTime DateRentalExpires
        {
            get
            {
                return dateRentalExpires;
            }
            set
            {
                if (ValidationLibrary.IsAFutureDate(value))
                {
                    dateRentalExpires = value;
                }
                else
                {

                    Feedback += "\nERROR: You must enter future dates";
                }
            }
        }

        public int BookmarkPage
        {
            get
            {
                return bookmarkPage;
            }

            set
            {
                if (value >= 0 && value <= Pages)
                {
                    bookmarkPage = value;
                }
                else
                {
                    Feedback += "\nERROR: Sorry you entered an invalid page # for a bookmark.";
                }
            }
        }

        public string AddARecord()
        {
            string strResult = "";

            SqlConnection Conn = new SqlConnection();

            Conn.ConnectionString = @GetConnected();

            string strSQL = "INSERT INTO EBooks (Title, AuthorFirst, AuthorLast, Email, Pages, DatePublished, DateRentalExpires, BookmarkPage) VALUES (@Title, @AuthorFirst, @AuthorLast, @Email, @Pages, @DatePublished, @DateRentalExpires, @BookmarkPage)";

            SqlCommand comm = new SqlCommand();
            comm.CommandText = strSQL;
            comm.Connection = Conn;

            comm.Parameters.AddWithValue("@Title", Title);
            comm.Parameters.AddWithValue("@AuthorFirst", AuthorFirst);
            comm.Parameters.AddWithValue("@AuthorLast", AuthorLast);
            comm.Parameters.AddWithValue("@Email", Email);
            comm.Parameters.AddWithValue("@Pages", Pages);
            comm.Parameters.AddWithValue("@DatePublished", DatePublished);
            comm.Parameters.AddWithValue("@DateRentalExpires", DateRentalExpires);
            comm.Parameters.AddWithValue("@BookmarkPage", BookmarkPage);

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

        public DataSet SearchEBooks(String strTitle, String strAuthorLast)
        {
            DataSet ds = new DataSet();


            SqlCommand comm = new SqlCommand();

            String strSQL = "SELECT EBook_ID, Title, AuthorFirst, AuthorLast FROM EBooks WHERE 0=0";

            if (strTitle.Length > 0)
            {
                strSQL += " AND Title LIKE @Title";
                comm.Parameters.AddWithValue("@Title", "%" + strTitle + "%");
            }
            if (strAuthorLast.Length > 0)
            {
                strSQL += " AND AuthorLast LIKE @AuthorLast";
                comm.Parameters.AddWithValue("@AuthorLast", "%" + strAuthorLast + "%");
            }

            SqlConnection conn = new SqlConnection();
            string strConn = @GetConnected();
            conn.ConnectionString = strConn;

            comm.Connection = conn;
            comm.CommandText = strSQL;

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = comm;

            conn.Open();
            da.Fill(ds, "EBooks_Temp");
            conn.Close();
            return ds;
        }

        public SqlDataReader FindOneEBook(int intEBook_ID)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand comm = new SqlCommand();

            string strConn = GetConnected();

            string sqlString =
           "SELECT * FROM EBooks WHERE EBook_ID = @EBook_ID;";

            conn.ConnectionString = strConn;

            comm.Connection = conn;
            comm.CommandText = sqlString;
            comm.Parameters.AddWithValue("@EBook_ID", intEBook_ID);

            conn.Open();

            return comm.ExecuteReader();

        }
        private string GetConnected()
        {
            return @"Server=sql.neit.edu\sqlstudentserver, 4500;Database=SE245_GOliva;User Id=SE245_GOliva;Password=005501789;";
        }

        public Ebook() : base()
        {
            BookmarkPage = 0;
            dateRentalExpires = DateTime.Now.AddDays(14);
        }
    }
}
