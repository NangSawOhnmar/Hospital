//
//  LoginResponse.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import SwiftyJSON

struct LoginSuccessResponse {
    var message: String!
    var token: String!
    
    static func loadJSON(json: JSON) -> LoginSuccessResponse{
        var success = LoginSuccessResponse()
        success.message = json["message"].stringValue
        success.token = json["token"].stringValue
        return success
    }
}

struct LoginFailResponse {
    var message: String!
    var data: LoginErrorData!
    
    static func loadJSON(json: JSON) -> LoginFailResponse{
        var loginFailResponse = LoginFailResponse()
        loginFailResponse.message = json["message"].stringValue
        loginFailResponse.data = LoginErrorData.loadJSON(json: json["data"])
        return loginFailResponse
    }
}

struct LoginErrorData {
    var email: [String]!
    var password: [String]!
    var phone: [String]!
    
    static func loadJSON(json: JSON) -> LoginErrorData{
        var loginErrorData = LoginErrorData()
        loginErrorData.email = json["email"].arrayObject as? [String]
        loginErrorData.password = json["password"].arrayObject as? [String]
        loginErrorData.phone = json["phone"].arrayObject as? [String]
        return loginErrorData
    }
}
