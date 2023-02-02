using ArendatorTOP.ViewModel;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Windows.Media.Imaging;

namespace ArendatorTOP.Converters
{
    internal class RelativeToFullPathConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string path = value as string;
            if (String.IsNullOrWhiteSpace(path)) return "/Resource/Images/no_foto.jpg";
            try 
            {
                if (!File.Exists(path))
                    return "\\Resource\\Images\\no_foto.jpg";
                else
                    return Path.GetFullPath(path);
            }
            catch 
            {
                return "\\Resource\\Images\\no_foto.jpg";
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
