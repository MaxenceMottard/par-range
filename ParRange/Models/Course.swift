//
//  Course.swift
//  ParRange
//
//  Created by Maxence Mottard on 24/04/2021.
//

import Foundation

class Course {
    let type: CourseType
    var holes: [Hole] = []
    
    var availableHoles: [Hole] {
        return (1...type.rawValue).map({ Hole(holeNumber: $0) })
    }
    
    init(type: CourseType) {
        self.type = type
    }
    
    enum CourseType: Int {
        case nine = 9, eighteen = 18
    }
}
