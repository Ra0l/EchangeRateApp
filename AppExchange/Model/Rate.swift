//
//  Rate.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 5/31/24.
//

import Foundation

struct ExchangeRate: Decodable {
    let provider: String
    let warning: String
    let terms: String
    let date: String
    let timeLastUpdated: Int
    let base: String
    let rates: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        case provider
        case warning = "WARNING_UPGRADE_TO_V6"
        case terms
        case date
        case timeLastUpdated = "time_last_updated"
        case base
        case rates
    }
}
