//
//  CurrentHoleView.swift
//  ParRange
//
//  Created by Maxence Mottard on 26/04/2021.
//

import SwiftUI

struct CurrentHoleView: View {
    let hole: Hole
    let openPopupFunction: () -> ()
    
    var body: some View {
        VStack {
            Text(hole.name.capitalized)
                .font(.title3)
            if hole.par != .unset {
                Text(hole.formatedPar.capitalized)
            }
            
            Button { openPopupFunction() } label: {
                Text("Ajouter le score")
            }.padding()
        }.padding(.vertical)
    }
}

struct CurrentHoleView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentHoleView(hole: Hole(par: .three, holeNumber: 4)) {}
    }
}
