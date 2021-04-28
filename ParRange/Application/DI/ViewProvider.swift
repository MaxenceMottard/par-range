//
//  ViewProvider.swift
//  ParRange
//
//  Created by Maxence Mottard on 25/04/2021.
//

import Foundation
import Swinject

class ViewProvider {
    static func generateAssembler(viewControllerAssembly: Assembly) -> Assembler {
        return Assembler([viewControllerAssembly, GlobalAssembly()])
    }
}
