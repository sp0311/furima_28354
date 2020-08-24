// document.addEventListener("turbolinks:load", function () {
//   $("#item_price").on("keyup", function () {
//     console.log("ok");
//     let price = $(this).val();
//     let ”add-tax-price” = Math.round(price * 0.1);
//     let ”add-tax-price” = Math.round(price * 0.9);
//     let profit = price - "add-tax-price";
//     $("#add-tax-price").text(add-tax-price);
//     $("#profit").text(profit);
//   });
// });

// console.log("this")
// window.addEventListener('load', function(){
// price = document.getElementById("item-price")
// fee = document.getElementById("add-tax-price")
// profit = document.getElementById("profit")

// price.addEventListener(input)
// document.getElementById("item-price").value;
// fee.innerHTML =  Math.round(price * 0.1);
// profit.innerHTML =  Math.round(price * 0.9);
// })

// console.log("this")
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

// fee = document.getElementById("add-tax-price")
// profit = document.getElementById("profit")



// price.addEventListener(input)
// document.getElementById("item-price").value;
// fee.innerHTML =  Math.round(price * 0.1);
// profit.innerHTML =  Math.round(price * 0.9);
})



