//
//  DogViewMode.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 19/09/22.
//

import Foundation

public class HomeViewModel {
    // MARK: - Imagenes de libros
    var imageSource : HomeObjectCollection?
    
        func getImage(){

            let dog1 = Home(image: "dog1")
            let dog2 = Home(image: "dog2")
            let dog3 = Home(image: "dog3")
            let dog4 = Home(image: "dog4")
            let dog5 = Home(image: "dog5")
            let dog6 = Home(image: "dog6")
            let dog7 = Home(image: "dog7")
            let dog8 = Home(image: "dog8")
            let dog9 = Home(image: "dog9")
            let dog10 = Home(image: "dog10")
            let Dogs = Catego(name: "Dogs", home: [dog1, dog2, dog3, dog4, dog5, dog6, dog7, dog8, dog9, dog10])

            let Image = HomeObjectCollection(catego: [Dogs], title: "Dogs")
            
            imageSource = Image
            
        }
}
