using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace wcf_chat
{
    // ПРИМЕЧАНИЕ. Команду "Переименовать" в меню "Рефакторинг" можно использовать для одновременного изменения имени класса "ServiceChat" в коде и файле конфигурации.
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.Single)]
    public class ServiceChat : IServiceChat
    {/// <summary>
    /// Список клиентов в приложении
    /// </summary>
        List<ServerUser> users = new List<ServerUser>();
        /// <summary>
        /// Метод определяющий подключение к серверу клиента
        /// </summary>
        /// <param name="name">Имя Клиента</param>
        /// <returns></returns>
        public void Connect(string name, int Id)
        {
            
            ServerUser serverUser = new ServerUser()
            {
                Id = Id,
                Name = name,
                OperationContext = OperationContext.Current
            };
            users.Add(serverUser);
        }
        /// <summary>
        /// Метод отключения клиента от сервера
        /// </summary>
        /// <param name="id">номер клиента</param>
        public void Disconnect(int id)
        {
            var user = users.FirstOrDefault(i => i.Id == id);
            if (user != null)
            {
                users.Remove(user);
            }
        }

        /// <summary>
        /// метод осуществляющий отправку сообщения
        /// содержит в себе метод, определяющий обмен сообщениями
        /// </summary>
        /// <param name="msg">содержимое сообщения</param>
        /// <param name="id">номер клиента</param>
        public void SendMessage(string msg, int id)
        {
            foreach (var item in users)
            {
                string answer = DateTime.Now.ToShortTimeString();
                var user = users.FirstOrDefault(i => i.Id == id);
                if (user != null)
                {
                    answer += " : " + user.Name + "| ";
                }
                answer += msg;

                item.OperationContext.GetCallbackChannel<IServerChatCallback>().MsgCallback(answer);
            }
        }
    }
}
