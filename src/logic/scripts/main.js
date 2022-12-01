///validaciones de formularios


//que seleccione el input vacio
let log=document.getElementById("log");
if(log !== null){
  let user= document.getElementById("users");
  log.addEventListener('click',(e)=>{
      if(user.value=="null"){
        e.preventDefault();
        alert("como quieres iniciar sesion");
        user.style.border="1px solid red";     
      }
    
  })
}

