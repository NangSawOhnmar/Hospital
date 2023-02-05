//
//  RequestClient.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import Foundation

import Alamofire
import SwiftyJSON

class Client{
    var sessionManager: Alamofire.Session!
    typealias completion = (_ response: AFDataResponse<Data>) -> Void
    typealias RequestAdaptCompletion = (_ urlRequest: URLRequest) -> Void
    
    init() {
        sessionManager = Alamofire.Session(configuration: URLSessionConfiguration.default)
    }

    init (config: URLSessionConfiguration = URLSessionConfiguration.default){
        sessionManager = Alamofire.Session(configuration: config)
    }

    func request(_ request: URLRequest,requestInterceptor: RequestInterceptor? = nil,_ completion: @escaping completion){
        sessionManager = Alamofire.Session(interceptor: requestInterceptor)
        sessionManager.session.configuration.httpShouldUsePipelining = true
        sessionManager.request(request).responseData { (response) in
            completion(response)
        }
    }
    
}

class AccessTokenAdapter: RequestAdapter {
    private let accessToken: String

    init(accessToken: String) {
        self.accessToken = accessToken
    }

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        if accessToken != ""{
            urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        return urlRequest
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.headers.add(.authorization(bearerToken: accessToken))

        completion(.success(urlRequest))
    }
}
