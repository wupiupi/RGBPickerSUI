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
    
    @State private var redSliderTextValue = ""
    @State private var greenSliderTextValue = ""
    @State private var blueSliderTextValue = ""

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
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        HStack {
                            Spacer()
                            Button("Done") {
                                hideKeyboard()
                            }
                        }
                    }
                }
            
            SetSlider(
                sliderValue: $redSliderValue,
                textFieldValue: $redSliderTextValue,
                tintColor: .red
            )
            SetSlider(
                sliderValue: $greenSliderValue,
                textFieldValue: $greenSliderTextValue,
                tintColor: .green
            )
            SetSlider(
                sliderValue: $blueSliderValue,
                textFieldValue: $blueSliderTextValue,
                tintColor: .blue
            )
            
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .ignoresSafeArea()
        .padding()
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    // MARK: - Private Method
    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

#Preview {
    ContentView()
}

