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
    
    private let service = CoinDataService()
    
    init() {
        fetchCoinsWithResult()
    }
    
    // NEW
    func fetchCoinsWithResult() {
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
    
    // OLD
    func fetchCoins() {
        service.fetchCoins { coins, error in
            DispatchQueue.main.async {
                if let error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                self.coins = coins ?? []
            }
        }
    }
}
