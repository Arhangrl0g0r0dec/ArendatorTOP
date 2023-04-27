using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ArendatorTOP.ViewModel
{
     class CreateContractViewModel : ViewModelBase
    {
        public string NumContract { get; set; }
        public DateTime DateСonclusion { get; set; }
        public string ArendatorTitle { get; set; }
        public string ArendatorName { get; set; }
        public double Sqare { get; set; }
        public int Floor { get; set; }
        public DateTime TimeOfRent { get; set; }
        public decimal Bet { get; set; }
        public decimal NDS { get; set; }
        public decimal PennyForDoNotPay {get; set; }

        public CreateContractViewModel() 
        {
            Title = "Создание договора";
        }

        public string CreateContract(Rent rent) 
        {
            string hashDate = DateTime.Now.Ticks.ToString();
            try
            {
                string path = $"Архив\\Договора\\{hashDate}.xaml";
                DBModel.GetContext().Rent.Add(rent);
                DBModel.GetContext().SaveChanges();

                Document document = new Document()
                {
                    IdRent = rent.Id,
                    IdTypeOfDocument = 1,
                    NumDocument = 1,
                    PathToDocument = path
                };

                DBModel.GetContext().Document.Add(document);
                DBModel.GetContext().SaveChanges();
                return path;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка!" + ex.ToString());
                return ex.ToString();
            }
        }
    }
}
