
using KpopZtations.Dataset;
using KpopZtations.Handler;
using KpopZtations.Model;
using KpopZtations.Report;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KpopZtations.View.Main
{
    public partial class TransactionReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TransactionHeaderHandler thh = new TransactionHeaderHandler();

            CrystalReport report = new CrystalReport();
            CrystalReportViewer.ReportSource = report;
            CrystalReportDataSet data = getData(thh.getTh());
            report.SetDataSource(data);
        }

        private CrystalReportDataSet getData(List<TransactionHeader> transactionHeaders)
        {
            CrystalReportDataSet data = new CrystalReportDataSet();
            var headerTable = data.TransactionHeader;
            var detailTable = data.TransactionDetail;

            detailTable.Columns.Add("SubTotal", typeof(int));
            headerTable.Columns.Add("GrandTotal", typeof(int));
            headerTable.Columns.Add("CustomerName", typeof(string));

            int grandTotal = 0;
            int subTotal = 0;

            foreach(TransactionHeader th in transactionHeaders)
            {
                var hrow = headerTable.NewRow();
                hrow["TranscationID"] = th.TransactionID;
                hrow["TransactionDate"] = th.TransactionDate;
                hrow["CustomerID"] = th.CustomerID;
                hrow["CustomerName"] = th.Customer.CustomerName;
                
                foreach(TransactionDetail td in th.TransactionDetails)
                {
                    var drow = detailTable.NewRow();
                    drow["TransactionID"] = td.TransactionID;
                    drow["AlbumID"] = td.AlbumID;
                    drow["Qty"] = td.Qty;

                    int detailSubtotal = (int)(td.Qty * td.Album.AlbumPrice);
                    
                    grandTotal += detailSubtotal;

                    drow["SubTotal"] = detailSubtotal;
                    detailTable.Rows.Add(drow);
                    
                }
                hrow["GrandTotal"] = grandTotal;
                headerTable.Rows.Add(hrow);
            }
            return data;
        }
    }
}