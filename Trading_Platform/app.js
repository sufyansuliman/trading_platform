const express = require("express");
const app = express();
app.use(express.static("client"));
const Alpaca = require('@alpacahq/alpaca-trade-api')

const alpaca = new Alpaca({
    keyId: 'PKCSTHBU44RUKFDMOQ74',
    secretKey: 'GOoF11seN9k3BvcVIYPsK5LN7GstiNiZJ9sgxQg1',
    paper: true
})

app.get("/api", (req, res) => {
    alpaca.getAccount().then((account)=>{
        res.send(JSON.stringify(account))
    })
})

app.listen(3000, () => {
    console.log("Server running on port 3000");
})

// {
//     id: '4c8a5d89-9f7f-44cf-988a-2eecb082cdef',
//     account_number: 'PA3L4TLY4TP3',
//     status: 'ACTIVE',
//     crypto_status: 'ACTIVE',
//     currency: 'USD',
//     buying_power: '200000',
//     regt_buying_power: '200000',
//     daytrading_buying_power: '0',
//     non_marginable_buying_power: '100000',
//     cash: '100000',
//     accrued_fees: '0',
//     pending_transfer_in: '0',
//     portfolio_value: '100000',
//     pattern_day_trader: false,
//     trading_blocked: false,
//     transfers_blocked: false,
//     account_blocked: false,
//     created_at: '2021-11-20T04:59:42.61861Z',
//     trade_suspended_by_user: false,
//     multiplier: '2',
//     shorting_enabled: true,
//     equity: '100000',
//     last_equity: '100000',
//     long_market_value: '0',
//     short_market_value: '0',
//     initial_margin: '0',
//     maintenance_margin: '0',
//     last_maintenance_margin: '0',
//     sma: '0',
//     daytrade_count: 0
//   }
  