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
            (DataContext as MoreDetailsAboutObjectRentViewModel).GetOR(ObjectRent.Id);
            BitmapImage image = new BitmapImage();
            image.BeginInit();
            image.UriSource = new Uri("\\Resource\\Images\\AddImage.jpg");
            listPhoto.Items.Add(image);
        }
    }
}
