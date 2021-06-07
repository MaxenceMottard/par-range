//
//  CustomButtonModifier.swift
//  ParRange
//
//  Created by Maxence Mottard on 26/04/2021.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    var color: Color? = nil
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color ?? Color.primaryColor)
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
    
    func customCircleButton(color: Color? = nil) -> some View {
        self.modifier(CustomButtonModifier(color: color))
            .clipShape(Circle())
    }
    
    func customCircleButtonGlowed() -> some View {
        self.customCircleButton()
            .shadow(color: .primaryColor, radius: 6)
    }
}
