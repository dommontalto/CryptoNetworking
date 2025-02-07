//
//  CoinDetailsViewModel.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 07/02/2025.
//

import Foundation

class CoinDetailsViewModel: ObservableObject {
    
    private let service = CoinDataService()
    private let coinId: String
    
    init(coinId: String) {
        self.coinId = coinId
        
        Task { await fetchCoinDetails() }
    }

    func fetchCoinDetails() async {
        do {
            let details = try await service.fetchCoinDetails(id: coinId)
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
        }
    }
}
