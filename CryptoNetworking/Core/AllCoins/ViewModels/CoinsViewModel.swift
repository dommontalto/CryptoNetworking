//
//  CoinsViewModel.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 16/01/2025.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coin = ""
    @Published var price = ""
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        fetchPrice(coin: "bitcoin")
    }
    
    func fetchPrice(coin: String) {
        service.fetchPrice(coin: coin) { price in
            DispatchQueue.main.async {
                self.price = "$\(price))"
                self.coin = coin
            }
        }
    }
}
