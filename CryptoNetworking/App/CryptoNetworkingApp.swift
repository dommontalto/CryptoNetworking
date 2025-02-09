//
//  CryptoNetworkingApp.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 14/01/2025.
//

import SwiftUI

@main
struct CryptoNetworkingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(service: CoinDataService())
        }
    }
}
