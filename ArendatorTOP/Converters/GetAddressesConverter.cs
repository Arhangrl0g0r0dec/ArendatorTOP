using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace ArendatorTOP.Converters
{
    class GetAddressesConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            ICollection<Client> clients = value as ICollection<Client>;
            return string.Join(" ",clients.Select(p => p.Street + " " + p.Home + " " + p.Floor + " " + p.Office + " " + p.Domophone));
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
