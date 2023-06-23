using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Http;
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
using TestingAPI.Components;

namespace TestingAPI
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        //Components.Client client;
        public MainWindow()
        {
            InitializeComponent();
            //client = _client;
            //DataContext = client;
            UserList.ItemsSource = DBConnect.db.User.ToList();
            RoleCb.ItemsSource = DBConnect.db.Role.ToList();
            RoleCb.DisplayMemberPath = "Name";

        }

        public static class NetManager
        {
            public static string URL = "http://localhost:51929/";
            public static HttpClient httpClient = new HttpClient();

            public static async Task<T> Get<T>(string controller)
            {
                var response = await httpClient.GetAsync(URL + controller);
                var data = JsonConvert.DeserializeObject<T>(await response.Content.ReadAsStringAsync());
                return data;
            }



            public static async Task<HttpResponseMessage> Post<T>(string controller, T data)
            {
                var jsonData = JsonConvert.SerializeObject(data);
                var response = await httpClient.PostAsync(URL + controller, new StringContent(jsonData, Encoding.UTF8, "application/json"));
                return response;
            }

            public static async Task<HttpResponseMessage> Put<T>(string controller, T data)
            {
                var jsonData = JsonConvert.SerializeObject(data);
                var response = await httpClient.PutAsync(URL + controller, new StringContent(jsonData, Encoding.UTF8, "application/json"));
                return response;
            }


            public static async Task<HttpResponseMessage> Delete<T>(string controller)
            {
                var response = await httpClient.DeleteAsync(URL + controller);
                return response;
            }

        }

        public class User
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public int Age { get; set; }
            public int RoleId { get; set; }
            public string Role { get; set; }
        }

        private async void Refresh()
        {
            var users = await NetManager.Get<List<User>>("api/Users/GetAllUsers");
            UserList.ItemsSource = users;
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        //private async void AddBt_Click(object sender, RoutedEventArgs e)
        //{
          

        //}

        private void NameTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void AgeTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Char.IsLetter(e.Text, 0))
            {
                e.Handled = true;
            }
        }


        private void RoleCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {   

        }

        private async void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            var user = new User();
            user.Name = NameTb.Text;
            user.Age = int.Parse(AgeTb.Text);
            user.RoleId = RoleCb.SelectedIndex + 1;
           await NetManager.Post("api/Users/Add", user);
            Refresh();
        }

        //private async void DelBtn_Click(object sender, RoutedEventArgs e)
        //{
        //    var user = UserList.SelectedItems.Cast<User>().ToList();
        //    await NetManager.Delete<List<User>>("api/Users/Delete/{name}");
           
        //    Refresh();
        //}

        //private void AddBt_Click(object sender, RoutedEventArgs e)
        //{
        //    var user = new Client();
        //    user.LastName = NameTb.Text;
        //    user.Age = int.Parse(AgeTb.Text);
        //    user.AgentId = RoleCb.SelectedIndex + 1;
        //    await NetManager.Post("api/Clients/Add", user);
        //    Refresh();
        //}
    }
}
