using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace ArendatorTOP.Converters
{
    internal class FraqilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            Materials Fraqility = value as Materials;
            if ((bool)Fraqility.Fragility)
            {
                return "Хрупкий";
            }
            else 
            {
                return "Не хрупкий";
            }

        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
