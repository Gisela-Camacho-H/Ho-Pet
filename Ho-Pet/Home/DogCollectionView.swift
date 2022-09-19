//
//  DogCollectionView.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 01/09/22.
//

import Foundation
import UIKit

class DogCollectionView : UICollectionViewCell{
    
    var imageDog : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.darkPink
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "")
        return image
    }()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        // background per element
        self.backgroundColor = UIColor.backgroundpink
        // add elements to the view and give them size and place
        imageDog =  UIImageView(frame: CGRect(x: 6, y: 6, width: Constants.width/6, height: Constants.height/8))
        self.addSubview(imageDog)
    }
    required init?(coder: NSCoder){
        fatalError()
    }
}
