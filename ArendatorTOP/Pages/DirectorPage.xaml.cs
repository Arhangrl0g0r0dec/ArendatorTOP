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
    /// Логика взаимодействия для Director.xaml
    /// </summary>
    public partial class Director : Page
    {
        User User;
        MainWindow MainWindow;
        public Director(MainWindow mainWindow, User user)
        {
            InitializeComponent();
            User = user;
            MainWindow = mainWindow;
        }

        private void btnRents_Click(object sender, RoutedEventArgs e)
        {
            ContainerFrame.Navigate(new RentsPage(User));
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.Container.Navigate(new Autorisation(MainWindow));
        }
    }
}
