using CefSharp.DevTools.DOMSnapshot;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class RentsViewModel : ViewModelBase
    {
        public string SearchString { get; set; }
        public DateTime DateStart { get; set; }
        public DateTime DateEnd { get; set; }
        public ObservableCollection<Rent> Rents { get; set; }

        public RentsViewModel()
        {
            Title = "Аренда";
            Rents = new ObservableCollection<Rent>();
            GetDates();
        }

        public void GetDates()
        {
            Rent rent = new Rent();
            rent = DBModel.GetContext().Rent.OrderByDescending(p => p.DateEnd).FirstOrDefault();
            DateEnd = rent.DateEnd;
            rent = DBModel.GetContext().Rent.OrderBy(p => p.DateEnd).FirstOrDefault();
            DateStart = rent.DateStart;
        }

        public ObservableCollection<Rent> UpdateRents() 
        {
            Rents.Clear();

            List<Rent> rents = new List<Rent>();

            rents = DBModel.GetContext().Rent.ToList();

            if (!String.IsNullOrEmpty(SearchString))
            {
                rents = rents.Where(p => p.Client.INN.ToLower().Contains(SearchString.ToLower())
                || p.Client.OGRN.ToLower().Contains(SearchString.ToLower()) 
                || p.Client.Surname.ToLower().Contains(SearchString.ToLower()) 
                || p.Client.KPP.ToLower().Contains(SearchString.ToLower()) 
                || p.Client.Name.ToLower().Contains(SearchString.ToLower()) 
                || p.Client.Patronimic.ToLower().Contains(SearchString.ToLower()) 
                || p.Client.PhoneNumber.ToLower().Contains(SearchString.ToLower()) 
                || p.Client.Street.ToLower().Contains(SearchString.ToLower())).ToList();
            }

            if(DateEnd.Date != null) 
            {
                rents = rents.Where(p => p.DateEnd <= DateEnd.Date).ToList();
            }

            if(DateStart.Date != null) 
            {
                rents = rents.Where(p => p.DateStart >= DateStart.Date).ToList();
            }

            foreach(var rent in rents) 
            {
                Rents.Add(rent);
            }

            return Rents;
        }

        public bool CheckRent(Rent rent)
        {
            if(rent != null) 
            {
                if(rent.DateEnd > DateTime.Now)
                {
                    return false;
                }
                else 
                {
                    return true;
                }
            }
            else 
            {
                return false;
            }
        }

        public bool DeleteRent(Rent rent) 
        {
            try
            {
                DBModel.GetContext().Rent.Remove(rent);
                DBModel.GetContext().SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
