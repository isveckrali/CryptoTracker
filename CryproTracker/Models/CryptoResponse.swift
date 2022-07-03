//
//  CryptoResponse.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 01/07/2022.
//

import Foundation

struct CryptoResponse: Decodable {
    let symbol: String
    let baseAsset: String
    let quoteAsset: String
    let openPrice: String
    let lowPrice: String
    let highPrice: String
    let lastPrice: String
    let volume: String
    let bidPrice: String
    let askPrice: String
    let at: Int
}

