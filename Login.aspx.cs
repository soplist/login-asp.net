using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('hello world!')</script>");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DB db = new DB();
        string userName = this.txtUserName.Text.Trim();
        //string passWord = this.txtPwd.Text.Trim();
        string passWord = db.GetMD5(this.txtPwd.Text.Trim());
        string num = this.txtValidateNum.Text.Trim();
        if (Session["ValidateNum"].ToString() == num.ToUpper())
        {
            SqlDataReader dr = db.reDr("select * from tb_user where UserName='" + userName + "' and PassWord='" + passWord + "'");
            dr.Read();
            if (dr.HasRows)
            {
                Session["UserID"] = dr.GetValue(0);
                Session["Role"] = dr.GetValue(4);
                Response.Redirect("~/UserManagement.aspx");
            }
            else
            {
                Response.Write("<script>alert('login failure');location='Login.aspx'</script>");
            }
            dr.Close();
        }
        else
        {
            Response.Write("<script>alert('validate code input error');location='Login.aspx'</script>");
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Register.aspx");
    }
    
}