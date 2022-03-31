using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp17
{
    class Plane : Vehicle
    {
        private int _WingLength;
        public Plane(int winglength)
        {
            _WingLength = winglength;
        }
    }
}
