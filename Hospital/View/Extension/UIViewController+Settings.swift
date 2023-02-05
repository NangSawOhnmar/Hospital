//
//  UIViewController+Settings.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import UIKit

extension UIViewController{
    func toastMessage(_ message: String){
        guard let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) else {return}
        let messageLbl = UILabel()
        messageLbl.text = message
        messageLbl.numberOfLines = 3
        messageLbl.textAlignment = .center
        messageLbl.font = UIFont.systemFont(ofSize: 12)
        messageLbl.textColor = .white
        messageLbl.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let textSize:CGSize = messageLbl.intrinsicContentSize
        let labelWidth = min(textSize.width, window.frame.width - 40)
        
        messageLbl.frame = CGRect(x: 20, y: window.frame.height - 90, width: labelWidth + 30, height: textSize.height + 20)
        messageLbl.center.x = window.center.x
        messageLbl.layer.cornerRadius = messageLbl.frame.height/2
        messageLbl.layer.masksToBounds = true
        window.addSubview(messageLbl)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            UIView.animate(withDuration: 5, animations: {
                messageLbl.alpha = 0
            }) { (_) in
                messageLbl.removeFromSuperview()
            }
        }
    }
}
