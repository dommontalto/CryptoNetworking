//
//  CoinImageView.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 12/02/2025.
//

import SwiftUI

struct CoinImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
        }
    }
}

#Preview {
    CoinImageView(url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")
}
