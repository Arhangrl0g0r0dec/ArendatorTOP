using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace wcf_chat
{
    // ПРИМЕЧАНИЕ. Можно использовать команду "Переименовать" в меню "Рефакторинг", чтобы изменить имя интерфейса "IServiceChat" в коде и файле конфигурации.
    /// <summary>
    /// Интерфейс определяющий работу чата
    /// </summary>
    [ServiceContract(CallbackContract = typeof(IServerChatCallback))]
    public interface IServiceChat
    {
        [OperationContract]
        int Connect(string Name);

        [OperationContract]
        void Disconnect(int id);
        [OperationContract(IsOneWay = true)]
        void SendMessage(string msg, int Id);
    }
    /// <summary>
    /// Интерфейс определяющий метод обмена сообщениями
    /// </summary>
    public interface IServerChatCallback
    {
        [OperationContract(IsOneWay = true)]
        void MsgCallback(string msg);
    }
}
