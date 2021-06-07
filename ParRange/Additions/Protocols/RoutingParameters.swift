//
//  Routing.swift
//  ParRange
//
//  Created by Maxence Mottard on 04/05/2021.
//

import Foundation
import Combine

struct EmptyCodable: Encodable {}

protocol RoutingParameters: Weakable {
    associatedtype BodyType: Encodable
    
    /// Base url for the current route. Can be specifed for all routes in the extension, and/or seperatly for each route
    var baseURL: String { get }
    
    /// HTTP request method to be used for this route
    var method: HTTPMethod { get }
    
    /// The url path for this route
    var path: String { get }
    
    /// Keys and values to be replaced in given path
    ///
    /// if URL is dynamic, keys need to be replaced by values
    /// which are available in Routing
    ///
    /// Exemple:
    ///
    /// - key: "orderId"
    /// - in URL "{orderId}"
    ///
    /// `{ }` will be replaced automatically
    var pathKeysValues: [String: String] { get }
    
    var queryParameters: [String: String] { get }
    
    /// The request parameters for current route
    var body: BodyType? { get }
    
    /// The request headers for the current route
    var fixHeaders: [String: String] { get }
    
    /// The request headers for the current route
    var headers: [String: String] { get set }
    
    /// The calculated property for the routing. Setups all necessary properties for current request.
    var urlRequest: URLRequest? { get }
    
    var successStatusCodes: Set<Int> { get }
}

extension RoutingParameters {
    var baseURL: String {
        return "https://golf.maxencemottard.com"
    }
    
    var method: HTTPMethod {
        return .POST
    }
    
    var pathKeysValues: [String: String] {
        return [:]
    }
    
    var queryParameters: [String: String] {
        return [:]
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var fixHeaders: [String: String] {
        return ["Content-Type": "application/json",
                "Accept": "application/json"]
    }
    
    var successStatusCodes: Set<Int> {
        return Set<Int>(200...209)
    }
    
    var body: BodyType? {
        return nil
    }
    
    var computedUrl: URL? {
        guard let baseURL = URL(string: baseURL) else {
            print("baseURL is nil when creating urlRequest in \(self)")
            
            return nil
        }
        
        return computeURL(baseURL: baseURL)
    }
    
    func computeURL(baseURL: URL) -> URL? {
        var urlString = path.isEmpty
            ? baseURL.absoluteString
            : baseURL.appendingPathComponent(path).absoluteString

        pathKeysValues.keys.forEach { key in
            guard let value = pathKeysValues[key] else { return }
            urlString = urlString.replacingOccurrences(of: ":\(key)", with: value)
        }
        
        if queryParameters != [:], var component = URLComponents(string: urlString) {
            component.queryItems = queryParameters.keys.map({ URLQueryItem(name: $0, value: queryParameters[$0]) })
            
            return component.url
        }
        
        return urlString.isEmpty ? baseURL : URL(string: urlString)
    }
    
    var urlRequest: URLRequest? {
        if let computedUrl = computedUrl {
            return createRequest(for: computedUrl)
        } else {
            print("computedUrl is nil in \(self) when creating urlRequest")
            
            return nil
        }
    }
    
    /// Create URL - adding headers and encode parameters
    ///
    /// - Parameter url: given url: URL
    /// - Returns: URLRequest created from URL with headers and parameters
    func createRequest(for url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        if let body = self.body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                print(error)
            }
        }
        
        return request
    }
}

enum HTTPMethod: String {
    case POST
    case GET
    case PUT
    case DELETE
}
