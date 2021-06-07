//
//  PartyListAssembly.swift
//  ParRange
//
//  Created by Maxence Mottard on 04/05/2021.
//

import Foundation
import Swinject

final class PartyListAssembly: Assembly {
    func assemble(container: Container) {        
        container.register(PartyListViewModel.self) { r -> PartyListViewModel in
            let viewModel = PartyListViewModel()

            return viewModel
        }

        container.register(PartyListView.self) { (r) -> PartyListView in
            let viewModel = r.resolve(PartyListViewModel.self)!

            return PartyListView(viewModel: viewModel)
        }
    }
}
