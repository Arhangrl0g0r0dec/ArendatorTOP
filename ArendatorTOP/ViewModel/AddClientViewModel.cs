using ArendatorTOP.Windows;
using BitMiracle.Docotic.Pdf;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Resources;

namespace ArendatorTOP.ViewModel
{
     class AddClientViewModel : ViewModelBase
    {
        public bool IsEdit { get; set; }
        public string FilePath { get; set; }
        public string Path { get; set; }
        public string FileName { get; set; }

        public const string PassportDir = "Архив/Документы клиента/Паспорт/";
        public const string CertificateDir = "Архив/Документы клиента/Свидетельства/";
        public const string AttorneyDir = "Архив/Документы клиента/Доверенности/";

        public string[] PathToFiles { get; set;}

        public AddClientViewModel()
        {
            PathToFiles = new string[3] { "", "", "" };
        }
        /// <summary>
        /// Открытие диалогового окна для выбора изображения, которое после будет передаваться на конвертацию в PDF-файл
        /// </summary>
        /// <param name="selectedButton">Выбранная кнопка, на основе которой программа понимает в какую папку сохранить файл</param>
        /// <returns></returns>
        public bool FileDialog(string selectedButton)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Фото| *png; *jpg; *gif;";
            ofd.InitialDirectory = "C:\\Users\\Arhangel0g0r0dec\\Arhangel0g0r0dec\\Desktop\\Архив для нужного хлама";
            ofd.ShowDialog();
            FilePath = ofd.FileName;
            FileName = ofd.SafeFileName;
            return ConverterToPDF(selectedButton, FilePath);
        }

        public bool ConverterToPDF(string selectedButton, string images)
        {
            using (PdfDocument pdf = new PdfDocument())
            {
                pdf.AddPage();

                PdfPage page = pdf.GetPage(0);

                string imagePath = images;

                if (String.IsNullOrEmpty(imagePath))
                {
                    return false;
                }
                else 
                {
                    PdfImage pdfImage = pdf.AddImage(imagePath);

                    page.Width = pdfImage.Width;

                    page.Height = pdfImage.Height;

                    page.Canvas.DrawImage(pdfImage, 0, 0);

                    string hashDate = DateTime.Now.Ticks.ToString();

                    if (selectedButton == "Фото паспорта")
                    {
                        Path = PassportDir + hashDate + ".pdf";
                        PathToFiles[0] = Path;
                    }
                    else if (selectedButton == "Фото свидетельтсва регистрации юр. лица")
                    {
                        Path = CertificateDir + hashDate + ".pdf";
                        PathToFiles[1] = Path;
                    }
                    else if (selectedButton == "Фото свидетельства подтверждающего полномочия руководителя")
                    {
                        Path = AttorneyDir + hashDate + ".pdf";
                        PathToFiles[2] = Path;
                    }

                    pdf.Save(Path);

                    if (!File.Exists(Path))
                    {
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }
            }
        }

        public string GetPath(int i) 
        {
            return PathToFiles[i];
        }
        
        /// <summary>
        /// В данный момент этот метод не испоьзуется, его суть заключается в получении хеша от зрначения времени сохранения файла
        /// </summary>
        /// <param name="value">Параметр для получения данных о времени сохранения, который преобразуется в уникальное значение имени</param>
        /// <returns></returns>
        public static String GetSha256Hash(string value)
        {
            using(SHA256 sha256 = SHA256.Create())
            {
                return String.Concat(sha256.ComputeHash(Encoding.UTF8.GetBytes(value)).Select(p=>p.ToString("x2")));
            }
        }

        public void AddClient(Client client)
        {
            try
            {
                DBModel.GetContext().Client.Add(client);
                DBModel.GetContext().SaveChanges();
            }
            catch (Exception ex) 
            { 
            }
        }

        public void EditClient(Client client)
        {
            try
            {
                DBModel.GetContext().SaveChanges();
            }
            catch (Exception ex)
            {
            }
        }
    }
}
