<%@page import="Config.Config"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    
    
    CHANGE_AMOUNT_URL = '<%=Config.ITEM_CHANGE_API %>';
    function changeAmount(id, method) {
    const url = CHANGE_AMOUNT_URL + '?id=' + encodeURIComponent(id) + '&method=' + encodeURIComponent(method);

    fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // Parse response body as JSON
            })
            .then(data => {
                console.log('Success:', data);
                console.log('Success:', data["id"]);
                let span = document.getElementById("quantity_" + data["id"].toString());
                let input = document.getElementById("quantity_in_" + data["id"].toString());
                span.innerHTML = data["value"];
                input.value = data["value"];
                calculate();
                // Handle success response here if needed
            }).catch(error => {
        console.error('Error:', error);
        alert('Error:', error);
        // Handle error here if needed
    });
    ;
}

function calculate() {
    let old_prices = document.querySelectorAll('.old_price');
    let prices = document.querySelectorAll('.current_price');
    let quantities = document.querySelectorAll('.quantity');

    let total_discount = 0;
    let total_amount = 0;
    let final_amount = 0;
    let total_items = 0;

    for (let i = 0; i < old_prices.length; i++) {
        let quantity = parseInt(quantities[i].value.trim());
        let old_price = parseFloat(old_prices[i].value.trim());
        let price = parseFloat(prices[i].value.trim());

        total_amount += (old_price * quantity);
        final_amount += (price * quantity);
        if (old_price != price) {
            total_discount += ((old_price - price) * quantity);
        }
        total_items += quantity;
        console.log(quantity);
    }
    document.getElementById("total_items").innerHTML = total_items;
    document.getElementById("cart_number").innerHTML = total_items;
    document.getElementById("total_price").innerHTML = total_amount.toFixed(2) + " LKR";
    document.getElementById("final_price").innerHTML = final_amount.toFixed(2) + " LKR";
    document.getElementById("total_discount").innerHTML = total_discount.toFixed(2) + " LKR";
}
</script>
</body>
</html>