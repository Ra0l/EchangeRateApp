//
//  Rate.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 5/31/24.
//

import Foundation

struct ExchangeRate: Decodable {
    let base: String
    let rates: [String: Double]
}
