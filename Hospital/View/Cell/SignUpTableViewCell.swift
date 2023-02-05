//
//  SignUpTableViewCell.swift
//  Hospital
//
//  Created by nang saw on 05/02/2023.
//

import UIKit

class SignUpTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTextField: InputTextField!
    @IBOutlet weak var birthDateTextField: InputTextField!
    @IBOutlet weak var genderTextField: InputTextField!
    @IBOutlet weak var NRCTypeTextField: InputTextField!
    @IBOutlet weak var stateNoTextField: UITextField!
    @IBOutlet weak var NaingTextField: UITextField!
    @IBOutlet weak var NRCNoTextField: UITextField!
    @IBOutlet weak var emailTextField: InputTextField!
    @IBOutlet weak var districtTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    @IBOutlet weak var nameErrorMessageLabel: UILabel!
    @IBOutlet weak var emailErrorMessageLabel: UILabel!
    @IBOutlet weak var dobErrorMessageLabel: UILabel!
    @IBOutlet weak var genderErrorMessageLabel: UILabel!
    @IBOutlet weak var IDTypeErrorMessageLabel: UILabel!
    @IBOutlet weak var IDNumberErrorMessageLabel: UILabel!
    @IBOutlet weak var passwordErrorMessageLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorMessageLabel: UILabel!
    
    static let IDENTIFIER: String = "SignUpTableViewCell"
    weak var delegate: SignUpTableViewCellDelegate?
    let genderPicker = UIPickerView()
    let NRCTypePicker = UIPickerView()
    let stateNoPicker = UIPickerView()
    let districtPicker = UIPickerView()
    let naingPicker = UIPickerView()
    var genderPickerData = ["Male", "Female"]
    var nrcTypeData = ["NRC"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTextField()
    }
    
    func setupTextField(){
        birthDateTextField.showCalendarImage()
        genderTextField.showExpandImage()
        NRCTypeTextField.showExpandImage()
        passwordTextField.enablePasswordToggle()
        passwordConfirmTextField.enablePasswordToggle()
        
        birthDateTextField.setInputViewDatePicker(target: self, selector: #selector(doneSelectDate))
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        genderTextField.inputView = genderPicker
        genderTextField.setupPickerBarButton(target: self, selector: #selector(doneGenderSelect))
        
        NRCTypePicker.delegate = self
        NRCTypePicker.dataSource = self
        NRCTypeTextField.inputView = NRCTypePicker
        NRCTypeTextField.setupPickerBarButton(target: self, selector: #selector(doneNRCTypeSelect))
        
        stateNoPicker.delegate = self
        stateNoPicker.dataSource = self
        stateNoTextField.inputView = stateNoPicker
        stateNoTextField.setupPickerBarButton(target: self, selector: #selector(doneStateNoSelect))
        
        districtPicker.delegate = self
        districtPicker.dataSource = self
        districtTextField.inputView = districtPicker
        districtTextField.setupPickerBarButton(target: self, selector: #selector(doneDistrictSelect))
        
        naingPicker.delegate = self
        naingPicker.dataSource = self
        NaingTextField.inputView = naingPicker
        NaingTextField.setupPickerBarButton(target: self, selector: #selector(doneNaingSelect))
        
    }
    
    @objc func doneSelectDate() {
        if let datePicker = birthDateTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            self.birthDateTextField.text = DateFormatHelper.dateToString(date: datePicker.date)
//            self.date_of_birth = "\(datePicker.date.toISO())"
        }
        self.birthDateTextField.resignFirstResponder()
    }
    
    @objc func doneGenderSelect() {
        genderTextField.resignFirstResponder()
        genderTextField.text = genderPickerData[genderPicker.selectedRow(inComponent: 0)]
    }
    
    @objc func doneNRCTypeSelect(){
        NRCTypeTextField.resignFirstResponder()
        NRCTypeTextField.text = nrcTypeData[NRCTypePicker.selectedRow(inComponent: 0)]
    }
    
    @objc func doneStateNoSelect(){
        stateNoTextField.resignFirstResponder()
        stateNoTextField.text = NRCData.state_no[stateNoPicker.selectedRow(inComponent: 0)]
    }
    
    @objc func doneDistrictSelect(){
        districtTextField.resignFirstResponder()
        districtTextField.text = NRCData.district[stateNoPicker.selectedRow(inComponent: 0)][districtPicker.selectedRow(inComponent: 0)]
    }
    
    @objc func doneNaingSelect(){
        NaingTextField.resignFirstResponder()
        NaingTextField.text = NRCData.N[naingPicker.selectedRow(inComponent: 0)]
    }
    
    @IBAction func tappedContinueButton(_ sender: Any) {
        let nrc_number = "\(stateNoTextField.text ?? "")/\(districtTextField.text ?? "")(\(NaingTextField.text ?? ""))\(NRCNoTextField.text ?? "")"
        let signupRequest = SignupRequest(name: nameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", password_confirmation: passwordConfirmTextField.text ?? "", date_of_birth: birthDateTextField.text ?? "", gender: genderTextField.text ?? "", id_type: NRCTypeTextField.text ?? "", id_number: nrc_number)
        self.delegate?.tappedContinue(registerData: signupRequest, cell: self)
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        self.delegate?.tappedLogin()
    }
}

protocol SignUpTableViewCellDelegate: AnyObject{
    func tappedContinue(registerData: SignupRequest, cell: SignUpTableViewCell)
    func tappedLogin()
}

extension SignUpTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genderPicker{
            return genderPickerData.count
        }else if pickerView == NRCTypePicker{
            return nrcTypeData.count
        }else if pickerView == stateNoPicker{
            return NRCData.state_no.count
        }else if pickerView == districtPicker{
            return NRCData.district[stateNoPicker.selectedRow(inComponent: 0)].count
        }else{
            return NRCData.N.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderPicker{
            return genderPickerData[row]
        }else if pickerView == NRCTypePicker{
            return nrcTypeData[row]
        }else if pickerView == stateNoPicker{
            return NRCData.state_no[row]
        }else if pickerView == districtPicker{
            return NRCData.district[stateNoPicker.selectedRow(inComponent: 0)][row]
        }else{
            return NRCData.N[row]
        }
    }
}
