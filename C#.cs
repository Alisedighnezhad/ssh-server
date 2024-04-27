using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Testformakingfileof_users_VPN_
{
    internal class Program
    {
        private static readonly Random random = new Random();

        static void Main(string[] args)
        {
            int u = 0;
            while (u < 100)
            {
                Console.WriteLine($"sudo adduser--gecos 'Fullname,Room Number,Work Phone,Home Phone' --password {pass()} {userid()} ");
                u++;
            }
            Console.ReadKey();
        }

        static string pass()
        {
            string All = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:,.<>?/~";
            string pass = string.Empty;
            for (int i = 0; i < 8; i++)
            {
                pass += All[random.Next(0, All.Length - 1)];
            }
            return pass;
        }
        static string userid()
        {
            string All = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            string id = string.Empty;
            for (int i = 0;i < 8; i++)
            {
                id += All[random.Next(0,All.Length -1)];
            }
            return id;
        }
        static void plus()
        {
            string Full = userid() + "---" + pass() +"---" + "kaftar" + "\n";
            File.AppendAllText("users.txt",Full);
        }
    }
}
