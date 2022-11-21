using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ArendatorTOP.ViewModel
{
    class ClientsViewModel : ViewModelBase
    {
        public string Address { get; private set; }
        public ObservableCollection<Client> Clients { get; set; }
        public List<Client> clients { get; set; }
        public ClientsViewModel()
        {
            Title = "Клинеты";
        }
        public ObservableCollection<Client> UpdateClientList()
        {
            try 
            {
                Clients = new ObservableCollection<Client>(DBModel.GetContext().Client);
                GetAddress();
            }
            catch(Exception ex) 
            {
                MessageBox.Show($"Ошибка! {ex}");
            }
            return Clients;
        }

        public void GetAddress()
        {

        }

        public List<Client> Search(string text)
        {
            if (!String.IsNullOrEmpty(text)) 
            {
                clients = DBModel.GetContext().Client.Where(p => p.Name.ToLower().Contains(text.ToLower())
                || p.Surname.ToLower().Contains(text.ToLower())
                || p.Patronimic.ToLower().Contains(text.ToLower())
                || p.PhoneNumber.ToLower().Contains(text.ToLower())
                || p.INN.ToLower().Contains(text.ToLower())
                || p.OGRN.ToLower().Contains(text.ToLower())
                || p.Mail.ToLower().Contains(text.ToLower())
                || p.KPP.ToLower().Contains(text.ToLower())).ToList();

                if (clients.Count != 0)
                    return clients;
                else
                    return null;
            }
            else 
            {
                clients = DBModel.GetContext().Client.ToList();
                return clients;
            }
        }
    }
}
