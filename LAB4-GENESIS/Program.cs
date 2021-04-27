using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;


namespace LAB4_GENESIS
{
    class Program
    {
        public class Person
        {

            private string firstname;
            private string middlename;
            private string lastname;
            private string street1;
            private string street2;
            private string city;
            private string state;
            private string zipcode;
            private string phone;
            private string email;


            public string FirstName
            {
                get
                {
                    return firstname;
                }
                set
                {
                    firstname = value;
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
                    lastname = value;
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
                    street1 = value;
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
                    city = value;
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
                    state = value;
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
                    zipcode = value;
                }
            }
            public string Phone
            {
                get
                {
                    return phone;
                }
                set
                {
                    phone = value;
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
                        email = $"Please enter email correctlty";
                    }
                }
            }
        }



        static void Main(string[] args)
        {
            bool blnResult = false;
            Person temp = new Person();

            //ASKING THE USER INFORMATION
            Console.Write($"Enter first name: ");
            temp.FirstName = Console.ReadLine();

            Console.Write($"Enter middle name: ");
            temp.MiddleName = Console.ReadLine();

            Console.Write($"Enter last name: ");
            temp.LastName = Console.ReadLine();

            Console.Write($"Enter street 1: ");
            temp.Street1 = Console.ReadLine();

            Console.Write($"Enter city: ");
            temp.City = Console.ReadLine();

            Console.Write($"Enter state: ");
            temp.State = Console.ReadLine();

            Console.Write($"Enter zip code: ");
            temp.ZipCode = Console.ReadLine();
            


            Console.Write($"Enter street 2: ");
            temp.Street2 = Console.ReadLine();

            Console.Write($"Enter phone: ");
            temp.Phone = Console.ReadLine();

            Console.Write($"Enter email: ");
            temp.Email = Console.ReadLine();

           



            //PRINT OUT USER'S INPUT
            Console.WriteLine($"----------------------------------");
            Console.WriteLine($"We now have the following person:");
            Console.WriteLine($"\nName: {temp.FirstName} Poppy {temp.MiddleName} {temp.LastName}");
            Console.WriteLine($"\nAddress: {temp.Street1}");
            Console.WriteLine($"\t{temp.City} {temp.State} {temp.ZipCode}");
            Console.WriteLine($"\n\t {temp.Street2}");
            Console.WriteLine($"\nContact: {temp.Phone}");
            Console.WriteLine($"\t{temp.Email}");

            BasicPause.Pause();
        }
    }
}
