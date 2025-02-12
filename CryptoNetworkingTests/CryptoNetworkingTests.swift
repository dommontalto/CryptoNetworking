//
//  CryptoNetworkingTests.swift
//  CryptoNetworkingTests
//
//  Created by Dominic Montalto on 14/01/2025.
//

import XCTest
@testable import CryptoNetworking

final class CryptoNetworkingTests: XCTestCase {

    func test_DecodeCoinsIntoArray_marketCapDesc() throws {
        do {
            let coins = try JSONDecoder().decode([Coin].self, from: mockCoins_marketCapDesc)
            XCTAssertTrue(coins.count > 0) // ensures has coins
            XCTAssertEqual(coins.count, 3) // coins all were decode
            XCTAssertEqual(coins, coins.sorted(by: { $0.marketCapRank < $1.marketCapRank} )) // ensures sorting order
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
