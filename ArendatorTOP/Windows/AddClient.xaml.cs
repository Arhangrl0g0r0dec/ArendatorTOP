using ArendatorTOP.Pages;
using ArendatorTOP.ViewModel;
using System;
using System.Text;
using System.Windows;

namespace ArendatorTOP.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddClient.xaml
    /// </summary>
    public partial class AddClient : Window
    {
        ClientsForEditPage ClientEditPage;
        public AddClient(ClientsForEditPage clientsForEditPage)
        {
            InitializeComponent();
            ClientEditPage = clientsForEditPage;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (String.IsNullOrEmpty(textName.Text))
                errors.AppendLine("Заполните имя!");
            if (String.IsNullOrEmpty(textSurname.Text))
                errors.AppendLine("Заполните фамилию!");
            if (String.IsNullOrEmpty(textPatronimic.Text))
                errors.AppendLine("Заполните отчество!");
            if (String.IsNullOrEmpty(textINN.Text))
                errors.AppendLine("Заполните ИНН!");
            if (String.IsNullOrEmpty(textOGRN.Text))
                errors.AppendLine("Заполните ОГРН!");
            if (String.IsNullOrEmpty(textKPP.Text))
                errors.AppendLine("Заполните КПП!");
            if (String.IsNullOrEmpty(textStreet.Text))
                errors.AppendLine("Заполните название улицы!");
            if (String.IsNullOrEmpty(textHome.Text))
                errors.AppendLine("Заполните номер дома!");
            if (String.IsNullOrEmpty(textFloor.Text))
                errors.AppendLine("Заполните номер этажа!");
            if (String.IsNullOrEmpty(textOffice.Text))
                errors.AppendLine("Заполните номер офиса!");
            if (String.IsNullOrEmpty(textDomophone.Text))
                errors.AppendLine("Заполните код домофона!");
            if (String.IsNullOrEmpty(textPhone.Text))
                errors.AppendLine("Заполните номер телефона!");

            if(errors.Length > 0) 
            {
                MessageBox.Show(errors.ToString());
            }
            else if (errors.Length == 0) 
            {
                Client client = new Client()
                {
                    Name = textName.Text,
                    Surname = textSurname.Text,
                    Patronimic = textPatronimic.Text,
                    INN = textINN.Text,
                    OGRN = textOGRN.Text,
                    KPP = textKPP.Text,
                    Mail = textEmail.Text,
                    PathToCopyPassport = (DataContext as AddClientViewModel).GetPath(),
                    PathToCopyCertificateOfRegistrationOfaLegalEntity = (DataContext as AddClientViewModel).GetPath(),
                    PathToCopyContractOfDirector = (DataContext as AddClientViewModel).GetPath(),
                    Street = textStreet.Text,
                    Home = textHome.Text,
                    Floor = textFloor.Text,
                    Office = textOffice.Text,
                    Domophone = textDomophone.Text,
                    PhoneNumber = textPhone.Text
                };

                (DataContext as AddClientViewModel).AddClient(client);
                this.Close();

                ClientEditPage.dataClients.ItemsSource = (DataContext as ClientsViewModel).UpdateClientList();
                
            }
        }

        private void btnAddPassport_Click(object sender, RoutedEventArgs e)
        {
            if ((DataContext as AddClientViewModel).FileDialog(btnAddPassport.Content.ToString()))
                MessageBox.Show("Файл успешно сохранен!");
            else
                MessageBox.Show("Не удалось сохранить файл, либо он не был выбран!");
        }

        private void btnAddRegistrationSertificate_Click(object sender, RoutedEventArgs e)
        {
            if ((DataContext as AddClientViewModel).FileDialog(btnAddRegistrationSertificate.Content.ToString()))
                MessageBox.Show("Файл успешно сохранен!");
            else
                MessageBox.Show("Не удалось сохранить файл, либо он не был выбран!");
        }

        private void btnAddSertificateOfDirector_Click(object sender, RoutedEventArgs e)
        {
            if ((DataContext as AddClientViewModel).FileDialog(btnAddSertificateOfDirector.Content.ToString()))
                MessageBox.Show("Файл успешно сохранен!");
            else
                MessageBox.Show("Не удалось сохранить файл, либо он не был выбран!");
        }
    }
}
