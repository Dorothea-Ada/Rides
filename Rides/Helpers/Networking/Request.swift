//
//  Request.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ContentType: String {
    case json = "application/json"
}

enum AcceptType: String {
    case json = "application/json"
    case urlencoded = "application/x-www-form-urlencoded"
}

struct Request {
    let baseURL: URL
    private(set) var path = ""
    private(set) var method: HTTPMethod = .get
    private(set) var queryParameters: [String: String]? = nil
    private(set) var bodyParameters: [String: Any]? = nil
    private(set) var headers: [String: String]? = nil
    private(set) var contentType: ContentType = .json
    private(set) var acceptType: AcceptType? = nil
    
    init(_ baseURL: URL) {
        self.baseURL = baseURL
    }
}

// MARK: Builder Methods

extension Request {
    func path(_ value: String) -> Request {
        var newRequest = self
        newRequest.path = value
        return newRequest
    }

    func method(_ method: HTTPMethod) -> Request {
        var newRequest = self
        newRequest.method = method
        return newRequest
    }
    
    func queryParameters(_ queryParameters: [String: String]) -> Request {
        var newRequest = self
        newRequest.queryParameters = queryParameters
        return newRequest
    }
    
    func data<Model: Encodable>(_ data: Model) -> Request {
        var newRequest = self

        guard
            let data = try? JSONEncoder().encode(data),
            let dictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        else { return self }

        newRequest.bodyParameters = dictionary

        return newRequest
    }

    func headers(_ headers: [String: String]) -> Request {
        var newRequest = self
        if newRequest.headers == nil {
            newRequest.headers = headers
        } else {
            newRequest.headers = newRequest.headers?.merging(headers, uniquingKeysWith: { _, new in new })
        }
        return newRequest
    }

    func contentType(_ contentType: ContentType) -> Request {
        var newRequest = self
        newRequest.contentType = contentType
        return newRequest
    }
    
    func acceptType(_ acceptType: AcceptType) -> Request {
        var newRequest = self
        newRequest.acceptType = acceptType
        return newRequest
    }
}


extension Request {
    func buildURLRequest() -> URLRequest {
        let url = path.isEmpty ? baseURL : baseURL.appendingPathComponent(path)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            fatalError("Impossible error - Invalid URL")
        }
        
        var urlRequest = URLRequest(url: url)
        
        if let queryParameters {
            components.queryItems = queryParameters.map { .init(name: $0.key, value: $0.value) }
        }
        
        if method == .post || method == .put || method == .patch {
            urlRequest.setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
        }
        
        if let bodyParameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParameters, options: [])
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        urlRequest.url = components.url
        urlRequest.httpMethod = method.rawValue
        
        if let acceptType {
            urlRequest.setValue(acceptType.rawValue, forHTTPHeaderField: "Accept")
        }
        
        if let headers {
            headers.forEach { key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return urlRequest
    }
}
