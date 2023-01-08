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
    public partial class ObjectRents : Page, INotifyPropertyChanged
    {
        //Логика для взаимодействия с анимацией фильтров
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

        public ObjectRents()
        {
            InitializeComponent();
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void btnFiltration_Click(object sender, RoutedEventArgs e)
        {
            if (isShowFilter == null) IsShowFilter = false;
            else IsShowFilter = !IsShowFilter;
        }

        private void textStartPrice_TextChanged(object sender, TextChangedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void textEndPrice_TextChanged(object sender, TextChangedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }
        private void test_MouseMove(object sender, MouseEventArgs e)
        {
            ListBox listBox = sender as ListBox;
            int countElements = listBox.Items.Count;
            int numberPhoto = (int)e.GetPosition(listBox).X / (380 / countElements);
            listBox.SelectedIndex = numberPhoto;
        }

        private void test_MouseLeave(object sender, MouseEventArgs e)
        {
            (sender as ListBox).SelectedIndex = 0;
        }

        private void comboType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void chekBoxStaytment_Unchecked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void chekBoxStaytment_Checked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void chekFloor_Unchecked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void chekFloor_Checked(object sender, RoutedEventArgs e)
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

        private void sortBox_Unchecked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void sortBox_Checked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void sortBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        //Удаление помещения
        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as ObjectRent;

            MessageBoxResult boxResult = new MessageBoxResult();

            if ((DataContext as ObjectRentViewModel).CheckObjectRent(item))
            {
                boxResult = MessageBox.Show($"Вы уверены что хотите убрать помещение № {item.Id.ToString() + " " + item.Appointment.Title} из списка, у него еще есть незавершенная аренда! Вместе с помещением уберутся все связанные с ним данные об аренде!", "Убрать?", MessageBoxButton.YesNo);
            }
            else
            {
                boxResult = MessageBox.Show($"Вы уверены что хотите убрать помещение № {item.Id.ToString() + " " + item.Appointment.Title} из списка", "Убрать?", MessageBoxButton.YesNo);
            }

            if (boxResult == MessageBoxResult.Yes)
            {
                (DataContext as ObjectRentViewModel).Delete(item);

                MessageBox.Show("Помещение успешно убрано из списка!");

                (DataContext as ObjectRentViewModel).ObjectRentList();
            }
            else if (boxResult == MessageBoxResult.No)
            {
                listObjectRent.SelectedItem = null;
            }
        }

        private void appointmentBox_Checked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void appointmentBox_Unchecked(object sender, RoutedEventArgs e)
        {
            (DataContext as ObjectRentViewModel).ObjectRentList();
        }

        private void checkDelete_Click(object sender, RoutedEventArgs e)
        {
            if(checkDelete.IsChecked == true) 
            {
                (DataContext as ObjectRentViewModel).IsCheking = true;
                (DataContext as ObjectRentViewModel).ObjectRentList();
            }
            else if(checkDelete.IsChecked!= true) 
            {
                (DataContext as ObjectRentViewModel).IsCheking = false;
                (DataContext as ObjectRentViewModel).ObjectRentList();
            }
        }
    }
}
