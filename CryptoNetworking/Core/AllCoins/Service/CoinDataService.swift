//
//  CoinDataService.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 28/01/2025.
//

import Foundation

protocol HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T
}

extension HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw CoinAPIError.requestFailed(description: "Invalid URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw CoinAPIError.requestFailed(description: "Request Failed")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw CoinAPIError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("DEBUG: Error \(error)")
            throw error as? CoinAPIError ?? .unknownError(error: error)
        }
    }
}

class CoinDataService: HTTPDataDownloader {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    func fetchCoins() async throws -> [Coin] {
        return try await fetchData(as: [Coin].self, endpoint: urlString)
    }
    
    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let detailsUrlString = "https://api.coingecko.com/api/v3/coins/\(id)?localization=false"
        return try await fetchData(as: CoinDetails.self, endpoint: detailsUrlString)
    }
}

extension CoinDataService {
    // SLIGHTLY OLD
    func fetchCoinsWithResult(completion: @escaping (Result<[Coin], CoinAPIError>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(.success(coins))
                
            } catch  {
                print("DEBUG: Failed to decode with error: \(error)")
                completion(.failure(.jsonParsingFailure))
            }
            
        }.resume()
    }
    
    // EXTEMELY OLD
    func fetchCoins(completion: @escaping ([Coin]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(nil, error)
                return
            }
            
            guard let data else { return }
            
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else { return }
            
            completion(coins, nil)
            
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



