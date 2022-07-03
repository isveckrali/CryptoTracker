//
//  PriceView.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 02/07/2022.
//

import SwiftUI

struct PriceView: View {
    //MARK: -PROPERTIES    
    var price: String
    
    //MARK: -BODY
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Text(price)
                .foregroundColor(.grayish)
                .font(.footnote)
        }//: VSTACK
    }
}

//MARK: -PREVIEW
struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(price: "123")
    }
}
