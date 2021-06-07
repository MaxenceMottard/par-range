//
//  Tee.swift
//  ParRange
//
//  Created by Maxence Mottard on 04/05/2021.
//

import Foundation

struct Tee: Decodable {
    let _id: String
    let courseId: String
    let name: String
    let distance:  Int
    let color: String
    let holes: [Hole]
}

struct Hole: Decodable {
    let number: Int;
    let par: Int;
    let handicap: Int;
    let length: Int;
    let handicap_9: Int;
    let handicap_18: Int;
}
