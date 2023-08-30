using ArendatorTOP.ViewModel;
using ArendatorTOP.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ArendatorTOP.Pages
{
    /// <summary>
    /// Логика взаимодействия для ClientsForEditPage.xaml
    /// </summary>
    public partial class ClientsForEditPage : Page
    {
        MainWindow mainWindow;
        public ClientsForEditPage(MainWindow main)
        {
            InitializeComponent();
            mainWindow = main;
            chekBoxActive.IsChecked = false;
            dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null); 
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(searchBox.Text);
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddClient addClient = new AddClient(this, null);
            addClient.Owner = mainWindow;
            addClient.Show();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            var client = (Client)dataClients.SelectedItem;
            AddClient addClient = new AddClient(this, client);
            addClient.Owner = mainWindow;
            addClient.Show();
        }

        private void chekBoxRent_Click(object sender, RoutedEventArgs e)
        {
            if (chekBoxRent.IsChecked == true)
            {
                (DataContext as ClientsViewModel).IsCheckedActive = (bool)chekBoxRent.IsChecked;
                chekBoxActive.IsChecked = false;
                dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null);
            }
            else 
            {
                dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null);
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var SelectedClients = (Client)dataClients.SelectedItem;

            MessageBoxResult boxResult = new MessageBoxResult();

            if ((DataContext as ClientsViewModel).CheckClient(SelectedClients))
            {
                boxResult = MessageBox.Show($"Вы уверены что хотите удалить клиента {SelectedClients.Name + " " + SelectedClients.Surname + " " + SelectedClients.Patronimic}, у него еще есть незавершенная аренда! ", "Удалить?", MessageBoxButton.YesNo);
            }
            else
            {
                boxResult = MessageBox.Show($"Вы уверены что хотите удалить клиента {SelectedClients.Name + " " + SelectedClients.Surname + " " + SelectedClients.Patronimic} ?", "Удалить?", MessageBoxButton.YesNo);
            }

            if (boxResult == MessageBoxResult.Yes)
            {
                (DataContext as ClientsViewModel).DeleteClient(SelectedClients);

                MessageBox.Show("Клиент успешно убран из списка!");

                dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null);
            }
            else if (boxResult == MessageBoxResult.No)
            {
                SelectedClients = null;
                dataClients.SelectedItem = null;
            }
        }

        

        private void comboBoxDoc_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int index = (sender as ComboBox).SelectedIndex;
            Client client = (sender as ComboBox).DataContext as Client;
            (DataContext as ClientsViewModel).OpenDocument(index, client);
        }

        private void chekBoxActive_Click(object sender, RoutedEventArgs e)
        {
                (DataContext as ClientsViewModel).IsCheckedDelete = (bool)chekBoxActive.IsChecked;
                chekBoxRent.IsChecked = false;
                dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null);
        }
    }
}
