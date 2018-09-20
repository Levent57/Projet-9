//
//  Currency.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 18/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

struct Currency: Decodable {
//    let rates: [String: Double]
    let baseCurrency: String?
    let rate: Rate?

        enum CodingKeys: String, CodingKey {
            case baseCurrency = "base"
            case rate
        }
    
}

extension Currency {
    
    static func calculateCurrency(baseCurrency: Double , rateTarget: Double) -> Double{
        print(rateTarget)
        let currency = baseCurrency * rateTarget
        
        return currency
    }
}

struct Rate: Decodable {
    let usd: Double
    let eur: Double
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
    }
}
