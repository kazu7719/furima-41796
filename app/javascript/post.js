function post (){

const itemprice = document.getElementById("item-price")
itemprice.addEventListener("input", () => {
  const counttax = itemprice.value;
  const addtaxprice  = document.getElementById("add-tax-price");
  addtaxprice.innerHTML = Math.floor ( counttax * 0.1 ) ;
  const profitprice = document.getElementById("profit");
  profitprice.innerHTML = Math.floor ( counttax - addtaxprice.innerHTML ) ;
});
};

window.addEventListener('turbo:load',post);
window.addEventListener("turbo:render", post);