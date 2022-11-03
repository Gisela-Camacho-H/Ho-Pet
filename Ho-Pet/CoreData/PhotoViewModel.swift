//
//  PhotoViewModel.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 27/10/22.
//

import Foundation
import LocalAuthentication
import SwiftUI
import UIKit

class AccountViewModel: ObservableObject {
 
    @Published var userInfo: PhotoModel?
    var imageProfile: UIImage = UIImage()
    
    func savePhoto(image: UIImage) {
        let photoData = image.jpegData(compressionQuality: 1.0) ?? Data()
        UserDataManager.shared.savePhoto(data: photoData)
    }

    func getPhoto() {
      userInfo = UserDataManager.shared.getPhoto().map(PhotoModel.init).first
        let image = UIImage(data: userInfo?.content ?? Data())
        imageProfile = image ?? UIImage()
    }
}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
