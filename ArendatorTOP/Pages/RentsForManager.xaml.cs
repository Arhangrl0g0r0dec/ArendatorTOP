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
    /// Логика взаимодействия для RentsForManager.xaml
    /// </summary>
    public partial class RentsForManager : Page
    {
        public RentsForManager()
        {
            InitializeComponent();
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }

        private void btnObjectRent_Click(object sender, RoutedEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }

        private void btnDocument_Click(object sender, RoutedEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }

        private void DateStartPicker_CalendarClosed(object sender, RoutedEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }

        private void DateEndPicker_CalendarClosed(object sender, RoutedEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }
    }
}
