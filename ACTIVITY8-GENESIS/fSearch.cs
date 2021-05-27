using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ACTIVITY8_GENESIS
{
    public partial class fSearch : Form
    {
        public fSearch()
        {
            InitializeComponent();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            Ebook temp = new Ebook();
            DataSet ds = temp.SearchEBooks(txtTitle.Text, txtAuthorLast.Text);

            dgvResults.DataSource = ds;   
            dgvResults.DataMember = ds.Tables["Ebooks_Temp"].ToString();  

        }


        private void dgvResults_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            string strEBook_ID = dgvResults.Rows[e.RowIndex].Cells[0].Value.ToString();

            MessageBox.Show(strEBook_ID);

            int intEBook_ID = Convert.ToInt32(strEBook_ID);

            Form1 Editor = new Form1(intEBook_ID);
            Editor.ShowDialog();
        }
    }
}
