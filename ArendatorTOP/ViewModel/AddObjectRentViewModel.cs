using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class AddObjectRentViewModel : ViewModelBase
    {

        public ObjectRent ObjectRent;
        public List<Appointment> Appointments { get; set; } = new List<Appointment>();
        public List<Statement> Statements { get; set; } = new List<Statement>();
        /// <summary>
        /// Коллекция фото помещения для привязки в xaml
        /// </summary>
        public ObservableCollection<PhotoOR> photoORs { get; set; } = new ObservableCollection<PhotoOR>();
        /// <summary>
        /// Список фото помещения, которые были добавлены, но не сохранены
        /// </summary>
        List<PhotoOR> newPhoto { get; set; } = new List<PhotoOR>();
        /// <summary>
        /// Список фото помещений, которые будут перенесены в photoORs
        /// </summary>
        List<PhotoOR> photos = new List<PhotoOR>();

        public AddObjectRentViewModel() 
        {
            Title = "Редактирование объекта аренды";
            GetAppointment();
        }
        
        public List<Appointment> GetAppointment()
        {
            Appointments = DBModel.GetContext().Appointment.ToList();
            return Appointments;
        }

        public List<Statement> GetStaitment()
        {
            Statements = DBModel.GetContext().Statement.ToList();
            return Statements;
        }

        public void GetObjectRentInfo(ObjectRent objectRent)
        {
            ObjectRent = objectRent;
            photoORs.Clear();
            photos = DBModel.GetContext().PhotoOR.Where(p => p.IdObject == objectRent.Id).ToList();

            foreach (PhotoOR photo in photos)
            {
                photoORs.Add(photo);
            }
        }

        public void CreateObjectRent()
        {
            ObjectRent or = new ObjectRent() 
            {
                
            };
        }

        public void AddObjectRentPhoto(string imagePath) 
        {
                PhotoOR photoOR = new PhotoOR()
                {
                    IdObject = ObjectRent.Id,
                    Path = imagePath
                };
                photoORs.Add(photoOR);
                newPhoto.Add(photoOR);
                DBModel.GetContext().PhotoOR.AddRange(newPhoto);
        }

        public void RemovePhoto(PhotoOR photoOR) 
        {
            photoORs.Remove(photoOR);
            newPhoto.Remove(photoOR);
            DBModel.GetContext().PhotoOR.Remove(photoOR);
        }

        public bool Save(Statement statement, Appointment appointment, decimal price)
        {
            try
            {
                ObjectRent.Statement = statement;
                ObjectRent.Appointment = appointment;
                ObjectRent.PriceForOneMeter = price;
                DBModel.GetContext().SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}
