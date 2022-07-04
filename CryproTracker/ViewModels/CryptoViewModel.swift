//
//  CryptoViewModel.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 01/07/2022.
//

import Foundation
import SwiftUI


struct CryptoViewModel: Identifiable {
    var id: UUID {
        return UUID()
    }
    
    //DI
    let cryptoResponse: CryptoResponse

    var name: String {
        return cryptoResponse.baseAsset
    }
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: Double(cryptoResponse.lastPrice)! as NSNumber)!
    }
    
    var sekPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "sv_SE")
        formatter.numberStyle = .currency
        return formatter.string(from: (Double(cryptoResponse.lastPrice)! * oneSekToDolar) as NSNumber)!
    }
    
    var toShowSekPrice: Bool = false
    
    var price: String {
        return cryptoResponse.lastPrice
    }
    
    var symbol: String {
        return cryptoResponse.baseAsset.lowercased()
    }
    
    var change: Double {
        return Double(cryptoResponse.lastPrice)! - Double(cryptoResponse.openPrice)!
    }
    
    var baseAsset: String {
        return cryptoResponse.baseAsset
    }
}
