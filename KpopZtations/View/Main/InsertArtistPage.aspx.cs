using KpopZtations.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KpopZtations.View.Main
{
    public partial class InsertArtistPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            string name = artistNameTb.Text;

            ArtistController ac = new ArtistController();
            lblError.Text = ac.doInsert(name, artistImageFile);

            if (lblError.Text == "")
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void submitBtn_Click1(object sender, EventArgs e)
        {

        }
    }
}