//
//  ContentView.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CurrencyConverterViewModel()

    var body: some View {
        VStack {
            TextField("Cantidad", text: $viewModel.amount)
                .keyboardType(.decimalPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                Picker("De", selection: $viewModel.baseCurrency) {
                    ForEach(viewModel.currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Picker("A", selection: $viewModel.targetCurrency) {
                    ForEach(viewModel.currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            
            Button("Convertir") {
                viewModel.convert()
            }
            .padding()

            Text(viewModel.result)
                .padding()
        }
        .padding()
        .onAppear {
            viewModel.fetchCurrencies()
        }
    }
}

#Preview {
    ContentView()
}
