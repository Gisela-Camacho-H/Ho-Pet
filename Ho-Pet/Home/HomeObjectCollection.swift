//
//  DogObjectCollection.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 19/09/22.
//

import UIKit

// collectionView class
class HomeObjectCollection{
    var catego : [Catego]?
    var title : String?
    
    // init the elements
    init(catego : [Catego], title : String){
        self.catego = catego
        self.title = title
    }
        
}

// each category has a name and a book
class Catego{
    var name : String?
    var home : [Home]?
    
    init(name : String, home: [Home]){
        self.name = name
        self.home = home
    }
}

// varibles per book
class Home {
    var image : String?
    
    init(image : String){
        self.image = image

    }
    
}
