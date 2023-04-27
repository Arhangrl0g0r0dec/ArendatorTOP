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
    /// Логика взаимодействия для RentPage.xaml
    /// </summary>
    public partial class RentsPage : Page
    {
        User User;
        public RentsPage(User user)
        {
            InitializeComponent();
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
            User = user;
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddRent addRent = new AddRent(User);
            addRent.Show();
        }

        private void btnObjectRent_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            Rent rent = (Rent)DataRents.SelectedItem;
            bool isChecked = (DataContext as RentsViewModel).CheckRent(rent);

            MessageBoxResult messageBoxResult = new MessageBoxResult();

            if (!isChecked) 
            {
                messageBoxResult = MessageBox.Show($"Вы уверенны что хотите удалить аренду № {rent.Id}? Срок данной аренды ешё не закончен!", "Удалить?", MessageBoxButton.YesNo );
            }
            else 
            {
                messageBoxResult = MessageBox.Show($"Вы уверенны что хотите удалить аренду № {rent.Id}?", "Удалить?", MessageBoxButton.YesNo);
            }

            if (messageBoxResult == MessageBoxResult.Yes) 
            {
                (DataContext as RentsViewModel).DeleteRent(rent);
            }
            else 
            {
                DataRents.SelectedItem = null;
            }
        }

        private void DateStartPicker_CalendarClosed(object sender, RoutedEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }

        private void DateEndPicker_CalendarClosed(object sender, RoutedEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }

        private void DateStartPicker_TextInput(object sender, TextCompositionEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }

        private void DateEndPicker_TextInput(object sender, TextCompositionEventArgs e)
        {
            DataRents.ItemsSource = (DataContext as RentsViewModel).UpdateRents();
        }
    }
}
