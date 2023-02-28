using ArendatorTOP.ViewModel;
using ArendatorTOP.Windows;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Runtime.CompilerServices;
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
    /// Логика взаимодействия для DemonstrationPage.xaml
    /// </summary>
    public partial class DemonstrationPage : Page
    {
        User User;
        Manager Managers;

        public DemonstrationPage(User user, Manager manager)
        {
            InitializeComponent();
            Managers = manager;
            DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
            User = user;
        }

        private void btnSingUp_Click(object sender, RoutedEventArgs e)
        {
            var demonstration = (sender as Button).DataContext as Demonstration;

            SingUpClient singUpClient = new SingUpClient(demonstration, User, this, Managers);
            singUpClient.Show();
        }

        private void checkFree_Click(object sender, RoutedEventArgs e)
        {
            if(checkFree.IsChecked == true) 
            {
                checkBusy.IsChecked = false;
                (DataContext as DemonstrationViewModel).IsCheckingBusy = (bool)checkBusy.IsChecked;
                (DataContext as DemonstrationViewModel).IsCheckingFree = (bool)checkFree.IsChecked;
                DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
            }
            else 
            {
                checkFree.IsChecked = false;
                (DataContext as DemonstrationViewModel).IsCheckingFree = (bool)checkFree.IsChecked;
                DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
            }
        }

        private void checkBusy_Click(object sender, RoutedEventArgs e)
        {
            if (checkBusy.IsChecked == true)
            {
                checkFree.IsChecked = false;
                (DataContext as DemonstrationViewModel).IsCheckingBusy = (bool)checkBusy.IsChecked;
                (DataContext as DemonstrationViewModel).IsCheckingFree = (bool)checkFree.IsChecked;
                DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
            }
            else
            {
                checkBusy.IsChecked = false;
                (DataContext as DemonstrationViewModel).IsCheckingBusy = (bool)checkBusy.IsChecked;
                DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
            }
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
        }

        private void DateEndPicker_SourceUpdated(object sender, DataTransferEventArgs e)
        {
            DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
        }

        private void DateStartPicker_SourceUpdated(object sender, DataTransferEventArgs e)
        {
            DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
        }

        private void DateEndPicker_CalendarClosed(object sender, RoutedEventArgs e)
        {
            DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
        }

        private void DateStartPicker_CalendarClosed(object sender, RoutedEventArgs e)
        {
            DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
        }
    }
}
