//
//  WeatherViewController.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 06/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var newyorkLabel: UILabel!
    
    @IBOutlet weak var parisLabel: UILabel!
    
    @IBOutlet weak var newyorkConditionIcon: UIImageView!
    
    @IBOutlet weak var parisConditionIcon: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    let weatherService = WeatherService()
    let weatherSetting = WeatherSetting()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.activityIndicator.isHidden = false
        getNewyorkWeather()
        getParisWeather()
    }
    
    func getNewyorkWeather() {
        weatherService.getWeather(codeLocation: CodeLocation.newyork) { (success, weather) in
            self.activityIndicator.isHidden = true
            if success, let weather = weather {
                self.updateDisplay(temperature: weather.query.results.channel.item.condition.temp, codeConditions: weather.query.results.channel.item.condition.code, temperatureLabel: self.newyorkLabel, IconConditions: self.newyorkConditionIcon)
            } else {
                self.showErrorPopup(title: "erreur", message: "ny")
            }
        }
    }
    
    func getParisWeather() {
        weatherService.getWeather(codeLocation: CodeLocation.paris) { (success, weather) in
            self.activityIndicator.isHidden = true
            if success, let weather = weather {
                self.updateDisplay(temperature: weather.query.results.channel.item.condition.temp, codeConditions: weather.query.results.channel.item.condition.code, temperatureLabel: self.parisLabel, IconConditions: self.parisConditionIcon)
            } else {
                self.showErrorPopup(title: "erreur", message: "paris")
            }
        }
    }
    
    func updateDisplay (temperature: String?, codeConditions:String?, temperatureLabel: UILabel, IconConditions: UIImageView) {

        if let temperature = temperature {

            let temp = weatherSetting.convert(temp: temperature)
            temperatureLabel.text = temp
        } else {
            temperatureLabel.text = "erreur"
        }
        
        if let codeConditions = codeConditions {

            IconConditions.image = UIImage(imageLiteralResourceName: WeatherSetting.getWeatherIconSettings(weatherCodes: codeConditions))
        } else {
            IconConditions.image = #imageLiteral(resourceName: "EmptyImage")
        }

    }
}
