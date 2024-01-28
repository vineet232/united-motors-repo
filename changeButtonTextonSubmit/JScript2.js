function disableBtn(btnID, newText) {

    Page_IsValid = null;

    if (typeof (Page_ClientValidate) == 'function') {
        Page_ClientValidate();
    }

    var btn = document.getElementById(btnID);
    var isValidationOk = Page_IsValid;

    if (isValidationOk !== null) {

        if (isValidationOk) {
            btn.disabled = true;
            btn.value = newText;
           // btn.style.background = " url(changeButtonTextonSubmit/pleasewait.gif) no-repeat";
            btn.style.background = "#000";
            btn.style.color = "#fff";
        }
        else {
            btn.disabled = false;
        }
    }
    else {
        setTimeout("setImage('"+btnID+"')", 10);
        btn.disabled = true;
        btn.value = newText;
        
    }
}

function setImage(btnID) {
    var btn = document.getElementById(btnID);
    // btn.style.background = 'url(../changeButtonTextonSubmit/12501270608.gif)';
    btn.style.background = "#000";
    btn.style.color = "#fff";
}