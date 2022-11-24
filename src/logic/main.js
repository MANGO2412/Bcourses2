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
                               <li><a href="src/views/curso.php?id_curso=${curso.codigo}">ver</a></li>  
                             </ul>
                          </article>   
                            `;      
    }
}

//----------------------------------------------------------------------------------------------------------------










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
                 showCourses('cursos',request);
            }
        });
    });   
    
 }else{
    $(document).ready(function () {
    
        //make request to get one courses
        $.ajax({
            url:'../logic/server.php',
            type:'POST',
            data:{activity:'oneGetCourse',idC:virifyEL.id},
            success: function (request) {
                 console.log(request);
            }
        });
    });    
 }


