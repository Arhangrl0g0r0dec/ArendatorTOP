using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using static System.Net.Mime.MediaTypeNames;

namespace ArendatorTOP.ViewModel
{
    class AddDemonstrationViewModel : ViewModelBase
    {
        public ObservableCollection<SelectionFilter> SelectionFiltersApp { get; set; }
        public ObservableCollection<Client> Clients = new ObservableCollection<Client>();
        public ObservableCollection<ObjectRent> ObjectRents = new ObservableCollection<ObjectRent>();
        public string InfoObjectRent;
        public string Name;
        public string Surname;
        public string Patronimic;
        public string PhoneNumber;
        public string SearchStringClient { get; set; }
        public AddDemonstrationViewModel() 
        {
            Title = "Запись на демонтрацию";
            SelectionFiltersApp = new ObservableCollection<SelectionFilter>(DBModel.GetContext().Appointment.Select(p => new SelectionFilter() { Appointments = p }));            
        }

        public ObservableCollection<Client> UpdateClientList()
        {
            Clients.Clear();

            List<Client> clients = DBModel.GetContext().Client.ToList();

            if (!String.IsNullOrEmpty(SearchStringClient)) 
            {
                clients = DBModel.GetContext().Client.Where(p => p.Name.ToLower().Contains(SearchStringClient.ToLower())
                || p.TitleCompany.ToLower().Contains(SearchStringClient.ToLower())
                || p.Surname.ToLower().Contains(SearchStringClient.ToLower())
                || p.Patronimic.ToLower().Contains(SearchStringClient.ToLower())
                || p.PhoneNumber.ToLower().Contains(SearchStringClient.ToLower())
                || p.INN.ToLower().Contains(SearchStringClient.ToLower())
                || p.OGRN.ToLower().Contains(SearchStringClient.ToLower())
                || p.Mail.ToLower().Contains(SearchStringClient.ToLower())
                || p.KPP.ToLower().Contains(SearchStringClient.ToLower())).ToList();
            }

            foreach(Client client in clients)
            {
                Clients.Add(client);
            }
            return Clients;
        }

        public List<Demonstration> GetDemonstrations()
        {
            List<Demonstration> demonstrations = new List<Demonstration>();
            demonstrations = DBModel.GetContext().Demonstration.ToList();
            demonstrations = demonstrations.OrderByDescending(p => p.DateOfDemonstration).ToList();
            return demonstrations;
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
            return Name= client.Name;
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

        public string GetDemonstrationDateTime(Demonstration demonstration) 
        {
            return demonstration.DateOfDemonstration.ToShortDateString() + " " + demonstration.TimeOfDemonstration.ToString();
        }

        public void SaveDemonstration(Demonstration demonstration ,ObjectRent SelectedObjectRent, Client SelectedClient, User user, string PhoneNumber)
        {
            demonstration.Name = SelectedClient.Name;
            demonstration.Surname = SelectedClient.Surname;
            demonstration.Patronimic = SelectedClient.Patronimic;
            demonstration.ObjectRent = SelectedObjectRent;
            demonstration.Client = SelectedClient;
            demonstration.IsOccupied = true;
            demonstration.Employee = user.Employee;
            demonstration.PhoneNumber = PhoneNumber;
            DBModel.GetContext().SaveChanges();
        }

        public void SaveDemonstrationForVisitor(Demonstration demonstration, ObjectRent SelectedObjectRent, User user, string PhoneNumber, string[] FullName)
        {
            demonstration.ObjectRent = SelectedObjectRent;
            demonstration.Name = FullName[0];
            demonstration.Surname = FullName[1];
            demonstration.Patronimic = FullName[2];
            demonstration.IsOccupied = true;
            demonstration.Employee = user.Employee;
            demonstration.PhoneNumber = PhoneNumber;
            DBModel.GetContext().SaveChanges();
        }
    }
}
