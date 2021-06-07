////
////  CurrentPartyPopupViewModel.swift
////  ParRange
////
////  Created by Maxence Mottard on 26/04/2021.
////
//
//import SwiftUI
//
//final class CurrentPartyPopupViewModel: ObservableObject {
//    @Published var state: State!
//    var pickerParValue: Hole.Par = Hole.Par.four {
//        didSet {
//            objectWillChange.send()
//        }
//    }
//    var pickerScoreValue: Int = 0 {
//        didSet {
//            objectWillChange.send()
//        }
//    }
//
//    var hole: Hole!
//    var handleValidate: ((Hole.Par, Int) -> ())!
//    
//    func setup(hole: Hole, handleValidate: @escaping (Hole.Par, Int) -> ()) {
//        self.hole = hole
//        self.handleValidate = handleValidate
//        self.state = .fromHole(hole: hole)
//        self.pickerScoreValue = hole.par.rawValue
//    }
//    
//    func validate() {
//        if state == .par {
//            self.hole.setPar(par: pickerParValue)
//            self.pickerScoreValue = pickerParValue.rawValue
//            self.state = .fromHole(hole: hole)
//            
//            return
//        }
//        
//        self.handleValidate(pickerParValue, pickerScoreValue)
//    }
//    
//    enum State {
//        case par, score
//        
//        static func fromHole(hole: Hole)-> Self {
//            return (hole.par == .unset) ? .par : .score
//        }
//    }
//}
