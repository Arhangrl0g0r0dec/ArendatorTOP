using ArendatorTOP.Windows;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using static System.Net.Mime.MediaTypeNames;

namespace ArendatorTOP.ViewModel
{
    class ClientsViewModel : ViewModelBase
    {
        public bool IsCheckedActive;
        public bool IsCheckedDelete;
        public int SelectedIndex{ get; set; }
        public static Client client { get; set; }
        public ObservableCollection<Client> Clients = new ObservableCollection<Client>();
        public List<Client> clients { get; set; }
        public ClientsViewModel()
        {
            Title = "Клинеты";
        }
        public ObservableCollection<Client> UpdateClientList(string text)
        {
            Clients.Clear();
            List<Client> clientList = DBModel.GetContext().Client.ToList();
            try
            {
                if (!String.IsNullOrEmpty(text))
                {
                    clientList = DBModel.GetContext().Client.Where(p => p.Name.ToLower().Contains(text.ToLower())
                    || p.Surname.ToLower().Contains(text.ToLower())
                    || p.Patronimic.ToLower().Contains(text.ToLower())
                    || p.PhoneNumber.ToLower().Contains(text.ToLower())
                    || p.INN.ToLower().Contains(text.ToLower())
                    || p.OGRN.ToLower().Contains(text.ToLower())
                    || p.Mail.ToLower().Contains(text.ToLower())
                    || p.KPP.ToLower().Contains(text.ToLower())).ToList();
                }

                if (IsCheckedDelete == true)
                {
                    clientList = clientList.Where(p => p.Del == true).ToList();
                }

                //if(IsCheckedActive == true)
                //{
                //    clientList = DBModel.GetContext().Rent.Where(p => p.DateEnd > DateTime.Now).Select(p => p.Client).Where(p => p.Del == false).ToList();
                //}
            }
            catch(Exception ex) 
            {
                MessageBox.Show($"Ошибка! {ex}");
            }

            foreach(var client in clientList) 
            {
                Clients.Add(client);
            }
            
            return Clients;
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
            return UpdateClientList(null);
        }

        public List<Client> ActiveClients()
        {
            var Client = DBModel.GetContext().Rent.Where(p => p.DateEnd > DateTime.Now).Select(p => p.Client).ToList();
            return Client;
        }
    }
}
