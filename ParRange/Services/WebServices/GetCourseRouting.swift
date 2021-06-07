//
//  GetCoursesRouting.swift
//  ParRange
//
//  Created by Maxence Mottard on 07/05/2021.
//

import Foundation

class GetCourseRoutingParameters: RoutingParameters {
    typealias BodyType = EmptyCodable
    
    var path: String = "/courses/:golfId"
    var method: HTTPMethod = .GET
    var pathKeysValues: [String : String]
    var headers: [String : String] = [:]
    
    init(with golfId: String) {
        pathKeysValues = ["golfId": golfId]
    }
}

class GetCourseRouting: Routing<GetCourseRoutingParameters, [Course]> {}
