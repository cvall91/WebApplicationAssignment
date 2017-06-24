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

public partial class MyPages_WorkOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDateTimeInspected.Text = DateTime.Today.ToShortDateString();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        saveDB();
    }

    protected void saveDB()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["COP4703ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("INSERT INTO WorkOrder(WorkOrderNum, MechanicCallSign," +
                "PartNum, InspectionComments, DateTimeInspected, Expires) VALUES (@Param1, @Param2, @Param3, @Param4, @Param5, @Param6)", conn);

                command.Parameters.AddWithValue("@Param1", txtWorkOrderNum.Text);
                command.Parameters.AddWithValue("@Param2", ddlMecCallSign.SelectedValue.ToString());
                command.Parameters.AddWithValue("@Param3", txtPartNum.Text);
                command.Parameters.AddWithValue("@Param4", txtInspectionComments.Text);
                command.Parameters.AddWithValue("@Param5", txtDateTimeInspected.Text);
                command.Parameters.AddWithValue("@Param6", calExpires.SelectedDate.ToString());
      
                command.CommandType = CommandType.Text;
                command.ExecuteNonQuery();
                GridView1.DataBind();
                conn.Close();
            }
        }
        catch (Exception e)
        {
            lblSqlErrorMessage.Text = e.ToString();
        }
    }
}