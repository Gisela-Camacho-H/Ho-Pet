//
//  SignInViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 30/08/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    private weak var logo: UIImageView?
    private weak var titleLogin: UILabel?
    private weak var signInButton: UIView.blackButton?
    private weak var emailTextField: UIView.mainTextField?
    private weak var passwordTextField: UIView.mainTextField?
    private weak var textFieldStack: UIStackView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setContrains()
    }
    
    func initUI() {
        //Background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "huellas")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        // logo Image
        let logo = UIImageView(frame: .zero)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        logo.layer.cornerRadius = Constants.width/10
        logo.clipsToBounds = true
        self.view.addSubview(logo)
        self.logo = logo
        
        // App name
        var titleLogin = UILabel(frame: .zero)
        titleLogin = UILabel(frame: CGRect(x: 0, y: 220 , width: Constants.width, height: 50))
        titleLogin.text = "Login"
        titleLogin.textColor = UIColor.darkPink
        titleLogin.applyTitleFont()
        titleLogin.textAlignment = .center
        self.view.addSubview(titleLogin)
        self.titleLogin = titleLogin
                        
        //MARK: - Login
        let signInButton = UIView.blackButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(onloginButtonTap), for: .touchUpInside)
        self.view.addSubview(signInButton)
        self.signInButton = signInButton
        
        //MARK: - Email TextField
        let emailTextField = UIView.mainTextField()
        self.emailTextField = emailTextField
        self.view.addSubview(emailTextField)
        
        let passwordTextField = UIView.mainTextField()
        self.passwordTextField = passwordTextField
        passwordTextField.isSecureTextEntry = true
        self.view.addSubview(passwordTextField)
        
        //MARK: - textField Stack
        let textFieldStack = UIStackView(frame: .zero)
        textFieldStack.axis = .vertical
        textFieldStack.spacing = 100.0
        textFieldStack.alignment = .fill
        textFieldStack.distribution = .fillEqually
        
        view.addSubview(textFieldStack)
        self.textFieldStack = textFieldStack
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        let textFieldArray = [emailTextField, passwordTextField]
        textFieldArray.forEach {button in
            textFieldStack.addArrangedSubview(button)
            }
    }
    
    func setContrains() {
        guard let logo = logo , let titleLogin = titleLogin, let textFieldStack = textFieldStack, let signInButton = signInButton else  { return }
        
        NSLayoutConstraint.activate([logo.bottomAnchor.constraint(equalTo: titleLogin.bottomAnchor, constant: -60),
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        ])
        
        //MARK: - textFielf Stack
                
        NSLayoutConstraint.activate([
            textFieldStack.topAnchor.constraint(equalTo: titleLogin.bottomAnchor, constant:  80),
            textFieldStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.8)
                ])
        
        NSLayoutConstraint.activate([signInButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 50),
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        signInButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
        ])
    }
    
    @objc func onloginButtonTap(){
        print("Go to home")
    }
}
