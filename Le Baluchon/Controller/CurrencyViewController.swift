//
//  CurrencyViewController.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 06/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var currencyResultLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var euroCurrencyLabel: UILabel!
    @IBOutlet weak var targetCurrencyLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        currencyTextField.resignFirstResponder()
    }
    
    @IBAction func changeAction(){
        ActivityIndicator.activityIndicator(activityIndicator: activityIndicator, button: convertButton, showActivityIndicator: true)
        change()
    }
    
    //MARK: Vars
    let currencyService = CurrencyService()

    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ActivityIndicator.activityIndicator(activityIndicator: activityIndicator, button: convertButton, showActivityIndicator: false)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Methods
    private func clear() {
        currencyTextField.text = ""
        currencyResultLabel.text = ""
    }
    
    // Get API data from Model
    private func change(){
        currencyService.getCurrecy { (success, currency) in
             ActivityIndicator.activityIndicator(activityIndicator: self.activityIndicator, button: self.convertButton, showActivityIndicator: false)
            if success, let currency = currency {
                self.updateDisplay(currency: currency)
            } else {
                self.showErrorPopup(title: "erreur", message: "erreur")
            }
        }
    }
    //Currency get from the Model to update into the view
    func updateDisplay(currency: Currency) {
        guard let inputCurrency = currencyTextField.text, !inputCurrency.isEmpty else {
            showErrorPopup(title: "Données manquantes", message: "Merci de bien vouloir entrer un nombre !")
            clear()
            return
        }
        guard let baseCurrency = Double(inputCurrency) else {
            showErrorPopup(title: "Données Erronées", message: "Merci de bien vouloir entrer un nombre pour obtenir la devise !")
           clear()
            return
        }
        guard let rateTarget = currency.rates?.usd else {
            showErrorPopup(title: "Taux indisponible", message: "Le taux n'a pu être obtenu du serveur")
            return
        }
        // Display the currency result with 3 numbers dicimal precision
        let currencyResult = Currency.calculateCurrency(baseCurrency: baseCurrency, rateTarget: rateTarget)
        currencyResultLabel.text = String(format: "%.3f", currencyResult)
    }

    
}
