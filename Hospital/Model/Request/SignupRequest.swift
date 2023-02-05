//
//  SignupRequest.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import Foundation

struct SignupRequest: Codable{
    let name: String
    let email: String
    let password: String
    let password_confirmation: String
    let date_of_birth: String
    let gender: String
    let id_type: String
    let id_number: String
}
