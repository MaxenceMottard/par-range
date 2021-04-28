//
//  CurrentPartyViewModel.swift
//  ParRange
//
//  Created by Maxence Mottard on 25/04/2021.
//

import Foundation
import SwiftUI

final class CurrentPartyViewModel: ObservableObject {
    var popupIsOpen: Bool = false {
        didSet {
            objectWillChange.send()
        }
    }
    
    var course: Course! {
        didSet {
            self.currentHole = course.availableHoles[0]
        }
    }
    private(set) var currentHole: Hole!
    
    var state: State = .notStarted {
        didSet {
            objectWillChange.send()
        }
    }
    
    func setup(course: Course) {
        self.course = course
    }
    
    func nextHole() {
        guard currentHole.holeNumber != course.type.rawValue else {
            course.holes.append(currentHole)
            state = .ended

            return
        }
        
        course.holes.append(currentHole)
        currentHole = course.availableHoles[currentHole.holeNumber]
    }
    
    func startParty() {
        state = .started
    }
    
    func breakParty() {
        state = .breaked
    }
    
    func handleValidatePopup(par: Hole.Par, score: Int) {
        currentHole.setPar(par: par)
        currentHole.addScore(score: score)

        popupIsOpen = false
        nextHole()
    }
    
    enum State {
        case notStarted, started, breaked, ended
    }
}
