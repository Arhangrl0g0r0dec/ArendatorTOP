using ArendatorTOP.ViewModel;
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
        public ClientsForEditPage()
        {
            InitializeComponent();
            dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList();
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            dataClients.ItemsSource = (DataContext as ClientsViewModel).Search(searchBox.Text);
        }
    }
}
