//
//  ContentView.swift
//  ColorizedAppSUI
//
//  Created by Константин Натаров on 12.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    @FocusState private var isActive: Bool
    
    var body: some View {
        ZStack {
            Color(.gray).ignoresSafeArea()
                .onTapGesture {
                    isActive = false
                }
            VStack {
                RectangleView(
                    redValue: redValue,
                    greenValue: greenValue,
                    blueValue: blueValue
                )
                VStack {
                    ColorSliderView(colorValue: $redValue, color: .red)
                    ColorSliderView(colorValue: $blueValue, color: .blue)
                    ColorSliderView(colorValue: $greenValue, color: .green)
                }
                .frame(height: 200)
                .focused($isActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isActive = false
                        }
                    }
                }
                Spacer()
            }
            .frame(width: 350)
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RectangleView: View {
    let redValue: Double
    let greenValue: Double
    let blueValue: Double
    
    var body: some View {
        Rectangle()
            .frame(width: 350, height: 200)
            .cornerRadius(20)
            .foregroundColor(
                Color(
                red: redValue / 255,
                green: greenValue / 255,
                blue: blueValue / 255
                )
            )
            .tint(.black)
            .shadow(color: .white, radius: 5)
    }
}
