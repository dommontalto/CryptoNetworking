//
//  CoinDetailsViewModel.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 07/02/2025.
//

import Foundation

class CoinDetailsViewModel: ObservableObject {
    private let service: CoinServiceProtocol
    private let coinId: String
    
    @Published var coinDetails: CoinDetails?
    
    init(service: CoinServiceProtocol, coinId: String) {
        self.service = service
        self.coinId = coinId
    }
    
    @MainActor
    func fetchCoinDetails() async {
        do {
            self.coinDetails = try await service.fetchCoinDetails(id: coinId)
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
        }
    }
}
