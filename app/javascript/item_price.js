document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const price = parseInt(inputValue, 10);

    if (isNaN(price)) {
      addTaxDom.innerHTML = '';
      profitDom.innerHTML = '';
      return;
    }

    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    addTaxDom.innerHTML = tax.toLocaleString();
    profitDom.innerHTML = profit.toLocaleString();
  });
});