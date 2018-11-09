//
//  TranslationService.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 30/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

enum Language: String {
    case fr = "fr"
    case en = "en"
    case de = "de"
    case tr = "tr"
    case es = "es"
    case error
}

class TranslationService {

    // MARK: Singleton
    init(translationSession: URLSession = URLSession(configuration: .default)) {
        self.translationSession = translationSession
    }
    private var translationSession : URLSession
    // MARK: Method
    func getTranslation(source: Language, target: Language, textToTranslate: String, callback: @escaping (Bool, TranslatedText?) -> Void) {
        guard let url = URL(string: getURL(textToTranslate: textToTranslate, source: source, target: target)) else { return }
        var task : URLSessionDataTask?
        task?.cancel() // Cancel the task before to start new one
        task = translationSession.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async{
                // Check data and no error
                guard let data = data, error == nil else {
                    callback(false, nil)
                    return
                }
                // Check Status response code
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }
                // Decode the JSON data
                guard let responseJSON = try? JSONDecoder().decode(DataTranslations.self, from: data),
                    let translatedText = responseJSON.data.translations?[0] else {
                    callback(false, nil)
                    return
                }
                // If all checks are okay, we set call back to true with the data
                callback(true, translatedText)
            }
        }
        // Resume the task
        task?.resume()
    }
    
    // Get translation url for URLSession
    func getURL(textToTranslate: String, source: Language, target: Language ) -> String {
        //  Format text to translate into allowed characters in URL (ex: space, special characters)
        let textTotranslateInURL = textToTranslate.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let request = Constante.TranslationAPI.key + Constante.TranslationAPI.source + source.rawValue + Constante.TranslationAPI.target + target.rawValue + Constante.TranslationAPI.format + Constante.TranslationAPI.textToTranslateParameter
        guard let requestEncoded = request.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return "" }
        let urlRequest = Constante.TranslationAPI.baseURL + requestEncoded + textTotranslateInURL!
        return urlRequest
    }
    
}
