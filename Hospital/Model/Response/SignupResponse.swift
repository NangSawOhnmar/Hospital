//
//  SignupResponse.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import SwiftyJSON

struct SignupSuccessResponse {
    var message: String!
    
    static func loadJSON(json: JSON) -> SignupSuccessResponse{
        var success = SignupSuccessResponse()
        success.message = json["message"].stringValue
        return success
    }
}

struct SignupFailResponse {
    var message: String!
    var data: SignupErrorData!
    
    static func loadJSON(json: JSON) -> SignupFailResponse{
        var signupFailResponse = SignupFailResponse()
        signupFailResponse.message = json["message"].stringValue
        signupFailResponse.data = SignupErrorData.loadJSON(json: json["data"])
        return signupFailResponse
    }
}

struct SignupErrorData {
    var name: [String]!
    var email: [String]!
    var password: [String]!
    var password_confirmation: [String]!
    var date_of_birth: [String]!
    var gender: [String]!
    var id_type: [String]!
    var id_number: [String]!
    
    static func loadJSON(json: JSON) -> SignupErrorData{
        var signupErrorData = SignupErrorData()
        signupErrorData.name = json["name"].arrayObject as? [String]
        signupErrorData.email = json["email"].arrayObject as? [String]
        signupErrorData.password = json["password"].arrayObject as? [String]
        signupErrorData.password_confirmation = json["password_confirmation"].arrayObject as? [String]
        signupErrorData.date_of_birth = json["date_of_birth"].arrayObject as? [String]
        signupErrorData.gender = json["gender"].arrayObject as? [String]
        signupErrorData.id_type = json["id_type"].arrayObject as? [String]
        signupErrorData.id_number = json["id_number"].arrayObject as? [String]
        return signupErrorData
    }
}
