//
//  CurrencyConverterViewModel.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 5/31/24.
//

import SwiftUI
import Combine


class CurrencyConverterViewModel: ObservableObject {
    
    @Published var isDolarToSoles: Bool = true
    @Published var amount: String = ""
    @Published var baseCurrency: String = "USD"
    @Published var targetCurrency: String = "PEN"
    @Published var currencies: [String] = []
    
    var result: String {
        guard let exchangeRates = exchangeRates,
              let rate = exchangeRates.rates[isDolarToSoles ? targetCurrency : "USD"],
              let amount = Double(amount) else {
            return "Ingrese un valor para realizar la conversión"
        }
        let convertedAmount = amount * rate
        return String(format: "%.5f", convertedAmount)
    }

    var exchangeRates: ExchangeRate?
    private var service: ExchangeRateServiceProtocol
    
    init(service: ExchangeRateServiceProtocol) {
        self.service = service
    }

    func fetchCurrencies() {
        service.fetchExchangeRates(for: isDolarToSoles ? baseCurrency : "PEN") { [weak self] exchangeRate in
            DispatchQueue.main.async {
                self?.exchangeRates = exchangeRate
                self?.currencies = exchangeRate?.rates.keys.sorted() ?? []
            }
        }
    }
}
