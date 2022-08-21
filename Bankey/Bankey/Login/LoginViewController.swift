//
//  ViewController.swift
//  Bankey
//
//  Created by Chandan on 10/08/22.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bankey"

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Your premium source for all things banking!"

        
    }
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        //Constraints for Title.
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
        ])
                
       //Constraints for Subtitle.
        NSLayoutConstraint.activate([
            subtitleLabel.widthAnchor.constraint(equalTo: loginView.widthAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
        ])

        
        //Constraints for Login View.
        NSLayoutConstraint.activate([
            //Below line puts the subview in middle of the screen equal to view.
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            //Below line is for pin the subview to left or leading side from view.
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            
            //Below line is for pin the subview to right or trailing side from view.
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
        ])
        
        //Constraints for Sign In Button.
        NSLayoutConstraint.activate([
          
            //Below line is for pin the subview to left or leading side equal to loginView.
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            
            //Below line is for pin the subview to right or trailing side equal to loginView.
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),

            //Below line is for pin the subview below loginView with spacing 2.
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2)
        ])
        
        //Constraints for Error Label.
        NSLayoutConstraint.activate([
          
            //Below line is for pin the subview to left or leading side.
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            
            //Below line is for pin the subview to right or trailing side.
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),

            //Below line is for pin the subview below signInButton with spacing 2.
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2)
        ])
    }
    
}


// MARK: - Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        
        login()
        
    }
    
    private func login()
    {
        guard let username = username, let password = password else {
            assertionFailure("Username & password should never be nil!")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username & password cannot be blank!")
            return
        }
        
        if username == "Chandan" && password == "12345" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }
        else {
            configureView(withMessage: "Incorrect username or password!")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        
    }
}
