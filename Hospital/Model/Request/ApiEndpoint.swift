//
//  ApiEndpoint.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import Foundation

enum Endpoints {
    static let base = "https://codetest.onenex.pro"
    
    case login
    case signUp
    case authRole
    case authPermission
    
    var stringValue: String {
        switch self {
        case .login: return Endpoints.base + "/api/auth/login"
        case .signUp: return Endpoints.base + "/api/auth/register"
        case .authRole: return Endpoints.base + "/api/authorization/roles"
        case .authPermission: return Endpoints.base + "/api/authorization/permissions"
        }
    }
    
    var url: URL {
        return URL(string: stringValue)!
    }
}
