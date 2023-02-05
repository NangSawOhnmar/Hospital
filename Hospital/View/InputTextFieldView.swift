//
//  InputTextFieldView.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import UIKit

class InputTextFieldView: UIView{
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
}
