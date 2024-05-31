//
//  ExchangeRateView.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 5/31/24.
//

import SwiftUI

struct ExchangeRateView: View {
    
    @State var have = ""
    @State var receive = ""
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            VStack {
                HStack {
                    Image("exchange")
                        
                    Text("Cambía tus dólares y soles al toque.")
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
                TextField("Cantidad", text: $have)
                    .customTextField()
            }
            
            VStack(alignment: .leading) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.system(size: 50))
                        .foregroundStyle(.black)
                }

            }
            
            VStack(alignment: .leading) {
                Text("Recibes")
                    .font(.headline)
                TextField("", text: $receive)
                    .customTextField()
            }
        }
        .padding()
    }
}

#Preview {
    ExchangeRateView()
}
