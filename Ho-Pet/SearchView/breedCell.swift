//
//  breedCell.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 09/02/23.
//

import Foundation
import UIKit
 
class BreedTableViewCell : UITableViewCell{
    
    var nameBreed : UILabel?
    
    var breed : String?

    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    
    init(breed: String) {
        super.init(style: .default, reuseIdentifier: nil)
        self.backgroundColor = .clear
        self.breed =  breed
        
        initUI()
    }
    
    func initUI(){
        
        nameBreed = UILabel(frame: CGRect(x: 20, y: 7, width: width / 1.6, height: 20))
        nameBreed?.font = UIFont(name: "Poppins-SemiBold", size: 14)
        nameBreed?.text = breed
        nameBreed?.textAlignment = .left
        nameBreed?.backgroundColor = .clear
        self.addSubview(nameBreed!)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

