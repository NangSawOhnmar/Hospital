//
//  UITextField+Settings.swift
//  Hospital
//
//  Created by nang saw on 04/02/2023.
//

import UIKit

extension UITextField{
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(named: "password_hide"), for: .normal)
        }else{
            button.setImage(UIImage(named: "password_show"), for: .normal)
            
        }
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(20))
        button.addTarget(self, action: #selector(togglePasswordView(_:)), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
    
    fileprivate func setCalendarImage(_ button: UIButton) {
        button.setImage(UIImage(named: "calendar"), for: .normal)
    }
    
    func showCalendarImage() {
        let button = UIButton(type: .custom)
        setCalendarImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(20))
        self.rightView = button
        self.rightViewMode = .always
    }
    
    fileprivate func setExpandArrowImage(_ button: UIButton) {
        button.setImage(UIImage(named: "expand_arrow"), for: .normal)
    }
    
    func showExpandImage() {
        let button = UIButton(type: .custom)
        setExpandArrowImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(20))
        self.rightView = button
        self.rightViewMode = .always
    }
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
            // Create a UIDatePicker object and assign to inputView
            let screenWidth = UIScreen.main.bounds.width
            let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
            datePicker.datePickerMode = .date //2
            datePicker.maximumDate = Date()
            datePicker.date = DateFormatHelper.stringToDate(date: "1995-01-01")
            // iOS 14 and above
            if #available(iOS 14, *) {// Added condition for iOS 14
              datePicker.preferredDatePickerStyle = .wheels
              datePicker.sizeToFit()
            }
            self.inputView = datePicker //3
            
            // Create a toolbar and assign it to inputAccessoryView
            let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
            let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
            let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
            let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
            toolBar.setItems([cancel, flexible, barButton], animated: false) //8
            self.inputAccessoryView = toolBar //9
        }
    
    func setupPickerBarButton(target: Any, selector: Selector){
        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
        
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
           
}
