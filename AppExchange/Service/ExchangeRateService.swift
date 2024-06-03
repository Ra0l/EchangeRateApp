//
//  ExchangeRateService.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 6/2/24.
//

import Foundation
import UIKit

protocol ExchangeRateServiceProtocol {
    func fetchExchangeRates(for baseCurrency: String, completion: @escaping (ExchangeRate?) -> Void)
}

class ExchangeRateService: ExchangeRateServiceProtocol {
    /** https://www.exchangerate-api.com/docs/free  */
    private let baseURL = "https://api.exchangerate-api.com/v4/latest/"

    func fetchExchangeRates(for baseCurrency: String, completion: @escaping (ExchangeRate?) -> Void) {
        let url = URL(string: "\(baseURL)\(baseCurrency)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let exchangeRate = try? JSONDecoder().decode(ExchangeRate.self, from: data)
            completion(exchangeRate)
        }.resume()
    }
}

class MockExchangeRateService: ExchangeRateServiceProtocol {
    var mockExchangeRate: ExchangeRate?
    
    func fetchExchangeRates(for baseCurrency: String, completion: @escaping (ExchangeRate?) -> Void) {
        completion(mockExchangeRate)
    }
}
