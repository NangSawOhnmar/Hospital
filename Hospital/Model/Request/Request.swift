//
//  Request.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import SwiftyJSON
import Alamofire

class Request: Router{
    
    init() {
        super.init(client: Client())
    }
    
    func registerAccount(params: SignupRequest, success: @escaping (SignupSuccessResponse) -> Void, fail: @escaping (SignupFailResponse) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let url = Endpoints.signUp.url
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            print("param:",params)
            self.request(urlRequest: request, params: params, nil, encoding: JSONEncoding.default, success: { json in
                success(SignupSuccessResponse.loadJSON(json: json))
            }, fail: { error in
                fail(SignupFailResponse.loadJSON(json: error))
            })
        }
    }
    
    func loginAccountWithEmail(params: LoginRequestWithEmail, success: @escaping (LoginSuccessResponse) -> Void, fail: @escaping (LoginFailResponse) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let url = Endpoints.login.url
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            print("param:",params)
            self.request(urlRequest: request, params: params, nil, encoding: JSONEncoding.default, success: { json in
                success(LoginSuccessResponse.loadJSON(json: json))
            }, fail: { error in
                fail(LoginFailResponse.loadJSON(json: error))
            })
        }
    }
    
    func loginAccountWithPhone(params: LoginRequestWithPhoneNumber, success: @escaping (LoginSuccessResponse) -> Void, fail: @escaping (LoginFailResponse) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let url = Endpoints.login.url
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            print("param:",params)
            self.request(urlRequest: request, params: params, nil, encoding: JSONEncoding.default, success: { json in
                success(LoginSuccessResponse.loadJSON(json: json))
            }, fail: { error in
                fail(LoginFailResponse.loadJSON(json: error))
            })
        }
    }
    
}
