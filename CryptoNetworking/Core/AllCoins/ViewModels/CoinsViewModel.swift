//
//  CoinsViewModel.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 16/01/2025.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    
    private let service: CoinDataService
    
    init(service: CoinDataService) {
        self.service = service
        Task { await fetchCoins() }
    }
    
    @MainActor
    func fetchCoins() async {
        do {
            self.coins = try await service.fetchCoins()
        } catch {
            guard let error = error as? CoinAPIError else { return }
            self.errorMessage = error.customDescription
        }
    }
    
    // SLIGHTLY OLD
    func fetchCoinsWithCompletionHandler() {
        service.fetchCoinsWithResult { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                switch result {
                case .success(let coins):
                    self.coins = coins
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
