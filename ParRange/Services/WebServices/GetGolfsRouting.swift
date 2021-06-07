//
//  GetGolfsRouting.swift
//  ParRange
//
//  Created by Maxence Mottard on 04/05/2021.
//

import Foundation

class GetGolfsRoutingParameters: RoutingParameters {
    typealias BodyType = EmptyCodable
    
    var path: String = "/golfs"
    var method: HTTPMethod = .GET
    var queryParameters: [String : String]
    var headers: [String : String] = [:]
    
    init(latitude: String, longitude: String) {
        queryParameters = ["latitude": latitude, "longitude": longitude]
    }
    
    init(name searchName: String) {
        queryParameters = ["name": searchName]
    }
}

class GetGolfsRouting: Routing<GetGolfsRoutingParameters, [Golf]> {}
