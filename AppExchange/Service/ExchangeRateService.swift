//
//  ExchangeRateService.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 6/2/24.
//

import Foundation

class ExchangeRateService {
    private let apiKey = "bdfa83b1fd5f4fb3bb8373e1db9e6631"
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
