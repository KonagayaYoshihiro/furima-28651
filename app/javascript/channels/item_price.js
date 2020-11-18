window.addEventListener('load', () => {
  const priceInput = document.getElementById("price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(inputValue * 0.9)
  })
});

