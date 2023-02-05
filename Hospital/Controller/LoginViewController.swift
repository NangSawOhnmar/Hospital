//
//  LoginViewController.swift
//  Hospital
//
//  Created by nang saw on 04/02/2023.
//

import UIKit
import CountryPickerView

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTableView: UITableView!
    private var apiRequest: Request!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        apiRequest = Request()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setupTableView(){
        loginTableView.register(UINib(nibName: LoginTableViewCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: LoginTableViewCell.IDENTIFIER)
        loginTableView.delegate = self
        loginTableView.dataSource = self
        loginTableView.tableFooterView = UIView()
    }

}

extension LoginViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginTableViewCell.IDENTIFIER) as? LoginTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension LoginViewController: LoginTableViewCellDelegate{
    func tappedLoginWithEmail(loginData: LoginRequestWithEmail, cell: LoginTableViewCell) {
        apiRequest.loginAccountWithEmail(params: loginData, success: { response in
            print("success:",response)
            self.toastMessage("Success login")
        }, fail: { error in
            self.toastMessage(error.message)
            if let emailError = error.data.email{
                cell.emailErrorMessageLabel.text = emailError.joined()
            }
            if let passwordError = error.data.password{
                cell.passwordErrorMessageLabel.text = passwordError.joined()
            }
        })
    }
    
    func tappedLoginWithPhone(loginData: LoginRequestWithPhoneNumber, cell: LoginTableViewCell) {
        apiRequest.loginAccountWithPhone(params: loginData, success: { response in
            print("success:",response)
            self.toastMessage("Success login")
        }, fail: { error in
            self.toastMessage(error.message)
            if let passwordError = error.data.password{
                cell.passwordErrorMessageLabel.text = passwordError.joined()
            }
        })
    }
    
    func tappedCountryCodeView(countryPicker: CountryPickerView) {
        countryPicker.showCountriesList(from: self)
    }
    
    func showSignUpView(viewController: SignUpViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
