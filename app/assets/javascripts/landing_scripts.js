$(function(){

    var numRand = Math.floor(Math.random()*3)

    if (numRand == 0){
        $('body').addClass("background-image1"); 
    }
    else if (numRand == 1){
        $('body').addClass("background-image2"); 
    }
    else{
        $('body').addClass("background-image3");   
    }
});