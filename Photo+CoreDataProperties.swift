//
//  Photo+CoreDataProperties.swift
//  
//
//  Created by GiselaCamacho on 10/11/22.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var image: Data?

}
