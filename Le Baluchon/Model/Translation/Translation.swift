//
//  Translation.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 30/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

struct DataTranslations: Decodable {
    var data: Translations
    
}

struct Translations: Decodable {
    let translations: [TranslatedText]?
}

struct TranslatedText: Decodable {
    let translatedText: String?
}
