using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class ManagerCabinetViewModel : ViewModelBase
    {
        public string FullName { get; set; }
        public User User { get; set; }
        public ManagerCabinetViewModel() 
        {
            Title = "Главная";
            User = AutorizationViewModel.user;
            GetFullName();
        }

        public string GetFullName() 
        {
            FullName = User.Employee.Surname + " " + User.Employee.Name;
            return FullName;
        }
    }
}
