//
//  SignInViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 30/08/22.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    private weak var logo: UIImageView?
    private weak var titleLogin: UILabel?
    private weak var signInButton: UIView.blackButton?
    private weak var emailTextField: UIView.mainTextField?
    private weak var passwordTextField: UIView.mainTextField?
    private weak var textFieldStack: UIStackView?
    weak var validacionLabel: UIView.validacionLabel?
    private weak var accountLabel: UILabel?
    private weak var signUpButton: UIButton?
    private weak var accounStackView: UIStackView?
    private var passwordCenterXAnchor: NSLayoutConstraint?
    private var userCenterXAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setContrains()
    }
    
    func getPassword() -> String{
        guard let data = KeychainManager.getPassWordKeychain(service: "hopet", acc: .password) else {
            return ""
        }
        let password = String(decoding: data, as: UTF8.self)
        return password
    }
    
    func getEmail() -> String {
        guard let data = KeychainManager.getEmailKeychain(key: "email") else {
            return ""
        }
        let email = String(decoding: data, as: UTF8.self)
        return email
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let emailTextField: UITextField = emailTextField,
        let passwordTextField: UITextField = passwordTextField else { return }

        UIView.animate(withDuration: 1.0, delay: 0.4, options: [.curveEaseIn], animations: {
        self.userCenterXAnchor?.isActive = false
        self.userCenterXAnchor = emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.userCenterXAnchor?.isActive = true

        self.passwordCenterXAnchor?.isActive = false
        self.passwordCenterXAnchor = passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.passwordCenterXAnchor?.isActive = true

        self.view.layoutIfNeeded()
        }, completion: nil)
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
        titleLogin = UILabel(frame: CGRect(x: 0, y: 230 , width: Constants.width, height: 50))
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
        emailTextField.attributedPlaceholder = NSAttributedString(
        string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.backgroundpink])
        emailTextField.text = getEmail()
        self.emailTextField = emailTextField
        self.view.addSubview(emailTextField)
        
        let passwordTextField = UIView.mainTextField()
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.backgroundpink])
        self.passwordTextField = passwordTextField
        passwordTextField.isSecureTextEntry = true
        passwordTextField.text = getPassword()
        self.view.addSubview(passwordTextField)
        
        let validacionLabel = UIView.validacionLabel()
        self.validacionLabel = validacionLabel
        validacionLabel.text = ""
        validacionLabel.textColor = .black
        self.view.addSubview(validacionLabel)
        
        // MARK: - go to Sign Up
        let accountLabel = UILabel()
        accountLabel.text = "  Don't have an account? "
        accountLabel.apply16Font()
        accountLabel.textColor = UIColor.backgroundBlack
        accountLabel.backgroundColor = UIColor.backgroundpinkblur
        self.accountLabel = accountLabel
        self.view.addSubview(accountLabel)
        
        let signUpButton = UIButton()
        signUpButton.setTitleColor(UIColor.darkPink, for: .normal)
        signUpButton.setTitle("SIGN UP  ", for: .normal)
        signUpButton.addTarget(self, action: #selector(GoToSignUp), for: .touchUpInside)
        signUpButton.titleLabel?.apply16Font()
        signUpButton.backgroundColor = UIColor.backgroundpinkblur
        signUpButton.layer.cornerRadius = 5
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
            element.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
    }
    
    func setContrains() {
        guard let logo = logo , let titleLogin = titleLogin, let signInButton = signInButton, let validacionLabel = validacionLabel, let accounStackView = accounStackView, let emailTextField = emailTextField, let passwordTextField = passwordTextField else  { return }
        
        NSLayoutConstraint.activate([logo.bottomAnchor.constraint(equalTo: titleLogin.bottomAnchor, constant: -60),
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        ])
        
        //MARK: - textField
        
        NSLayoutConstraint.activate([
          emailTextField.heightAnchor.constraint(equalToConstant: 50),
          passwordTextField.heightAnchor.constraint(equalToConstant: 50),
          emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant:  400),
          passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
          emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
          passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])

        userCenterXAnchor = emailTextField.centerXAnchor.constraint(
              equalTo: view.centerXAnchor, constant: -view.bounds.width)
        userCenterXAnchor?.isActive = true

        passwordCenterXAnchor = passwordTextField.centerXAnchor.constraint(
              equalTo: view.centerXAnchor, constant: view.bounds.width)
        passwordCenterXAnchor?.isActive = true
                
        NSLayoutConstraint.activate([validacionLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
        validacionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        validacionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        NSLayoutConstraint.activate([signInButton.topAnchor.constraint(equalTo: validacionLabel.bottomAnchor, constant: 20),
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        signInButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
        ])
        
        NSLayoutConstraint.activate([accounStackView.bottomAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 60),
                                     accounStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func onloginButtonTap(){
        guard let email = emailTextField?.text, let password = passwordTextField?.text else { return }
        if emailTextField?.text == "" {
                validacionLabel?.text = "Write a email"
                return
            }
        
        if passwordTextField?.text == "" {
            print(ConfigValues.get().emptyPassword)
            validacionLabel?.text = "Write your password"
            return
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print(e)
                } else {
                    do {
                        try KeychainManager.savePassword(
                            service: "hopet",
                            acc: .password,
                            password: self?.passwordTextField?.text?.data(using: .utf8) ?? Data())
                        try KeychainManager.saveEmail(
                            key: .email,
                            account:  self?.emailTextField?.text?.data(using: .utf8) ?? Data())
                    } catch {
                        print("error")
                    }
                    
                    
                    let goHome = TabBarViewController()
                    print(ConfigValues.get().login)
                    let navVC = UINavigationController(rootViewController: goHome)
                    navVC.modalPresentationStyle = .fullScreen
                    self?.present(navVC, animated: true, completion: nil)
                }
            }

        }
    }
    
    @objc func GoToSignUp() {
        let goSignUp = SignUpViewController()
        goSignUp.modalPresentationStyle = .fullScreen
        present(goSignUp, animated: true, completion: nil)
    }
}
