//
//  ViewProvider+CurrentParty.swift
//  ParRange
//
//  Created by Maxence Mottard on 25/04/2021.
//

import Foundation
import SwiftUI

extension ViewProvider {
    enum CurrentParty {
        static func home(course: Course) -> CurrentPartyView {
            let assembler = generateAssembler(viewControllerAssembly: CurrentPartyAssembly())
                            
            return assembler.resolver.resolve(CurrentPartyView.self, argument: course)!
        }
        
        static func popup(hole: Hole, handleValidate: @escaping (Hole.Par, Int) -> ()) -> CurrentPartyPopupView {
            let assembler = generateAssembler(viewControllerAssembly: CurrentPartyAssembly())
                            
            return assembler.resolver.resolve(CurrentPartyPopupView.self, arguments: hole, handleValidate)!
        }
    }
}
