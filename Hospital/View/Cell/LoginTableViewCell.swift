//
//  LoginTableViewCell.swift
//  Hospital
//
//  Created by nang saw on 04/02/2023.
//

import UIKit
import CountryPickerView

class LoginTableViewCell: UITableViewCell {

    @IBOutlet weak var getHelpButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var selectCountryView: UIView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var emailErrorMessageLabel: UILabel!
    @IBOutlet weak var passwordErrorMessageLabel: UILabel!
    
    private var countryPicker: CountryPickerView!
    static let IDENTIFIER: String = "LoginTableViewCell"
    weak var delegate: LoginTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSegmentControlView()
        setupCountryPickerView()
        passwordTextField.enablePasswordToggle()
    }
    
    func setupSegmentControlView() {
        self.segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        self.segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        segmentControl.layer.borderColor = UIColor.lightGray.cgColor
        segmentControl.layer.borderWidth = 1
    }
    
    func setupCountryPickerView(){
        countryPicker = CountryPickerView(frame: selectCountryView.frame)
        countryPicker.delegate = self
        countryPicker.dataSource = self
        countryCodeLabel.text = countryPicker.selectedCountry.phoneCode
        flagImageView.image = countryPicker.selectedCountry.flag
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedCountryCode))
        selectCountryView.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func setmentIndexChange(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
        case 0:
            self.phoneNumberView.isHidden = false
            self.emailView.isHidden = true
        case 1:
            self.phoneNumberView.isHidden = true
            self.emailView.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
        let signupViewController = SignUpViewController()
        self.delegate?.showSignUpView(viewController: signupViewController)
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
        case 0:
            let loginRequestWithPhone = LoginRequestWithPhoneNumber(phone_number: phoneTextField.text ?? "", password: passwordTextField.text ?? "")
            self.delegate?.tappedLoginWithPhone(loginData: loginRequestWithPhone, cell: self)
        case 1:
            let loginRequestWithEmail = LoginRequestWithEmail(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
            self.delegate?.tappedLoginWithEmail(loginData: loginRequestWithEmail, cell: self)
        default:
            break
        }
    }
    
    @objc func tappedCountryCode(){
        self.delegate?.tappedCountryCodeView(countryPicker: countryPicker)
    }
    
}

extension LoginTableViewCell: CountryPickerViewDelegate, CountryPickerViewDataSource{
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        self.countryCodeLabel.text = country.phoneCode
        self.flagImageView.image = country.flag
    }
}

protocol LoginTableViewCellDelegate: AnyObject {
    func tappedCountryCodeView(countryPicker: CountryPickerView)
    func showSignUpView(viewController: SignUpViewController)
    func tappedLoginWithEmail(loginData: LoginRequestWithEmail, cell: LoginTableViewCell)
    func tappedLoginWithPhone(loginData: LoginRequestWithPhoneNumber, cell: LoginTableViewCell)
}
