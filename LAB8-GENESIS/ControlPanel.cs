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
    public partial class ControlPanel : Form
    {
        public ControlPanel()
        {
            InitializeComponent();
        }

        private void btnAddAPerson_Click(object sender, EventArgs e)
        {
            Form1 temp = new Form1();
            temp.Show();
        }

        private void btnSearchPersons_Click(object sender, EventArgs e)
        {
            Search temp = new Search();
            temp.Show();
        }
    }
}
