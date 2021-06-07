//
//  QuichesApp.swift
//  ParRange
//
//  Created by Maxence Mottard on 06/05/2021.
//

import Foundation
import QuichesCore
import Combine

class QuichesAppManager: ObservableObject {
    static let shared = QuichesAppManager()

    let quichesApp = QuichesApp(publicKey: "pub_1ce4c55c61b80406a460dcf6d0ddc51a04479640493f61ee069b77390b611b8fdb5195e432afa9e61571515d2a1792c205d0")
    
    var jwtToken: String? {
        quichesApp.authentication.token
    }
    
    var jwtTokenIsExpired: Bool {
        quichesApp.authentication.tokenIsExpired
    }
    
    var isAuthenticated: Bool {
        return jwtToken != nil
    }
    
    func refreshToken() -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { [weak self] promise in
            guard let strongSelf = self else {
                promise(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                return
            }
            strongSelf.quichesApp.authentication.refreshToken { result in
                promise(result)
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func login(mail: String, password: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { [weak self] promise in
            guard let strongSelf = self else {
                promise(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                return
            }
            strongSelf.quichesApp.authentication.signInWithMailAndPassword(mail: mail, password: password) {
                promise($0)
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
