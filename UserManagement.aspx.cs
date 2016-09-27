using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserManagement : System.Web.UI.Page
{
    public static string selVal;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToBoolean(Session["Role"]))
                selVal = "";
            else
            {
                selVal = "where UserID=" + Session["UserID"].ToString();
            }
            DataListBind();
        }
    }
    public void DataListBind()
    {
        DB db = new DB();
        string sqlstr = "select * from tb_User " + selVal;
        DataTable dt = db.reDt(sqlstr);
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }

    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = e.Item.ItemIndex;
        DataListBind();
    }
    
    protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = -1;
        DataListBind();
    }
    
    protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        DB db = new DB();
        string userName = ((Label)e.Item.FindControl("lblUserName")).Text;
        string oldpassWord = ((TextBox)e.Item.FindControl("txtOldpwd")).Text;
        string newpassWord = ((TextBox)e.Item.FindControl("txtNewpwd")).Text;
        if (db.GetMD5(oldpassWord) == e.CommandArgument.ToString())
        {
            string sqlStr = "update tb_User set PassWord='" + db.GetMD5(newpassWord) + "'where UserName='" + userName + "'";
            int reValue = db.sqlEx(sqlStr);

            if (reValue == 0)
                Response.Write("<script>alert('password change failure!');</script>");
            else
                Response.Write("<script>alert('password change success!');</script>");
            DataList1.EditItemIndex = -1;
            DataListBind();
        }
        else
        {
            Response.Write("<script>alert('input old password error!');</script>");
        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        DB db = new DB();
        if (e.CommandName == "select")
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            DataListBind();
        }
        if (e.CommandName == "updateName")
        {
            string userName = ((TextBox)e.Item.FindControl("txtUserName")).Text;
            string email = ((TextBox)e.Item.FindControl("txtEmail")).Text;
            string userID = e.CommandArgument.ToString();
            string sqlStr = "update tb_User set UserName='" + userName + "',Email='" + email + "' where UserID=" + userID;
            int reValue = db.sqlEx(sqlStr);
            if (reValue == 0)
                Response.Write("<script>alert('update user message failure!');</script>");

            DataList1.SelectedIndex = -1;
            DataListBind();
        }
        if (e.CommandName == "cancel")
        {
            DataList1.SelectedIndex = -1;
            DataListBind();
        }
        if (e.CommandName == "setRole")
        {
            string userID = e.CommandArgument.ToString();
            string roleText = ((Button)e.Item.FindControl("btnSetRole")).Text;
            bool role = (roleText == "cancel administrative rights" ? false : true);
            string sqlStr = "update tb_User set Role='" + role + "'where UserID=" + userID;
            int reValue = db.sqlEx(sqlStr);

            if (reValue == 0)
                Response.Write("<script>alert('administrative set failure!');</script>");
            DataListBind();
        }
    }
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        DB db = new DB();
        string userID = e.CommandArgument.ToString();
        string sqlStr = "delete from tb_User where UserID=" + userID;
        int reValue = db.sqlEx(sqlStr);
        if (reValue == 0)
            Response.Write("<script>alert('delete failure!');</script>");
        DataListBind();
    }
    protected void btnDelete_Load(object sender, EventArgs e)
    {
        ((Button)sender).Attributes["onclick"] = "javascript:return confirm('are you sure to delete this record?')";
    }
    protected void lnkbtnExit_Click(object sender, EventArgs e)
    {
        Session["ValidateNum"] = null;
        Session["Role"] = null;
        Session["UserID"] = null;
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Login.aspx");

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (!Convert.ToBoolean(Session["Role"]))
        {
            switch (e.Item.ItemType)
            {
                case ListItemType.Item://odd
                    ((Button)e.Item.FindControl("btnSetRole")).Enabled = false;
                    break;
                case ListItemType.AlternatingItem:
                    ((Button)e.Item.FindControl("btnSetRole")).Enabled = false;
                    break;//even
            }
        }
    }
}