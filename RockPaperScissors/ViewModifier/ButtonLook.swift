//
//  ButtonLook.swift
//  RockPaperScissors
//
//  Created by Fatemeh NajafiMoghadam on 9/10/23.
//

import SwiftUI

struct ButtonLook: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .shadow(color: .white, radius: 3, x: 0.0, y: 0.0)
    }
}

extension View {
    func buttonStyle() -> some View {
        self.modifier(ButtonLook())
    }
}
