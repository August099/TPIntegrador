
const nombreDeUsuario = document.getElementById("usuario");
const email = document.getElementById("email");
const contraseña = document.getElementById("contrasena");
const contraseña2 = document.getElementById("contrasena2");

const inputs = document.querySelectorAll(".inputs");


const validacion = (e) => {
    switch (e.target.name){
        case "usuario":
            if (nombreDeUsuario.value === "" || nombreDeUsuario.value.charAt(0) === " " || nombreDeUsuario.value.length < 4){
                console.log("si");
                if (clase(nombreDeUsuario.classList) === "form-control2") {
                    nombreDeUsuario.classList.replace("form-control2","form-control3");
                }else if(clase(nombreDeUsuario.classList) === "form-control3"){
                }else if (clase(nombreDeUsuario.classList) === "form-control") {
                    nombreDeUsuario.classList.add("form-control3");
                }
                
            }else{
                console.log("no");
                if (clase(nombreDeUsuario.classList) === "form-control3") {
                    nombreDeUsuario.classList.replace("form-control3","form-control2");
                }else if(clase(nombreDeUsuario.classList) === "form-control2"){
                }else if (clase(nombreDeUsuario.classList) === "form-control") {
                    nombreDeUsuario.classList.add("form-control2");
                }
                
            }
            break;
        case "email":
            if (email.value === "" || email.value.charAt(0) === " " || contiene_arroba(email.value)){
                if (clase(email.classList) === "form-control2") {
                    email.classList.replace("form-control2","form-control3");
                }else if(clase(email.classList) === "form-control3"){
                }else if (clase(email.classList) === "form-control") {
                    email.classList.add("form-control3");
                }
                
            }else{
                if (clase(email.classList) === "form-control3") {
                    email.classList.replace("form-control3","form-control2");
                }else if(clase(email.classList) === "form-control2"){
                }else if (clase(email.classList) === "form-control") {
                    email.classList.add("form-control2");
                }
                
            }
            break;
        
        case "contrasena":
            if (contraseña.value.length < 4 || contraseña.value !== contraseña2.value){
                if (clase(contraseña.classList) === "form-control2") {
                    contraseña.classList.replace("form-control2","form-control3");
                    contraseña2.classList.replace("form-control2","form-control3");
                }else if(clase(contraseña.classList) === "form-control3"){
                }else if (clase(contraseña.classList) === "form-control") {
                    contraseña.classList.add("form-control3");
                    contraseña2.classList.add("form-control3");
                }
            }else{
                if (clase(contraseña.classList) === "form-control3") {
                    contraseña.classList.replace("form-control3","form-control2");
                    contraseña2.classList.replace("form-control3","form-control2");
                }else if(clase(contraseña.classList) === "form-control2"){
                }else if (clase(contraseña.classList) === "form-control") {
                    contraseña.classList.add("form-control2");
                    contraseña2.classList.add("form-control2");
                }
            }
            break;
        
        case "contrasena2":
            if (contraseña2.value.length < 4 || contraseña2.value !== contraseña.value){
                if (clase(contraseña2.classList) === "form-control2") {
                    contraseña.classList.replace("form-control2","form-control3");
                    contraseña2.classList.replace("form-control2","form-control3");
                }else if(clase(contraseña2.classList) === "form-control3"){
                }else if (clase(contraseña2.classList) === "form-control") {
                    contraseña.classList.add("form-control3");
                    contraseña2.classList.add("form-control3");
                }
                
            }else{
                if (clase(contraseña2.classList) === "form-control3") {
                    contraseña.classList.replace("form-control3","form-control2");
                    contraseña2.classList.replace("form-control3","form-control2");
                }else if(clase(contraseña2.classList) === "form-control2"){
                }else if (clase(contraseña2.classList) === "form-control") {
                    contraseña.classList.add("form-control2");
                    contraseña2.classList.add("form-control2");
                }
                
            }
            break;
    }
}
function contiene_arroba(Email){

    let arroba = true;
    for (let i = 0; i < Email.length; i++){

        if (Email.charAt(i) === '@'){

            arroba = false;
        }
    }
    return arroba;
}

function clase(c){

    let clas;
    for (let i = 0; i < c.length; i++){

        if (c[i] === "form-control"){

            clas = "form-control";
        }
        if (c[i] === "form-control2"){

            clas = "form-control2";
        }
        if (c[i] === "form-control3"){

            clas = "form-control3";
        }
    }
    return clas;
}

inputs.forEach((input)=>{
    input.addEventListener('blur', validacion);
});