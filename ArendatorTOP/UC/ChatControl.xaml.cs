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

namespace ArendatorTOP.UC
{
    /// <summary>
    /// Логика взаимодействия для ChatControl.xaml
    /// </summary>
    public partial class ChatControl : UserControl, INotifyPropertyChanged, IServiceChatCallback
    {
        public static readonly DependencyProperty NameForChatProperty =
            DependencyProperty.Register("NameForChat", typeof(string),
                typeof(ChatControl), new UIPropertyMetadata());
        /// <summary>
        /// Имя полученное от Manager при помощи свойства расширения NameForChat
        /// </summary>
        public string NameForChat
        {
            get { return (string) GetValue(NameForChatProperty); }
            set { SetValue(NameForChatProperty, value); }
        }

        public int IdForChat = 0;
        /// <summary>
        /// Свойство определящее будет ли показан чат
        /// </summary>
        private bool? isShowChat = null;
        public event PropertyChangedEventHandler PropertyChanged;

        bool IsConnect = false;
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
        public List<Employee> Employees = DBModel.GetContext().Employee.ToList();
        public ChatControl()
        {
            InitializeComponent();
        }
        
        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            this.DataContext = this;
            Employee employee = new Employee();
            employee = Employees.FirstOrDefault(p => p.Id == IdForChat);
            Employees.Remove(employee);
            listEmployee.ItemsSource = Employees;
            listNotification.ItemsSource = DBModel.GetContext().Message.Where(n => n.IdRecipient == IdForChat).ToList();
            client = new ServiceChatClient(new InstanceContext(this));
            ConnectionUser();
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

        void ConnectUser()
        {
            if (!IsConnect)
            {
                client.Connect(NameForChat);
                IsConnect = true;
            }
        }

        void DisconnectUser()
        {
            if (IsConnect)
            {
                client.Disconnect(IdForChat);
                client = null;
                IsConnect = false;
            }
        }

        public void MsgCallback(string msg)
        {
            listChat.Items.Add(msg);
            listChat.ScrollIntoView(listChat.Items.Count - 1);
        }

        void ConnectionUser()
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

        private void btnEnterMessage_Click(object sender, RoutedEventArgs e)
        {
            if (client != null)
            {
                client.SendMessage(txtContentMessage.Text, IdForChat);
                txtContentMessage.Text = string.Empty;
            }
        }
    }
}
