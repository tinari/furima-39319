document.addEventListener("DOMContentLoaded", () => {
 const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue= priceInput.value;

    const addTaxDom= document.getElementById("add-tax-price");
    const profitDom= document.getElementById("profit");
  
    const taxRate= 0.1;
    const taxAmount= Math.floor(inputValue * taxRate);

    const profitAmount = inputValue - taxAmount;
    
    addTaxDom.innerHTML= `${taxAmount}`;
    profitDom.innerHTML= `${profitAmount}`;
  });
});


