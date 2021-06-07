//
//  Hole.swift
//  ParRange
//
//  Created by Maxence Mottard on 24/04/2021.
//

import Foundation

//final class Hole {
//    private(set) var par: Par
//    private(set) var score: Int?
//    let holeNumber: Int
//    
//    private var rangeScoreStringDictionary: [Int: String] = [-3: "Albatros", -2: "Eagle", -1: "Birdie", 0: "Par",
//                                                             1: "Bogey", 2: "Double Bogey", 3: "Triple Bogey"]
//    var name: String {
//        return "trou \(holeNumber)"
//    }
//    var formatedPar: String {
//        return "par \(par.rawValue)"
//    }
//    var formatedScore: String {
//        guard let score = score,
//              let formated = rangeScoreStringDictionary[score - par.rawValue] else { return "\(par.maximumScore)+" }
//        
//        return "\(formated): \(score)"
//    }
//    
//    init(holeNumber: Int) {
//        self.holeNumber = holeNumber
//        self.par = .unset
//    }
//    
//    init(par: Par, holeNumber: Int) {
//        self.par = par
//        self.holeNumber = holeNumber
//    }
//    
//    enum Par: Int, CaseIterable {
//        case three = 3, four = 4, five = 5, unset = -1
//        
//        var availableScores: [Int] {
//            if self == .unset {
//                return []
//            }
//            
//            let min = 1
//            let max = (self.rawValue + 4)
//            
//            return Array(min...max) + [-1]
//        }
//        
//        var maximumScore: Int {
//            self == .unset ? 0 : availableScores[availableScores.count - 2]
//        }
//    }
//    
//    func addScore(score: Int) {
//        self.score = score
//    }
//    
//    func setPar(par: Par) {
//        self.par = par
//    }
//}
//
//extension Hole: Equatable {
//    static func == (lhs: Hole, rhs: Hole) -> Bool {
//        return (lhs.holeNumber == rhs.holeNumber)
//    }
//}
