//
//  CoinDetails.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 07/02/2025.
//

struct CoinDetails: Codable {
    var id: String
    var name: String
    var symbol: String
    var description: Description
}

struct Description: Codable {
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case text = "en"
    }
}
