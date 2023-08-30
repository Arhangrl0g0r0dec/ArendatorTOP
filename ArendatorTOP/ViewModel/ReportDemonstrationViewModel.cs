using ArendatorTOP.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class ReportDemonstrationViewModel : ViewModelBase
    {
        public List<int> DemonstrationsId = new List<int>();
        public List<string> ManagersOfDemonstrations = new List<string>();
        public List<string> ObjectRents = new List<string>();
        public List<DateTime> DateTimesDemonstrations = new List<DateTime>();
        public List<TimeSpan> TimeSpansDemonstrations = new List<TimeSpan>();
        public List<Demonstration> Demonstrations = new List<Demonstration>();

        public ReportDemonstrationViewModel()
        {
            Title = "Отчетность по демонстрациям";
        }

        public List<Demonstration> GetListDemonstrations(DateTime dateTime)
        {
            Demonstrations = DBModel.GetContext().Demonstration.Where(p => p.IsOccupied == true).Where(p => p.DateOfDemonstration == dateTime).ToList();
            DemonstrationsId = Demonstrations.Select(p => p.Id).ToList();
            ManagersOfDemonstrations = Demonstrations.Select(p => p.Employee.Name + " " + p.Employee.Surname + " " + p.Employee.Patronimic).ToList();
            DateTimesDemonstrations = Demonstrations.Select(p => p.DateOfDemonstration).Where(p => p.Date == dateTime).ToList();
            TimeSpansDemonstrations = Demonstrations.Select(p => p.TimeOfDemonstration).ToList();
            ObjectRents = Demonstrations.Select(p => p.ObjectRent.Id + " " + p.ObjectRent.Appointment.Title).ToList();
            return Demonstrations;
        }
    }
}
