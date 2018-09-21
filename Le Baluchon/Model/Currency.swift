//
//  Currency.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 18/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation

struct Currency: Decodable {

    let baseCurrency: String?
    let rates: Rate?

       private enum CodingKeys: String, CodingKey {
            case baseCurrency = "base"
            case rates
        }
}

extension Currency {
    
    static func calculateCurrency(baseCurrency: Double , rateTarget: Double) -> Double{
        let currency = baseCurrency * rateTarget
        
        return currency
    }
}

struct Rate: Decodable {
    let usd: Double
    
    private enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}
