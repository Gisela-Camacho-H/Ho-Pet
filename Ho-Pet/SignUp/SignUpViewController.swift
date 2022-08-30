//
//  SignUpViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 30/08/22.
//

import UIKit

class SignUpViewController: UIViewController {
        
    private weak var logo: UIImageView?
    private weak var titleLogin: UILabel?
    private weak var submitButton: UIView.pinkButton?
    private weak var nameTextField: UIView.signUpTextField?
    private weak var emailTextField: UIView.signUpTextField?
    private weak var passwordTextField: UIView.signUpTextField?
    private weak var repeatPasswordTextField: UIView.signUpTextField?
    private weak var textFieldStack: UIStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setContrains()
    }
        
    func initUI() {
        //Background
        view.backgroundColor = UIColor.backgroundBlack
        
        // logo Image
        let logo = UIImageView(frame: .zero)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        logo.layer.cornerRadius = Constants.width/10
        logo.clipsToBounds = true
        self.view.addSubview(logo)
        self.logo = logo
                            
        //MARK: - Login
        let signInButton = UIView.pinkButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Submit", for: .normal)
        signInButton.addTarget(self, action: #selector(onloginButtonTap), for: .touchUpInside)
        self.view.addSubview(signInButton)
        self.submitButton = signInButton
            
        //MARK: - Email TextField
        let nameTextField = UIView.signUpTextField()
        self.emailTextField = nameTextField
        self.view.addSubview(nameTextField)
        
        let emailTextField = UIView.signUpTextField()
        self.emailTextField = emailTextField
        self.view.addSubview(emailTextField)
            
        let passwordTextField = UIView.signUpTextField()
        self.passwordTextField = passwordTextField
        passwordTextField.isSecureTextEntry = true
        self.view.addSubview(passwordTextField)
            
        let repeatPasswordTextField = UIView.signUpTextField()
        self.repeatPasswordTextField = repeatPasswordTextField
        repeatPasswordTextField.isSecureTextEntry = true
        self.view.addSubview(repeatPasswordTextField)
        
        //MARK: - textField Stack
        let textFieldStack = UIStackView(frame: .zero)
        textFieldStack.axis = .vertical
        textFieldStack.spacing = 50.0
        textFieldStack.alignment = .fill
        textFieldStack.distribution = .fillEqually
        
        view.addSubview(textFieldStack)
        self.textFieldStack = textFieldStack
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        let textFieldArray = [nameTextField, emailTextField, passwordTextField, repeatPasswordTextField]
        textFieldArray.forEach {button in
            textFieldStack.addArrangedSubview(button)
            }
    }
        
    func setContrains() {
        guard let logo = logo , let textFieldStack = textFieldStack, let signInButton = submitButton else  { return }
            
        NSLayoutConstraint.activate([logo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        ])
            
        //MARK: - textFielf Stack
                    
        NSLayoutConstraint.activate([
            textFieldStack.topAnchor.constraint(equalTo: view.topAnchor, constant:  80),
            textFieldStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.8)
                ])
            
        NSLayoutConstraint.activate([signInButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 50),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            signInButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            ])
        }
        
        @objc func onloginButtonTap(){
            print("Go to home")
        }
    }
