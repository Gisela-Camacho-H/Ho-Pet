//
//  Ho-Pet
//
//  Created by GiselaCamacho on 01/02/23.
//

import UIKit

struct Config: Decodable {
    let login: String
    let updatePhoto: String
    let emptyPassword: String
    let PasswordsDontMatch: String
    let goToLogin: String
}

struct ConfigValues {
    static func get() -> Config {
        
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            fatalError("Could not find prints.plist in your bundle")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Config.self, from: data)
        } catch let err{
            print(err)
            fatalError(err.localizedDescription)
        }
    }
}
