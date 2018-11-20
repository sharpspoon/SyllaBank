using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using SyllaBank1;
using System.Data.SqlClient;
using System.Data;

public partial class Account_Manage : System.Web.UI.Page
{
    protected string SuccessMessage
    {
        get;
        private set;
    }

    protected bool CanRemoveExternalLogins
    {
        get;
        private set;
    }

    private bool HasPassword(UserManager manager)
    {
        var user = manager.FindById(User.Identity.GetUserId());
        return (user != null && user.PasswordHash != null);
    }

    protected void Page_Load()
    {


        if (!IsPostBack)
        {
            // Determine the sections to render
            UserManager manager = new UserManager();
            CanRemoveExternalLogins = manager.GetLogins(User.Identity.GetUserId()).Count() > 1;

            // Render success message
            var message = Request.QueryString["m"];
            if (message != null)
            {
                // Strip the query string from action
                Form.Action = ResolveUrl("~/Account/Manage");

                SuccessMessage =
                    message == "ChangePwdSuccess" ? "Your password has been changed."
                    : message == "SetPwdSuccess" ? "Your password has been set."
                    : message == "RemoveLoginSuccess" ? "The account was removed."
                    : String.Empty;
                successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            }
        }
    }

    public IEnumerable<UserLoginInfo> GetLogins()
    {
        UserManager manager = new UserManager();
        var accounts = manager.GetLogins(User.Identity.GetUserId());
        CanRemoveExternalLogins = accounts.Count() > 1 || HasPassword(manager);
        return accounts;
    }

    public void RemoveLogin(string loginProvider, string providerKey)
    {
        UserManager manager = new UserManager();
        var result = manager.RemoveLogin(User.Identity.GetUserId(), new UserLoginInfo(loginProvider, providerKey));
        string msg = String.Empty;
        if (result.Succeeded)
        {
            var user = manager.FindById(User.Identity.GetUserId());
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            msg = "?m=RemoveLoginSuccess";
        }
        Response.Redirect("~/Account/Manage" + msg);
    }

    private void AddErrors(IdentityResult result)
    {
        foreach (var error in result.Errors)
        {
            ModelState.AddModelError("", error);
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        schoolDropDownList.Visible = true;
        Label1.Visible = true;
        Label10.Visible = true;
        facultyFirstNameTextBox.Visible = true;
        Button1.Visible = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        using (SqlConnection connection = new SqlConnection("Server=tcp:syllabank.database.windows.net,1433;Initial Catalog=sylladb;Persist Security Info=False;User ID=syllasa;Password=Crackp4d1!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
        {
            
            connection.Open();

            //get userid
            var userDataSet = new DataSet();
            var userSelect = new SqlCommand("select id from aspnetusers where username=" + "'" + Context.User.Identity.GetUserName() + "'", connection)
            {
                CommandType = CommandType.Text
            };
            var userDataAdapter = new SqlDataAdapter { SelectCommand = userSelect };
            userDataAdapter.Fill(userDataSet);
            var resultuser = userDataSet.Tables[0].Rows[0]["id"].ToString();

            //get schoolid
            var schoolDataSet = new DataSet();
            var schoolSelect = new SqlCommand("select schoolID from school where Institution_Name=" + "'" + schoolDropDownList.Text + "'", connection)
            {
                CommandType = CommandType.Text
            };
            var schoolDataAdapter = new SqlDataAdapter { SelectCommand = schoolSelect };
            schoolDataAdapter.Fill(schoolDataSet);
            var resultschool = schoolDataSet.Tables[0].Rows[0]["schoolID"].ToString();
            


            String facultyQuery = "INSERT INTO dbo.faculty (prefix, firstName, lastName, gender, schoolID, userID) VALUES (@prefix, @firstName, @lastName, @gender, @schoolID, @userID)";
            using (SqlCommand command = new SqlCommand(facultyQuery, connection))
            {
                command.Parameters.AddWithValue("@prefix", prefixDropDownList.Text);
                command.Parameters.AddWithValue("@firstName", facultyFirstNameTextBox.Text);
                command.Parameters.AddWithValue("@lastName", facultyLastNameTextBox.Text);
                command.Parameters.AddWithValue("@gender", genderDropDownList.Text);
                command.Parameters.AddWithValue("@schoolID", resultschool);
                command.Parameters.AddWithValue("@userID", resultuser);

                //connection.Open();
                int result = command.ExecuteNonQuery();

                // Check Error
                if (result < 0)
                    Console.WriteLine("Error inserting data into Database!");
            }
        }
    }
}