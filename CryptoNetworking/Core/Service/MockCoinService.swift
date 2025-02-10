//
//  MockCoinService.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 10/02/2025.
//

class MockCoinService: CoinServiceProtocol {
    func fetchCoins() async throws -> [Coin] {
        return [Coin(id: "bitcoin", symbol: "btc", name: "Bicoin", currentPrice: 100000, marketCapRank: 1)]
    }
    
    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let description = Description(text: "Biggest crypto coin ever")
        return CoinDetails(id: "bitcoin", name: "Bicoin", symbol: "btc", description: Description(text: "Biggest crypto coin ever"))
    }
}
