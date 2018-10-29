//
//  TranslationService.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 30/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

enum Language: String {
    case en = "en"
    case de = "de"
    case tr = "tr"
    case es = "es"
    case error
}

class TranslationService {

    init(translationSession: URLSession = URLSession(configuration: .default)) {
        self.translationSession = translationSession
    }
    
    private var translationSession : URLSession
    
    func getTranslation(source: Language, target: Language, textToTranslate: String, callback: @escaping (Bool, TranslatedText?) -> Void) {
        
        guard let url = URL(string: getURL(textToTranslate: textToTranslate, source: source, target: target)) else { return }
        
        var task : URLSessionDataTask?
       
        task?.cancel()
        
        task = translationSession.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async{
                
                guard let data = data, error == nil else {
                    callback(false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }
                guard let responseJSON = try? JSONDecoder().decode(DataTranslations.self, from: data),
                    let translatedText = responseJSON.data.translations?[0] else {
                    callback(false, nil)
                    return
                }
                callback(true, translatedText)
            }
        }
        task?.resume()
    }
    
    
    func getURL(textToTranslate: String, source: Language, target: Language ) -> String {

        guard let textTotranslateInURL = textToTranslate.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return ""
        }
        let request = Constante.TranslationAPI.key + Constante.TranslationAPI.source + source.rawValue + Constante.TranslationAPI.target + target.rawValue + Constante.TranslationAPI.format + Constante.TranslationAPI.textToTranslateParameter
        guard let requestEncoded = request.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return "" }
        let urlRequest = Constante.TranslationAPI.baseURL + requestEncoded + textTotranslateInURL
        return urlRequest
    }
    
}
