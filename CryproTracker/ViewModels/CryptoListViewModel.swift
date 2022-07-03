//
//  CryptoListViewModel.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 01/07/2022.
//

import Foundation
import Combine

class CryptoListViewModel: ObservableObject {
    //MARK: -PROPERTIES
    @Published var cryptoList = [CryptoViewModel]()
    
    private let cryptoService = CryptoService()
    var cancellable: AnyCancellable?
    
    //MARK: -FUNCTIONS
    func getCryptoList() {
        guard let getCryptoList = cryptoService.getCryptoList() else {
            print("no data")
            return
        }
        
       cancellable = getCryptoList.sink { err in
            print(err)
        } receiveValue: { cryptoListRes in
            print("Data \(cryptoListRes)")
            self.cryptoList = cryptoListRes.map{CryptoViewModel(cryptoResponse: $0)}
        }
        
    }
    
    //find and show it
    func showSekCurrency(item: CryptoViewModel) {
        if let row = self.cryptoList.firstIndex(where: {$0.baseAsset == item.baseAsset}) {
            self.cryptoList[row].toShowSekPrice = true
            print("Sondurum \(self.cryptoList)")
        }
        print("Sondurum \(self.cryptoList)")
        print("Sondurum1 \(item)")

    }
}
