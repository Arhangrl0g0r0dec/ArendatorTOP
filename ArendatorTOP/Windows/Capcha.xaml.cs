﻿using ArendatorTOP.Pages;
using ArendatorTOP.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ArendatorTOP
{
    /// <summary>
    /// Логика взаимодействия для Capcha.xaml
    /// </summary>
    public partial class Capcha : Window
    {
        MainWindow mainWindow;
        public bool IsCapcha = false;
        public User user { get; set; }
        public Capcha(MainWindow Window, User AutoUser)
        {
            InitializeComponent();
            mainWindow = Window;
            user = AutoUser;
        }

        private void btnSend_Click(object sender, RoutedEventArgs e)
        {
            if ((DataContext as AutorizationViewModel).CheckCapcha(textBoxCapcha.Text))
            {
                if(user.Employee.Post.Id == 1)
                {
                    mainWindow.Container.Navigate(new Manager(mainWindow, user));
                    Close();
                }
                else if(user.Employee.Post.Id == 2) 
                {
                    mainWindow.Container.Navigate(new Director(mainWindow ,user));
                    Close();
                }
                else if (user.Employee.Post.Id == 3)
                {
                    mainWindow.Container.Navigate(new Operator(mainWindow, user));
                    Close();
                }
                else if (user.Employee.Post.Id == 4)
                {
                    mainWindow.Container.Navigate(new StorekeeperPage(mainWindow, user));
                    Close();
                }
            }
            else
            {
                MessageBox.Show("Неверный код!");
                textBoxCapcha.Text = "";
                (DataContext as AutorizationViewModel).GetCapcha();
            }
        }
    }
}
