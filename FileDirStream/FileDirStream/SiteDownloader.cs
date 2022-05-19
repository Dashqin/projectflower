using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace FileDirStream
{
    public static class SiteDownloader
    {
        public static void DownloadHtml(string link, string filename)
        {
            HttpClient httpClient = new HttpClient();
            string content = httpClient.GetStringAsync(link).Result;

            StreamWriter sw = new StreamWriter(@"C:\Users\Bashir Azizov\Downloads\"+ filename + ".html");
            sw.Write(content);
            sw.Close();
        }
    }
}
