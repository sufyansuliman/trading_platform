function runIt(){
    fetch('http://localhost:3000/api')
        .then(response => response.json())
        .then(data => {
            document.getElementById("buyingPower").innerHTML = data.buying_power
            document.getElementById("currency").innerHTML = data.currency
            document.getElementById("portfolioValue").innerHTML = data.portfolio_value
        });
}
