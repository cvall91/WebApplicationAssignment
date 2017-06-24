/**
 * Name: Carlos Valle
 * Panther Id: 3004204
 * Assignment: Homework 2
 * Class: COP 4813 
 * Semester: Summer B 2016
 * 
 * I attest that this is my original work 
 * - Carlos Valle
 */

using System;
using System.Collections;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

[ServiceContract(Namespace = "")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class DangerZone2
{

    [OperationContract]
    public Boolean checkMecCallSign(String name)
    {
        ArrayList array = new ArrayList { "Viper", "Jester", "Cougar" };

        foreach (String sign in array)
        {
            if ((sign.ToUpper()).Equals(name.ToUpper()))
            {
                return true;
            }
        }
        return false;
    }
}
