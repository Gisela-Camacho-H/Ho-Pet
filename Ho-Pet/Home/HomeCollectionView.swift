//
//  HomeCollectionView.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 19/09/22.
//

import UIKit

class HomeCollectionView: UICollectionViewCell{
    
    
    var imageHome : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.backgroundBlack
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "dog1")
        return image
    }()

    
    override init(frame: CGRect){
        super.init(frame: .zero)
        self.backgroundColor = .darkGray
        
        imageHome =  UIImageView(frame: CGRect(x: 6, y: 8, width: Constants.width/7, height: Constants.height/9))
        self.addSubview(imageHome)

    }
    
    // assign the elements
    func setData (home : Home){
        imageHome.image = UIImage(named: home.image ?? "")
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
}
