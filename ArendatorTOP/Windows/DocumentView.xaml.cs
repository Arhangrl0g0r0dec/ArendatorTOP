using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ArendatorTOP.Windows
{
    /// <summary>
    /// Логика взаимодействия для DocumentView.xaml
    /// </summary>
    public partial class DocumentView : Window
    {
        public DocumentView(string path)
        {
            InitializeComponent();
            try
            {
                using (FileStream fs = File.Open(path, FileMode.Open))
                {
                   FlowDocument flowDocument = XamlReader.Load(fs) as FlowDocument;
                   docReader.Document = flowDocument;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка!" + ex.ToString());
            }
            
        }
    }
}
