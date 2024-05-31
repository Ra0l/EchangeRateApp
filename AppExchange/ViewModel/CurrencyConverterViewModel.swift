//
//  CurrencyConverterViewModel.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 5/31/24.
//

import SwiftUI
import Combine

class CurrencyConverterViewModel: ObservableObject {
    @Published var amount: String = ""
    @Published var baseCurrency: String = "USD"
    @Published var targetCurrency: String = "EUR"
    @Published var result: String = ""
    @Published var currencies: [String] = []

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

    func convert() {
        guard let exchangeRates = exchangeRates,
              let rate = exchangeRates.rates[targetCurrency],
              let amount = Double(amount) else {
            result = "Error en la conversión"
            return
        }
        let convertedAmount = amount * rate
        result = String(format: "%.2f", convertedAmount)
    }
}
