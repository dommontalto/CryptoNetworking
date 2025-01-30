//
//  CoinDataService.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 28/01/2025.
//

import Foundation

class CoinDataService {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    func fetchCoins(completion: @escaping ([Coin]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
           
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else { return }
            
            completion(coins)
            
        }.resume()
    }
    
    func fetchPrice(coin: String, completion: @escaping (Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                if let error {
                    print("DEBUG: Failed with error \(error)")
                    //                self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    //                self.errorMessage = "Bad HTTP Response"
                    return
                }
                
                guard httpResponse.statusCode == 200 else {
                    //                self.errorMessage = "Failed to fetch with \(httpResponse.statusCode)"
                    return
                }
                
                guard let data else { return }
                guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
                guard let value = jsonObject[coin] as? [String: Double] else {
                    print("Failed to pass value")
                    return
                }
                guard let price = value["usd"] else { return }
                
                //            self.coin = coin.capitalized
                //            self.price = "$\(price)"
                completion(price)
            
        }.resume()
    }
}
