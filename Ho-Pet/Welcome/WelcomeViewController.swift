//
//  ViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 30/08/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - Properties
    private weak var logo: UIImageView?
    var appName: UILabel?
    private weak var signInButton: UIView.clearButton?
    private weak var signUpButton: PinkButton?
    private weak var buttonStack: UIStackView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setContrains()
    }

    func initUI() {
        
        //Background
        view.backgroundColor = .black
        
        // Logo
        let logo = UIImageView(frame: .zero)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        logo.layer.cornerRadius = Constants.width/2.5
        logo.clipsToBounds = true
        self.view.addSubview(logo)
        self.logo = logo
        
        // App name
        var appName = UILabel(frame: .zero)
        appName = UILabel(frame: CGRect(x: 0, y: 100 , width: Constants.width, height: 50))
        appName.text = ""
        var charIndex = 0
       let titleText = "Ho - Pet"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: Double(charIndex) * 0.5, repeats: false){
                (timer) in
                self.appName?.text?.append(letter)
            }
            charIndex += 1
        }
        appName.textColor = .white
        appName.headTitle()
        appName.textAlignment = .center
        self.view.addSubview(appName)
        self.appName = appName
                        
        //MARK: - Sign Up
        let signUpButton = PinkButton()
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        self.view.addSubview(signUpButton)
        self.signUpButton = signUpButton
                
        //MARK: - Login
        let signInButton = UIView.clearButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(onloginButtonTap), for: .touchUpInside)
        self.view.addSubview(signInButton)
        self.signInButton = signInButton
        
        //MARK: - Button Stack
        let buttonStack = UIStackView(frame: .zero)
        buttonStack.axis = .vertical
        buttonStack.spacing = 50.0
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        
        view.addSubview(buttonStack)
        self.buttonStack = buttonStack
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        let buttonArray = [signUpButton, signInButton]
        buttonArray.forEach {button in
            buttonStack.addArrangedSubview(button)
            }
}
    
    func setContrains() {
        guard let logo = logo , let appName = appName, let buttonStack = buttonStack else  { return }
        
        NSLayoutConstraint.activate([logo.topAnchor.constraint(equalTo: appName.bottomAnchor, constant: 50),
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
        
        //MARK: - Button Stack
                
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: logo.bottomAnchor, constant:  70),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.8)
                ])
    }

    @objc func onloginButtonTap(){
        print("Go to login")
        let goLogin = SignInViewController()
        goLogin.modalPresentationStyle = .fullScreen
        present(goLogin, animated: true, completion: nil)
    }
    @objc func onSignUpButtonTap(){
        print("Go to Sign Up")
        let goSignUp = SignUpViewController()
        goSignUp.modalPresentationStyle = .fullScreen
        present(goSignUp, animated: true, completion: nil)
    }
}


