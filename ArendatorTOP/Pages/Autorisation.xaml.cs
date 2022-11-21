using ArendatorTOP.Interfaces;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ArendatorTOP.Pages
{
    /// <summary>
    /// Логика взаимодействия для Autorisation.xaml
    /// </summary>
    public partial class Autorisation : Page, IGettingPassword
    {
        MainWindow window;
        Capcha capcha;
        public Autorisation(MainWindow main)
        {
            InitializeComponent();
            (DataContext as AutorizationViewModel).GettingPassword = this;
            window = main;
        }

        public string GetPassword() => paswordBox.Password;

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            if ((DataContext as AutorizationViewModel).LogIn()) 
            {
                //capcha = new Capcha(window);
                //capcha.Owner = window;
                //capcha.Show();
                //capcha.DataContext = DataContext;
                //(DataContext as AutorizationViewModel).GetCapcha();
                window.Container.Navigate(new Manager());
            }
            else 
            {
                MessageBox.Show("Неверный логин или пароль!");
            }
        }
    }
}
