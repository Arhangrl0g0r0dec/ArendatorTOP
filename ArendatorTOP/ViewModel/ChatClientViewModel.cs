using ArendatorTOP.ServiceChat;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ArendatorTOP.ViewModel
{
    class ChatClientViewModel:ViewModelBase
    {
        public User User { get; set; }

        public ChatClientViewModel() 
        {
            User = AutorizationViewModel.user;
        }
    }
}
