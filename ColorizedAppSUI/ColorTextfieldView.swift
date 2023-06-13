//
//  ColorTextfieldView.swift
//  ColorizedAppSUI
//
//  Created by Константин Натаров on 12.06.2023.
//

import SwiftUI

struct ColorTextFieldView: View {
    @Binding var text: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    let color: Color
    
    var body: some View {
        TextField("", text: $text) { _ in
            checkValue()
        }
        .frame(width: 60, alignment: .trailing)
        .textFieldStyle(.roundedBorder)
        .shadow(color: color, radius: 2)
        .multilineTextAlignment(.trailing)
        .keyboardType(.decimalPad)
        .alert("Ooops...Wrong Format!", isPresented: $showAlert, actions: {}) {
            Text("Value must be from 0 to 255")
        }
    }
}

extension ColorTextFieldView {
    private func checkValue() {
        if let value = Double(text), (0.0...255.0).contains(value) {
            self.value = value
            return
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}

