//
//  CryptoListView.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 02/07/2022.
//

import SwiftUI


enum Currencies:Int {
    case USD = 0
    case KR = 1
}

struct CryptoListView: View {
    //MARK: -PROPERTIES
    @ObservedObject private var vm = CryptoListViewModel()
    @State private var showLocaleCurrency = Currencies.USD
    
    init() {
         vm.getCryptoList()
        UISegmentedControl.appearance().selectedSegmentTintColor = .blue
         UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
         UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .normal)

    }
    
    //MARK: -BODY
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.base
                    .ignoresSafeArea()
                VStack {
                    Text("Crypto Tracker")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .neurographicShadow()
                    
                    Picker("", selection: $showLocaleCurrency) {
                        Text("KR").tag(Currencies.KR)
                        Text("USD").tag(Currencies.USD)
                    }//: PICKER
                    .pickerStyle(.segmented)
                    .frame(width: 200)
                    .neurographicShadow()
                    
                    if vm.cryptoList.isEmpty {
                       CustomProgressView()
                    }
                    ScrollView {
                        LazyVStack(alignment: .center) {
                            ForEach(vm.cryptoList) { crypto in
                                CryptoCell(crypto: crypto, showLocaleCurrency: $showLocaleCurrency)
                                    .neurographicShadow()
                            }//: LOOP
                        }//: VSTACK
                    }//: SCROLLVIEW
                    .padding(.bottom, 16)
                }
               
            }//: ZSTACK
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.all)
    }
}

//MARK: -PREVIEW
struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
