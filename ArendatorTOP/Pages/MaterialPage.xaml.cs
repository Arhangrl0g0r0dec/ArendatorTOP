using ArendatorTOP.ViewModel;
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
    /// Логика взаимодействия для MaterialPage.xaml
    /// </summary>
    public partial class MaterialPage : Page
    {
        public MaterialPage()
        {
            InitializeComponent();
            dataMaterials.ItemsSource = (DataContext as MaterialViewModel).UpdateMaterialsList();
            comboTypeMaaterial.ItemsSource = (DataContext as MaterialViewModel).GetOfMaterials();
        }

        private void txtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            dataMaterials.ItemsSource = (DataContext as MaterialViewModel).UpdateMaterialsList();
        }

        private void comboTypeMaaterial_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            dataMaterials.ItemsSource = (DataContext as MaterialViewModel).UpdateMaterialsList();
        }
    }
}
