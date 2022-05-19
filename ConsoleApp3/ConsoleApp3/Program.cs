using System;

namespace ConsoleApp3
{
    class Program
    {
        static void Main(string[] args)
        {
            //  Console.WriteLine("1ci ededi daxil edin:");
            //int m = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("2ci ededi daxil edin:");
            //int n = Convert.ToInt32(Console.ReadLine());
            //int sum = 0;
            //if (m < n)
            //{
            //    for (int i = m; i < n; i++)
            //    {
            //        sum = sum + i;
            //                 
            //    }  Console.WriteLine(sum);
            // }
            // else
            // {
            //    Console.WriteLine("error");
            //}

            //Console.WriteLine("N-i daxil edin");
            //int n = Convert.ToInt32(Console.ReadLine());
            //int eo = 0;
            //for (int i = 15; i < n; i+=15)
            //{

            //    eo = (eo + i) / 2;

            //}

            //Console.WriteLine(eo);


            //Console.WriteLine("n-i daxil edin");
            //int n = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("m-i daxil edin");
            //int m = Convert.ToInt32(Console.ReadLine());
            //if (n < 100)
            //{
            //    for (int i = 21; i < m; i++)
            //    {
            //        if (i % 21 == 0)
            //        {
            //            Console.WriteLine(i);
            //        }
            //    }

            //}
            //else
            //{
            //    Console.WriteLine("error");
            //}

            Console.WriteLine("n-i daxil edin");
            int n = Convert.ToInt32(Console.ReadLine());
            int pow = 1;
            for(int i = 2; i <= n; i+=2)
            {
              //  i%2==0;
                pow++;
                
            } 
            Console.WriteLine(pow);


        }
    }
}
