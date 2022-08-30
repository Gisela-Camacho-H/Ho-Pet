//
//  UIView++.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 30/08/22.
//

import UIKit

extension UIView{
    
    func applyWhiteBackgroundColor(){
        self.backgroundColor = .white
    }
    
    func applyBlackBackgroundColor(){
        self.backgroundColor = .backgroundBlack
    }
    
    //MARK: - Button
    class pinkButton: UIButton {
        override init(frame: CGRect){
            super.init(frame: frame)
            backgroundColor = UIColor.backgroundpink
            setTitleColor(.black, for: .normal)
            layer.cornerRadius = Constants.cornerRadius
            titleLabel?.applyTitleFont()
        }
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
    
    class clearButton: UIButton {
        override init(frame: CGRect){
            super.init(frame: frame)
            layer.borderColor = UIColor.backgroundpink.cgColor
            layer.borderWidth = Constants.borderWidth
            setTitleColor(.backgroundpink, for: .normal)
            layer.cornerRadius = Constants.cornerRadius
            titleLabel?.applyTitleFont()

        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class blackButton: UIButton {
            override init(frame: CGRect){
                super.init(frame: frame)
                backgroundColor = UIColor.backgroundBlack
                setTitleColor(.backgroundpink, for: .normal)
                layer.cornerRadius = Constants.cornerRadius
                titleLabel?.applyTitleFont()
            }
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
    }

    //MARK: - label

    class validacionLabel: UILabel {
        override init(frame: CGRect){
            super.init(frame: frame)
            apply14Font()
            textColor = .red
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
            numberOfLines = 0
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
//MARK: - Text Field
    class mainTextField: UITextField {
        override init(frame: CGRect){
            super.init(frame: frame)
            heightAnchor.constraint(equalToConstant: Constants.height/15).isActive = true
            layer.cornerRadius = 7
            layer.borderWidth = 1
            backgroundColor = .white
            textAlignment = NSTextAlignment.left
            keyboardType = UIKeyboardType.default
            textColor = UIColor.backgroundBlack
            autocorrectionType = UITextAutocorrectionType.no
            clearButtonMode = UITextField.ViewMode.whileEditing
            leftViewMode = UITextField.ViewMode.always
            translatesAutoresizingMaskIntoConstraints = false
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class signUpTextField: UITextField {
        override init(frame: CGRect){
            super.init(frame: frame)
            heightAnchor.constraint(equalToConstant: Constants.height/15).isActive = true
            backgroundColor = UIColor.textFieldColor
            layer.borderColor = UIColor.backgroundpink.cgColor
            layer.cornerRadius = 10
            layer.borderWidth = 2
            textAlignment = NSTextAlignment.left
            keyboardType = UIKeyboardType.default
            textColor = UIColor.backgroundBlack
            autocorrectionType = UITextAutocorrectionType.no
            clearButtonMode = UITextField.ViewMode.whileEditing
            leftViewMode = UITextField.ViewMode.always
            translatesAutoresizingMaskIntoConstraints = false
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
}
