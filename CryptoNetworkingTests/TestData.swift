//
//  TestData.swift
//  CryptoNetworkingTests
//
//  Created by Dominic Montalto on 10/02/2025.
//

import Foundation

// 3 coins
let mockCoinsData_marketCapDesc: Data = """
[
    {
        "id": "bitcoin",
        "symbol": "btc",
        "name": "Bitcoin",
        "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        "current_price": 23378,
        "market_cap": 537783687806,
        "market_cap_rank": 1,
        "fully_diluted_valuation": 654826805215,
        "total_volume": 13404020422,
        "high_24h": 23424,
        "low_24h": 22942,
        "price_change_24h": -60.19,
        "price_change_percentage_24h": -0.25705,
        "market_cap_change_24h": -1400093300.0,
        "market_cap_change_percentage_24h": -0.2599,
        "circulating_supply": 19371181,
        "total_supply": 21000000,
        "ath": 68789.0,
        "ath_change_percentage": -66.074,
        "ath_date": "2021-11-10T14:24:11.849Z",
        "atl": 67.81,
        "atl_change_percentage": 34324.39,
        "atl_date": "2013-07-06T00:00:00.000Z",
        "last_updated": "2023-03-31T17:32:09.847Z",
        "price_change_percentage_24h_in_currency": -0.25899
    },
    {
        "id": "ethereum",
        "symbol": "eth",
        "name": "Ethereum",
        "image": "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
        "current_price": 1559.86,
        "market_cap": 199466866649,
        "market_cap_rank": 2,
        "fully_diluted_valuation": 199466866649,
        "total_volume": 7711183174,
        "high_24h": 1577.87,
        "low_24h": 1526.6,
        "price_change_24h": -7.26,
        "price_change_percentage_24h": -0.464,
        "market_cap_change_24h": -504553965.72345,
        "market_cap_change_percentage_24h": -0.25147,
        "circulating_supply": 122173521.193191,
        "total_supply": 122173521.193191,
        "ath": 4878.26,
        "ath_change_percentage": -68.039,
        "ath_date": "2021-11-10T14:24:19.604Z",
        "atl": 0.432979,
        "atl_change_percentage": 359227.08,
        "atl_date": "2015-10-20T00:00:00.000Z",
        "last_updated": "2023-03-31T17:32:12.057Z",
        "price_change_percentage_24h_in_currency": -0.6479
    },
    {
        "id": "tether",
        "symbol": "usdt",
        "name": "Tether",
        "image": "https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663",
        "current_price": 1.0,
        "market_cap": 82781907825,
        "market_cap_rank": 3,
        "fully_diluted_valuation": 82781907825,
        "total_volume": 34219000429,
        "high_24h": 1.01,
        "low_24h": 0.998729,
        "price_change_24h": 0.00172,
        "price_change_percentage_24h": 0.172,
        "market_cap_change_24h": 106668583.556,
        "market_cap_change_percentage_24h": 0.129,
        "circulating_supply": 82781907825,
        "total_supply": null,
        "ath": 1.32,
        "ath_change_percentage": -24.336,
        "ath_date": "2018-07-24T00:00:00.000Z",
        "atl": 0.572521,
        "atl_change_percentage": 74.648,
        "atl_date": "2015-03-02T00:00:00.000Z",
        "last_updated": "2023-03-31T17:32:08.550Z",
        "price_change_percentage_24h_in_currency": 0.00197
    }
]
""".data(using: .utf8)!
