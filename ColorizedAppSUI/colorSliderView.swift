//
//  colorSliderView.swift
//  ColorizedAppSUI
//
//  Created by Константин Натаров on 12.06.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var colorValue: Double
    @State private var text = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(colorValue))")
                .frame(width: 40, alignment: .leading)
            Spacer()
            Slider(value: $colorValue, in: 0...255, step: 1)
                .frame(width: 240)
                .tint(color)
                .onChange(of: colorValue) { newValue in
                    updateText(newValue)
                }
                .animation(.easeInOut(duration: 0.8), value: colorValue)
            Spacer()
            ColorTextFieldView(text: $text, value: $colorValue, color: color)
        }
        .onAppear {
            updateText(colorValue)
        }
    }
    
    private func updateText(_ value: Double) {
        text = "\(lround(value))"
    }
}
