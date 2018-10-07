//
//  TranslationService.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 30/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

class TranslationService {
    

    init(translationSession: URLSession = URLSession(configuration: .default)) {
        self.translationSession = translationSession
    }
    
    private var translationSession : URLSession
    
    func getTranslation(textToTranslate: String, pairsLanguage: String, callback: @escaping (Bool, TranslatedText?) -> Void) {
        
        guard let url = getURL(textToTranslate: textToTranslate, pairsLanguage: pairsLanguage) else {
            callback(false, nil)
            return
        }
        
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
    
    
    func getURL(textToTranslate: String, pairsLanguage: String ) -> URL? {

        let sourceAndTarget = setSourceAndTarget(pairsLanguage: pairsLanguage)
        guard let source = sourceAndTarget.source, let target = sourceAndTarget.target else { return nil }
        print(source)
        print(target)
        guard let textTotranslateInURL = textToTranslate.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return nil
        }
        let request = Constante.TranslationAPI.key + Constante.TranslationAPI.source + source + Constante.TranslationAPI.target + target + Constante.TranslationAPI.format + Constante.TranslationAPI.textToTranslateParameter
        guard let requestEncoded = request.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return nil }
        let urlRequest = Constante.TranslationAPI.baseURL + requestEncoded + textTotranslateInURL
        let url = URL(string: urlRequest)
        return url
    }
//    https://www.googleapis.com/language/translate/v2?key=AIzaSyCuum7i7Byx4LEA6AK6AiiwnAeqqwXlO_M&source=fr&target=en&format=text&q=C'est perdu
    
    func setSourceAndTarget(pairsLanguage: String) -> (source: String?, target: String?) {
        
        switch pairsLanguage {
        case "Français -> Anglais":
            let source = "fr"
            let target = "en"
            return (source, target)
        default:
            let source: String? = nil
            let target: String? = nil
            return (source, target)
        }
    }
    
}
