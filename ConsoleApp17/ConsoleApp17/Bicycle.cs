using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp17
{
    class Bicycle :Vehicle
    {
        private int _PedalKind;
        public Bicycle(int pedalkind)
        {
            _PedalKind = pedalkind;
        }
    }
}
