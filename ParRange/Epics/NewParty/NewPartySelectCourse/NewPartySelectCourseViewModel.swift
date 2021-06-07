//
//  NewPartySelectCourseViewModel.swift
//  ParRange
//
//  Created by Maxence Mottard on 07/05/2021.
//

import Foundation

struct NewPartySelectCourseViewModelInputs: ViewModelInputs {
    let getCoursesRouting: GetCourseRouting
    let selectedGolf: Golf
    let selectCourseMethod: (Course) -> Void
}

class NewPartySelectCourseViewModel: ViewModel<NewPartySelectCourseViewModelInputs> {
    @Published var courses: [Course] = []
    
    func fetchCoursess() {
        let parameters = GetCourseRoutingParameters(with: inputs.selectedGolf._id)
        
        inputs.getCoursesRouting
            .call(with: parameters)
            .sink(receiveCompletion: { _ in }) { [weak self] courses in
                self?.courses = courses
            }.store(in: &bag)
    }
}
