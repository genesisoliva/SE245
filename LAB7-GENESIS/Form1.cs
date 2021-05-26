using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LAB6_GENESIS
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnAddPerson_Click(object sender, EventArgs e)
        {
            PersonV2 temp = new PersonV2();
            temp.Feedback = "";

            temp.FirstName = txtFirstName.Text;
            temp.MiddleName = txtMiddleName.Text;
            temp.LastName = txtLastName.Text;

            temp.Street1 = txtStreet.Text;
            temp.City = txtCity.Text;
            temp.State = txtState.Text;
            temp.ZipCode = txtZipCode.Text;

            temp.Street2 = txtStreet2.Text;

            temp.PhoneNumber = txtPhoneNumber.Text;
            temp.Email = txtEmail.Text;

            temp.CellPhone = txtCellPhone.Text;
            temp.Instagram = txtInstagram.Text;

            if(temp.Feedback.Contains("ERROR:"))
            {
                lblFeedback.Text = temp.AddAPersonRecord();
            }
            else
            {
                lblFeedback.Text = $"\n{temp.FirstName} {temp.MiddleName} {temp.LastName}\n\nADDRESS INFORMATION:\n{temp.Street1}\n{temp.City} {temp.State} {temp.ZipCode}\n\n{temp.Street2}\n\nCONTACT INFORMATION:\n\n{temp.PhoneNumber} (Phone Number)\n{ temp.CellPhone} (Cell Phone)\n{ temp.Email}";
            }
        }

        
    }
}
