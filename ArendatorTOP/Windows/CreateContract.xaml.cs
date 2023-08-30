using ArendatorTOP.Pages;
using ArendatorTOP.ViewModel;
using Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Packaging;
using System.Linq;
using System.Reflection;
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
using System.Windows.Xps.Packaging;
using System.Windows.Xps.Serialization;

namespace ArendatorTOP.Windows
{
    /// <summary>
    /// Логика взаимодействия для CreateContract.xaml
    /// </summary>
    public partial class CreateContract : System.Windows.Window
    {
        /// <summary>
        /// Окно формирования контракта, здесь пока что формируется xaml документ, необходимо преобразовать его в pdf файл и сохранять по определенному пути, также должна быть возможность печати файла!!!
        /// </summary>
        RentsPage RentsPage;
        Rent Rent;
        public CreateContract(Rent rent, RentsPage rentsPage)
        {
            InitializeComponent();
            RentsPage = rentsPage;
            Rent = rent;
            (DataContext as CreateContractViewModel).Rent = Rent;
            (DataContext as CreateContractViewModel).AddInfomation();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            string path = (DataContext as CreateContractViewModel).CreateContract(Rent);

            using (FileStream fs = File.Open(path, FileMode.Create))
            {
                if (docReader.Document != null && docReaderAct.Document != null)
                {
                    XamlWriter.Save(docReader.Document, fs);
                    MessageBox.Show("Аренда, договор и акт сохранены успешно.");
                }
            }
            RentsPage.DataRents.ItemsSource = DBModel.GetContext().Rent.ToList();
        }

        private void docReader_Loaded(object sender, RoutedEventArgs e)
        {
            
        }
    }
}
