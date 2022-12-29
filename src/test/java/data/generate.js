function a(lengthP){
    var result = "";
    var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    var charactersLength = characters.length;
    for(var i=0; i<lengthP; i++){
        result += characters.charAt(Math.floor(Math.random()*charactersLength))
    }
    return result;
}