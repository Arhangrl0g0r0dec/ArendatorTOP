using ArendatorTOP.Interfaces;
using ArendatorTOP.ViewModel;
using System.Windows;
using System.Windows.Controls;

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
                capcha = new Capcha(window, (DataContext as AutorizationViewModel).GetUser());
                capcha.Owner = window;
                capcha.Show();
                capcha.DataContext = DataContext;
                (DataContext as AutorizationViewModel).GetCapcha();
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль!");
            }
        }
    }
}
