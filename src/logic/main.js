//method to show all courses
function showCourses(elementid,data){
    const  element= document.getElementById(elementid);
    const dataArra= JSON.parse(data);


    for (let i = 0; i < dataArra.length; i++) {
        let curso=dataArra[i];
       element.innerHTML +=`
                          <article>
                             <ul class="cursos_style">
                               <li>${curso.nombre}</li>
                               <li><img src=${curso.imagen}></li>
                               <li><p>${curso.costo}</p><li>
                               <li><a href="home.php?id_curso=${curso.codigo}&&menu=curso">ver</a></li>
                             </ul>
                          </article>   
                            `;      
    }
}

//----------------------------------------------------------------------------------------------------------------
function showOneCourse(elementid,data) {
    const element = document.getElementById(elementid);
    const dataArra= JSON.parse(data);


    for (let i = 0; i < dataArra.length; i++) {
        let curso=dataArra[i];
        let temaslist="";

                for (let i = 0; i < curso.temas.length; i++) {
                    const element = curso.temas[i];
                    for (const key in element) {
                       temaslist+=`<p>●${element[key]}</p>`
                    }
                    
                }

       element.innerHTML +=`
       <section id="dividida">
       <div class = izqres>
          <br>
      <p class="p3">${curso.nombre}</p>
      <p class="p4">${curso.descripcion}</p>
          </div>
          <div class = derres>
           <img class="imgxd" src="css/mcf.png">
          </div>
          </section>
          <section id="dividida">
              <div class = izqapren>
                 <br>
             <p class="p5">¿Qué es lo que vas a aprender?</p>
             <br>
             <div class="p6">
               ${temaslist}
              </div>
              <br>
             
             <p class="p7">ACERCA DEL INSTRUCTOR</p>
             <div class="perfil">
              <br>
              <img class="imgperf" src="img/david.jpeg">
              
              <br>
              <p class="nombrexd">${curso.maestro}</p>
              <p class="area"></p>
              <br>
              <br>
          </div>
                 </div>
                 <div class = derapren>
                  <br>
                 <div class="precio">
                  <br>
                  <p class="prec">${curso.costo} MXN</p>
                  <ul class="botonesxd">
                  <li><a href="comprar.php">Comprar curso</a></li>
                  </ul>
                  <p class="adv">Una vez realizada la compra no podras cancelar tu compra.</p>
                  <br>
                  <br>
                 </div>
                 <br>
                 <br>
              <div class="hora">
                 <span class="hora">Horarios: 7:00 - 9:00 am</span><br>
                 <span class="hora">Personas inscritas al curso: ${curso.cantidad}/30 </span><br>
                 <span class="hora">Fecha de inicio: ${curso.fechaIN}</span><br>
                 <span class="hora">Fecha de fin: ${curso.fechaFIN}</span><br>
              </div>   
              </div>
              
                 </section>
                            `;      
    }

}









//-----------------------------------------------------------------------------------------------------------------


const virifyEL = document.querySelector('.curso')
if(virifyEL == null){
    $(document).ready(function () {
    
        //make request to get all courses
        $.ajax({
            url:'src/logic/server.php',
            type:'POST',
            data:{activity:'getcourses'},
            success: function (request) {
                //  console.log(request);
                  showCourses('cursos',request);
            }
        });
    });   
    
 }else{
    $(document).ready(function () {
    
        //make request to get one courses
        $.ajax({
            url:'src/logic/server.php',
            type:'POST',
            data:{activity:'oneGetCourse',idC:virifyEL.id},
            success: function (request) {
                //   console.log(request);
                 showOneCourse(virifyEL.id,request)
            }
        });
    });    
 }



