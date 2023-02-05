//
//  DataService.swift
//  Hospital
//
//  Created by nang saw on 04/02/2023.
//

import Foundation

class DataService{
    static let shared = DataService()
    private let user_profile = "user_profile"
    
    private init(){}
    
    func setUserProfile(_ profile: String){
        
    }
    
    func getUserProfile() -> String{
        return ""
    }
}

