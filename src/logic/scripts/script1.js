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

//instrucciones para que el buscador trabaje
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
                                     <a href="home.php?id_curso=${element.codigo}&&menu=curso">ver mas del curso</a>
                                  </article>
                                `;  
                 }
              }

             console.log(data)
         }
     });


   })
})



//codigo para eventos de cambiar formulario
$(document).ready(function () {

    //para editar el formualrio
   $('#edit').click((e)=>{
       $('#formdata').addClass('show');     
   })
    
    //para no editar el formulario
   $('#cancel').click(function (e) {
       //evita mandar cosas al servidor
      e. preventDefault();
      $('#formdata').removeClass('show');

   });

   //para guardar los cambios
   $('#save').click(function (e) {
       let confrmar = confirm("esta seguro que quieres realizar estos cambios");
       if(!confrmar){
        e. preventDefault();
       }

   });

    // console.log($('#formdata').childre("input").length);
})




