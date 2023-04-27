using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class UserCabinetViewModel : ViewModelBase
    { 
        public User User { get; set; }
        public string FullName { get; set; }
        public int Id { get; set; }

        public UserCabinetViewModel() 
        {
            Title = "Главная";
            User = AutorizationViewModel.user;
            FullName = User.Employee.Surname + " " + User.Employee.Name;
            GetFullName();
        }

        public string GetFullName()
        {
            FullName = User.Employee.Surname + " " + User.Employee.Name;
            return FullName;
        }
    }
}
