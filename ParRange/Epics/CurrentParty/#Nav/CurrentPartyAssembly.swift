//
//  CurrentPartyAssembly.swift
//  ParRange
//
//  Created by Maxence Mottard on 25/04/2021.
//

import Foundation
import Swinject
import SwiftUI

final class CurrentPartyAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CurrentPartyViewModel.self) { (_, course: Course) -> CurrentPartyViewModel in
            let viewModel = CurrentPartyViewModel()
            
            viewModel.setup(course: course)
            
            return viewModel
        }
        
        container.register(CurrentPartyView.self) { (r, course: Course) -> CurrentPartyView in
            let viewModel = r.resolve(CurrentPartyViewModel.self, argument: course)!
            
            return CurrentPartyView(viewModel: viewModel)
        }
        container.register(CurrentPartyPopupViewModel.self) { (_, hole: Hole, handleValidate: @escaping (Hole.Par, Int) -> ()) -> CurrentPartyPopupViewModel in
            let viewModel = CurrentPartyPopupViewModel()
            
            viewModel.setup(hole: hole, handleValidate: handleValidate)
            
            return viewModel
        }
        
        container.register(CurrentPartyPopupView.self) { (r, hole: Hole, handleValidate: @escaping (Hole.Par, Int) -> ()) -> CurrentPartyPopupView in
            let viewModel = r.resolve(CurrentPartyPopupViewModel.self, arguments: hole, handleValidate)!
            
            return CurrentPartyPopupView(viewModel: viewModel)
        }
    }
}
