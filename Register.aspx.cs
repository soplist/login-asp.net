using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    int reValue;//-1---(username exist),0---(failure),1---(success),2---(username not exist)
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        reValue = CheckName();
        if (reValue == -1)
        {
            Response.Write("<script>alert('username exist!');</script>");
        }
        else
        {
            DB db = new DB();
            string UserName = this.txtUserName.Text;
            string PassWord = db.GetMD5(this.txtPwd.Text.ToString());
            string Email = this.txtEmail.Text;

            string cmdstr = "insert into tb_User(UserName,PassWord,Email) values('" + UserName + "','" + PassWord + "','" + Email + "')";
            try
            {
                reValue = db.sqlEx(cmdstr);
                if (reValue == 1)
                {
                    Response.Write("<script>alert('register success');</script>");
                    Clear();
                }
                else if (reValue == 0)
                {
                    Response.Write("<script>alert('register failure');</script>");
                }
            }
            catch (Exception ee)
            {
                Response.Write("<script>alert('register failure');</script>");
            }
        }
    }

    protected void lnkbtnCheck_Click(object sender, EventArgs e)
    {
        reValue = CheckName();
        if (reValue == -1)
        {
            Response.Write("<script>alert('username exist!');</script>");
            this.txtUserName.Focus();
        }
        else if (reValue == 2)
        {
            Response.Write("<script>alert('username not exist!');</script>");
            this.txtUserName.Focus();
        }
    }

    public int CheckName()
    {
        DB db = new DB();
        string str = "select count(*) from tb_User where UserName='" + this.txtUserName.Text + "'";
        try
        {
            DataTable dt = db.reDt(str);
            if (dt.Rows[0][0].ToString() != "0")
            {
                return -1;
            }
            else
            {
                return 2;
            }
        }
        catch (Exception ee)
        {
            return 0;
        }
    }

    public void Clear()
    {
        this.txtUserName.Text = "";
        this.txtPwd.Text = "";
        this.txtRepwd.Text = "";
        this.txtEmail.Text = "";
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}