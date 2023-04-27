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
    /// Логика взаимодействия для Operator.xaml
    /// </summary>
    public partial class Operator : Page
    {
        MainWindow mainWindow;
        User User;
        public Operator(MainWindow main, User user)
        {
            InitializeComponent();
            mainWindow = main;
            User = user;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            mainWindow.Container.Navigate(new Autorisation(mainWindow));
        }

        private void btnClient_Click(object sender, RoutedEventArgs e)
        {
            ContainerFrame.Navigate(new ClientsPage(mainWindow));
        }

        private void btnObjectRent_Click(object sender, RoutedEventArgs e)
        {
            ContainerFrame.Navigate(new ObjectRentForLook());
        }

        private void btnRent_Click(object sender, RoutedEventArgs e)
        {
            ContainerFrame.Navigate(new ReportOfDemonstration());
        }

        private void btnDemonstration_Click(object sender, RoutedEventArgs e)
        {
            ContainerFrame.Navigate(new DemonstrationPage(User, null));
        }
    }
}
