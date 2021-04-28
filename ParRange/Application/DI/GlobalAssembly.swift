//
//  GlobalAssembly.swift
//  ParRange
//
//  Created by Maxence Mottard on 25/04/2021.
//

import Swinject
import SwinjectAutoregistration

class GlobalAssembly: Assembly {
    func assemble(container: Container) {
        registerWebServices(container)
    }
    
    func registerWebServices(_ container: Container) {
        
    }
}
