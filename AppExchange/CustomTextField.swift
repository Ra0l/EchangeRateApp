//
//  CustomTextField.swift
//  AppExchange
//
//  Created by Raul Kevin Aliaga Shapiama on 5/31/24.
//

import Foundation
import SwiftUI

struct CustomTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 8)
            .background(.white)
            .mask(
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous)
            )
            .overlay(
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
                .stroke()
                .fill(.black.opacity(0.1))
            )
    }
}

extension View {
    func customTextField() -> some View {
        modifier(CustomTextField())
    }
}
