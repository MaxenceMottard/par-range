////
////  CurrentPartyViewModel.swift
////  ParRange
////
////  Created by Maxence Mottard on 25/04/2021.
////
//
//import Foundation
//import SwiftUI
//
//final class CurrentPartyViewModel: ObservableObject {
//    @Published var popupIsOpen: Bool = false
//    @Published var elapsedTime: TimeInterval = 0
//    var formatedElapsedTime: String {
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        formatter.dateFormat = "HH:mm:ss"
//
//        return formatter.string(from: Date(timeIntervalSinceReferenceDate: elapsedTime))
//    }
//    var timer: Timer?
//
//    @Published var state: State = .notStarted {
//        didSet {
//            switch state {
//            case .started:
//                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                    self.elapsedTime += 1
//                }
//            case .breaked, .ended:
//                timer?.invalidate()
//            case .notStarted:
//                return
//            }
//        }
//    }
//
//    private(set) var currentHole: Hole!
//
//    var course: Course! {
//        didSet {
//            self.currentHole = course.availableHoles[0]
//        }
//    }
//
//    func setup(course: Course) {
//        self.course = course
//    }
//
//    private func nextHole() {
//        guard currentHole.holeNumber != self.course.type.rawValue else {
//            self.course.holes.append(self.currentHole)
//            self.stopParty()
//
//            return
//        }
//
//        self.course.holes.append(self.currentHole)
//        self.currentHole = self.course.availableHoles[self.currentHole.holeNumber]
//    }
//
//    func startParty() {
//        self.state = .started
//    }
//
//    func stopParty() {
//        self.state = .ended
//    }
//
//    func breakParty() {
//        self.state = .breaked
//    }
//
//    func handleValidatePopup(par: Hole.Par, score: Int) {
//        self.currentHole.setPar(par: par)
//        self.currentHole.addScore(score: score)
//
//        self.popupIsOpen = false
//        self.nextHole()
//    }
//
//    enum State {
//        case notStarted, started, breaked, ended
//    }
//}
