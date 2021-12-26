function calc(){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("input", () => {
    const PriceValue = itemPrice.value;
    const tax = 0.1;
    const taxFee = PriceValue * tax;
    const profit = PriceValue - taxFee;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profitInput = document.getElementById("profit");
    addTaxPrice.innerHTML = taxFee;
    profitInput.innerHTML = profit;

  });
};

window.addEventListener('load', calc)