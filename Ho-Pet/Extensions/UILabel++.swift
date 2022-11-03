//
//  UILabel.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 30/08/22.
//
import UIKit

extension UILabel{
    
    // MARK: - Funciones de fuentes
    
    func headTitle(){
        self.font = UIFont(name: "Chalkduster", size: 60)
    }
    
    func applyTitleFont2(){
        self.font = UIFont(name: "HoeflerText-BlackItalic", size: 45)
    }
    
    func applyTitleFont(){
        self.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
    }

    func applySubtitleFont(){
        self.font = UIFont(name: "HoeflerText-BlackItalic", size: 25)
    }
    
    func apply20Font(){
        self.font = UIFont(name: "HoeflerText-BlackItalic", size: 20)
    }
    
    func apply16Font(){
        self.font = UIFont(name: "HoeflerText-BlackItalic", size: 16)
    }
    
    func apply14Font(){
        self.font = UIFont(name: "HoeflerText-BlackItalic", size: 14)
    }

}
