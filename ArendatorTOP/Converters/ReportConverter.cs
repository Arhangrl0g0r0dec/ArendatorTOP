using LiveCharts;
using LiveCharts.Wpf;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace ArendatorTOP.Converters
{
    class ReportConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            List<int> id = values[0] as List<int>;
            List<double> rents = values[1] as List<double>;
            List<string> ObjectRentTitle = values[2] as List<string>;
            if (id == null || rents == null || ObjectRentTitle == null) return null;

            SeriesCollection series = new SeriesCollection();
            for (int i = 0; i < rents.Count; i++)
            {
                series.Add(new PieSeries { Title = id[i].ToString() + " " + ObjectRentTitle[i], Values = new ChartValues<double> { rents[i] } });
            }
            return series;
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
