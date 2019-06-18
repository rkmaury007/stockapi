$(document).ready(function(){
    validate();
});

function validate()
    {
        var name = document.getElementById("name");
        var stockPrice = document.getElementById("stockPrice");
        var numOfStock = document.getElementById("numOfStock");
        /*var a = document.getElementById("stockPrice");*/
        var c = document.getElementById("stockPrice").value;
        var d = document.getElementById("numOfStock").value;
        var valid = true;
        if(name.value.length<=0 || stockPrice.value.length<=0 || numOfStock.value.length<=0)
        {
            alert("This field is mandatory");
            valid = false;
        }
        else{
            if(isNaN(c) || isNaN(d)){
                alert("Enter a number");
                valid = false;}
        }
        return valid;
    };