using ArendatorTOP.Pages;
using ArendatorTOP.ViewModel;
using System;
using System.Linq;
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
        Client SelectedClient { get; set; }
        /// <summary>
        /// Узнать как передать DataContext AddClientViewModel после того как данные для редактироваиня заполнены
        /// </summary>
        /// <param name="clientsForEditPage"></param>
        /// <param name="client"></param>
        public AddClient(ClientsForEditPage clientsForEditPage, Client client)
        {
            InitializeComponent();

            ClientEditPage = clientsForEditPage;

            SelectedClient = client;

            if(SelectedClient != null) 
            {
                textTitle.Text = "Редактировать";
                DataContext = SelectedClient;
            }
            else 
            {
                textTitle.Text = "Добавить";
                DataContext = new AddClientViewModel();
            }
            
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

            
            
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
            }
            else if (errors.Length == 0)
            {
                if (DataContext == SelectedClient)
                {
                    DataContext = new AddClientViewModel();
                    (DataContext as AddClientViewModel).EditClient(SelectedClient);
                    this.Close();
                }
                else 
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
                }
                ClientEditPage.dataClients.ItemsSource = DBModel.GetContext().Client.ToList();
                MessageBox.Show("Информация сохранена!");
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
            if ((DataContext as AddClientViewModel).FileDialog(text.Text.ToString()))
                MessageBox.Show("Файл успешно сохранен!");
            else
                MessageBox.Show("Не удалось сохранить файл, либо он не был выбран!");
        }
    }
}
