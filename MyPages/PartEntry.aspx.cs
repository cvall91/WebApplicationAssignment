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


using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PartEntry : System.Web.UI.Page

{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDateEntered.Text = DateTime.Today.ToShortDateString();
        txtSavedValues.Visible = false;
        lblErrorMissingValues.Visible = false;
        savedEntries.Visible = false;
    }

    protected void txtRequestOrderNum_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtDateEntered_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtDescription_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtPartNum_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtSerialNum_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtModel_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtInstructions_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtTroubleReported_TextChanged(object sender, EventArgs e)
    {

    }

    protected void chkboxMasterContract_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SavePart();
        SavePartDB();
    }

    protected void SavePartDB()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["COP4703ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("INSERT INTO PartEntry(Client, RequestOrderNum," +
                "DateEntered, Description, PartNum, Serial, Manufacturer, Model, MechanicCallSign)" +
                "VALUES (@Param1, @Param2, @Param3, @Param4, @Param5, @Param6, @Param7, @Param8, @Param9)", conn);

                command.Parameters.AddWithValue("@Param1", ddlClientList.DataValueField.ToString());
                command.Parameters.AddWithValue("@Param2", txtRequestOrderNum.Text);
                command.Parameters.AddWithValue("@Param3", txtDateEntered.Text);
                command.Parameters.AddWithValue("@Param4", txtDescription.Text);
                command.Parameters.AddWithValue("@Param5", txtPartNum.Text);
                command.Parameters.AddWithValue("@Param6", txtSerialNum.Text);
                command.Parameters.AddWithValue("@Param7", ddlManufacturer.DataValueField.ToString());
                command.Parameters.AddWithValue("@Param8", txtModel.Text);
                command.Parameters.AddWithValue("@Param9", ddlMechanicCallSign.DataValueField.ToString());

                command.CommandType = CommandType.Text;
                command.ExecuteNonQuery();
                GridView1.DataBind();
                conn.Close();
            }
        } catch (Exception e)
        {
            lblSqlErrorMessage.Text = e.ToString();
        }       
        
    }

    // Collects all the data from the controls and saves them in a Dictionary class
    protected void SavePart()
    {
        // Firsts checks if any required values are missing
        if (checkRequiredValues())
        {
            Welcome.Visible = false;
            savedEntries.Visible = true;
            Dictionary<string, string> myDict = new Dictionary<string, string>();

            myDict.Add(ddlClientList.ID, ddlClientList.Text);
            myDict.Add(txtRequestOrderNum.ID, txtRequestOrderNum.Text);
            myDict.Add(txtDateEntered.ID, txtDateEntered.Text);
            myDict.Add(txtDescription.ID, txtDescription.Text);
            myDict.Add(txtPartNum.ID, txtPartNum.Text);
            myDict.Add(txtSerialNum.ID, txtSerialNum.Text);
            myDict.Add(ddlManufacturer.ID, ddlManufacturer.Text);
            myDict.Add(txtModel.ID, txtModel.Text);
            myDict.Add(txtInstructions.ID, txtInstructions.Text);
            myDict.Add(txtTroubleReported.ID, txtTroubleReported.Text);
            myDict.Add(chkboxMasterContract.ID, chkboxMasterContract.Checked.ToString());

            string json = JsonConvert.SerializeObject(myDict, Formatting.Indented);

            hiddenSavedValues.Value = json;
            txtSavedValues.Text = json;
            txtSavedValues.Visible = true;
        }
        else
        {
            //Display error label if required values missing
            lblErrorMissingValues.Visible = true;
        }
    }

    //Checks to see if all the required fields are filled in.
    protected Boolean checkRequiredValues()
    {
        if (String.IsNullOrEmpty(txtRequestOrderNum.Text)&&
            String.IsNullOrEmpty(txtDescription.Text)&&
            String.IsNullOrEmpty(txtPartNum.Text)&&
            String.IsNullOrEmpty(txtSerialNum.Text)&&
            String.IsNullOrEmpty(txtModel.Text))
            return false;

        return true;
    }
}