using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LAB8_GENESIS
{
    public partial class Search : Form
    {
        public Search()
        {
            InitializeComponent();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            PersonV2 temp = new PersonV2();
            DataSet ds = temp.SearchPersonV2(txtLastName.Text, txtPhoneNumber.Text, txtCellPhone.Text);

            dgvResults.DataSource = ds;                                
            dgvResults.DataMember = ds.Tables["PersonV2_Temp"].ToString();
        }

        private void dgvResults_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            string strPersonV2_ID = dgvResults.Rows[e.RowIndex].Cells[0].Value.ToString();

            MessageBox.Show(strPersonV2_ID);

            int intPersonV2_ID = Convert.ToInt32(strPersonV2_ID);

            Form1 Editor = new Form1(intPersonV2_ID);
            Editor.ShowDialog();
        }
    }
}
