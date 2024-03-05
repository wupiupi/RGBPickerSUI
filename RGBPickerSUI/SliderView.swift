//
//  SliderView.swift
//  RGBPickerSUI
//
//  Created by Paul Makey on 5.03.24.
//

import SwiftUI

struct SetSlider: View {
    @Binding var sliderValue: Double
    @Binding var textFieldValue: String
    
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text(sliderValue.string())
                .frame(width: 40, alignment: .leading)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(tintColor)
            
            TextField(sliderValue.string(), text: $textFieldValue)
                .frame(width: 50)
                .keyboardType(.numberPad)
                .onChange(of: sliderValue) { _, newValue in
                    if 0...255 ~= newValue {
                        sliderValue = newValue
                    }
                }
        }
    }
    
    // MARK: - Private Methods
    private func validate(value: Double) -> Bool {
        0...255 ~= value
    }
    
    private func setValue(value: Double) {
        sliderValue = validate(value: value)
        ? Double(textFieldValue) ?? sliderValue
        : sliderValue
    }
}

#Preview {
    SetSlider(
        sliderValue: .constant(125),
        textFieldValue: .constant(""),
        tintColor: .red
    )
}
