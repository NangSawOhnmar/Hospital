//
//  LoginRequest.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import Foundation

struct LoginRequestWithEmail: Codable{
    var email: String
    var password: String
}

struct LoginRequestWithPhoneNumber: Codable{
    var phone_number: String
    var password: String
}
