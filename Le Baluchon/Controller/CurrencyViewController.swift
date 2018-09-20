//
//  CurrencyViewController.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 06/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var currencyResultLabel: UILabel!
    @IBOutlet weak var ConvertButton: UIButton!
    @IBOutlet weak var EuroCurrencyLabel: UILabel!
    @IBOutlet weak var targetCurrencyLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let currencyService = CurrencyService()
    
    @IBAction func changeAction(){
        ActivityController.activityController(activityIndicator: activityIndicator, button: ConvertButton, showActivityIndicator: true)
        change()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ActivityController.activityController(activityIndicator: activityIndicator, button: ConvertButton, showActivityIndicator: false)
        currencyService.getCurrecy { (success, currency) in
            print(success)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func clear() {
        currencyTextField.text = ""
        currencyResultLabel.text = ""
    }
    
    func change(){
        currencyService.getCurrecy { (success, currency) in
             ActivityController.activityController(activityIndicator: self.activityIndicator, button: self.ConvertButton, showActivityIndicator: false)
            if success, let currency = currency {
                self.updateDisplay(currency: currency)
            } else {
                self.showErrorPopup(title: "erreur", message: "erreur")
            }
        }
    }

    func updateDisplay(currency: Currency) {

        guard let inputCurrency = currencyTextField.text, !inputCurrency.isEmpty else {
            showErrorPopup(title: "Données manquantes", message: "Merci de bien vouloir entrer un nombre !")
            clear()
            return
        }

        guard let baseCurrencyRate = Double(inputCurrency) else {
            showErrorPopup(title: "Données Erronées", message: "Merci de bien vouloir entrer un nombre pour obtenir la devise !")
           clear()
            return
        }

        guard let rateTarget = currency.rate?.usd else {
            showErrorPopup(title: "Taux indisponible", message: "Le taux n'a pu être obtenu du serveur")
            return
        }

        let currencyResult = Currency.calculateCurrency(baseCurrency: baseCurrencyRate, rateTarget: rateTarget)

        currencyResultLabel.text = String(format: "%.3f", currencyResult)
        EuroCurrencyLabel.text = currency.baseCurrency
        targetCurrencyLabel.text = "USD"
    }
    
}
