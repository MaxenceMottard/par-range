//
//  CurrentPartyPopupView.swift
//  ParRange
//
//  Created by Maxence Mottard on 26/04/2021.
//

import SwiftUI

struct CurrentPartyPopupView: View {    
    @ObservedObject var viewModel: CurrentPartyPopupViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.hole.name.capitalized)
                .font(.title)
                .padding(.bottom)
            
            if viewModel.state == .par {
                parView.transition(.move(edge: .leading))
            }
            
            if viewModel.state == .score {
                scoreView.transition(.move(edge: .trailing))
            }
            
            Button(action: viewModel.validate, label: {
                Text("Valider")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .customButtonGlowed()
            })
        }
    }
    
    var parView: some View {
        VStack {
            Text("Configurez le par pour ce trou.")
            
            Picker("Par", selection: $viewModel.pickerParValue) {
                ForEach(Hole.Par.allCases.filter({ $0 != .unset }), id: \.self) { par in
                    Text("\(par.rawValue)")
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
    }
    
    var scoreView: some View {
        VStack {
            Text("Ajoutez votre score.")
            
            Picker("Score", selection: $viewModel.pickerScoreValue) {
                ForEach(viewModel.hole.par.availableScores, id: \.self) { score in
                    if score == -1 {
                        Text("\(viewModel.hole.par.maximumScore)+")
                    } else {
                        Text("\(score)")
                    }
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
    }
}

struct CurrentPartyPopupView_Previews: PreviewProvider {
    static var previews: some View {
        Popup(Binding.constant(true)) {
            ViewProvider.CurrentParty.popup(hole: Hole(par: .five, holeNumber: 3), handleValidate: { _, _ in })
        }.preferredColorScheme(.dark)

        Popup(Binding.constant(true)) {
            ViewProvider.CurrentParty.popup(hole: Hole(par: .five, holeNumber: 3), handleValidate: { _, _ in })
        }
    }
}
