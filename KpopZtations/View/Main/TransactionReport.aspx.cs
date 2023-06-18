
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


            foreach(TransactionHeader th in transactionHeaders)
            {
                var hrow = headerTable.NewRow();
                hrow["TranscationID"] = th.TransactionID;
                hrow["TransactionDate"] = th.TransactionDate;
                hrow["CustomerID"] = th.CustomerID;
                headerTable.Rows.Add(hrow);
                
                foreach(TransactionDetail td in th.TransactionDetails)
                {
                    var drow = detailTable.NewRow();
                    drow["TransactionID"] = td.TransactionID;
                    drow["AlbumID"] = td.AlbumID;
                    drow["Qty"] = td.Qty;
                    detailTable.Rows.Add(drow);
                }
            }
            return data;
        }
    }
}