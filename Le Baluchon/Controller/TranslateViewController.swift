//
//  TranslateViewController.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 06/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import UIKit

class TranslateViewController: UIViewController {
    
    
    @IBOutlet weak var TranslationTextField: UITextField!
    
    @IBOutlet weak var TranslatedText: UILabel!
    
    @IBAction func TranslateButton(_ sender: UIButton) {
        translate()
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        TranslationTextField.resignFirstResponder()
    }
    
    let translationService = TranslationService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let pairsLanguage = "Français -> Anglais"
 
    
    private func translate() {
        guard let textToTranslate = TranslationTextField.text, !textToTranslate.isEmpty else {
            self.showErrorPopup(title: "erreur", message: "Pas de contenu")
            return
        }
        translationService.getTranslation(textToTranslate: textToTranslate, pairsLanguage: pairsLanguage) { (success, translatedText) in
            print(success)
            if success, let translatedText = translatedText?.translatedText {
                print(translatedText)
                self.updateDisplay(textTranslated: translatedText)
            } else {
            self.showErrorPopup(title: "erreur", message: "pas de reseau")
            }
        }
    }
    
    private func updateDisplay(textTranslated: String?) {
        TranslatedText.text = textTranslated
    }
    
    
    
    
    
}
