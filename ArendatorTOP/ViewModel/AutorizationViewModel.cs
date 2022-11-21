using ArendatorTOP.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.TextFormatting;

namespace ArendatorTOP.ViewModel
{
    class AutorizationViewModel : ViewModelBase
    {
        public static User user { get; set; }
        public string Login { get; set; }
        private string _code;
        public string Code 
        {
            get => _code;
            private set
            {
                if(_code != value)
                {
                    _code = value;
                    PropertyChange();
                }
            }
        }
        public bool IsCapcha { get; set; }

        public AutorizationViewModel() 
        {
        }
        public IGettingPassword GettingPassword { private get; set; }
        private string Password 
        {
            get => GettingPassword.GetPassword();
        }

        public bool LogIn()
        {
            try
            {
                user = DBModel.GetContext().User.FirstOrDefault(p => p.Login == Login && p.Password == Password);
            }
            catch (Exception ex)
            {
            }
            return user != null;
        }

        public string GetCapcha() 
        {
            Random random = new Random(); // Random для генерации случайных чисел

            /*
                Enumerable.Range позволяет получить диапазон чисел. Первый параметр - начально значение диапазона. Второй параметр - количество элементов.
                Так, если мы первым параметром укажем число 1, а вторым - 10, то получим колелкцию {1,2,3,4,5,6,7,8,9,10}
                В данном код используется автоматическое преведение символов к числовому типу по кодировке UFT-8. Так, знак '!' имеет числовое значение 33, 
                а знак '/' - 47.
                С помощью метода Select и лябда выражения приводим числовое значение к типу char. Таким образом, получаем коллекцию(массив) символов.
            */
            char[] specChars = Enumerable.Range('!', '/' - '!' + 1).Select(p => (char)p).ToArray(); // Массив специальных символов.
            char[] numberChars = Enumerable.Range('0', '9' - '0' + 1).Select(p => (char)p).ToArray(); // Массив цифр.
            var letterChars = Enumerable.Range('A', 'Z' - 'A' + 1).Select(p => (char)p).ToList(); //Коллекция латиницы.
            letterChars.AddRange(Enumerable.Range('a', 'z' - 'a' + 1).Select(p => (char)p)); //Дополняем нижним регистром.
            /*
                Enumerable.Repeat создаем последовательности из одинаковых элементов. Первый параметр - элементов, второй параметр - количество повторений.
                С помощью Select вытаскиваем из каждой копии вытаскиваем случаынй символ
             */
            string str = new string(Enumerable.Repeat(letterChars, 6).Select(p => p[random.Next(p.Count)]).ToArray()); //Получаем строку из 6 латинских букв
            str += specChars[random.Next(specChars.Length)]; // Седьмой символ - спец. символ.
            str += numberChars[random.Next(numberChars.Length)]; // Восьмой символ - цифра.
            Code = str;
            return Code;
        }

        public bool CheckCapcha(string _code) 
        {
            if (Code == _code)
                IsCapcha = true;
            else
                IsCapcha = false;
            return IsCapcha;
        }
    }
}
