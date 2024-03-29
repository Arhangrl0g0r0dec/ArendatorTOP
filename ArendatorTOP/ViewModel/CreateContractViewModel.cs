﻿using Microsoft.Office.Interop.Word;
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
        public string DateСonclusion { get; set; }
        public string ArendatorTitle { get; set; }
        public string ArendatorName { get; set; }
        public double Sqare { get; set; }
        public int Floor { get; set; }
        public string TimeOfRent { get; set; }
        public decimal Bet { get; set; }
        public decimal NDS { get; set; }
        public decimal PennyForDoNotPay { get; set; }
        public Rent Rent { get; set; }
    

        public CreateContractViewModel() 
        {
            Title = "Создание договора";
        }

        public void AddInfomation() 
        {
            ArendatorTitle = Rent.Client.TitleCompany;
            ArendatorName = Rent.Client.Name;
            Sqare = Rent.ObjectRent.Square;
            Floor = Rent.ObjectRent.Floor.FloorValue;
            NumContract = DBModel.GetContext().Document.Where(p => p.NumDocument == 1).Count() + 1.ToString();
            TimeOfRent = Rent.DateEnd.Subtract(Rent.DateStart).ToString();
            DateСonclusion = DateTime.Today.ToString();
        }

        public string CreateContract(Rent rent) 
        {
            string hashDate = DateTime.Now.Ticks.ToString();
            try
            {
                string path = $"Архив\\Договора\\{hashDate}.xaml";
                DBModel.GetContext().Rent.Add(rent);
                DBModel.GetContext().SaveChanges();

                List<Document> documents = new List<Document>() 
                {
                    new Document()
                {
                    IdRent = rent.Id,
                    IdTypeOfDocument = 1,
                    NumDocument = DBModel.GetContext().Document.Where(p=>p.NumDocument == 1).Count() + 1,
                    PathToDocument = path
                },
                    new Document()
                {
                    IdRent = rent.Id,
                    IdTypeOfDocument = 4,
                    NumDocument = DBModel.GetContext().Document.Where(p => p.NumDocument == 4).Count() + 1,
                    PathToDocument = path
                }
            };

                DBModel.GetContext().Document.AddRange(documents);
                DBModel.GetContext().SaveChanges();
                return path;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка!" + ex.ToString());
                return ex.ToString();
            }
        }

        public void AdditionalAgreement(Rent rent) 
        {
            string hashDate = DateTime.Now.Ticks.ToString();
            string path = $"Архив\\Договора\\{hashDate}.xaml";
            Document additionalAgreement = new Document() 
            {
                IdRent = rent.Id,
                IdTypeOfDocument = 2,
                NumDocument = DBModel.GetContext().Document.Count() + 1,
                PathToDocument = path
            };
        }
    }
}
