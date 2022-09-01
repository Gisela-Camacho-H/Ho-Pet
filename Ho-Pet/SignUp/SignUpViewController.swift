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
    weak var emailTextField: UIView.signUpTextField?
    private weak var passwordTextField: UIView.signUpTextField?
    private weak var repeatPasswordTextField: UIView.signUpTextField?
    private weak var textFieldStack: UIStackView?
    weak var validacionLabel: UIView.validacionLabel?
    private weak var accountLabel: UILabel?
    private weak var signUpButton: UIButton?
    private weak var accounStackView: UIStackView?
    
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
        logo.layer.cornerRadius = Constants.width/6.67
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
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceHolderWhite])
        self.nameTextField = nameTextField
        self.view.addSubview(nameTextField)
        
        let emailTextField = UIView.signUpTextField()
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceHolderWhite])
        self.emailTextField = emailTextField
        self.view.addSubview(emailTextField)
            
        let passwordTextField = UIView.signUpTextField()
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceHolderWhite])
        self.passwordTextField = passwordTextField
        passwordTextField.isSecureTextEntry = true
        self.view.addSubview(passwordTextField)
            
        let repeatPasswordTextField = UIView.signUpTextField()
        repeatPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Repear Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceHolderWhite])
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
        
        let validacionLabel = UIView.validacionLabel()
        self.validacionLabel = validacionLabel
        validacionLabel.text = ""
        self.view.addSubview(validacionLabel)
        
        // MARK: - go to Sign Up
        let accountLabel = UILabel()
        accountLabel.text = "Already have an account "
        accountLabel.apply16Font()
        accountLabel.textColor = UIColor.backgroundpink
        self.accountLabel = accountLabel
        self.view.addSubview(accountLabel)
        
        let signUpButton = UIButton()
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.setTitle("SIGN IN", for: .normal)
        signUpButton.addTarget(self, action: #selector(GoToSignIn), for: .touchUpInside)
        signUpButton.titleLabel?.apply16Font()
        self.signUpButton = signUpButton
        self.view.addSubview(signUpButton)
//MARK: - cuentaStackView
        let cuentaArray: [AnyObject] = [accountLabel, signUpButton]
        
        let accounStackView = UIStackView()
        accounStackView.axis = .horizontal
        accounStackView.spacing = 1
        accounStackView.alignment = .fill
        accounStackView.distribution = .equalSpacing
            cuentaArray.forEach {element in
                accounStackView.addArrangedSubview(element as! UIView)
        }
        self.accounStackView = accounStackView
        self.view.addSubview(accounStackView)
        accounStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cuentaArray.forEach {element in
            element.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        
    }
        
    func setContrains() {
        guard let logo = logo , let textFieldStack = textFieldStack, let signInButton = submitButton, let validacionLabel = validacionLabel, let accounStackView = accounStackView else  { return }
            
        NSLayoutConstraint.activate([logo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
        logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
        ])
            
        //MARK: - textFielf Stack
                    
        NSLayoutConstraint.activate([
            textFieldStack.topAnchor.constraint(equalTo: view.topAnchor, constant:  80),
            textFieldStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.8)
                ])
            
        NSLayoutConstraint.activate([validacionLabel.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 40),
        validacionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        validacionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        NSLayoutConstraint.activate([signInButton.topAnchor.constraint(equalTo: validacionLabel.bottomAnchor, constant: 40),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            signInButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            ])
        
        NSLayoutConstraint.activate([accounStackView.bottomAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
                                     accounStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        }
    
    @objc func GoToSignIn() {
        print("Go to Sign In")
        let goSignIn = SignInViewController()
        goSignIn.modalPresentationStyle = .fullScreen
        present(goSignIn, animated: true, completion: nil)
    }

    @objc func onloginButtonTap(){
        
        func isValidEmail(emailID:String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
           let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailTest.evaluate(with: emailID)
       }
        // empty information 
        if nameTextField?.text == "" {
                print("Empty Name")
                validacionLabel?.text = "Write your name"
                return
            }
        
        if emailTextField?.text == "" {
                print("Empty Email")
                validacionLabel?.text = "Write a email"
                return
            }
        
        if passwordTextField?.text == "" {
            print("Empty password")
            validacionLabel?.text = "Write your password"
            return
        }
        
        if repeatPasswordTextField?.text == "" {
            print("Empty password confirm")
            validacionLabel?.text = "Confirm your password"
            return
        }
        
        if isValidEmail(emailID: emailTextField?.text ?? "") {
            validatePass()
            } else {
                print("no valid Email")
                validacionLabel?.text = "Write a valid email"
            }
        }
    func validatePass() {
        guard let passwordTextField = passwordTextField, let repeatPasswordTextField = repeatPasswordTextField else {
            return
        }

        if passwordTextField.text == repeatPasswordTextField.text {
            print("Valid Email")
                print("Go to login")
                let goLogin = SignInViewController()
                goLogin.modalPresentationStyle = .fullScreen
                present(goLogin, animated: true, completion: nil)
        }else {
            print("Passwords don't match")
            validacionLabel?.text = "Match the passwords"
        }
    }
        
    }
