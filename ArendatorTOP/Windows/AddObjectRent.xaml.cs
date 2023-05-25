using ArendatorTOP.ViewModel;
using ArendatorTOP.Pages;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для AddObjectRent.xaml
    /// </summary>
    public partial class AddObjectRent : Window
    {

        public ObjectRent ObjectRent;

        ObjectRents ObjectRents;

        public AddObjectRent(ObjectRent objectRent, ObjectRents objectRents)
        {
            InitializeComponent();            
            ObjectRent = objectRent;
            (DataContext as AddObjectRentViewModel).GetObjectRentInfo(ObjectRent);
            comboAppointment.ItemsSource = (DataContext as AddObjectRentViewModel).GetAppointment();
            comboAppointment.SelectedItem = ObjectRent.Appointment;
            priceText.Text = ObjectRent.PriceForOneMeter.ToString();
            squareText.Text = ObjectRent.Square.ToString();
            comboStaitment.ItemsSource = (DataContext as AddObjectRentViewModel).GetStaitment();
            comboStaitment.SelectedItem = ObjectRent.Statement;
            textFloor.Text = ObjectRent.Floor.FloorValue.ToString();
            btnOR.Width = (double)ObjectRent.Control.WidthControl;
            btnOR.Height = (double)ObjectRent.Control.Height;
            btnOR.Content = ObjectRent.Control.Id;
            ObjectRents = objectRents;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (comboAppointment.SelectedItem != null && !string.IsNullOrEmpty(priceText.Text) && comboStaitment.SelectedItem != null)
                {
                    if ((DataContext as AddObjectRentViewModel).Save((Statement)comboStaitment.SelectedItem, (Appointment)comboAppointment.SelectedItem, Convert.ToDecimal(priceText.Text)))
                    {
                        MessageBox.Show("Информация успешно сохранена!");
                    }
                    else
                    {
                        MessageBox.Show("Не удалось сохранить данные!");
                    }
                }
                else
                {
                    MessageBox.Show("Ошибка! Проверьте все ли данные о помещении заполнены соответствующими значениями!");
                }
                ObjectRents.listObjectRent.ItemsSource = DBModel.GetContext().ObjectRent.ToList();
            }
            catch (FormatException ex)
            {
                MessageBox.Show("Ошибка! Проверьте все ли данные о помещении заполнены соответствующими значениями!" + ex.ToString());
            }
        }

        private void btnAddImage_Click(object sender, RoutedEventArgs e)
        {
            string pathTo = "Архив\\Помещения";
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image files (*.png;*.jpeg)|*.png;*.jpeg|All files (*.*)|*.*";
            if (openFileDialog.ShowDialog() == true)
            {
                string pathImage = pathTo +"\\" + DateTime.Now.Ticks.ToString() + ".jpg";
                Uri fileUri = new Uri(openFileDialog.FileName);
                Image image = new Image();
                image.Source = new BitmapImage(fileUri);
                File.Copy(openFileDialog.FileName, pathImage);
                (DataContext as AddObjectRentViewModel).AddObjectRentPhoto(pathImage);
                listPhotoObjectRent.SelectedIndex = -1;
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var selectedImage = (sender as Button).DataContext as PhotoOR;
            (DataContext as AddObjectRentViewModel).RemovePhoto(selectedImage);
        }
    }
}
