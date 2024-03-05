//
//  ContentView.swift
//  RGBPickerSUI
//
//  Created by Paul Makey on 5.03.24.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)

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
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 5))
            HStack {
                Text(redSliderValue.string())
                Slider(value: $redSliderValue, in: 0...255, step: 1)
                    .tint(.red)
            }
            HStack {
                Text(greenSliderValue.string())
                Slider(value: $greenSliderValue, in: 0...255, step: 1)
                    .tint(.green)
            }
            HStack {
                Text(blueSliderValue.string())
                Slider(value: $blueSliderValue, in: 0...255, step: 1)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension Double {
    func string() -> String {
        String(format: "%.f", self)
    }
}
