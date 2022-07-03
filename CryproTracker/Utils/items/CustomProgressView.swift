//
//  CustomProgressView.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 02/07/2022.
//

import SwiftUI

struct CustomProgressView: View {
    
    //MARK: -BODY
    var body: some View {
       ProgressView("Please wait...")
           .progressViewStyle(CircularProgressViewStyle(tint: .purple))
           .foregroundColor(.green)

    }
}

//MARK: -PREVIEW
struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView()
    }
}
