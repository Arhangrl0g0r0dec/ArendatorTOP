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
    /// Логика взаимодействия для ObjectRent.xaml
    /// </summary>
    public partial class ObjectRent : Page, INotifyPropertyChanged
    {
        private bool? isShowFilter = null;

        public bool IsCheckedAll = false;
        public bool IsCheckedFree = false;
        public bool IsCheckedBusy = false;
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

        public ObjectRent()
        {
            InitializeComponent();
            IsCheckedAll = true;
            chekBoxAll.IsChecked = IsCheckedAll;
            comboType.ItemsSource = (DataContext as ObjectRentViewModel).GetAppointment();
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void btnFiltration_Click(object sender, RoutedEventArgs e)
        {
            if (isShowFilter == null) IsShowFilter = false;
            else IsShowFilter = !IsShowFilter;
        }

        private void btnLastPhoto_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnNextPhoto_Click(object sender, RoutedEventArgs e)
        {

        }

        private void comboType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string item = comboType.SelectedItem.ToString();
            listObjectRent.ItemsSource = (DataContext as ObjectRentViewModel).FilterAppointments(item);
        }

        private void textStartPrice_TextChanged(object sender, TextChangedEventArgs e)
        {
            GetPricese();
        }

        private void textEndPrice_TextChanged(object sender, TextChangedEventArgs e)
        {
            GetPricese();
        }

        private void GetPricese()
        {
            try
            {
                string startPrice =  "";
                string endPrice = "";
                if (!String.IsNullOrWhiteSpace(textStartPrice.Text)) 
                {
                    startPrice = textStartPrice.Text;
                }

                if (!String.IsNullOrWhiteSpace(textEndPrice.Text)) 
                {
                    endPrice = textEndPrice.Text;
                }

                listObjectRent.ItemsSource = (DataContext as ObjectRentViewModel).FiltrationPrice(startPrice, endPrice);
            }
            catch(Exception ex)
            {
                MessageBox.Show($"Ошибка! {ex}");
            }
        }

        private void chekBoxAll_Click(object sender, RoutedEventArgs e)
        {
            IsCheckedBusy = false;
            chekBoxBusy.IsChecked = IsCheckedBusy;
            
            IsCheckedFree = false;
            chekBoxFree.IsChecked = IsCheckedFree;
            
            IsCheckedAll = !IsCheckedAll;
            chekBoxAll.IsChecked = IsCheckedAll;
            
            if (IsCheckedAll)
            {
                listObjectRent.ItemsSource = (DataContext as ObjectRentViewModel).FiltrationStatus(IsCheckedAll, IsCheckedFree, IsCheckedBusy);
            }
            else 
            {
            
            }
        }

        private void chekBoxFree_Click(object sender, RoutedEventArgs e)
        {
            IsCheckedBusy = false;
            chekBoxBusy.IsChecked = IsCheckedBusy;

            IsCheckedAll = false;
            chekBoxAll.IsChecked = IsCheckedAll;

            IsCheckedFree = !IsCheckedFree;
            chekBoxFree.IsChecked = IsCheckedFree;
            
            
            if (IsCheckedFree) 
            {
                listObjectRent.ItemsSource = (DataContext as ObjectRentViewModel).FiltrationStatus(IsCheckedAll, IsCheckedFree, IsCheckedBusy);
            }
            else
            {
                IsCheckedAll = true;
                chekBoxAll.IsChecked = IsCheckedAll;
                IsCheckedFree = false;
                listObjectRent.ItemsSource = (DataContext as ObjectRentViewModel).FiltrationStatus(IsCheckedAll, IsCheckedFree, IsCheckedBusy);
            }
        }

        private void chekBoxBusy_Click(object sender, RoutedEventArgs e)
        {            
            IsCheckedFree = false;
            chekBoxFree.IsChecked = IsCheckedFree;
            
            IsCheckedAll = false;
            chekBoxAll.IsChecked = IsCheckedAll;

            IsCheckedBusy = !IsCheckedBusy;
            chekBoxBusy.IsChecked = IsCheckedBusy;

            if (IsCheckedBusy)
            {
                listObjectRent.ItemsSource = (DataContext as ObjectRentViewModel).FiltrationStatus(IsCheckedAll, IsCheckedFree, IsCheckedBusy);
            }
            else
            {
                IsCheckedFree = false;
                IsCheckedAll = true;
                chekBoxAll.IsChecked = IsCheckedAll;
                listObjectRent.ItemsSource = (DataContext as ObjectRentViewModel).FiltrationStatus(IsCheckedAll, IsCheckedFree, IsCheckedBusy);
            }
        }
    }
}
