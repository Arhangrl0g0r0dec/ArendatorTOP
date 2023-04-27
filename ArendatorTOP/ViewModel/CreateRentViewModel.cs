using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ArendatorTOP.ViewModel
{
    class CreateRentViewModel : ViewModelBase
    {
        public ObservableCollection<SelectionFilter> SelectionFiltersApp { get; set; }
        public ObservableCollection<Client> Clients = new ObservableCollection<Client>();
        public ObservableCollection<ObjectRent> ObjectRents = new ObservableCollection<ObjectRent>();
        public string SearchStringClient { get; set;}
        public string InfoObjectRent { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Patronimic { get; set; }
        public string PhoneNumber { get; set; }
        public int NumContract { get; set; }
        public List<FormOfPayment> formOfPayments = new List<FormOfPayment>();
        public CreateRentViewModel() 
        {
            SelectionFiltersApp = new ObservableCollection<SelectionFilter>(DBModel.GetContext().Appointment.Select(p => new SelectionFilter() { Appointments = p }));
        }

        public ObservableCollection<Client> UpdateClientList()
        {
            Clients.Clear();

            List<Client> clients = DBModel.GetContext().Client.ToList();

            if (!String.IsNullOrEmpty(SearchStringClient))
            {
                clients = DBModel.GetContext().Client.Where(p => p.Name.ToLower().Contains(SearchStringClient.ToLower())
                || p.Surname.ToLower().Contains(SearchStringClient.ToLower())
                || p.Patronimic.ToLower().Contains(SearchStringClient.ToLower())
                || p.PhoneNumber.ToLower().Contains(SearchStringClient.ToLower())
                || p.INN.ToLower().Contains(SearchStringClient.ToLower())
                || p.OGRN.ToLower().Contains(SearchStringClient.ToLower())
                || p.Mail.ToLower().Contains(SearchStringClient.ToLower())
                || p.KPP.ToLower().Contains(SearchStringClient.ToLower())).ToList();
            }

            foreach (Client client in clients)
            {
                Clients.Add(client);
            }
            return Clients;
        }

        public ObservableCollection<ObjectRent> UpdateObjectRentList()
        {
            ObjectRents.Clear();
            List<ObjectRent> objectRents = DBModel.GetContext().ObjectRent.Where(p => p.Del == false).ToList();

            try
            {
                List<Appointment> appointments = SelectionFiltersApp.Where(p => p.IsChecked).Select(p => p.Appointments).ToList();

                if (appointments.Count != 0)
                {
                    objectRents = objectRents.Where(p => appointments.Contains(p.Appointment)).ToList();
                }

                foreach (var objectR in objectRents)
                {
                    ObjectRents.Add(objectR);
                }
                return ObjectRents;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка! " + ex.ToString());
            }
            return ObjectRents;
        }

        public string GetClientName(Client client)
        {
            return Name = client.Name;
        }

        public string GetClientSurname(Client client)
        {
            return Surname = client.Surname;
        }

        public string GetClientPatronimic(Client client)
        {
            return Patronimic = client.Patronimic;
        }

        public string GetClientPhoneNumber(Client client)
        {
            return PhoneNumber = client.PhoneNumber;
        }

        public string GetObjectRent(ObjectRent obj)
        {
            return InfoObjectRent = "№" + obj.Id + obj.Appointment.Title.ToString();
        }

        //Вывести контракт!!!
        public Document GetNumContract()
        {
            Document document;
            document = DBModel.GetContext().Document.Where(p => p.IdTypeOfDocument == 1).OrderBy(p => p.NumDocument).FirstOrDefault();
            NumContract = document.NumDocument + 1;

            if (document == null) 
            {
                return null;
            }
            else 
            {
                return document;
            }
        }


        public List<FormOfPayment> UpdatePaymentList()
        {
            return formOfPayments = DBModel.GetContext().FormOfPayment.ToList();
        }

        public Rent SaveDemonstration(Client client, Employee employee, ObjectRent objectRent, FormOfPayment formOfPayment, DateTime dateStart, DateTime dateEnd) 
        {
            Rent rent = new Rent()
            {
                Client = client,
                ObjectRent = objectRent,
                Bet = Convert.ToDecimal(Convert.ToDouble(objectRent.PriceForOneMeter) * objectRent.Square),
                DateStart = dateStart,
                DateEnd = dateEnd,
                Deposit = Convert.ToDecimal(Convert.ToDouble(objectRent.PriceForOneMeter) * objectRent.Square),
                Employee = employee,
                FormOfPayment = formOfPayment,
                OwnerOfObjectRent = "ООО ПСК РИТМ",
                Document = null,
            };
            return rent;
        }
    }
}
