//
//  CryptoCell.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 01/07/2022.
//

import SwiftUI

struct CryptoCell: View {
    //MARK: -PROPERTIES
    let crypto: CryptoViewModel
    private let positiveChangeColor = Color.greenish
    private let negativeChangeColor = Color.red
        
    @Binding var showLocaleCurrency: Currencies
    
    
    //MARK: -BODY
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(crypto.symbol)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .aspectRatio(contentMode: .fit)
                    .neurographicShadow()
                
                VStack(alignment: .leading) {
                    Text(crypto.name)
                        .foregroundColor(.grayish)
                    Text(String(format: "%.3f", crypto.change))
                        .foregroundColor(crypto.change > 0.0 ? positiveChangeColor : negativeChangeColor)
                }//: VSTACK
                
                Spacer()
                VStack(alignment:.center, spacing: 0) {
                    PriceView(price: crypto.formattedPrice)
                    Spacer()
                    PriceView(price: crypto.sekPrice)
                        .opacity(showLocaleCurrency == .USD ? 0 : 1)
                        
                }
                .frame(height: 40, alignment: .center)
                    
                
            }//: HSTACK
            .neurographicShadow()
                .padding()
                .background(
                    Text(crypto.symbol.uppercased())
                        .font(.system(size: 65))
                        .rotationEffect(.degrees(-45))
                        .foregroundColor(.darkShadow)
                        .opacity(0.1)
                        .neurographicShadow()
                        .offset(x: 100)
                )
                .background(Color.base)
                .cornerRadius(28)
                .padding()
               /* .onTapGesture {
                    self.showLocaleCurrency.toggle()
                }*/
        }//: VSTACK
    }
}

//MARK: -PREIVIEW
struct CryptoCell_Previews: PreviewProvider {
    static var previews: some View {
        CryptoCell(crypto: cryptoVM, showLocaleCurrency: .constant(.USD))
    }
}
