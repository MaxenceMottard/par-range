//
//  ViewProvider+PartyList.swift
//  ParRange
//
//  Created by Maxence Mottard on 04/05/2021.
//

import Foundation
import SwiftUI

extension ViewProvider {
    static func partyList() -> PartyListView {
        let assembler = generateAssembler(viewControllerAssembly: PartyListAssembly())

        return assembler.resolver.resolve(PartyListView.self)!
    }
}
