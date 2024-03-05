//
//  ContentView.swift
//  RGBPickerSUI
//
//  Created by Paul Makey on 5.03.24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - @State Properties
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)

    // MARK: - Body
    var body: some View {
        VStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 200)
                .foregroundStyle(
                    Color(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.white, lineWidth: 5)
                )
            
            SetSlider(sliderValue: $redSliderValue, tintColor: .red)
            SetSlider(sliderValue: $greenSliderValue, tintColor: .green)
            SetSlider(sliderValue: $blueSliderValue, tintColor: .blue)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct SetSlider: View {
    @Binding var sliderValue: Double
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text(sliderValue.string())
                .frame(width: 40)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(tintColor)
        }
    }
}

