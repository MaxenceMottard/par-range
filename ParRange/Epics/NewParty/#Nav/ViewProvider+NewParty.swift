//
//  ViewProvider+NewParty.swift
//  ParRange
//
//  Created by Maxence Mottard on 06/05/2021.
//

import Foundation
import SwiftUI

extension ViewProvider {
    enum NewParty {
        static func home() -> NewPartyView {
            let assembler = generateAssembler(viewControllerAssembly: NewPartyAssembly())

            return assembler.resolver.resolve(NewPartyView.self)!
        }
        
        static func selectGolf(selectGolfMethod: @escaping (Golf) -> Void) -> NewPartySelectGolfView {
            let assembler = generateAssembler(viewControllerAssembly: NewPartyAssembly())

            return assembler.resolver.resolve(NewPartySelectGolfView.self, argument: selectGolfMethod)!
        }
        
        static func selectCourse(selectedGold: Golf, selectCourseMethod: @escaping (Course) -> Void) -> NewPartySelectCourseView {
            let assembler = generateAssembler(viewControllerAssembly: NewPartyAssembly())

            return assembler.resolver.resolve(NewPartySelectCourseView.self, arguments: selectedGold, selectCourseMethod)!
        }
    }
}
