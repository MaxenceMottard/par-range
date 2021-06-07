//
//  Routing.swift
//  ParRange
//
//  Created by Maxence Mottard on 05/05/2021.
//

import Foundation
import Combine

class Routing<RoutingParameterType: RoutingParameters, DecodeType> {
    fileprivate let jsonDecoder = JSONDecoder()
    
    func call(with parameters: RoutingParameterType) -> AnyPublisher<DecodeType, Error> where DecodeType: Decodable {
        guard let request = parameters.urlRequest else { return AnyPublisher(Empty()) }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) -> Data in
                if let response = response as? HTTPURLResponse, !parameters.successStatusCodes.contains(response.statusCode) {
                    throw NSError(domain: "SERVICE_ERROR", code: response.statusCode, userInfo: nil)
                }
                
                return data
            }
            .decode(type: DecodeType.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func call(with parameters: RoutingParameterType) -> AnyPublisher<Void, Error> where DecodeType == EmptyCodable {
        guard let request = parameters.urlRequest else { return AnyPublisher(Empty()) }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap { _ in }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class AuthenticatedRouting<RoutingParameterType: RoutingParameters, DecodeType>: Routing<RoutingParameterType, DecodeType> {
    
    override func call(with parameters: RoutingParameterType) -> AnyPublisher<Void, Error> where DecodeType == EmptyCodable {
        if QuichesAppManager.shared.jwtTokenIsExpired {
            return QuichesAppManager.shared
                .refreshToken()
                .flatMap { [weak self] _ -> AnyPublisher<Void, Error> in
                    guard let strongSelf = self else { return AnyPublisher(Empty()) }
                    
                    return strongSelf.call(with: parameters)
                }.eraseToAnyPublisher()
        }
        
        guard let token = QuichesAppManager.shared.jwtToken else { return AnyPublisher(Empty()) }
        
        parameters.headers["authorization"] = "Bearer \(token)"

        return super.call(with: parameters)
    }
    
    override func call(with parameters: RoutingParameterType) -> AnyPublisher<DecodeType, Error> where DecodeType: Decodable {
        
        if QuichesAppManager.shared.jwtTokenIsExpired {
            return QuichesAppManager.shared
                .refreshToken()
                .flatMap { [weak self] _ -> AnyPublisher<DecodeType, Error> in
                    guard let strongSelf = self else { return AnyPublisher(Empty()) }
                    
                    return strongSelf.call(with: parameters)
                }.eraseToAnyPublisher()
        }
        
        guard let token = QuichesAppManager.shared.jwtToken else { return AnyPublisher(Empty()) }
        
        parameters.headers["authorization"] = "Bearer \(token)"
        
        return super.call(with: parameters)
    }
}
