using ArendatorTOP.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Runtime.CompilerServices;
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
    /// Логика взаимодействия для DemonstrationPage.xaml
    /// </summary>
    public partial class DemonstrationPage : Page
    {
        public DemonstrationPage()
        {
            InitializeComponent();

            DataDemonstration.ItemsSource = (DataContext as DemonstrationViewModel).UpdateDemonstration();
        }

        private void btnSingUp_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
