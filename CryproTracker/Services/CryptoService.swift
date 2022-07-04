//
//  CryptoService.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 30/06/2022.
//

import Foundation
import Combine

// https://api.wazirx.com/sapi/v1/tickers/24hr

final class CryptoService {
    
   // let url = URL(string: "https://api.wazirx.com/sapi/v1/tickers/24hr")
    
   // let symbols = ["btc","eth", "usdt", "xrp","bch","ada","ltc","cro"]
    
    lazy var urlComponents: URLComponents = {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "api.wazirx.com"
        component.path = "/sapi/v1/tickers/24hr"
      //  component.queryItems = [URLQueryItem(name: "base", value: "USD")]
        return component
    }()
    
    // parameters can be generics
    func getCryptoList() -> AnyPublisher<[CryptoResponse], Error>? {
        guard let url = urlComponents.url else { return nil }
        
        print(url)
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [CryptoResponse].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
