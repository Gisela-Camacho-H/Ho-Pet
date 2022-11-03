//
//  Entity.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 27/10/22.
//

import Foundation
import CoreData
import UIKit

struct PhotoModel {
    let photo: Photo
    
    var photoID: NSManagedObjectID {
        return photo.objectID
    }
    
    var content: Data {
        return photo.image ?? Data()
    }
}

