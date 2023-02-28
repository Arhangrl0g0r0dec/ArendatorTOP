using ArendatorTOP.ViewModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
    /// Логика взаимодействия для ObjectRentForLook.xaml
    /// </summary>
    public partial class ObjectRentForLook : Page, INotifyPropertyChanged
    {
        public ObjectRentForLook()
        {
            InitializeComponent();
            Container.Navigate(new Plan());
        }

        private bool? isShowFilter = null;


        public bool? IsShowFilter
        {
            get => isShowFilter;
            set
            {
                if (isShowFilter != value)
                {
                    isShowFilter = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("IsShowFilter"));
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void test_MouseLeave(object sender, MouseEventArgs e)
        {
            (sender as ListBox).SelectedIndex = 0;
        }

        private void test_MouseMove(object sender, MouseEventArgs e)
        {
            ListBox listBox = sender as ListBox;
            int countElements = listBox.Items.Count;
            int numberPhoto = (int)e.GetPosition(listBox).X / (380 / countElements);
            listBox.SelectedIndex = numberPhoto;
        }

        private void appointmentBox_Checked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void appointmentBox_Unchecked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void btnFiltration_Click(object sender, RoutedEventArgs e)
        {

        }

        private void textStartPrice_TextChanged(object sender, TextChangedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void textEndPrice_TextChanged(object sender, TextChangedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void textStartSquare_TextChanged(object sender, TextChangedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void textEndSquare_TextChanged(object sender, TextChangedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void chekFloor_Checked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void chekFloor_Unchecked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void chekBoxStaytment_Checked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void chekBoxStaytment_Unchecked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void checkDelete_Click(object sender, RoutedEventArgs e)
        {
            if (checkDelete.IsChecked == true)
            {
                (DataContext as ObjectRentViewModel).IsCheking = true;
                (DataContext as ObjectRentViewModel).ObjectRentList();
            }
            else if (checkDelete.IsChecked != true)
            {
                (DataContext as ObjectRentViewModel).IsCheking = false;
                (DataContext as ObjectRentViewModel).ObjectRentList();
            }
        }

        private void sortBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }
    }
}
