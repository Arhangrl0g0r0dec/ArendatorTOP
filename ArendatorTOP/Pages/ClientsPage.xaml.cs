using ArendatorTOP.ViewModel;
using Svg2Xaml;
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
    /// Логика взаимодействия для ClientsPage.xaml
    /// </summary>
    public partial class ClientsPage : Page
    {

        MainWindow mainWindow;
        public ClientsPage(MainWindow main)
        {
            InitializeComponent();
            mainWindow = main;
            dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null);
        }

        private void chekBoxActive_Click(object sender, RoutedEventArgs e)
        {
            if (chekBoxActive.IsChecked == true)
            {
                (DataContext as ClientsViewModel).IsCheckedActive = true;
                dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null);
            }
            else if (chekBoxActive.IsChecked != true)
            {
                (DataContext as ClientsViewModel).IsCheckedActive = true;
                dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null);
            }
        }

        private void chekBoxRent_Click(object sender, RoutedEventArgs e)
        {
            if (chekBoxRent.IsChecked == true)
            {
                (DataContext as ClientsViewModel).IsCheckedActive = true;
                dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null);
            }
            else if (chekBoxRent.IsChecked != true)
            {
                (DataContext as ClientsViewModel).IsCheckedActive = false;
                dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(null);
            }
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList(searchBox.Text);
        }
    }
}
