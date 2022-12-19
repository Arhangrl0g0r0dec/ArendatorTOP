using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP
{
    /// <summary>
    /// Класс для удлбства фильтрации помещений по этажам
    /// </summary>
    class Floor
    {
        public int floor { get; set; }

        public Floor(int floor)
        {
            this.floor = floor;
        }
    }
}
