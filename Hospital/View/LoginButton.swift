//
//  LoginButton.swift
//  Hospital
//
//  Created by nang saw on 04/02/2023.
//

import UIKit

class LoginButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        tintColor = UIColor.white
        backgroundColor = UIColor(rgb: 0x192792)
    }

}
