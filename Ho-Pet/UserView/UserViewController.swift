//
//  UserViewController.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 19/10/22.
//

import UIKit

class UserViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    private weak var buttonUpdateImage: UIButton?
    private var accountVM = AccountViewModel()
    private weak var imageProfile: UIImageView?
    lazy var userNameLabel: UILabel = UILabel()
    lazy var userEmailLabel: UILabel = UILabel()
    lazy var lightLabel: UILabel = UILabel()
    lazy var switchMode: UISwitch = UISwitch()
    let imagePicker: UIImagePickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setContrains()
        accountVM.getPhoto()
        imagePicker.delegate = self
    }
    
    func initUI(){
        
        let imageProfile = UIImageView(frame: .zero)
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        imageProfile.image = UIImage(systemName: "person.circle.fill")
        imageProfile.tintColor = .gray
        imageProfile.backgroundColor = .white
        imageProfile.layer.cornerRadius = Constants.width/4
        imageProfile.clipsToBounds = true
        self.view.addSubview(imageProfile)
        self.imageProfile = imageProfile
        
        let buttonUpdateImage = UIButton(frame: .zero)
        buttonUpdateImage.translatesAutoresizingMaskIntoConstraints = false
        buttonUpdateImage.setImage(UIImage(systemName: "camera.circle.fill"), for: UIControl.State.normal)
        buttonUpdateImage.tintColor = .white
        buttonUpdateImage.contentVerticalAlignment = .fill
        buttonUpdateImage.contentHorizontalAlignment = .fill
        buttonUpdateImage.backgroundColor = .backgroundBlack
        buttonUpdateImage.addTarget(self, action: #selector(updatePhoto), for: .touchUpInside)
        buttonUpdateImage.layer.cornerRadius = Constants.width/10
        buttonUpdateImage.clipsToBounds = true
        self.view.addSubview(buttonUpdateImage)
        self.buttonUpdateImage = buttonUpdateImage
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "user")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        title = "User"
        
        
        userNameLabel = UILabel(frame: CGRect(x: 30, y: 330, width: Constants.width - 60, height: 50))
        userNameLabel.text = "User Name: Gis"
        userNameLabel.apply20Font()
        view.addSubview(userNameLabel)

        userEmailLabel = UILabel(frame: CGRect(x: 30, y: 430, width: Constants.width - 60, height: 50))
        userEmailLabel.text = "User Email: gis@gmail.com"
        userEmailLabel.apply20Font()
        view.addSubview(userEmailLabel)
        
        switchMode = UISwitch(frame:CGRect(x: Constants.width/2, y: 500, width: 10, height: 10))
        switchMode.isOn = false
        switchMode.setOn(false, animated: false)
        switchMode.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        self.view!.addSubview(switchMode)
        
        lightLabel = UILabel(frame:CGRect(x: Constants.width/3 - 40, y: 510, width: 100, height: 20))
        lightLabel.text = "Light Mode "
        lightLabel.apply16Font()
        lightLabel.textAlignment = .center
        lightLabel.textColor = UIColor.backgroundBlack
        view.addSubview(lightLabel)

    }
    
    func setContrains() {
        guard let imageProfile = imageProfile, let buttonUpdateImage = buttonUpdateImage else {
            return
        }
        
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        imageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        imageProfile.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        imageProfile.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
        
        NSLayoutConstraint.activate([
            buttonUpdateImage.bottomAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 5),
            buttonUpdateImage.rightAnchor.constraint(equalTo: imageProfile.rightAnchor, constant: -3),
            buttonUpdateImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            buttonUpdateImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        ])
    }
    
    @objc func switchValueDidChange(_ sender: UISwitch!) {
        if (sender.isOn){
            overrideUserInterfaceStyle = .light
            userNameLabel.textColor = UIColor.backgroundBlack
            userEmailLabel.textColor = UIColor.backgroundBlack
            lightLabel.textColor = UIColor.backgroundBlack
            
        }
        else{
            overrideUserInterfaceStyle = .dark
            userNameLabel.textColor = .white
            userEmailLabel.textColor = .white
            lightLabel.textColor = .white
        }
        
    }
    
    @objc func updatePhoto(){
        print("updating photo")
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagenSeleccionada: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageProfile?.image = imagenSeleccionada
            accountVM.savePhoto(image: imagenSeleccionada)
            if imagePicker.sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(imagenSeleccionada, nil, nil, nil)
            }
        }
        imagePicker.dismiss(animated: true, completion: nil)
    
    }
    }
