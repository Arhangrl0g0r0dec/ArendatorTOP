using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ArendatorTOP.Pages
{
    /// <summary>
    /// Логика взаимодействия для Plan.xaml
    /// </summary>
    public partial class Plan : Page
    {

        double scaleMinX { get; set; }
        double scaleMinY { get; set; }

        public Plan()
        {
            InitializeComponent();

            scaleMinX = st.ScaleX;
            scaleMinY = st.ScaleY;
        }

        private void CanvasPlan_MouseWheel(object sender, MouseWheelEventArgs e)
        {
            Double coordinate_X = (e.GetPosition(CanvasPlan).X);
            Double coordinate_Y = (e.GetPosition(CanvasPlan).Y);

            st.CenterX = coordinate_X;
            st.CenterY = coordinate_Y;

            if (e.Delta > 0)
            {
                st.ScaleX *= 1.01;
            }

            if (e.Delta < 0)
            {
                st.ScaleX /= 1.01;
            }

            if(st.ScaleX <= scaleMinX) 
            {
                st.ScaleX = scaleMinX;
                st.ScaleY = st.ScaleX;
            }
            else if(st.ScaleX >= scaleMinX) 
            {
                st.ScaleY = st.ScaleX;
            }
        }

        private void test_MouseLeave(object sender, MouseEventArgs e)
        {

        }

        private void test_MouseMove(object sender, MouseEventArgs e)
        {

        }
    }
}
