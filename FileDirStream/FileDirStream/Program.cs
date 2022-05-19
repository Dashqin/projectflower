using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Xml.Serialization;

namespace FileDirStream
{
    class Program
    {
        static void Main(string[] args)
        {
            #region Directory-File
            //Directory.CreateDirectory(@"C:\Users\Bashir Azizov\Desktop\test");
            //Directory.CreateDirectory(@"C:\Users\Bashir Azizov\Desktop\test2\main\code");

            //File.Create(@"C:\Users\Bashir Azizov\Desktop\test\mamed\index.html");

            //Directory.Delete(@"C:\Users\Bashir Azizov\Desktop\test",true);


            //Console.WriteLine(Directory.Exists(@"C:\Users\Bashir Azizov\Desktop\test"));
            //Console.WriteLine(File.Exists(@"C:\Users\Bashir Azizov\Desktop\test\test.txt"));


            //string[] subdirs = Directory.GetDirectories(@"C:\Users\Bashir Azizov\Desktop\test");

            //for (int i = 0; i < subdirs.Length; i++)
            //{
            //    Console.WriteLine(subdirs[i]);
            //}


            //string[] files = Directory.GetFiles(@"C:\Users\Bashir Azizov\Desktop\test\mamed");

            //for (int i = 0; i < files.Length; i++)
            //{
            //    Console.WriteLine(files[i]);
            //}

            //DirectoryInfo directoryInfo = new DirectoryInfo(@"C:\Users\Bashir Azizov\Desktop\test");
            //Console.WriteLine(directoryInfo.LastAccessTime);

            //FileInfo fileInfo = new FileInfo(@"C:\Users\Bashir Azizov\Desktop\test\main.txt");

            //Console.WriteLine(fileInfo.Length);
            #endregion

            #region stream
            //StreamWriter sw = new StreamWriter(@"C:\Users\Bashir Azizov\Desktop\test\main.txt", true);
            //sw.WriteLine("Salam necesen?");
            //sw.Close();


            //using (StreamWriter sw = new StreamWriter(@"C:\Users\Bashir Azizov\Desktop\test\ilham.txt"))
            //{
            //    sw.WriteLine("sagol yaxsiyam");
            //}

            //StreamWriter sw = new StreamWriter(@"C:\Users\Bashir Azizov\Desktop\test\main.txt", true);
            //sw.WriteLine("Mandarin");
            //sw.Close();

            //StreamReader sr = new StreamReader(@"C:\Users\Bashir Azizov\Desktop\test\main.txt");
            //string fileContent = sr.ReadToEnd();
            //sr.Close();
            //Console.WriteLine(fileContent);
            #endregion

            //SiteDownloader.DownloadHtml("https://yandex.com/", "Yandex1");
            //SiteDownloader.DownloadHtml("https://yandex.com/", "Yandex2");
            //SiteDownloader.DownloadHtml("https://yandex.com/", "Yandex3");


            //Comment c1 = new Comment();
            //c1.Text = "SaLaM XaNiM!";
            //c1.Likes = 12;
            //c1.Date = DateTime.Now;

            //Comment c2 = new Comment();
            //c2.Text = "Profildeki ozunuzsuz?";
            //c2.Likes = 3;
            //c2.Date = DateTime.Now;

            //Comment c3 = new Comment();
            //c3.Text = "Direct atmayin";
            //c3.Likes = 0;
            //c3.Date = DateTime.Now;

            //Comment c4 = new Comment();
            //c4.Text = "Ad gunun mubarak";
            //c4.Likes = 4;
            //c4.Date = DateTime.Now;


            //User user = new User();
            //user.Name = "Mamed";
            //user.Surname = "Aliyev";
            //user.Age = 10;
            //user.Email = "mamed@code.edu.az";

            //User user2 = new User();
            //user2.Name = "Isabala";
            //user2.Surname = "Qeniyev";
            //user2.Age = 21;
            //user2.Email = "Isabala@code.edu.az";

            //user.comments.Add(c1);
            //user.comments.Add(c2);

            //user2.comments.Add(c3);
            //user2.comments.Add(c4);

            //List<User> users = new List<User>();
            //users.Add(user);
            //users.Add(user2);


            //string usersAsJson = JsonConvert.SerializeObject(users);

            //StreamWriter sw = new StreamWriter(@"C:\Users\Bashir Azizov\source\repos\FileDirStream\FileDirStream\Files\main.json");
            //sw.Write(usersAsJson);
            //sw.Close();


            //StreamReader sr = new StreamReader(@"C:\Users\Bashir Azizov\source\repos\FileDirStream\FileDirStream\Files\main.json");
            //string jsonStr = sr.ReadToEnd();
            //sr.Close();


            //List<User> usersFromFile = JsonConvert.DeserializeObject<List<User>>(jsonStr);

            //foreach (User item in usersFromFile)
            //{
            //    Console.WriteLine(item.Name);
            //}

            //HttpClient httpClient = new HttpClient();
            //string jsonResp = httpClient.GetStringAsync("https://jsonplaceholder.typicode.com/users").Result;

            //List <Person> persons = JsonConvert.DeserializeObject<List<Person>>(jsonResp);


            //foreach (Person item in persons)
            //{
            //    Console.WriteLine(item.company.name);
            //}


            HttpClient client = new HttpClient();
            string response = client.GetStringAsync("https://www.cbar.az/currencies/08.04.2022.xml").Result;
            StringReader stringReader = new StringReader(response);
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(ValCurs));
            ValCurs valCurs = (ValCurs)xmlSerializer.Deserialize(stringReader);


            Console.WriteLine("Elinde nece azn var?");
            int amount = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Neye cevirmek isteyirsen? Kodunu daxil et.");
            string currency = Console.ReadLine();

            Valute valute = valCurs.ValType[1].Valute.Find(x => x.Code.ToLower() == currency.ToLower());

            Console.WriteLine(amount / Convert.ToDecimal(valute.Value));
        }

    }
}
