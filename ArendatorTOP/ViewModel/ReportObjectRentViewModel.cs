using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class ReportObjectRentViewModel:ViewModelBase
    {
        public DateTime DateStartRent { get; set; }
        public DateTime DateEndRent { get; set; }
        public List <ObjectRent> NoPopularObjectRent { get; set; }
        public List<int> ObjectRentId { get; set; }
        public List<double> CountRents { get; set; } 
        public List<string> ObjectRentTitle { get; set; }
        public List<decimal> FullPrice { get; set; }

        public string FullTitle { get; set; }
        public List<Rent> Rents { get; set; }
        public ReportObjectRentViewModel()
        {
            DateStartRent = DBModel.GetContext().Rent.OrderBy(p => p.DateStart).Select(p => p.DateStart).FirstOrDefault();
            DateEndRent = DBModel.GetContext().Rent.OrderByDescending(p => p.DateEnd).Select(p => p.DateEnd).FirstOrDefault();
            Rents = new List<Rent>();
            Rents = DBModel.GetContext().Rent.ToList();
            CreateReport();
        }

        public void CreateReport()
        {
            List<ObjectRent> objectRents = DBModel.GetContext().ObjectRent.ToList();
            ObjectRentId = objectRents.Select(p => p.Id).ToList();
            ObjectRentTitle = objectRents.Select(p => p.Appointment.Title).ToList();
            CountRents = new List<double>();
            FullPrice = new List<decimal>();
            objectRents.ForEach(p =>
            {
                CountRents.Add(DBModel.GetContext().Rent.Where(n => n.IdObjectRent == p.Id && n.DateStart >= DateStartRent && n.DateEnd<=DateEndRent).Count());
            });

            NoPopularObjectRent = objectRents.Where(p => p.Rent.Count() == CountRents.Min()).ToList();

            foreach (var i in objectRents)
            {
                FullPrice.Add(i.Rent.Select(p => p.Id).Count() * Convert.ToDecimal(i.Square) * i.PriceForOneMeter);
            }
            

            InfoObjectRent();
        }

        public void InfoObjectRent() 
        {
            foreach(var i in NoPopularObjectRent) 
            {
                FullTitle = "№" + i.Id.ToString() + " " + i.Appointment.Title + " ";
            }
        }
    }
}
