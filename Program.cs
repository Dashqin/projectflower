using System;

namespace ConsoleApp8
{
    class Program
    {
        //static void Main(string[] args)
        //{

        //    Console.WriteLine(Sum(-256));
        //    // Console.WriteLine
        //}

        //    static int Sum(int n)
        //    {
        //        int say = 1;
        //        while (n>9 || n<-9)
        //        {
        //            n /= 10;
        //            say++;
        //        }
        //         return say;
        //         //Console.WriteLine(say);
        //    }       
        #region
        static void Main(string[] args)
        {

            Console.WriteLine(Sum(1, 5, 4, 2));

        }
        static int Sum(params int[] nums)
        {
            int min = nums[0];
            int m = 0;
            for (int i = 0; i < nums.Length - 1; i++)
            {
                if (nums[i] < min)
                {
                    min = nums[i];
                    m = i;
                    // Console.WriteLine(i);
                    return i;
                }


            }
            return m;
        }
        #endregion


        //static void Main(string[] args)
        //{
        //    Console.WriteLine(Sum(8));
        //}
        //static int Sum(int n)
        //{
        //    int say = 1;
        //    for(int i = 2; i <= n; i++)
        //    {
        //        n /= 2;
        //        say++;
        //    }
        //    return say;
        //}
    }
}
