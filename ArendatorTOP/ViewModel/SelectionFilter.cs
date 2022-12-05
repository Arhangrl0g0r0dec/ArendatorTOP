using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class SelectionFilter : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public void PropertyChange(string propertyName) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        public Appointment Appointments { get; set; }
        public Statement Statements { get; set; }
        public Floor Floor { get; set; }

        public bool _isChecked = false;
        public bool IsChecked 
        {
            get => _isChecked;
            set 
            {
                if (_isChecked != value) 
                {
                    _isChecked = value;
                    PropertyChange("IsChecked");
                }
            }
        }
    }
}
