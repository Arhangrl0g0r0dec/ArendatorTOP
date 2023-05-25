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
using System.Windows.Shapes;

namespace ArendatorTOP.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddRent.xaml
    /// </summary>
    public partial class AddRent : Window
    {
        ObjectRent ObjectRent { get; set; }
        Client Client { get; set; }
        User User { get; set; }
        public AddRent(User user)
        {
            InitializeComponent();
            comboTypeOfPayment.ItemsSource = (DataContext as CreateRentViewModel).UpdatePaymentList();
            listBoxClients.ItemsSource = (DataContext as CreateRentViewModel).UpdateClientList();
            listBoxOR.ItemsSource = (DataContext as CreateRentViewModel).UpdateObjectRentList();
            numContract.Text = ((DataContext as Document).NumDocument + 1).ToString();
            User = user;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Client = (Client)listBoxClients.SelectedItem;
            ObjectRent = (ObjectRent)listBoxOR.SelectedItem;
            FormOfPayment formOfPayment = (FormOfPayment)comboTypeOfPayment.SelectedItem;
            Employee employee;
            employee = User.Employee;

            if (DateEnd.SelectedDate < DateStart.SelectedDate)
            {
                MessageBox.Show("Выбранный диапазон дат невозможен!");
            }
            else if (DateEnd.SelectedDate == DateStart.SelectedDate) 
            {
                MessageBox.Show("Выбранный диапазон дат невозможен!");
            }
            else if (DateEnd.SelectedDate == null || DateStart.SelectedDate == null) 
            {
                MessageBox.Show("Вы не выбрали начальную и конечную даты аренды!");
            }
            else 
            {
                DateTime dateEnd = (DateTime)DateEnd.SelectedDate;

                DateTime dateStart = (DateTime)DateStart.SelectedDate;

                CreateContract createContract = new CreateContract((DataContext as CreateRentViewModel).SaveDemonstration(Client, employee, ObjectRent, formOfPayment, dateStart, dateEnd));
                createContract.Show();
                this.Close();
            }
        }

        private void searchText_TextChanged(object sender, TextChangedEventArgs e)
        {
            listBoxClients.ItemsSource = (DataContext as CreateRentViewModel).UpdateClientList();
        }

        private void appointmentBox_Unchecked(object sender, RoutedEventArgs e)
        {
            listBoxOR.ItemsSource = (DataContext as CreateRentViewModel).UpdateObjectRentList();
        }

        private void appointmentBox_Checked(object sender, RoutedEventArgs e)
        {
            listBoxOR.ItemsSource = (DataContext as CreateRentViewModel).UpdateObjectRentList();
        }

        private void listBoxClients_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var client = (Client)listBoxClients.SelectedItem;

            nameText.Text = (DataContext as CreateRentViewModel).GetClientName(client);
            surnameText.Text = (DataContext as CreateRentViewModel).GetClientSurname(client);
            PatronimicText.Text = (DataContext as CreateRentViewModel).GetClientPatronimic(client);
            PhoneNumberText.Text = (DataContext as CreateRentViewModel).GetClientPhoneNumber(client);
        }

        private void listBoxOR_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var objectRent = (ObjectRent)listBoxOR.SelectedItem;
            ObjectRentText.Text = (DataContext as CreateRentViewModel).GetObjectRent(objectRent);
        }
    }
}
