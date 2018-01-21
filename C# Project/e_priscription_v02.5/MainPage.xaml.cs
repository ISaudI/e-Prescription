using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;
using Windows.UI.Popups;
using SQLitePCL;

    
// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=402352&clcid=0x409

namespace e_priscription_v02._5
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        String radiosel;
        public MainPage()
        {
            this.InitializeComponent();
            this.NavigationCacheMode = NavigationCacheMode.Required;
        }

        public SQLitePCL.SQLiteConnection dbcoonection = new SQLiteConnection("NeaErgasia.db");

        private void tbLogin_GotFocus(object sender, RoutedEventArgs e)
        {
            tbLogin.Text = "";
        }

        private void tbLogin_TextChanged(object sender, TextChangedEventArgs e)
        {
            long a;
            if (!long.TryParse(tbLogin.Text, out a))
            {
               
                // If not int clear textbox text or Undo() last operation
                tbLogin.Text = "";

            }
        }

        private void bLogin_Click(object sender, RoutedEventArgs e)
        {
            switch (radiosel)
            {
                case "Doctor":
                    String sSQL = @"SELECT [DoctorId] from iatroi where [DoctorId] = " + tbLogin.Text;
                    ISQLiteStatement dbstate = dbcoonection.Prepare(sSQL);
                    while (dbstate.Step() == SQLiteResult.ROW)
                    {
                        var itemId = tbLogin.Text;
                        this.Frame.Navigate(typeof(DoctorPage), itemId);
                    }
                    break;

                case "Drugstore":
                    sSQL = @"SELECT [Store_Id] from dragstores where [Store_Id] = " + tbLogin.Text;
                    dbstate = dbcoonection.Prepare(sSQL);
                    while (dbstate.Step() == SQLiteResult.ROW)
                    {
                        var itemId = tbLogin.Text;
                        this.Frame.Navigate(typeof(DrugstorePage), itemId);
                    }
                    break;
            }
        }

        private void radioDoctor_Checked(object sender, RoutedEventArgs e)
        {
            radiosel = "Doctor";
        }

        private void radioDrugstore_Checked(object sender, RoutedEventArgs e)
        {
            radiosel = "Drugstore";
        }
    }
}
