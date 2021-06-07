//
//  NewPartyViewModel.swift
//  ParRange
//
//  Created by Maxence Mottard on 06/05/2021.
//

import Foundation

class NewPartyViewModel: ViewModel<EmptyInputs> {    
    @Published var state: PartyState = .selectGolf
    @Published var selectedGolf: Golf?
    @Published var selectedCourse: Course?
    
    enum PartyState: String {
        case selectGolf = "selectGolf"
        case selectCourse = "selectCourse"
        case party = "party"
    }
    
    func selectGolf(golf: Golf) {
        selectedGolf = golf
        state = .selectCourse
    }
    
    func selectCourse(course: Course) {
        selectedCourse = course
        state = .party
    }
    
    func resetViewModel() {
        selectedCourse = nil
        selectedGolf = nil
        state = .selectGolf
    }
}
