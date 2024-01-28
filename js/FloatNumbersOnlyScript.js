
    var specialKeys = new Array();

    specialKeys.push(8); //Backspace  
    specialKeys.push(189); //(-) key  
  
    function numericOnly(elementRef) {  
  
    var keyCodeEntered = (event.which) ? event.which : (window.event.keyCode) ?    window.event.keyCode : -1;  
  
    if ((keyCodeEntered >= 48) && (keyCodeEntered <= 57) ) {  
  
    return true;  
  
}  
  
// '.' decimal point...  
  
else if (keyCodeEntered == 46) {  
  
// Allow only 1 decimal point ('.')...  
  
if ((elementRef.value) && (elementRef.value.indexOf('.') >= 0))  
  
    return false;  
  
else  
  
    return true;  
  
}  
  
    return false;  
  
}




function myFunc(obj) {
    var val = obj.value;
    
    var re = /^([- 0-9]+[\.]?[0-9]?[0-9]?|[0-9]+)$/g;
    var re1 = /^([0-9]+[\.]?[0-9]?[0-9]?|[0-9]+)/g;
    if (re.test(val)) {
        //do something here

    } else {
        val = re1.exec(val);
        if (val) {
            obj.value = val[0];
        } else {
            obj.value = "";
        }
    }
}


//$(".two-decimals").on("keypress", function (evt) {

//    var $txtBox = $(this);
//    var charCode = (evt.which) ? evt.which : evt.keyCode
//    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46)
//        return false;
//    else {
//        var len = $txtBox.val().length;
//        var index = $txtBox.val().indexOf('.');
//        if (index > 0 && charCode == 46) {
//            return false;
//        }
//        if (index > 0) {
//            var charAfterdot = (len + 1) - index;
//            if (charAfterdot > 3) {
//                return false;
//            }
//        }
//    }
//    return $txtBox; //for chaining
//});
