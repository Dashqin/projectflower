using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp17
{
    class Car :Vehicle
    {
        private int _DoorCount;
        private int _WinCode;
        public Car(int doorcount,int wincode)
        {
            _DoorCount = doorcount;
            _WinCode = wincode;
        }
    }
}
