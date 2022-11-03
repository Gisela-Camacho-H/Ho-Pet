//
//  PhotoDataManager.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 27/10/22.
//

import Foundation
import CoreData
import UIKit

class UserDataManager {
  var persistenceContainer: NSPersistentContainer
  static let shared = UserDataManager()

  var viewContext: NSManagedObjectContext {
    return persistenceContainer.viewContext
  }

  private init() {
    persistenceContainer = NSPersistentContainer(name: "HO-Pet-DB")
    persistenceContainer.loadPersistentStores { description, error in
      if let error = error {
        fatalError("Unable to initializable core data stack \(error)")
      }
    }
  }
    
    func savePhoto(data: Data) {
    do{
        try viewContext.save()
    } catch{
        viewContext.rollback()
        print(error.localizedDescription)
        }
    }
    
    func getPhoto() -> [Photo] {
    let request: NSFetchRequest<Photo> = Photo.fetchRequest()
      do {
        return try viewContext.fetch(request)
      } catch {
        return []
      }
    }
}
