using ArendatorTOP.ViewModel;
using ArendatorTOP;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace UnitTestProjectArendatorTOP
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestAddClient()
        {
            AddClientViewModel addClientViewModel = new AddClientViewModel();
            Client client = new Client()
            {
                TitleCompany = "ООО Петров",
                Name = "Василий",
                Surname = "Петров",
                Patronimic = "Алексеевич",
                INN = "12343126",
                OGRN = "89127987",
                KPP = "8452439857",
                Mail = "ghdshd@mail.ru",
                PathToCopyPassport = "kasdhuyu",
                PathToCopyContractOfDirector = "ыывавы",
                PathToCopyCertificateOfRegistrationOfaLegalEntity = "jkshvyry",
                Street = "Павлова",
                Home = "3",
                Domophone = "3",
                Floor = "3",
                Office = "3",
                PhoneNumber = "+7983749234",
                Del = false
            };
            Assert.AreEqual(false, addClientViewModel.AddClient(client));
        }
    }
}
