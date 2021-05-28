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

namespace LAB8_GENESIS
{
    public partial class AddPerson : Form
    {
        public AddPerson()
        {
            InitializeComponent();
        }

        public AddPerson(int intPersonV2_ID)
        {
            InitializeComponent();

            PersonV2 temp = new PersonV2();
            SqlDataReader dr = temp.FindOnePersonV2(intPersonV2_ID);

            while (dr.Read())
            {
                PersonV2_ID.Text = dr["PersonV2_ID"].ToString();

                txtFirstName.Text = dr["Title"].ToString();
                txtMiddleName.Text = dr["AuthorFirst"].ToString();
                txtLastName.Text = dr["AuthorLast"].ToString();

                txtStreet1.Text = dr["Street1"].ToString();
                txtCity.Text = dr["City"].ToString();
                txtState.Text = dr["State"].ToString();
                txtZipCode.Text = dr["ZipCode"].ToString();

                txtStreet2.Text = dr["Street1"].ToString();

                txtPhoneNumber.Text = dr["PhoneNumber"].ToString();
                txtEmail.Text = dr["Email"].ToString();

                txtCellPhone.Text = dr["CellPhone"].ToString();
                txtInstagram.Text = dr["Instagram"].ToString();
            }


        }
        private void btnAddPerson_Click(object sender, EventArgs e)
        {
            PersonV2 temp = new PersonV2();
            temp.Feedback = "";

            temp.FirstName = txtFirstName.Text;
            temp.MiddleName = txtMiddleName.Text;
            temp.LastName = txtLastName.Text;

            temp.Street1 = txtStreet1.Text;
            temp.City = txtCity.Text;
            temp.State = txtState.Text;
            temp.ZipCode = txtZipCode.Text;

            temp.Street2 = txtStreet2.Text;

            temp.PhoneNumber = txtPhoneNumber.Text;
            temp.Email = txtEmail.Text;

            temp.CellPhone = txtCellPhone.Text;
            temp.Instagram = txtInstagram.Text;

            if (temp.Feedback.Contains("ERROR:"))
            {
                lblFeedback.Text = temp.AddAPersonRecord();
            }
            else
            {
                lblFeedback.Text = temp.Feedback;
            }

        }

        private void AddPerson_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
