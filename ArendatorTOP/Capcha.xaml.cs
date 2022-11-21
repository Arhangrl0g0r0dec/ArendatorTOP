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

namespace ArendatorTOP
{
    /// <summary>
    /// Логика взаимодействия для Capcha.xaml
    /// </summary>
    public partial class Capcha : Window
    {
        MainWindow mainWindow;
        public bool IsCapcha = false;
        public Capcha(MainWindow Window)
        {
            InitializeComponent();
            mainWindow = Window;
        }

        private void btnSend_Click(object sender, RoutedEventArgs e)
        {
            if ((DataContext as AutorizationViewModel).CheckCapcha(textBoxCapcha.Text)) 
            {
                mainWindow.Container.Navigate(new Manager());
                Close();
            }
            else
            {
                MessageBox.Show("Неверный код!");
                (DataContext as AutorizationViewModel).GetCapcha();
            }
                
        }
    }
}
