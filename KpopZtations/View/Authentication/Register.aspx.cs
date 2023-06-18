using KpopZtations.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KpopZtations.View.Authentication
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = tbName.Text;
            string email = tbEmail.Text;
            string address = tbAddress.Text;
            string password = tbPassword.Text;

            CustomerController cc = new CustomerController();
            lbError.Text = cc.doRegister(name, email, address, rbMale, rbFemale, password);

            if (lbError.Text == "")
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}