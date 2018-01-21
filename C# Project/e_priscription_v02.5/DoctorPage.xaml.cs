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
    public sealed partial class DoctorPage : Page
    {
        public DoctorPage()
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

        private void textBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void bLogout_Click(object sender, RoutedEventArgs e)
        {
            this.Frame.Navigate(typeof(MainPage));
            tbSuccess.Text = "";
            tbAMKA.Text = "";
        }

        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {

            String sSQL = @"SELECT [DoctorId],[LastNmae],[FirstName],[Specialty],[Phone] from iatroi where [DoctorId] = " + tbId.Text;
            ISQLiteStatement dbstate = dbcoonection.Prepare(sSQL);
            while (dbstate.Step() == SQLiteResult.ROW)
            { 
                tbname.Text = dbstate["LastNmae"] as string + " " + dbstate["FirstName"] as string;
                tbSpeciality.Text = dbstate["Specialty"] as string;
                tbPhone.Text = dbstate["Phone"] as string;    

            }

            var Items = new List<string>();
            sSQL = @"SELECT [EOF_CODE],[DESCRIPTION],[INCREMET] from DRAGS";
            dbstate = dbcoonection.Prepare(sSQL);
            while (dbstate.Step() == SQLiteResult.ROW)
            {
                Items.Add(dbstate["EOF_CODE"] + " " + dbstate["DESCRIPTION"] + " " + dbstate["INCREMET"]);

            }
                listDrugsDescription.ItemsSource = Items;
            

            

        }

        private void tbSearch_GotFocus(object sender, RoutedEventArgs e)
        {
            tbAMKA.Text = "";
        }

        private void bSearch_Click(object sender, RoutedEventArgs e)
        {
            var Items = new List<string>();
            String sSQL = @"SELECT [Cust_Lname],[Cust_Fname],[Cust_AMKA],[Cust_Address],[Cust_Region],[Cust_ZIP],[Cust_Phone],[Cust_mail] from customers where [Cust_AMKA] =" + tbAMKA.Text;
            ISQLiteStatement dbstate = dbcoonection.Prepare(sSQL);
            while (dbstate.Step() == SQLiteResult.ROW)

            {
               Items.Add("Ονοματεπώνυμο: "+dbstate["Cust_Lname"]+" "+dbstate["Cust_Fname"]+"  Διεύθυνση: "+dbstate["Cust_Address"]+"  Πόλη: "+dbstate["Cust_Region"]+"  Τ.Κ.: "+dbstate["Cust_ZIP"]+"  Τηλέφωνο: "+dbstate["Cust_Phone"]+"  e-mail: "+dbstate["Cust_mail"]);
            }
            listcustomer.ItemsSource = Items;

            var Items1 = new List<string>();
            sSQL = @"SELECT [amka],[Drag],[Quant] from preskr where [amka] ='" + tbAMKA.Text + "'";
            dbstate = dbcoonection.Prepare(sSQL);
            while (dbstate.Step() == SQLiteResult.ROW)
            {
                Items1.Add(dbstate["Drag"] + " " + dbstate["Quant"]);

            }
            listDrugsPriscription.ItemsSource = Items1;

        }

        private void listcustomer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void textBlock_Copy5_SelectionChanged(object sender, RoutedEventArgs e)
        {

        }

        

        public void listDrugsDescription_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            tbSelDrug.Text = listDrugsDescription.SelectedItem.ToString();
        }

        private void textBlock_Copy4_SelectionChanged(object sender, RoutedEventArgs e)
        {

        }

        private async void bAdd_Click(object sender, RoutedEventArgs e)
        {
            if (tbAMKA.Text== "")
            {
                MessageDialog msgbox = new MessageDialog("Παρακαλώ συμπληρώστε το Α.Μ.Κ.Α. του πελάτη");
                await msgbox.ShowAsync();
            }
            else if (tbQuantity.Text == "") {
                MessageDialog msgbox = new MessageDialog("Παρακαλώ συμπληρώστε το ποσότητα του φαρμάκου");
                await msgbox.ShowAsync();
            }
            else
            { 
                string sSQL = @"insert into preskr ([amka] ,[drag],[quant])
                    values ('" + tbAMKA.Text + "','" + tbSelDrug.Text + "','" + tbQuantity.Text + "')";
                dbcoonection.Prepare(sSQL).Step();
                {
                    var Items = new List<string>();
                    String sSQL1 = @"SELECT [amka],[Drag],[Quant] from preskr where [amka] like '" + tbAMKA.Text + "%'";
                    ISQLiteStatement dbstate = dbcoonection.Prepare(sSQL1);
                    while (dbstate.Step() == SQLiteResult.ROW)
                    {
                        Items.Add(dbstate["Drag"] + " " + dbstate["Quant"]);
                    }
                    listDrugsPriscription.ItemsSource = Items;
                }
                tbSuccess.Text = "Καταχώρηση επιτυχής!";
            }

            
        }

        private void listDrugsPriscription_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
        }

        private void bDelete_Click(object sender, RoutedEventArgs e)
        {
            String sSQL = @"delete  from preskr where [amka] =" + tbAMKA.Text;
            ISQLiteStatement dbstate = dbcoonection.Prepare(sSQL);
            dbstate.Step();
            tbSuccess.Text = "Διαγραφή επιτυχής!";

        }

        private void tbAMKA_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
