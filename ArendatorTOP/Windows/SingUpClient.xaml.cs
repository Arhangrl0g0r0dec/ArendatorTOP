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

namespace ArendatorTOP.Windows
{
    /// <summary>
    /// Логика взаимодействия для SingUpClient.xaml
    /// </summary>
    public partial class SingUpClient : Window
    {
        ObjectRent objectRent;
        Client client;
        User User;
        DemonstrationPage demonstrationPage;
        Manager Managers;
        Demonstration demonstration;
        public SingUpClient(Demonstration SelectedDemonstration, User user, DemonstrationPage demonstrationPages, Manager manager)
        {
            InitializeComponent();
            demonstration = SelectedDemonstration;
            demonstrationPage = demonstrationPages;
            if ((bool)SelectedDemonstration.IsOccupied)
            {
                textSecTitle.Text = "Редактирование записи";
                nameText.Text = SelectedDemonstration.Name;
                surnameText.Text = SelectedDemonstration.Surname;
                Patronimic.Text = SelectedDemonstration.Patronimic;
                PhoneNumberText.Text = SelectedDemonstration.PhoneNumber;
                ObjectRentText.Text =  "№" + SelectedDemonstration.IdObjectRent + " " + SelectedDemonstration.ObjectRent.Appointment.Title;
                listBoxClients.SelectedItem = SelectedDemonstration.Client;
                listBoxOR.SelectedItem= SelectedDemonstration.ObjectRent;
            }
            else 
            {
                textSecTitle.Text = "Создание записи";
            }
            User = user;
            Managers = manager;
            DateTimeStart.Text = (DataContext as AddDemonstrationViewModel).GetDemonstrationDateTime(SelectedDemonstration);
            listBoxClients.ItemsSource = (DataContext as AddDemonstrationViewModel).UpdateClientList();
            listBoxOR.ItemsSource = (DataContext as AddDemonstrationViewModel).UpdateObjectRentList();
            listBoxObjectsRent.ItemsSource = (DataContext as AddDemonstrationViewModel).UpdateObjectRentList();
        }

        private void appointmentBox_Checked(object sender, RoutedEventArgs e)
        {
            (DataContext as AddDemonstrationViewModel).UpdateObjectRentList();
        }

        private void appointmentBox_Unchecked(object sender, RoutedEventArgs e)
        {
            (DataContext as AddDemonstrationViewModel).UpdateObjectRentList();
        }

        private void listBoxClients_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            client = (Client)listBoxClients.SelectedItem;
            if(client != null) 
            {
                nameText.Text = (DataContext as AddDemonstrationViewModel).GetClientName(client);
                surnameText.Text = (DataContext as AddDemonstrationViewModel).GetClientSurname(client);
                Patronimic.Text = (DataContext as AddDemonstrationViewModel).GetClientPatronimic(client);
                PhoneNumberText.Text = (DataContext as AddDemonstrationViewModel).GetClientPhoneNumber(client);
            }
            else 
            {
                MessageBox.Show("Вы не выбрали клиента!");
            }
        }

        private void listBoxOR_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            objectRent = (ObjectRent)listBoxOR.SelectedItem;
            ObjectRentText.Text = (DataContext as AddDemonstrationViewModel).GetObjectRent(objectRent);
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            string[] FullName = new string[3];
            if (Tabs.SelectedIndex == 0) 
            {
                if (!String.IsNullOrEmpty(nameText.Text)
                && !String.IsNullOrEmpty(surnameText.Text)
                && !String.IsNullOrEmpty(Patronimic.Text)
                && !String.IsNullOrEmpty(PhoneNumberText.Text)
                && !String.IsNullOrEmpty(ObjectRentText.Text)) 
                {
                    (DataContext as AddDemonstrationViewModel).SaveDemonstration(demonstration, objectRent, client, User, PhoneNumberText.Text);
                    MessageBox.Show("Заявка на демонстрацию сохранена успешно!");
                    ReloadDemonstrations();
                }
                else
                {
                    MessageBox.Show("Не все поля с данными были заполнены! Проверьте выбрали ли вы помещение и клиента.");
                }
            }
            else if(Tabs.SelectedIndex == 1)
            {
                if (!String.IsNullOrEmpty(nameOfVisitor.Text)
                && !String.IsNullOrEmpty(surnameOfVisitor.Text)
                && !String.IsNullOrEmpty(patronimicOfVisitor.Text)
                && !String.IsNullOrEmpty(PhoneNumberText.Text)
                && !String.IsNullOrEmpty(ObjectRentText.Text))
                {
                    FullName[0] = nameOfVisitor.Text;
                    FullName[1] = surnameOfVisitor.Text;
                    FullName[2] = patronimicOfVisitor.Text;
                    (DataContext as AddDemonstrationViewModel).SaveDemonstrationForVisitor(demonstration, objectRent, User, PhoneNumberText.Text, FullName);
                    MessageBox.Show("Заявка на демонстрацию сохранена успешно!");
                    ReloadDemonstrations();
                }
                else
                {
                    MessageBox.Show("Не все поля с данными были заполнены! Проверьте выбрали ли вы помещение и клиента.");
                }
            }
        }

        private void ReloadDemonstrations()
        {
            demonstrationPage.DataDemonstration.ItemsSource = (DataContext as AddDemonstrationViewModel).GetDemonstrations();
            this.Close();
        }

        private void searchText_TextChanged(object sender, TextChangedEventArgs e)
        {
            listBoxClients.ItemsSource = (DataContext as AddDemonstrationViewModel).UpdateClientList();
        }

        private void btnCanpel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
