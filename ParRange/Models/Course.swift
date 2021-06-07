//
//  Course.swift
//  ParRange
//
//  Created by Maxence Mottard on 24/04/2021.
//

import Foundation

//class Course {
//    let type: CourseType
//    var holes: [Hole] = []
//
//    var availableHoles: [Hole] {
//        return (1...type.rawValue).map({ Hole(holeNumber: $0) })
//    }
//
//    init(type: CourseType) {
//        self.type = type
//    }
//
//
//}

struct Course: Decodable {
    let _id: String
    let golfId: String
    let name: String
    let par: Int
    let holes: CourseType
}

enum CourseType: Int, Decodable {
    case nine = 9, eighteen = 18
}
