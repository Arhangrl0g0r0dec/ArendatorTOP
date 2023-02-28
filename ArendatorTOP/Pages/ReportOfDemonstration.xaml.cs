using ArendatorTOP.ViewModel;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
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
using Word = Microsoft.Office.Interop.Word;

namespace ArendatorTOP.Pages
{
    /// <summary>
    /// Логика взаимодействия для ReportOfDemonstration.xaml
    /// </summary>
    public partial class ReportOfDemonstration : Page
    {
        DateTime dateStart { get; set; }
        public ReportOfDemonstration()
        {
            InitializeComponent();
            dataDemonstrations.ItemsSource = (DataContext as ReportDemonstrationViewModel).GetListDemonstrations(DateTime.Now);
        }

        private void btnCreateReport_Click(object sender, RoutedEventArgs e)
        {
            plug.Visibility = Visibility.Visible;
            if (DateStart.SelectedDate != null)
            {
                dateStart = DateStart.SelectedDate.Value.Date;
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.Filter = "Doc Files (*.docx)|*.docx";
                if (saveFileDialog.ShowDialog() == true)
                {
                    WordExport(saveFileDialog.FileName, DataContext as ReportDemonstrationViewModel);
                    plug.Visibility = Visibility.Visible;
                }
            }
            else
            {
                dateStart = DateTime.Now.Date;
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.Filter = "Doc Files (*.docx)|*.docx";
                if (saveFileDialog.ShowDialog() == true)
                {
                    WordExport(saveFileDialog.FileName, DataContext as ReportDemonstrationViewModel);
                }
            }
            plug.Visibility = Visibility.Hidden;
        }

        private void WordExport(string savePath, ReportDemonstrationViewModel reportViewModel)
        {
            
            Word.Application application = new Word.Application();
            
            try
            {
                object missing = Type.Missing;
                Word.Document document = application.Documents.Add(ref missing, ref missing, ref missing, ref missing);
                Word.Paragraph paragraph = document.Paragraphs.Add(ref missing);
                paragraph.Range.Text = $"Отчет на {DateStart.SelectedDate.Value.ToShortDateString()}";
                paragraph.Range.Font.Name = "Times New Roman";
                paragraph.Range.Font.Size = 16;
                paragraph.Range.Font.Bold = 1;
                paragraph.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
                paragraph.Range.InsertParagraphAfter();
                //Таблица
                paragraph.Range.Font.Size = 12;
                paragraph.Range.Font.Bold = 0;
                Word.Table table = document.Tables.Add(paragraph.Range, reportViewModel.Demonstrations.Count + 1, 5, ref missing);
                table.Borders.InsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;
                table.Borders.OutsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;
                //Шапка таблицы
                table.Rows[1].Range.Font.Bold = 1;
                table.Rows[1].Shading.BackgroundPatternColor = Word.WdColor.wdColorBlue;
                table.Rows[1].Cells[1].Range.Text = "№";
                table.Rows[1].Cells[2].Range.Text = "Менеджер";
                table.Rows[1].Cells[3].Range.Text = "Помещение";
                table.Rows[1].Cells[4].Range.Text = "Дата демонстрации";
                table.Rows[1].Cells[5].Range.Text = "Время демонстрации";

                for (int i = 2; i <= table.Rows.Count; i++)
                {
                    for (int j = 1; j <= table.Columns.Count; j++)
                    {
                        switch (j)
                        {
                            case 1:
                                table.Rows[i].Cells[j].Range.Text = reportViewModel.DemonstrationsId[i - 2].ToString();
                                break;
                            case 2:
                                table.Rows[i].Cells[j].Range.Text = reportViewModel.ManagersOfDemonstrations[i - 2];
                                break;
                            case 3:
                                table.Rows[i].Cells[j].Range.Text = reportViewModel.ObjectRents[i - 2].ToString();
                                break;
                            case 4:
                                table.Rows[i].Cells[j].Range.Text = reportViewModel.DateTimesDemonstrations[i - 2].ToString();
                                break;
                            case 5:
                                table.Rows[i].Cells[j].Range.Text = reportViewModel.TimeSpansDemonstrations[i - 2].ToString();
                                break;
                        }
                    }
                }

                //Сохранение
                document.SaveAs2(savePath, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing, missing
                    , missing, missing, missing, missing, missing);
                document.Close(null, null, null);
                application.Quit(null, null, null);
                MessageBox.Show("Отчет сохранен успешно!");
            }
            catch
            {
                this.Dispatcher.Invoke(() =>
                {
                    MessageBox.Show("Ошибка!");
                });
                application.Quit(null, null, null);
            }
        }

        private void DateStart_CalendarClosed(object sender, RoutedEventArgs e)
        {
            dateStart = DateStart.SelectedDate.Value;
            dataDemonstrations.ItemsSource = (DataContext as ReportDemonstrationViewModel).GetListDemonstrations(dateStart);
        }
    }
}
