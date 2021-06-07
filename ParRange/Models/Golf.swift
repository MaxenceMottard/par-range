//
//  Golf.swift
//  ParRange
//
//  Created by Maxence Mottard on 04/05/2021.
//

import Foundation

struct Golf: Decodable {
    let _id: String
    let name: String
    let city: String
    let zip: Int?
    let latitude: String
    let longitude: String
    let ffgolf_vignette: String
    let ffgolf_photo1: String
    let ffgolf_photo2: String
    let ffgolf_photo3: String
    let ffgolf_large: String
}
