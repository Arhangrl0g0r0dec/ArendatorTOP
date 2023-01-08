using ArendatorTOP.Windows;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ArendatorTOP.ViewModel
{
    class ClientsViewModel : ViewModelBase
    {
        public bool IsChecedDelete { get; set; }
        public bool IsChecedActive { get; set; }
        public static Client client { get; set; }
        public ObservableCollection<Client> Clients { get; set; }
        public List<Client> clients { get; set; }
        public ClientsViewModel()
        {
            Title = "Клинеты";
        }
        public List<Client> UpdateClientList()
        {
            List<Client> clientList = DBModel.GetContext().Client.ToList();
            try 
            {
                if (IsChecedDelete == true)
                {
                    clientList = clientList.Where(p => p.Del == true).ToList();
                }

                if (IsChecedDelete == false)
                {
                    clientList = clientList.Where(p => p.Del != true).ToList();
                }

                if (IsChecedActive == true) 
                {
                    
                }

                if (IsChecedActive == false) 
                {
                
                }
            }
            catch(Exception ex) 
            {
                MessageBox.Show($"Ошибка! {ex}");
            }
            return clientList;
        }

        public bool CheckClient(Client SelectedClient)
        {
            client = SelectedClient;
            var r = DBModel.GetContext().Rent.Where(p => p.IdClient == SelectedClient.Id && p.DateEnd > DateTime.Now).ToList();
            
            if(r.Count != 0) 
            {
                return true;
            }
            else 
            {
                return false;
            }
        }

        public ObservableCollection<Client> DeleteClient() 
        {
            client.Del = true;
            DBModel.GetContext().SaveChanges();
            return Clients = (ObservableCollection<Client>)Clients.Where(p => p.Del == true);
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


        public List<Client> ActiveClients() 
        {
            var Client = DBModel.GetContext().Rent.Where(p => p.DateEnd > DateTime.Now).Select(p=>p.Client).ToList();
            return Client;
        }


    }
}
