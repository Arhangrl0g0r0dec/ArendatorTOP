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
    /// Логика взаимодействия для Reports.xaml
    /// </summary>
    public partial class Reports : Page
    {

        private DateTime dateStart;
        private DateTime dateEnd;
        public Reports()
        {
            InitializeComponent();
        }

        async void WordExport(string savePath, ReportObjectRentViewModel reportViewModel) 
        {
            
            
                await Task.Run(() =>
                {
                    Word.Application application = new Word.Application();

                    try
                    {
                        object missing = Type.Missing;
                        Word.Document document = application.Documents.Add(ref missing, ref missing, ref missing, ref missing);
                        Word.Paragraph paragraph = document.Paragraphs.Add(ref missing);
                        paragraph.Range.Text = $"Отчет c {dateStart.ToString("dd.MM.yyyy")} по {dateEnd.ToString("dd.MM.yyyy")}";
                        paragraph.Range.Font.Name = "Times New Roman";
                        paragraph.Range.Font.Size = 16;
                        paragraph.Range.Font.Bold = 1;
                        paragraph.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
                        paragraph.Range.InsertParagraphAfter();
                        //Таблица
                        paragraph.Range.Font.Size = 12;
                        paragraph.Range.Font.Bold = 0;
                        Word.Table table = document.Tables.Add(paragraph.Range, reportViewModel.ObjectRentTitle.Count + 1, 3, ref missing);
                        table.Borders.InsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;
                        table.Borders.OutsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;
                        //Шапка таблицы
                        table.Rows[1].Range.Font.Bold = 1;
                        table.Rows[1].Shading.BackgroundPatternColor = Word.WdColor.wdColorBlue;
                        table.Rows[1].Cells[1].Range.Text = "№";
                        table.Rows[1].Cells[2].Range.Text = "Тип помещения";
                        table.Rows[1].Cells[3].Range.Text = "Колличество аренд";

                        for (int i = 2; i <= table.Rows.Count; i++)
                        {
                            for (int j = 1; j <= table.Columns.Count; j++)
                            {
                                switch (j)
                                {
                                    case 1:
                                        table.Rows[i].Cells[j].Range.Text = (i - 1).ToString();
                                        break;
                                    case 2:
                                        table.Rows[i].Cells[j].Range.Text = reportViewModel.ObjectRentTitle[i - 2];
                                        break;
                                    case 3:
                                        table.Rows[i].Cells[j].Range.Text = reportViewModel.CountRents[i - 2].ToString();
                                        break;
                                }
                            }
                        }


                        //Диаграмма
                        paragraph.Range.InsertParagraphAfter();
                        Word.InlineShape inlineShape = document.InlineShapes.AddChart2(-1, Microsoft.Office.Core.XlChartType.xlPie, paragraph.Range, ref missing);
                        dynamic chartWb = inlineShape.Chart.ChartData.Workbook;
                        dynamic workSheet = chartWb.Sheets["Лист1"];
                        dynamic dataTable = workSheet.ListObjects["Таблица1"];
                        dataTable.DataBodyRange.ClearContents();
                        workSheet.Range["B1"].Value2 = "Аренда помещений";
                        for (int i = 0; i < reportViewModel.ObjectRentTitle.Count; i++)
                        {
                            workSheet.Range[$"A{i + 2}"].Value2 = reportViewModel.ObjectRentTitle[i];
                            workSheet.Range[$"B{i + 2}"].Value2 = reportViewModel.CountRents[i].ToString();
                        }
                        dataTable.Range.Resize(reportViewModel.ObjectRentTitle.Count + 1, 2);

                        //Информация о самом популярном объекте аренды
                        paragraph.Range.InsertParagraphAfter();
                        paragraph.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
                        paragraph.Range.Text = $"Самое поаулярное помещение: {reportViewModel.FullTitle} " +
                        $"(колличество аренд {reportViewModel.NoPopularObjectRent.Rent.Count})";

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
                    this.Dispatcher.Invoke(() =>
                    {
                        plug.Visibility = Visibility.Hidden;
                    });

                });
        }

        private void btnCreateReport_Click(object sender, RoutedEventArgs e)
        {
            if (DateStart.SelectedDate != null)
            {
                dateStart = DateStart.SelectedDate.Value.Date;
            }
            else
            {
                dateStart = DateTime.Now.Date;
            }

            if (DateEnd.SelectedDate != null)
            {
                dateEnd = DateEnd.SelectedDate.Value.Date;
            }
            else
            {
                dateEnd = DateTime.Now.Date;
            }

            if (dateStart > dateEnd)
            {
                MessageBox.Show("Данный диапазон дат невозможен!");
            }
            else
            {
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.Filter = "Doc Files (*.docx)|*.docx";
                if (saveFileDialog.ShowDialog() == true)
                {
                    WordExport(saveFileDialog.FileName, DataContext as ReportObjectRentViewModel);
                    plug.Visibility = Visibility.Visible;
                }
            }
            
        }
    }
}
