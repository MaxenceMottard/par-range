//
//  Popup.swift
//  ParRange
//
//  Created by Maxence Mottard on 26/04/2021.
//

import SwiftUI

struct Popup<A: View>: View {
    let contentView: A
    @Binding var isShow: Bool
    @State private var location: CGPoint = .zero
    
    init(_ isShow: Binding<Bool>, contentView: () -> (A)) {
        self.contentView = contentView()
        self._isShow = isShow
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                
                if isShow {
                    contentView
                        .padding(.vertical, 30)
                        .padding(.horizontal)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(20.0)
                        .padding(.horizontal)
                        .padding(.bottom, geometry.safeAreaInsets.bottom)
                        .transition(.move(edge: .bottom))
                        .animation(.easeOut)
                        .offset(y: location.y)
                        .foregroundColor(.white)
                }
            }.ignoresSafeArea()
            .background(backgroundColor)
        }
    }
    
    var backgroundColor: some View {
        Group {
            if isShow {
                Color.black.opacity(0.4).ignoresSafeArea().onTapGesture { closePopup() }.transition(.opacity)
                    .animation(.easeOut)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                let offset = CGPoint(x: 0, y: (value.location.y - value.startLocation.y))
                                
                                if offset.y > 0 {
                                    location = offset
                                }
                            })
                            .onEnded({ value in
                                let offset = CGPoint(x: 0, y: (value.location.y - value.startLocation.y))
                                if offset.y > 100 {
                                    closePopup()
                                } else {
                                    location = .zero
                                }
                            })
                    )
            }
        }
    }
    
    func closePopup() {
        withAnimation {
            isShow = false
        }
        location = .zero
    }
}

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Popup(Binding.constant(true)) {
            VStack {
                Text("Hi !")
                Text("This is a beautiful popup.")
                
                Button(action: {}, label: {
                    Text("Click here")
                }).padding()
            }
        }
    }
}
