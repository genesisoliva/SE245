using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ACTIVITY8_GENESIS
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        public Form1(int intEBook_ID)
        {
            InitializeComponent();

            Ebook temp = new Ebook();
            SqlDataReader dr = temp.FindOneEBook(intEBook_ID);

            while (dr.Read())
            {
                txtTitle.Text = dr["Title"].ToString();
                txtAuthorFirst.Text = dr["AuthorFirst"].ToString();
                txtAuthorLast.Text = dr["AuthorLast"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtPages.Text = dr["Pages"].ToString();
                txtBookmarkPage.Text = dr["BookmarkPage"].ToString();
                lblEBook_ID.Text = dr["EBook_ID"].ToString();

                dtpDatePublished.Value = DateTime.Parse(dr["DatePublished"].ToString());
                dtpDateRentalExpires.Value = DateTime.Parse(dr["DateRentalExpires"].ToString());

                lblEBook_ID.Text = dr["EBook_ID"].ToString();
            }


        }
        private void btnInsert_Click(object sender, EventArgs e)
        {
            Ebook temp = new Ebook();

            temp.Title = txtTitle.Text;
            temp.AuthorFirst = txtAuthorFirst.Text;
            temp.AuthorLast = txtAuthorLast.Text;
            temp.Email = txtEmail.Text;

            temp.DatePublished = dtpDatePublished.Value;
            temp.DateRentalExpires = dtpDateRentalExpires.Value;

            int intTempPages;
            bool blnResult = Int32.TryParse(Console.ReadLine(), out intTempPages);

            if (blnResult == false)
            {
                lblFeedback.Text += "Sorry incorrect page #.  Please try again. (Ex: 214) ";
            }
            else
            {
                temp.Pages = intTempPages;
            }

            int intBMPage;
            blnResult = Int32.TryParse(Console.ReadLine(), out intBMPage);

            if (blnResult == false)
            {
                lblFeedback.Text += "Sorry incorrect Bookmark page #.  Please try again. (Ex: 214) ";
            }
            else
            {
                temp.BookmarkPage = intBMPage;
            }

            if (!temp.Feedback.Contains("ERROR:"))
            {
                lblFeedback.Text = temp.AddARecord();
            }
            else
            {
                lblFeedback.Text = temp.Feedback;
            }

         }

        private void lblEBook_ID_Click(object sender, EventArgs e)
        {

        }
    }
}
