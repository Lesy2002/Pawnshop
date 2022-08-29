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

namespace AuthorizationPawnshop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void cancelBtn_Click(object sender, RoutedEventArgs e)
        {
            loginBox.Text = String.Empty;
            passBox.Password = String.Empty;
        }

        public static bool TestValidation(string loginBox, string passBox)
        {
            bool result = false;
         
            if (passBox == "")
            {
                result = false;
            }
            else
            {
                if (loginBox == "")
                {
                    result = false;
                }
                else
                {
                    result = true;
                }
            }
            return result;
        }

        private void autBtn_Click(object sender, RoutedEventArgs e)
        {
            Model.PawnshopEntities db = new Model.PawnshopEntities();
            if (passBox.Password == "" || loginBox.Text == "")
            {
                if (passBox.Password == "")
                {
                    string messageBoxText = "Введите пароль!";
                    string caption = "Предупреждение";
                    MessageBoxButton button = MessageBoxButton.OK;
                    MessageBoxImage icon = MessageBoxImage.Error;
                    MessageBoxResult result;

                    result = MessageBox.Show(messageBoxText, caption, button, icon, MessageBoxResult.Yes);
                }
                if (loginBox.Text == "")
                {
                    string messageBoxText = "Введите логин!";
                    string caption = "Предупреждение";
                    MessageBoxButton button = MessageBoxButton.OK;
                    MessageBoxImage icon = MessageBoxImage.Error;
                    MessageBoxResult result;

                    result = MessageBox.Show(messageBoxText, caption, button, icon, MessageBoxResult.Yes);
                }
            }
            else
            {
                Model.Employee empl = db.Employee.Where(l => l.Login == loginBox.Text).FirstOrDefault();

                if (empl != null)
                {
                    if (empl.Password == passBox.Password || empl.Login == loginBox.Text)
                    {
                        string messageBoxText = "Пользователь успешно авторизовался!";
                        string caption = "Уведомление";
                        MessageBoxButton button = MessageBoxButton.OK;
                        MessageBoxImage icon = MessageBoxImage.Information;
                        MessageBoxResult result;

                        result = MessageBox.Show(messageBoxText, caption, button, icon, MessageBoxResult.Yes);
                    }
                }
                else
                {
                    string messageBoxText = "Пользователь не найден!";
                    string caption = "Ошибка!!!";
                    MessageBoxButton button = MessageBoxButton.OK;
                    MessageBoxImage icon = MessageBoxImage.Error;
                    MessageBoxResult result;

                    result = MessageBox.Show(messageBoxText, caption, button, icon, MessageBoxResult.Yes);
                }
            }
        }
    }
}
