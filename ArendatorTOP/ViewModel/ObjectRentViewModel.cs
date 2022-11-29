using ArendatorTOP.Interfaces;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ArendatorTOP.ViewModel
{
    class ObjectRentViewModel : ViewModelBase, IMessageShow
    {
        private decimal startPr;
        private decimal endPr;
        public int id { get; set; }
        public PhotoOR Photo { get; set; }
        public List<PhotoOR> photoList { get; set; }
        public ObjectRentViewModel() 
        {
            Title = "Помещения";
            ObjectRentList();
        }

        public List<string> TitleAppointment;
        public ObservableCollection <Appointment>  appointments { get; set; }
        public List<ObjectRent> objectRents { get; set; }

        public void ObjectRentList()
        {
            try
            {
                objectRents = DBModel.GetContext().ObjectRent.ToList();
                filterObjectRent = objectRents;
            }
            catch (Exception ex) 
            {
                ShowMessage($"Ошибка! {ex}");
            }
        }

        public List<ObjectRent> FilterAppointments(string selectedAppointment) 
        {
            //Фильтрация по назанчению
            ObjectRentList();

            objectRents = objectRents.Where(p => p.Appointment.Title == selectedAppointment).ToList();
            if (objectRents != null)
            {
                return objectRents;
            }
            else
            {
                return null;
            }
        }
        //Поменять в классе формы decimal на string!!!

        private List<ObjectRent> filterObjectRent;
        public List<ObjectRent> FiltrationPrice(string startPrice, string endPrice)
        {
            filterObjectRent = objectRents;
            //Фильтрация по цене
            if (!String.IsNullOrWhiteSpace(endPrice.ToString()))
            {
                endPr = Convert.ToDecimal(endPrice);
                filterObjectRent = filterObjectRent.Where(p => p.PriceForOneMeter <= endPr).ToList();
            }
           
            if (!String.IsNullOrWhiteSpace(startPrice.ToString()))
            {
                startPr = Convert.ToDecimal(startPrice);
                filterObjectRent = filterObjectRent.Where(p => p.PriceForOneMeter >= startPr).ToList();
            }

            if (filterObjectRent != null)
            {
                return filterObjectRent;
            }
            else
            {
                return null;
            }
        }

        public List<ObjectRent> FiltrationStatus(bool statusAll, bool statusFree, bool statusBusy)
        {
            if(statusAll)
            {
                return filterObjectRent;
            }
            else if(statusFree)
            {
                //var rent = DBModel.GetContext().Rent;
                return filterObjectRent;
            }
            else if(statusBusy) 
            {
                return filterObjectRent.Where(p => p.Rent.Select(r => r.IdObjectRent) != null).ToList();
            }
            return filterObjectRent;
        }



        public List<string> GetAppointment() 
        {
            TitleAppointment = DBModel.GetContext().Appointment.Select(p => p.Title).ToList();
            return TitleAppointment;
        }

        public void GetImage()
        {
            var Objects = DBModel.GetContext().ObjectRent.ToList();
            photoList = DBModel.GetContext().PhotoOR.ToList();

            string[] ImagesOfOR = new string[] { };

            List<int> indexObjects = new List<int> { };

            foreach (var obj in Objects)
            {
                indexObjects.Add(obj.Id);
            }

            for (int i = 0; i <= indexObjects.Count; i++)
            {
                Photo = (PhotoOR)DBModel.GetContext().PhotoOR.Select(p => p.IdObject == indexObjects[i]);
                photoList.Add(Photo);
            }
        }
        
        public void MyPhoto(string btnNext, string btnLast) 
        {
            if(btnNext == "") 
            {
                id++;
                if (id < 1) 
                {
                    id = 6;
                }
            }
        }

        public string ShowMessage(string message)
        {
            return message;
        }
    }
}
