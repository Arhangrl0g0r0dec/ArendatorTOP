using ArendatorTOP.Pages;
using ArendatorTOP.ViewModel;
using System;
using System.IO;
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

        Client ClientForAdd { get; set; }
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
                    ClientForAdd = new Client()
                    {
                        Name = textName.Text,
                        Surname = textSurname.Text,
                        Patronimic = textPatronimic.Text,
                        INN = textINN.Text,
                        OGRN = textOGRN.Text,
                        KPP = textKPP.Text,
                        Mail = textEmail.Text,
                        PathToCopyPassport = (DataContext as AddClientViewModel).GetPath(0),
                        PathToCopyCertificateOfRegistrationOfaLegalEntity = (DataContext as AddClientViewModel).GetPath(1),
                        PathToCopyContractOfDirector = (DataContext as AddClientViewModel).GetPath(2),
                        Street = textStreet.Text,
                        Home = textHome.Text,
                        Floor = textFloor.Text,
                        Office = textOffice.Text,
                        Domophone = textDomophone.Text,
                        PhoneNumber = textPhone.Text
                    };

                    (DataContext as AddClientViewModel).AddClient(ClientForAdd);
                    this.Close();
                }
                ClientEditPage.dataClients.ItemsSource = DBModel.GetContext().Client.ToList();
                MessageBox.Show("Информация сохранена!");
            }
        }

        private void btnAddPassport_Click(object sender, RoutedEventArgs e)
        {
            controlLoadingOne.Visibility = Visibility.Visible;
            if ((DataContext as AddClientViewModel).FileDialog(btnAddPassport.Content.ToString())) 
            {
                MessageBox.Show("Файл успешно сохранен!");
            }
            else 
            {
                MessageBox.Show("Не удалось сохранить файл, либо он не был выбран!");
            }
            controlLoadingOne.Visibility = Visibility.Hidden;
            CheckMark1.Visibility = Visibility.Visible;
        }

        private void btnAddRegistrationSertificate_Click(object sender, RoutedEventArgs e)
        {
            controlLoadingTwo.Visibility = Visibility.Visible;
            
            if ((DataContext as AddClientViewModel).FileDialog(btnAddRegistrationSertificate.Content.ToString()))
            {
                MessageBox.Show("Файл успешно сохранен!");
            }
            else
            {
                MessageBox.Show("Не удалось сохранить файл, либо он не был выбран!");
            }
            controlLoadingTwo.Visibility = Visibility.Hidden;
            CheckMark2.Visibility = Visibility.Visible;
        }

        private void btnAddSertificateOfDirector_Click(object sender, RoutedEventArgs e)
        {
            controlLoadingThree.Visibility = Visibility.Visible;
            if ((DataContext as AddClientViewModel).FileDialog(text.Text.ToString())) 
            {
                MessageBox.Show("Файл успешно сохранен!");
            }
            else
            {
                MessageBox.Show("Не удалось сохранить файл, либо он не был выбран!");
            }
            controlLoadingThree.Visibility = Visibility.Hidden;
            CheckMark3.Visibility = Visibility.Visible;
        }

        /// <summary>
        /// При закрытии формы все файлы что были добавлены проверяются, и в случае их наличия удаляются
        /// Доработать, поменять событие закрытия окна, можно изменить стить окна чтобы не было возможности закрыть его крестиком
        /// </summary>
        /// 
        private void CloseWindow() 
        {
            MessageBoxResult messageBoxResult = new MessageBoxResult();
            messageBoxResult = MessageBox.Show("Вы уверены, что хотите отменить процесс, в таком случае все введенные вами данные будут утеряны, включая добавленные файлы!", "Отменить?", MessageBoxButton.YesNo);
            if (messageBoxResult == MessageBoxResult.Yes)
            {
                for(int i = 0; i <= 2; i++) 
                {
                    if((DataContext as AddClientViewModel).GetPath(i) != "")
                    {
                        File.Delete((DataContext as AddClientViewModel).GetPath(i));
                    }
                }
                this.Close();
            }
            else if (messageBoxResult == MessageBoxResult.No)
            {
            }
        }

        private void btnCanpel_Click(object sender, RoutedEventArgs e)
        {
            CloseWindow();
        }
    }
}
