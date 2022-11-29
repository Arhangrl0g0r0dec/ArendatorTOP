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
        public string FilePath { get; set; }
        public string Path { get; set; }
        public string FileName { get; set; }

        public const string PassportDir = "Архив/Документы клиента/Паспорт/";
        public const string CertificateDir = "Архив/Документы клиента/Свидетельства/";
        public const string AttorneyDir = "Архив/Документы клиента/Доверенности/";
        public AddClientViewModel() 
        {
            Title = "Добавление клиента";
        }
        /// <summary>
        /// Сделать сохранение файла в формате pdf по указанному пути
        /// </summary>
        /// <returns></returns>
        public bool FileDialog(string selectedButton)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Фото| *png; *jpg; *gif;";
            ofd.InitialDirectory = "C:\\Users\\Arhangel0g0r0dec\\Arhangel0g0r0dec\\Desktop\\Архив для нужного хлама";
            ofd.ShowDialog();
            FilePath = ofd.FileName;
            FileName = ofd.SafeFileName;
            return ConverterToPDF(selectedButton, FilePath, FileName);
        }

        /// <summary>
        /// Метод конвертации изображения документа в PDF-file
        /// необходимо додумать проверку на событие когда файл не был выбран
        /// </summary>
        /// <param name="selectedButton"></param>
        /// <param name="images"></param>
        /// <param name="pdfName"></param>
        /// <returns></returns>
        /// 

        public bool ConverterToPDF(string selectedButton, string images, string pdfName)
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
                    }
                    else if (selectedButton == "Фото свидетельтсва регистрации юр. лица")
                    {
                        Path = CertificateDir + hashDate + ".pdf";
                    }
                    else if (selectedButton == "Фото свидетельства подтверждающего полномочия руководителя")
                    {
                        Path = AttorneyDir + hashDate + ".pdf";
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

        public string GetPath() 
        {
            return Path;
        }

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
    }
}
