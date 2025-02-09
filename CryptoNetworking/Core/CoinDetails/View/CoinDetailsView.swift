//
//  CoinDetailsView.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 07/02/2025.
//

import SwiftUI

public struct CoinDetailsView: View {
    let coin: Coin
    @ObservedObject private var viewModel: CoinDetailsViewModel
    
    init(coin: Coin, service: CoinDataService) {
        self.coin = coin
        self.viewModel = CoinDetailsViewModel(service: service, coinId: coin.id)
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            if let details = viewModel.coinDetails {
                Text(details.name)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                
                Text(details.id.uppercased())
                    .font(.footnote)
                
                Text(details.description.text)
                    .font(.footnote)
                    .padding(.vertical)
            }
        }
        .task {
            await viewModel.fetchCoinDetails()
        }
        .padding()
    }
}


//#Preview {
//    CoinDetailsView()
//}
