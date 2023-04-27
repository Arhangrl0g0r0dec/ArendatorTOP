using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class MoreDetailsAboutObjectRentViewModel : ViewModelBase
    {
        public List<PhotoOR> Photos {get; set;}
        public int Id { get; set;}
        public MoreDetailsAboutObjectRentViewModel() 
        {
            Title = "Подробная информация о помещении";

            Photos = new List<PhotoOR>();
            Photos = DBModel.GetContext().PhotoOR.Where(p => p.IdObject == Id).ToList();
        }

        public void GetOR(int id) 
        {
            Id = id;
        }
    }
}
