//
//  CustomButtonModifier.swift
//  ParRange
//
//  Created by Maxence Mottard on 26/04/2021.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.primaryColor)
            .foregroundColor(.white)
    }
}

extension View {
    func customButton() -> some View{
        self.modifier(CustomButtonModifier())
            .cornerRadius(7)
    }
    
    func customButtonGlowed() -> some View {
//        self.customButton()
//            .background(Color.primaryColor.blur(radius: 10))
        
        self.customButton()
            .shadow(color: .primaryColor, radius: 6)
    }
    
    func customCircleButton() -> some View {
        self.modifier(CustomButtonModifier())
            .clipShape(Circle())
    }
    
    func customCircleButtonGlowed() -> some View {
        self.customCircleButton()
            .shadow(color: .primaryColor, radius: 6)
    }
}
