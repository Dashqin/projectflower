using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp17
{
    public abstract class Vehicle : IEngine,IWheel,ITransmission
    {
        private int _DriveTime;
        private int _DrivePath;
        //public Vehicle(int drivetime, int drivepath)
        //{
        //    _DriveTime = drivetime;
        //    _DrivePath = drivepath;
        //}
        public void AvarageSpeed()
        {

        }

        public void LeftFuelAmount()
        {
            throw new NotImplementedException();
        }

        public void ShowInfo()
        {

        }
    }
}
