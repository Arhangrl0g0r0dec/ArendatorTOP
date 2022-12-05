﻿using ArendatorTOP.ViewModel;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ArendatorTOP.Pages
{
    /// <summary>
    /// Логика взаимодействия для Manager.xaml
    /// </summary>
    public partial class Manager : Page
    {
        MainWindow mainWindow;
        public Manager(MainWindow main)
        {
            InitializeComponent();
            mainWindow = main;
        }

        private void btnClient_Click(object sender, RoutedEventArgs e)
        {
            ContainerFrame.Navigate(new ClientsForEditPage(mainWindow));
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            mainWindow.Container.Navigate(new Autorisation(mainWindow));
        }

        private void btnObjectRent_Click(object sender, RoutedEventArgs e)
        {
            ContainerFrame.Navigate(new ObjectRents());
        }

        private void btnRent_Click(object sender, RoutedEventArgs e)
        {
            ContainerFrame.Navigate(new Reports());
        }
    }
}
