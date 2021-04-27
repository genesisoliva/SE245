using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LAB4_GENESIS
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
            if (temp.Length < 5)
            {
                result = true;
            }
            return result;
        }
       
    }
}
