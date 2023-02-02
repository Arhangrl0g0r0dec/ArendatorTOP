using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class DemonstrationViewModel : ViewModelBase
    {
        Demonstration ForAddDemonstration { get; set; }
        Demonstration Last = new Demonstration();
        public List<Demonstration> demonstrations = new List<Demonstration>();

        public DemonstrationViewModel() 
        {
            Title = "Демонстрации";
        }
        /// <summary>
        /// Данный метод отвечает за дополнение БД новыми записями
        /// </summary>
        /// Данная переменная получает необходимое количество дней для соблюдеия обязательного разрыва 7 дней от сегодняшней даты
        /// <returns>Возвращает отсортированный список демонстраций</returns>
        public List<Demonstration> UpdateDemonstration() 
        {
            demonstrations = DBModel.GetContext().Demonstration.ToList();

            Last = (Demonstration)demonstrations.OrderByDescending(p => p.DateOfDemonstration).OrderByDescending(e => e.TimeOfDemonstration).FirstOrDefault();
            
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
            DBModel.GetContext().SaveChanges();

            //После здесь список демонстраций сортируется по убыванию даты демонстрации
            return DBModel.GetContext().Demonstration.OrderByDescending(p => p.DateOfDemonstration).ToList();
        }
        
    }
}
