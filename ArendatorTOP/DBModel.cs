using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP
{
    class DBModel
    {
        private static ArendatorTOPEntities _context;

        public static ArendatorTOPEntities GetContext() 
        {
            if(_context == null) 
            {
                _context = new ArendatorTOPEntities();
            }
            return _context;
        }
    }
}
