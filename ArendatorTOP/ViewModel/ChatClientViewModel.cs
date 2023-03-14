using ArendatorTOP.ServiceChat;
using ArendatorTOP.UC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ArendatorTOP.ViewModel
{
    class ChatClientViewModel : ViewModelBase
    {
        bool IsConnect = false;
        public ServiceChatClient client;
        int ID;
        ChatClientViewModel()
        {
            ConnectionUser();
        }

        void ConnectUser()
        {
            //if (!IsConnect)
            //{
            //    client = new ServiceChatClient(new System.ServiceModel.InstanceContext(this));
            //    ID = client.Connect();
            //    IsConnect = true;
            //}
        }

        void DisconnectUser()
        {
            if (IsConnect)
            {
                client.Disconnect(ID);
                client = null;
                IsConnect = false;
            }
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

        public void SendMessage(string message) 
        {
            client.SendMessage(message, ID);
        }
    }
}
