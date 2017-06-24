/**
 * Name: Carlos Valle
 * Panther Id: 3004204
 * Assignment: Homework 3
 * Class: COP 4813 
 * Semester: Summer B 2016
 * 
 * I attest that this is my original work 
 * - Carlos Valle
 */

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyPages_CreateMechanic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSaveButton_Click(object sender, EventArgs e)
    {
        if(ddlSpecialty.Text.ToUpper().Equals("(Select One)".ToUpper()))
        {
            lblSpecialtyCheck.Text = "Please select a specialty";
        }

        saveDB();
    }

    protected void saveDB()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["COP4703ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("INSERT INTO Mechanic(MechanicCallSign," +
                "FirstName, LastName, Specialty) VALUES (@Param1, @Param2, @Param3, @Param4)", conn);

                command.Parameters.AddWithValue("@Param1", txtMechanicCallSign.Text);
                command.Parameters.AddWithValue("@Param2", txtFirstName.Text);
                command.Parameters.AddWithValue("@Param3", txtLastName.Text);
                command.Parameters.AddWithValue("@Param4", ddlSpecialty.SelectedValue.ToString());

                command.ExecuteNonQuery();
                conn.Close();
            }
        }
        catch (Exception e)
        {
            //lblSqlErrorMessage.Text = e.ToString();
        }
    }
}