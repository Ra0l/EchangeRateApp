//
//  CurrencyConverterViewModel.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 5/31/24.
//

import SwiftUI
import Combine

class CurrencyConverterViewModel: ObservableObject {
    
    var isDolarToSoles: Bool = true
    @Published var amount: String = ""
    @Published var baseCurrency: String = "USD"
    @Published var targetCurrency: String = "PEN"
    @Published var currencies: [String] = []
    
    var result: String {
        guard let exchangeRates = exchangeRates,
              let rate = exchangeRates.rates[targetCurrency],
              let amount = Double(amount) else {
            return "Ingrese un valor para realizar la conversión"
        }
        let convertedAmount = amount * rate
        return String(format: "%.5f", convertedAmount)
    }

    private var exchangeRates: ExchangeRate?
    private var service = ExchangeRateService()

    func fetchCurrencies() {
        service.fetchExchangeRates(for: baseCurrency) { [weak self] exchangeRate in
            DispatchQueue.main.async {
                self?.exchangeRates = exchangeRate
                self?.currencies = exchangeRate?.rates.keys.sorted() ?? []
            }
        }
    }
}
