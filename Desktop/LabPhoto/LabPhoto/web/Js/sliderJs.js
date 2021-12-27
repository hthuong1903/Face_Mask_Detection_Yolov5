//khoi tao indexSlide = 1 
var slideIndex = 1;
//function next/prev control
function plusDivs(n) {
  showDivs(slideIndex += n);
}
//
function showDivs(n) {
  // khoi tao bien i 
  var i;
  // x return NodeList
  var x = document.getElementsByClassName("show");
  // x.length return number of node in nodelist
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  
  //loop for from first node to last node in Nodelist 
  for (i = 0; i < x.length; i++) {
      //hidden node
    x[i].style.display = "none";  
  }
  //display next node or pre node
  x[slideIndex-1].style.display = "block";
}

setInterval(function () {
  plusDivs(1);
}, 1000);


