using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LAB6_GENESIS
{
    class Person
    {
        private string firstname;
        private string middlename;
        private string lastname;
        private string street1;
        private string city;
        private string state;
        private string zipcode;
        private string street2;
        private string phonenumber;
        private string email;
        private string feedback;


        public string FirstName
        {
            get
            {
                return firstname;
            }
            set
            {
                //firstname = value;
                if (ValidationLibrary.IsItFilledIn(value))
                {
                    firstname = value;
                }
                else
                {
                    firstname = $"ERROR: Please enter first name.";
                }
            }

        }
        public string MiddleName
        {
            get
            {
                return middlename;
            }
            set
            {
                middlename = value;
            }
        }
        public string LastName
        {
            get
            {
                return lastname;
            }
            set
            {
                //lastname = value;
                if (ValidationLibrary.IsItFilledIn(value))
                {
                    lastname = value;
                }
                else
                {
                    lastname = $"\nERROR: Please enter last name.";
                }
            }
        }
        public string Street1
        {
            get
            {
                return street1;
            }
            set
            {
                //street1 = value;
                if (ValidationLibrary.IsItFilledIn(value))
                {
                    street1 = value;
                }
                else
                {
                    street1 = $"\nERROR: Enter street.";
                }
            }
        }
        public string Street2
        {
            get
            {
                return street2;
            }
            set
            {
                street2 = value;
 
            }
        }
        public string City
        {
            get
            {
                return city;
            }
            set
            {
                //city = value;
                if (ValidationLibrary.IsItFilledIn(value))
                {
                    city = value;
                }
                else
                {
                    city = $"ERROR: Enter city.";
                }
            }
        }
        public string State
        {
            get
            {
                return state;
            }
            set
            {
               // state = value;
               if(ValidationLibrary.ValidateStateTwoLetters(value))
                {
                    state = value;
                }
               else
                {
                    state = $"ERROR: Incorrect Format. Ex. RI";
                }
            }
        }
        public string ZipCode
        {
            get
            {
                return zipcode;
            }
            set
            {
                //zipcode = value;
                if(ValidationLibrary.ValidateZipCode(value))
                {
                    zipcode = value;
                }
                else
                {
                    zipcode = $"\nERROR: Incorrect Format. Ex: 02910";
                }
            }
        }
        public string PhoneNumber
        {
            get
            {
                return phonenumber;
            }
            set
            {
                //phonenumber = value;
                if(ValidationLibrary.ValidatePhoneNumber(value))
                {
                    phonenumber = value;
                }
                else
                {
                    phonenumber = $"ERROR: Enter the correct format.";
                }
            }
        }
        public string Email
        {
            get
            {
                return email;
            }
            set
            {
                if (ValidationLibrary.IsValidEmail(value))
                {
                    email = value;
                }
                else
                {
                    email = $"ERROR: Please enter email correctlty";
                }
            }
        }
        public string Feedback
        {
            get
            {
                return feedback;
            }
            set
            {
                    email = value;
            }
        }

        public Person()
        {
            firstname = "";
            middlename = "";
            lastname = "";
            street1 = "";
            city = "";
            state = "";
            zipcode = "";
            street2 = "";
            phonenumber = "";
            email = "";
            feedback = "";
        }
    }
}
