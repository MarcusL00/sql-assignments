using System.Runtime.CompilerServices;

namespace Random_generator
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //random genrator
        Random random = new Random();
            //made this so you can make a new amount of enteries
        int numberOfEnteries = 1000001;
            //adding the file path so it knows where to output to
        string filepath = "C:\\Users\\zbc23mwly\\Desktop\\Performance\\RandomNumber.Txt";
            // writes to the RandomNumber.txt
        using (StreamWriter writer = new StreamWriter(filepath)) 
            { 
            //loops the amount of enteries
            for (int i = 1; i < numberOfEnteries; i++) 
                {
                //generates between 1-9999
                int randomNumber = random.Next(1,10000);
                    //uses each loop of the enteries to generate an ID (i) and a random number
                    writer.WriteLine(i +", " + randomNumber);

                }
            }



        }
    }
}