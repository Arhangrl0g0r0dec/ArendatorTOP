using ArendatorTOP.Pages;
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
    /// Логика взаимодействия для MoreDetailsAboutObjectRent.xaml
    /// </summary>
    public partial class MoreDetailsAboutObjectRent : Window
    {
        ObjectRent ObjectRent { get; set; }
        public MoreDetailsAboutObjectRent(ObjectRent objectRent)
        {
            InitializeComponent();

            ObjectRent = objectRent;
            (DataContext as MoreDetailsAboutObjectRentViewModel).GetObjectRentInfo(ObjectRent);
            comboAppointment.ItemsSource = (DataContext as MoreDetailsAboutObjectRentViewModel).GetAppointment();
            comboAppointment.SelectedItem = ObjectRent.Appointment;
            priceText.Text = ObjectRent.PriceForOneMeter.ToString();
            squareText.Text = ObjectRent.Square.ToString();
            comboStaitment.ItemsSource = (DataContext as MoreDetailsAboutObjectRentViewModel).GetStaitment();
            comboStaitment.SelectedItem = ObjectRent.Statement;
            textFloor.Text = ObjectRent.Floor.FloorValue.ToString();
            btnOR.Width = (double)ObjectRent.Control.WidthControl;
            btnOR.Height = (double)ObjectRent.Control.Height;
            btnOR.Content = ObjectRent.Control.Id;

            comboAppointment.IsEditable = false;
            comboStaitment.IsEditable = false;
        }
    }
}
