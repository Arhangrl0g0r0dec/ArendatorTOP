using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;

namespace ArendatorTOP.ViewModel
{
    class DemonstrationViewModel : ViewModelBase
    {
        Demonstration ForAddDemonstration { get; set; }

        Demonstration Last = new Demonstration();
        public DateTime DateStart { get; set; }
        public DateTime DateEnd { get; set; }
        public string SearchText { get; set; }
        public bool IsCheckingFree;
        public bool IsCheckingBusy;
        public List<Demonstration> demonstrations = new List<Demonstration>();
        public List<Demonstration> Demonstrations = new List<Demonstration>();

        public DemonstrationViewModel()
        {
            Title = "Демонстрации";

            GetDateStart();

            GetDateEnd();
        }
        /// <summary>
        /// Данный метод отвечает за дополнение БД новыми записями
        /// </summary>
        /// Данная переменная получает необходимое количество дней для соблюдеия обязательного разрыва 7 дней от сегодняшней даты
        /// <returns>Возвращает отсортированный список демонстраций</returns>

        public DateTime GetDateStart()
        {
            return DateStart = DBModel.GetContext().Demonstration.Select(n => n.DateOfDemonstration).FirstOrDefault();
        }

        public DateTime GetDateEnd()
        {
            Demonstration demonstration = new Demonstration();

            demonstration = DBModel.GetContext().Demonstration.OrderByDescending(p => p.DateOfDemonstration).FirstOrDefault();

            return DateEnd = demonstration.DateOfDemonstration;
        }

        public List<Demonstration> UpdateDemonstration()
        {
            Demonstrations.Clear();

            Last = DBModel.GetContext().Demonstration.OrderByDescending(p => p.DateOfDemonstration).FirstOrDefault();

            int CountDay = 7 - (Last.DateOfDemonstration.DayOfYear - DateTime.Now.DayOfYear);

            //цикл перебирает все дни в зависимости от
            ///<param name="CountDay"></param>
            ///После каждый день заполняется отдельным временем, в новый экземпляр демонстраций добавляется дата одним свойством и время другим
            for (int i = CountDay; i > 0; i--)
            {
                for (int j = 12; j <= 17; j++)
                {
                    ForAddDemonstration = new Demonstration();
                    ForAddDemonstration.DateOfDemonstration = Last.DateOfDemonstration.AddDays(i);
                    ForAddDemonstration.DateOfDemonstration.ToShortDateString();
                    ForAddDemonstration.TimeOfDemonstration = new TimeSpan(j, 00, 00);
                    ForAddDemonstration.IsOccupied = false;
                    demonstrations.Add(ForAddDemonstration);
                }
            }

            DBModel.GetContext().Demonstration.AddRange(demonstrations);
            DBModel.GetContext().Demonstration.AddOrUpdate();
            DBModel.GetContext().SaveChanges();

            Demonstrations = DBModel.GetContext().Demonstration.ToList();

            if (IsCheckingBusy == true)
            {
                IsCheckingFree = false;
                Demonstrations = Demonstrations.Where(p => p.IsOccupied == true).ToList();
            }

            if (IsCheckingFree == true)
            {
                IsCheckingBusy = false;
                Demonstrations = Demonstrations.Where(p => p.IsOccupied == false).ToList();
            }

            if (DateStart.Date != null)
            {
                Demonstrations = Demonstrations.Where(p => p.DateOfDemonstration >= DateStart).ToList();
            }

            if (DateEnd.Date != null)
            {
                Demonstrations = Demonstrations.Where(p => p.DateOfDemonstration <= DateEnd).ToList();
            }

            foreach (var demonstration in Demonstrations.Where(n => n.IsOccupied == true))
            {
                demonstration.Name = demonstration.Client.Name;
                demonstration.Surname = demonstration.Client.Surname;
                demonstration.Patronimic = demonstration.Client.Patronimic;
                demonstration.PhoneNumber = demonstration.Client.PhoneNumber;
            }

            if (!String.IsNullOrEmpty(SearchText))
            {
                Demonstrations = (List<Demonstration>)Demonstrations.Where(n => n.IsOccupied == true).Where
                (p => p.Client.OGRN.ToLower().Contains(SearchText.ToLower())
                || p.Client.INN.ToLower().Contains(SearchText.ToLower())
                || p.Name.ToLower().Contains(SearchText.ToLower())
                || p.Surname.ToLower().Contains(SearchText.ToLower())
                || p.Patronimic.ToLower().Contains(SearchText.ToLower())
                || p.Client.Street.ToLower().Contains(SearchText.ToLower())
                || p.Client.Home.ToLower().Contains(SearchText.ToLower())
                || p.PhoneNumber.ToLower().Contains(SearchText.ToLower())
                || p.Client.KPP.ToLower().ToLower().Contains(SearchText.ToLower())).ToList();
            }

            Demonstrations = Demonstrations.OrderByDescending(p => p.DateOfDemonstration).ToList();//После здесь список демонстраций сортируется по убыванию даты демонстрации

            return Demonstrations;
        }
    }
}
