//
//  InputTextField.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import UIKit

class InputTextField: UITextField{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 15
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
}
