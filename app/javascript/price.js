window.addEventListener('load', function(){
price_field = document.getElementById("item-price")

price_field.addEventListener("keyup", function(){

  let price = this.value;
  let fee = price / 10;
  let profit = price - fee;

  const fee_field = document.getElementById("add-tax-price");
  const profit_field = document.getElementById("profit");

  fee_field.textContent = fee;
  profit_field.textContent = profit;
  

});
})



