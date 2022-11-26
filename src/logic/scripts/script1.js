// alert("hello world");


//evento para mostra categorias
const btnsCategory = document.querySelectorAll('.boton');
for (let i = 0; i < btnsCategory.length; i++) {
    if(btnsCategory[i].id=="todos"){
        btnsCategory[i].addEventListener('click',()=>{
            window.location.href='home.php';
        });

    }else{
        btnsCategory[i].addEventListener('click',()=>{
            window.location.search=`?category=${btnsCategory[i].id}`
        });
    }
}

//codiog del buscador
$(document).ready(function (){
 let content = document.getElementById("listbusq");
 let list=document.getElementById("list");

 //evento que agrega la clases de inmovilidad
 $('#luck').focus(function () {
    content.classList.add('notMovLIst');
    $('#nav').addClass('notMove');

    if($('#hamburger').length !== 0){
        $('#hamburger').hide();
    }
 })

 //evento que  elimina la clase de inmovilidad
 $('#close').click(function (){
    content.classList.remove('notMovLIst');
    $('#nav').removeClass('notMove');
    $('#hamburger').show();
 })

 //evento que busca  el elemento
 $('#luck').keyup(function (e) {
     
       


        $.ajax({
         url:'src/logic/server.php',
         type:'GET',
         data:{activity:'search',namecurso:$('#luck').val()},
         success: function (request) {
             //  showCourses('cursos',request);
             let data = JSON.parse(request);

              if(data.length == 0 || $('#luck').val() == ""){
                 list.innerHTML="<p>no hay datos</p>"
              }else{
                list.innerHTML=" ";
                for (let i = 0; i < data.length; i++) {
                    const element = data[i];
  
                    list.innerHTML+=`
                                  <article>
                                     <p>${element.nombre}</p>
                                     <p>${element.descripcion}</p>
                                  </article>
                                `;  
                 }
              }

             console.log(data)
         }
     });


   })
})