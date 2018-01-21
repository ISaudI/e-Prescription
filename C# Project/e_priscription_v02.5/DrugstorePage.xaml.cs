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

// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

namespace e_priscription_v02._5
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class DrugstorePage : Page
    {
        public DrugstorePage()
        {
            this.InitializeComponent();
            this.NavigationCacheMode = NavigationCacheMode.Required;
        }
        public SQLitePCL.SQLiteConnection dbcoonection = new SQLiteConnection("NeaErgasia.db");

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);
            string id = e.Parameter.ToString();
            tbId.Text = id;
        }

        private void bLogout_Click(object sender, RoutedEventArgs e)
        {
            this.Frame.Navigate(typeof(MainPage));
            tbSucess.Text = "";
            tbAMKA.Text = "";

        }

        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            var Items = new List<string>();
            String sSQL = @"SELECT [Store_Id],[Store_Name],[Address],[State],[Region],[ZIP],[Phone],[Email] from dragstores where [Store_Id] =" + tbId.Text;
            ISQLiteStatement dbstate = dbcoonection.Prepare(sSQL);
            while (dbstate.Step() == SQLiteResult.ROW)

            {
                Items.Add("Ονομασία: " + dbstate["Store_Name"] + " Διεύθυνση: " + dbstate["Address"] + " Πόλη: " + dbstate["Region"] + " Νομός: " + dbstate["State"] + " Τ.Κ.: " + dbstate["ZIP"] + " Τηλέφωνο: " + dbstate["Phone"] + " e-mail: " + dbstate["Email"]);
            }
            listdrugstrore.ItemsSource = Items;
        }

        private void bSearch_Click(object sender, RoutedEventArgs e)
        {
            var Items = new List<string>();
            String sSQL = @"SELECT [Cust_Lname],[Cust_Fname],[Cust_AMKA],[Cust_Address],[Cust_Region],[Cust_ZIP],[Cust_Phone],[Cust_mail] from customers where [Cust_AMKA] like '" + tbAMKA.Text + "%'";
            ISQLiteStatement dbstate = dbcoonection.Prepare(sSQL);
            while (dbstate.Step() == SQLiteResult.ROW)

            {
                Items.Add("Ονοματεπώνυμο: " + dbstate["Cust_Lname"] + " " + dbstate["Cust_Fname"] + "  Διεύθυνση: " + dbstate["Cust_Address"] + "  Πόλη: " + dbstate["Cust_Region"] + "  Τ.Κ.: " + dbstate["Cust_ZIP"] + "  Τηλέφωνο: " + dbstate["Cust_Phone"] + "  e-mail: " + dbstate["Cust_mail"]);
            }
            listcustomer.ItemsSource = Items;

            var Items1 = new List<string>();
            sSQL = @"SELECT [amka],[Drag],[Quant] from preskr where [amka] ='" + tbAMKA.Text + "'";
            dbstate = dbcoonection.Prepare(sSQL);
            while (dbstate.Step() == SQLiteResult.ROW)
            {
                Items1.Add(dbstate["Drag"] + " " + dbstate["Quant"]);

            }
            listDrugs.ItemsSource = Items1;

            
        }

        private void tbSearch_GotFocus(object sender, RoutedEventArgs e)
        {
            tbAMKA.Text = "";
        }

        private void listdrugstrore_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void listcustomer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void bSuccess_Click(object sender, RoutedEventArgs e)
        {
            String sSQL = @"delete from preskr where [amka] like '" + tbAMKA.Text + "%'";
            ISQLiteStatement dbstate = dbcoonection.Prepare(sSQL);
            dbstate.Step();
            tbSucess.Text = "Η συνταγή εκτελέστηκε με επιτυχία!";
            

        }

        private void tbSucess_SelectionChanged(object sender, RoutedEventArgs e)
        {
            
        }

        private void listDrugs_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
        }
    }
}
