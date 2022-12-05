using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class ReportViewModel:ViewModelBase
    {
        public ObjectRent PopularObjectRent { get; set; }
        public List<int> ObjectRentId { get; set; }
        public List<double> CountRents { get; set; } 
        public List<string> ObjectRentTitle { get; set; }

        public string FullTitle { get; set; }
        public ReportViewModel()
        {
            Title = "Отчетность по аренде";
            List<ObjectRent> objectRents = DBModel.GetContext().ObjectRent.ToList();
            ObjectRentId = objectRents.Select(p => p.Id).ToList();
            ObjectRentTitle = objectRents.Select(p => p.Appointment.Title).ToList();
            CountRents = new List<double>();
            objectRents.ForEach(p =>
            {
                CountRents.Add(DBModel.GetContext().Rent.Where(n => n.IdObjectRent == p.Id).Count()); 
            });

            PopularObjectRent = objectRents.FirstOrDefault(p => p.Rent.Count() == CountRents.Max());

            InfoObjectRent();
        }

        public void InfoObjectRent() 
        {
            FullTitle = "№" + PopularObjectRent.Id.ToString() + " " + PopularObjectRent.Appointment.Title;
        }
    }
}
