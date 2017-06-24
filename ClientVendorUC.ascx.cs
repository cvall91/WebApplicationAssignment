using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyPages_ClientVendorUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string varType = Request.QueryString["type"];
        btnSaveButton.Text = varType + " Registration";
    }

    protected void btnSaveButton_Click(object sender, EventArgs e)
    {
        if (SaveClientVendor().Equals("Vendor"))
            SaveVendor();
        else SaveClient();
    }

    protected String SaveClientVendor()
    {
        if (rdoButtonYes.Checked)
            return "Vendor";

        return "Client";
    }

    protected void SaveClient()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["COP4703ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand(("ClientOrVendorSP"), conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ClientOrVendor" , "C"));

                command.Parameters.AddWithValue("@Param1", txtFedTaxID.Text);
                command.Parameters.AddWithValue("@Param2", txtBusinessName.Text);
                command.Parameters.AddWithValue("@Param3", txtAddress.Text);
                command.Parameters.AddWithValue("@Param4", txtCity.Text);
                command.Parameters.AddWithValue("@Param5", txtState.Text);
                command.Parameters.AddWithValue("@Param6", txtZipCode.Text);

                //command.CommandType = CommandType.Text;
                command.ExecuteNonQuery();
                conn.Close();
            }
        }
        catch (Exception e)
        {
            lblSqlErrorMessage.Text = e.ToString();
        }
    }

    protected void SaveVendor()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["COP4703ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand(("ClientOrVendorSP"), conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ClientOrVendor", "V"));

                command.Parameters.AddWithValue("@Param1", txtFedTaxID.Text);
                command.Parameters.AddWithValue("@Param2", txtBusinessName.Text);
                command.Parameters.AddWithValue("@Param3", txtAddress.Text);
                command.Parameters.AddWithValue("@Param4", txtCity.Text);
                command.Parameters.AddWithValue("@Param5", txtState.Text);
                command.Parameters.AddWithValue("@Param6", txtZipCode.Text);

                //command.CommandType = CommandType.Text;
                command.ExecuteNonQuery();
                conn.Close();
            }
        }
        catch (Exception e)
        {
            lblSqlErrorMessage.Text = e.ToString();
        }
    }

    protected void txtState_TextChanged(object sender, EventArgs e)
    {
        txtState.Text = txtState.Text.ToUpper();
    }
}