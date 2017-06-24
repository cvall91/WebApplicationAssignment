function checkMecCallSign() {
    var callSign = $("#txtMechanicCallSign").val();
    DangerZone2.checkMecCallSign(callSign, checkMecCallSignCallBack);
}

function checkMecCallSignCallBack(result) {
    $(document).ready(function () {
        if (result) {
            $("#lblCallSignCheck").html("Your Call sign already exists, Please try another one");
            $("#txtMechanicCallSign").val("");
        } else {
            $("#lblCallSignCheck").html("Your Call Sign has been verified");
        }
    })

}