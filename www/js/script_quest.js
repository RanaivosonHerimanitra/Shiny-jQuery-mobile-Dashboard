var page_courante = 1;
$(function() {
  $(document).keyup( function(e) {
   switch( e.keyCode) {
     case 39:
       suivant(8);
       break;
     case 37:
       precedent(8);
       break;
   };
  });
});
function suivant(n)
{
    if (page_courante!=n) { //parameter n where n is the last page index
           page_courante++;
          $('#page' + page_courante ).show();
          for (var j=1;j<page_courante;j++) {
            $('#page' + j ).hide();
           }
          if ( j<n ) { //parameter n where n is the last page index
              for (var j=page_courante+1;j<n+1;j++) { //parameter n+1
                   $('#page' + j ).hide();
              }
          }
          
       } else {
         console.log('you are on the last page');
       }
}

function precedent(n)
{
   if (page_courante!=1) { 
           page_courante--;
          $('#page' + page_courante ).show();
          for (var j=1;j<page_courante;j++) {
            $('#page' + j ).hide();
           }
          if ( j<n) { //parameter n where n is the last page index
              for (var j=page_courante+1;j<n+1;j++) { //parameter n+1
                   $('#page' + j ).hide();
              }
          }
          
       } else {
         console.log('you are on the first page');
       } 
}



//function initialisation()
//{
 
   // var page1=document.getElementById("page1");
    //page1.style.display="";
    //$('#page1').show();
    //var page2=document.getElementById("page2");
    //page2.style.display="none";
    //$('#page2').hide();
    //var page3=document.getElementById("page3");
    //page3.style.display="none";  
    //$('#page3').hide();
    //var page4=document.getElementById("page4");
    //page4.style.display="none";
    //$('#page4').hide();
    //var page5=document.getElementById("page5");    
   // page5.style.display="none";
   // var page6=document.getElementById("page6");    
    //page6.style.display="none";
   // var page7=document.getElementById("page7");    
   // page7.style.display="none";
   // var page8=document.getElementById("page8");    
   // page8.style.display="none";
  
//}

