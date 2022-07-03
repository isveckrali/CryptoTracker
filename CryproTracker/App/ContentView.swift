//
//  ContentView.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 30/06/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: -PROPERTIES
    
    //MARK: -BODY
    var body: some View {
        CryptoListView()
    }
}

//MARK: -PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
