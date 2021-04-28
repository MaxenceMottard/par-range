//
//  CurrentPartyPopupViewModel.swift
//  ParRange
//
//  Created by Maxence Mottard on 26/04/2021.
//

import SwiftUI

final class CurrentPartyPopupViewModel: ObservableObject {
    @Published var state: State!
    @Published var pickerParValue: Hole.Par = Hole.Par.four
    @Published var pickerScoreValue: Int = 0

    var hole: Hole!
    var handleValidate: ((Hole.Par, Int) -> ())!
    
    func setup(hole: Hole, handleValidate: @escaping (Hole.Par, Int) -> ()) {
        self.hole = hole
        self.handleValidate = handleValidate
        state = .fromHole(hole: hole)
        pickerScoreValue = hole.par.rawValue
    }
    
    func validate() {
        if state == .par {
            hole.setPar(par: pickerParValue)
            pickerScoreValue = pickerParValue.rawValue
            state = .fromHole(hole: hole)
            
            return
        }
        
        handleValidate(pickerParValue, pickerScoreValue)
    }
    
    enum State {
        case par, score
        
        static func fromHole(hole: Hole)-> Self {
            return (hole.par == .unset) ? .par : .score
        }
    }
}
