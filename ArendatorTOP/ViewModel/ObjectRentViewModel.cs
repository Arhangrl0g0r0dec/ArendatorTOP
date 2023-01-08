using ArendatorTOP.Interfaces;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ArendatorTOP.ViewModel
{
    class ObjectRentViewModel : ViewModelBase
    {
        ObjectRent Objrent;
        public int selectedSortIndex { get; set; } = 0;
        public int selectedStateIndex { get; set; } = 0;
        public bool IsCheking { get; set; }
        public string StartPrice { get; set; }
        public string EndPrice { get; set; }
        public string StartSquare { get; set; }
        public string EndSquare { get; set; }
        public ObservableCollection<SelectionFilter> SelectionFiltersApp { get; set; }
        public ObservableCollection<SelectionFilter> SelectionFiltersState { get; set; }
        public ObservableCollection<SelectionFilter> SelectionFiltersFloor { get; set; }
        public ObservableCollection<SelectionFilter> SelectionFiltersSort { get; set; }
        public ObservableCollection<SelectionFilter> SelectionFiltersActive { get; set; }
        public ObservableCollection<ObjectRent> ObjectRents { get; set; }

        public ObjectRentViewModel()
        {
            Title = "Помещения";
            ObjectRents = new ObservableCollection<ObjectRent>();
            List<Floor> Floors = new List<Floor>()
            {
                new Floor(0),
                new Floor(1),
                new Floor(2),
                new Floor(3),
                new Floor(4),
                new Floor(5),
            };

            SelectionFiltersFloor = new ObservableCollection<SelectionFilter>(Floors.Select(p => new SelectionFilter() { Floor = p}));
            SelectionFiltersApp = new ObservableCollection<SelectionFilter>(DBModel.GetContext().Appointment.Select(p => new SelectionFilter() { Appointments = p }));
            SelectionFiltersState = new ObservableCollection<SelectionFilter>(DBModel.GetContext().Statement.Select(p => new SelectionFilter() { Statements = p }));

            ObjectRentList();
        }

        public void ObjectRentList()
        {
            try
            {
                ObjectRents.Clear();
                List<Floor> floors = SelectionFiltersFloor.Where(p => p.IsChecked).Select(p => p.Floor).ToList();
                List<Appointment> appointments = SelectionFiltersApp.Where(p => p.IsChecked).Select(p => p.Appointments).ToList();
                List<ObjectRent> objectRents = DBModel.GetContext().ObjectRent.ToList();
                List<Statement> statements = SelectionFiltersState.Where(p => p.IsChecked).Select(p => p.Statements).ToList();

                //Фильтрация
                if (!String.IsNullOrWhiteSpace(StartPrice))
                {
                    objectRents = objectRents.Where(p => p.PriceForOneMeter >= Convert.ToDecimal(StartPrice)).ToList();
                }

                if (!String.IsNullOrWhiteSpace(EndPrice))
                { 
                    objectRents = objectRents.Where(p => p.PriceForOneMeter <= Convert.ToDecimal(EndPrice)).ToList();
                }
                
                if(appointments.Count != 0) 
                {
                    objectRents = objectRents.Where(p => appointments.Contains(p.Appointment)).ToList();
                }

                if(statements.Count != 0)
                {
                    objectRents = objectRents.Where(p => statements.Contains(p.Statement)).ToList();
                }

                if (!String.IsNullOrWhiteSpace(StartSquare))
                {
                    objectRents = objectRents.Where(p => p.Square >= Convert.ToDouble(StartSquare)).ToList();
                }

                if (!String.IsNullOrWhiteSpace(EndSquare))
                {
                    objectRents = objectRents.Where(p => p.Square <= Convert.ToDouble(EndSquare)).ToList();
                }

                switch (selectedSortIndex) 
                {
                    case 0:
                        objectRents = objectRents.OrderBy(p => p.PriceForOneMeter).ToList();
                        break;
                    case 1:
                        objectRents = objectRents.OrderByDescending(p => p.PriceForOneMeter).ToList();
                        break;
                    case 2:
                        objectRents = objectRents.OrderBy(p => p.Square).ToList();
                        break;
                    case 3:
                        objectRents = objectRents.OrderByDescending(p => p.Square).ToList();
                        break;
                }

                if (IsCheking == true) 
                {
                    objectRents = objectRents.Where(p => p.Del == true).ToList();
                }

                if (IsCheking != true)
                {
                    objectRents = objectRents.Where(p => p.Del != true).ToList();
                }

                foreach(var objectRent in objectRents)
                {
                    ObjectRents.Add(objectRent);
                }
            }
            catch (Exception ex) 
            {
            }
        }

        public void Delete(ObjectRent objectRent) 
        {
            Objrent = objectRent;
            Objrent.Del = true;
            DBModel.GetContext().SaveChanges();
        }

        public bool CheckObjectRent(ObjectRent selectedObjectRent)
        {
            Objrent = selectedObjectRent;

            var r = DBModel.GetContext().Rent.Where(p => p.IdObjectRent == selectedObjectRent.Id && p.DateEnd > DateTime.Now).FirstOrDefault();

            if (r != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
