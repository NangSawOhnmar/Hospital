//
//  SignUpViewController.swift
//  Hospital
//
//  Created by nang saw on 04/02/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signupTableView: UITableView!
    private var apiRequest: Request!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        apiRequest = Request()
    }

    func setupTableView(){
        signupTableView.register(UINib(nibName: SignUpTableViewCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: SignUpTableViewCell.IDENTIFIER)
        signupTableView.delegate = self
        signupTableView.dataSource = self
    }
}

extension SignUpViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SignUpTableViewCell.IDENTIFIER, for: indexPath) as? SignUpTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SignUpViewController: SignUpTableViewCellDelegate{
    func tappedContinue(registerData: SignupRequest, cell: SignUpTableViewCell) {
        apiRequest.registerAccount(params: registerData, success: { response in
            print("success:",response)
            self.toastMessage("Success register")
        }, fail: { error in
            print("error:",error)
            self.toastMessage(error.message)
            if let nameError = error.data.name{
                cell.nameErrorMessageLabel.text = nameError.joined()
            }
            if let emailError = error.data.email{
                cell.emailErrorMessageLabel.text = emailError.joined()
            }
            if let dobError = error.data.date_of_birth{
                cell.dobErrorMessageLabel.text = dobError.joined()
            }
            if let genderError = error.data.gender{
                cell.genderErrorMessageLabel.text = genderError.joined()
            }
            if let idTypeError = error.data.id_type{
                cell.IDTypeErrorMessageLabel.text = idTypeError.joined()
            }
            if let idNumberError = error.data.id_number{
                cell.IDNumberErrorMessageLabel.text = idNumberError.joined()
            }
            if let passwordError = error.data.password{
                cell.passwordErrorMessageLabel.text = passwordError.joined()
            }
            if let passwordConfirmError = error.data.password_confirmation{
                cell.confirmPasswordErrorMessageLabel.text = passwordConfirmError.joined()
            }
        })
    }
    
    func tappedLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
