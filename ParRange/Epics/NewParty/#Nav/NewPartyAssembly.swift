//
//  NewPartyAssembly.swift
//  ParRange
//
//  Created by Maxence Mottard on 06/05/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class NewPartyAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(LocationManager.self, initializer: LocationManager.init)
        
        container.register(NewPartyViewModel.self) { r -> NewPartyViewModel in
            let viewModel = NewPartyViewModel()

            return viewModel
        }

        container.register(NewPartyView.self) { (r) -> NewPartyView in
            let viewModel = r.resolve(NewPartyViewModel.self)!

            return NewPartyView(viewModel: viewModel)
        }

        container.register(NewPartySelectCourseViewModel.self) {(r, selectedGold: Golf, selectCourseMethod: @escaping (Course) -> Void) -> NewPartySelectCourseViewModel in
            let viewModel = NewPartySelectCourseViewModel()
            
            let inputs = NewPartySelectCourseViewModelInputs(
                getCoursesRouting: r.resolve(GetCourseRouting.self)!,
                selectedGolf: selectedGold,
                selectCourseMethod: selectCourseMethod
            )
            viewModel.setup(with: inputs)

            return viewModel
        }

        container.register(NewPartySelectCourseView.self) { (r, selectedGold: Golf, selectCourseMethod: @escaping (Course) -> Void) -> NewPartySelectCourseView in
            let viewModel = r.resolve(NewPartySelectCourseViewModel.self, arguments: selectedGold, selectCourseMethod)!

            return NewPartySelectCourseView(viewModel: viewModel)
        }

        container.register(NewPartySelectGolfViewModel.self) { (r, selectGolfMethod: @escaping (Golf) -> Void) -> NewPartySelectGolfViewModel in
            let viewModel = NewPartySelectGolfViewModel()
            let inputs = NewPartySelectGolfViewModelInputs(
                getGolfsRouting: r.resolve(GetGolfsRouting.self)!,
                selectGolfMethod: selectGolfMethod,
                locationManager: r.resolve(LocationManager.self)!
            )
            viewModel.setup(with: inputs)

            return viewModel
        }

        container.register(NewPartySelectGolfView.self) { (r, selectGolfMethod: @escaping (Golf) -> Void) -> NewPartySelectGolfView in
            let viewModel = r.resolve(NewPartySelectGolfViewModel.self, argument: selectGolfMethod)!

            return NewPartySelectGolfView(viewModel: viewModel)
        }
    }
}
