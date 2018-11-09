//
//  TranslateViewController.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 06/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import UIKit


class TranslateViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var translationTextField: UITextField!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var targetLanguageTextField: UITextField!
    @IBOutlet weak var translatedText: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBAction func TranslateButton(_ sender: UIButton) {
        ActivityIndicator.activityIndicator(activityIndicator: activityIndicator, button: translateButton, showActivityIndicator: true)
        translate()
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        translationTextField.resignFirstResponder()
        targetLanguageTextField.resignFirstResponder()
    }
    
    //MARK: - Vars
    let translationService = TranslationService()
    let pickerView = UIPickerView()
    let pickerDataArray = [Language.fr.rawValue, Language.de.rawValue, Language.en.rawValue, Language.tr.rawValue, Language.es.rawValue]
    
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       ActivityIndicator.activityIndicator(activityIndicator: activityIndicator, button: translateButton, showActivityIndicator: false)
        pickerView.dataSource = self
        pickerView.delegate = self
        targetLanguageTextField.inputView = pickerView
        targetLanguageTextField.text = Language.en.rawValue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    //MARK: Methods
    // Get API data from Model
    private func translate() {
        guard let textToTranslate = translationTextField.text, !textToTranslate.isEmpty else {
            self.showErrorPopup(title: "erreur", message: "Pas de contenu")
            ActivityIndicator.activityIndicator(activityIndicator: self.activityIndicator, button: self.translateButton, showActivityIndicator: false)
            clear()
            return
        }
        translationService.getTranslation(source: .fr, target: Language(rawValue: targetLanguageTextField!.text!)!, textToTranslate: textToTranslate) { (success, translatedText) in
            ActivityIndicator.activityIndicator(activityIndicator: self.activityIndicator, button: self.translateButton, showActivityIndicator: false)
            if success, let translatedText = translatedText?.translatedText {
                self.updateDisplay(textTranslated: translatedText)
            } else {
                self.showErrorPopup(title: "erreur", message: "Pas de reseaux")
            }
        }
    }
    
    private func updateDisplay(textTranslated: String?) {
        translatedText.text = textTranslated
    }
    
    private func clear() {
        translatedText.text = ""
        translationTextField.text = ""
    }

}
// MARK: Picker View
extension TranslateViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    //Set number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Set number of row in the component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataArray.count
    }
    //Display the titles of component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataArray[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        targetLanguageTextField.text = pickerDataArray[row]
    }

}
