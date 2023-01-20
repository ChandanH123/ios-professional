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
    
    // title animation
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var titleLeadingAnchor: NSLayoutConstraint?
    
    // subTitle animation
    var trailingEdgeOnScreen: CGFloat = -16
    var trailingEdgeOffScreen: CGFloat = 1000
    
    var subTitleTrailingAnchor: NSLayoutConstraint?
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false // It takes any control or element of view in your viewController and makes it ready for auto layou, if you don't write this you'll not able to view anything.
        
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
        titleLabel.alpha = 0

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
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleLeadingAnchor?.isActive = true // If we set the constraints into NSLayoutConstraint.activate array then It is by default true but if we define the constraints outside the NSLayoutConstraint.activate array then we have to set isActive = true.
        
       //Constraints for Subtitle.
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3), // 3 = 24pts.
            // subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3), // 3 = 24pts.
        ])

        subTitleTrailingAnchor = subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingEdgeOffScreen)
        subTitleTrailingAnchor?.isActive = true // If we set the constraints into NSLayoutConstraint.activate array then It is by default true but if we define the constraints outside the NSLayoutConstraint.activate array then we have to set isActive = true.
        
        //Constraints for Login View.
        NSLayoutConstraint.activate([
            //Below line puts the subview in middle of the screen equal to view.
            view.centerYAnchor.constraint(equalTo: loginView.centerYAnchor),
            
            //Below line is for pin the subview to left or leading side from view.
            // loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2), // 2 = 16pts.
            //or
            //Below line is for pin the subview to left or leading side from view.
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            
            //Below line is for pin the subview to right or trailing side from view.
            // view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2), // 2 = 16pts.
            // or
            //Below line is for pin the subview to right or trailing side from view.
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
        ])
        
        //Constraints for Sign In Button.
        NSLayoutConstraint.activate([
          
            //Below line is for pin the subview to left or leading side equal to loginView.
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            
            //Below line is for pin the subview to right or trailing side equal to loginView.
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),

            //Below line is for pin the subview below loginView with spacing 2.
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2) // 2 = 16pts.
        ])
        
        //Constraints for Error Label.
        NSLayoutConstraint.activate([
          
            //Below line is for pin the subview to left or leading side.
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            
            //Below line is for pin the subview to right or trailing side.
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),

            //Below line is for pin the subview below signInButton with spacing 2.
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2) // 2 = 16pts.
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
        
        if username == "Ch" && password == "123" {
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
        shakeButton()
        
    }
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0] // [center, right, left, right, center] - x positions.
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1] // key frame timings.
        animation.duration = 0.4
        
        animation.isAdditive = true
        signInButton.layer.add(animation, forKey: "shake")
    }
}

extension LoginViewController {
    private func animate() {
        
        let duration = 2.0
        
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.subTitleTrailingAnchor?.constant = self.trailingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 1)
        
        let animator3 = UIViewPropertyAnimator(duration: duration * 2, curve: .easeInOut) {
            self.titleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation(afterDelay: 1)
    }
}
