//
//  NeurographicShadow.swift
//  CryproTracker
//
//  Created by Mehmet Seyhan on 01/07/2022.
//

import Foundation
import SwiftUI

struct NeurographicShadow: ViewModifier  {
    //MARK: -BODY
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.grayish.opacity(0.1), radius: 5, x: -5, y: -5)
            .shadow(color: Color.darkShadow.opacity(0.2), radius: 5, x: 5, y: 5)
    }
}

extension View {
    func neurographicShadow() -> some View {
        return self.modifier(NeurographicShadow())
    }
}
