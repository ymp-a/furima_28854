window.addEventListener('keyup', function(){
  // 販売金額の値取得
  const keyup = document.getElementById("item-price").value
  // 整数のみ小数点以下切り捨て表示
  const taxid = Math.floor(keyup / 10);
  const profitid = Math.floor(keyup * 9 / 10);
  // 販売手数料
  const tax = document.getElementById("add-tax-price")
  tax.innerHTML = taxid
  // 販売利益
  const item_profit = document.getElementById("profit")
  item_profit.innerHTML = profitid

  console.log(tax.innerHTML)
  console.log(item_profit.innerHTML)
})