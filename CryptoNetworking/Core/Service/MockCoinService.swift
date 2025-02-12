//
//  MockCoinService.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 10/02/2025.
//

import Foundation

class MockCoinService: CoinServiceProtocol {
    
    var mockData: Data?
    var mockError: CoinAPIError?
    
    func fetchCoins() async throws -> [Coin] {
        if let mockDataError = mockError { throw mockDataError }
        
        do {
            let coins = try JSONDecoder().decode([Coin].self, from: mockData ?? mockCoins_marketCapDesc)
            return coins
        } catch {
            throw error as? CoinAPIError ?? .unknownError(error: error)
        }
    }
    
    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let description = Description(text: "Test description")
        let bitcoinDetails = CoinDetails(id: "bitcoin", name: "Bitcoin", symbol: "btc", description: description)
        return bitcoinDetails
    }
    
    func doSomething() {
        print("Do stuff")
    }
}
