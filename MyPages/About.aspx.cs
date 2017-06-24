using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    int pageCount;
    bool firstLoad;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (ViewState["count"] == null && pageCount == 0)
            {
                ViewState["count"] = 0.ToString();
            }

            lblCounter.Text = ViewState["count"].ToString();

        } else {
            pageCount = Convert.ToInt32(ViewState["count"]);
            pageCount++;
            ViewState["count"] = pageCount.ToString();
            lblCounter.Text = ViewState["count"].ToString();
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Response.Redirect(Page.Request.Url.ToString(), true);
    }
}