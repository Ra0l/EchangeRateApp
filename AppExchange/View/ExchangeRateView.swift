//
//  ExchangeRateView.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 5/31/24.
//

import SwiftUI

struct ExchangeRateView: View {
    
    @ObservedObject var viewModel = CurrencyConverterViewModel(service: ExchangeRateService())
    @State var have = ""
    @State var receive = ""
    
    var body: some View {
        
        Text("APP EXCHANGE")
            .font(.title)
            .fontWeight(.bold)
        VStack(spacing: 10) {
            
            VStack {
                HStack {
                    Image("exchange")
                        
                    Text(viewModel.isDolarToSoles ? "Cambía tus dólares y soles al toque." : "Cambía tus soles y dólares al toque.")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                HStack(spacing: 20) {
                    Text("Venta: S/ 3.72000")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                    Text("Compra: S/ 3.72000")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Tienes")
                    .font(.headline)
                TextField(viewModel.isDolarToSoles ? "Dólares" : "Soles", text: $viewModel.amount)
                    .customTextField()
            }
            
            VStack(alignment: .leading) {
                Button {
                    viewModel.isDolarToSoles.toggle()
                    viewModel.fetchCurrencies()
                    viewModel.amount = viewModel.result
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.system(size: 50))
                        .foregroundStyle(.black)
                }

            }
            
            VStack(alignment: .leading) {
                Text("Recibes")
                    .font(.headline)
                TextField(viewModel.result, text: $receive)
                    .customTextField()
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchCurrencies()
        }
    }
}

#Preview {
    ExchangeRateView()
}
