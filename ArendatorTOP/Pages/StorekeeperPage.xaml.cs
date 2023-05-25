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
    /// Логика взаимодействия для StorekeeperPage.xaml
    /// </summary>
    public partial class StorekeeperPage : Page
    {
        MainWindow MainWindow;
        User User;
        public StorekeeperPage(MainWindow mainWindow, User user)
        {
            InitializeComponent();

        }

        private void btnMaterial_Click(object sender, RoutedEventArgs e)
        {
            ContainerFrame.Navigate(new MaterialPage());
        }
    }
}
