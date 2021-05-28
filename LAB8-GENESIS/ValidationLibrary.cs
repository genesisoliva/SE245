using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LAB8_GENESIS
{
    class ValidationLibrary
    {
        public static bool GetPoop(string temp)
        {
            bool result = false;

            if (temp.Contains("Poop"))
            {
                result = true;
            }
            return result;
        }



        public static bool IsValidEmail(string temp)
        {
            bool blnResult = true;

            int atLocation = temp.IndexOf("@");
            int NextatLocation = temp.IndexOf("@", atLocation + 1);

            int periodLocation = temp.LastIndexOf(".");

            if (temp.Length < 8)
            {
                blnResult = false;
            }

            else if (atLocation < 2)
            {
                blnResult = false;
            }

            else if (periodLocation + 2 > (temp.Length))
            {
                blnResult = false;
            }

            return blnResult;
        }

        public static bool IsItFilledIn(string temp)
        {
            bool result = false;
            if (temp.Length > 0)
            {
                result = true;
            }
            return result;
        }
        public static bool ValidateStateTwoLetters(string state)
        {
            bool result;
            if (state.Length > 2)
            {
                result = false;
            }
            else
            {
                result = true;
            }

            return result;
        }
        public static bool ValidatePhoneNumber(string num)
        {
            int dashLocation = num.IndexOf("-");
            int lastDashLocation = num.LastIndexOf("-");
            int numLength = num.Length;
            bool result;

            if (dashLocation == 3 && lastDashLocation == 7 && numLength == 12)
            {
                result = true;
            }
            else
            {
                result = false;
            }

            return result;
        }
        public static bool ValidateZipCode(string zip)
        {
            int intZip;
            bool isNumber = Int32.TryParse(zip, out intZip);
            bool result;

            if (zip.Length == 5 && isNumber)
            {
                result = true;
            }
            else
            {
                result = false;
            }
            return result;
        }
    }
}
