using CefSharp.DevTools.Cast;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using System.Xml.Linq;
using ArendatorTOP.ViewModel;
using ArendatorTOP.Pages;
using CefSharp.DevTools.IO;
using ArendatorTOP.ServiceChat;
using System.ServiceModel;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Windows.Interop;

namespace ArendatorTOP.UC
{
    /// <summary>
    /// Логика взаимодействия для ChatControl.xaml
    /// </summary>
    public partial class ChatControl : UserControl, INotifyPropertyChanged, IServiceChatCallback
    {
        /// <summary>
        /// Свойство определящее будет ли показан чат
        /// </summary>
        private bool? isShowChat = null;
        User User { get; set; }
        bool IsConnect = false;
        
        public event PropertyChangedEventHandler PropertyChanged;
        List<Employee> Employees { get; set; }
        ServiceChatClient client;
        public bool? IsShowChat
        {
            get => isShowChat;
            set
            {
                if (isShowChat != value)
                {
                    isShowChat = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("IsShowChat"));
                }
            }
        }
        
        public int Id {get; set;} 
        public string Name { get; set; }
        public ChatControl()
        {
            InitializeComponent();
            client = new ServiceChatClient(new InstanceContext(this));
            User = (DataContext as ChatClientViewModel).User;
            this.DataContext = this;
            Id = User.Employee.Id;
            Name = User.Employee.Surname[0] + ". " + User.Employee.Name;
            ConnectionUser();
            Employees = DBModel.GetContext().Employee.Where(e => e.Id != Id).ToList();
            listEmployee.ItemsSource = Employees;
            listNotification.ItemsSource = DBModel.GetContext().Message.Where(p => p.IdRecipient == User.Employee.Id).ToList();
        }

        void DisconnectUser()
        {
            if (IsConnect)
            {
                client.Disconnect(Id);
                client = null;
                IsConnect = false;
            }
        }

        public void ConnectionUser()
        {
            if (IsConnect)
            {
                DisconnectUser();
            }
            else
            {
                ConnectUser();
            }
        }

        void ConnectUser()
        {
            try
            {
                if (!IsConnect)
                {
                    client.Connect(Name, Id);
                    IsConnect = true;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка подключения! " + ex.Message);
            }
        }

        private void btnChat_Click(object sender, RoutedEventArgs e)
        {
            if (isShowChat == null)
            {
                IsShowChat = false;
            }
            else 
            {
                IsShowChat = !IsShowChat;
            } 
        }

        private void btnEnterMessage_Click(object sender, RoutedEventArgs e)
        {
            client.SendMessage(txtContentMessage.Text, Id);
            txtContentMessage.Text = string.Empty;
        }

        public void MsgCallback(string msg)
        {
            listChat.Items.Add(msg);
            listChat.ScrollIntoView(listChat.Items.Count - 1);
        }
    }
}
