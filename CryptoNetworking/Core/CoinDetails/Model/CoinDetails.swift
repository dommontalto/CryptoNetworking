//
//  CoinDetails.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 07/02/2025.
//

struct CoinDetails: Decodable {
    var id: String
    var name: String
    var symbol: String
    var description: Description
}

struct Description: Decodable {
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case text = "en"
    }
}
