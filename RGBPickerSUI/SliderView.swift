//
//  SliderView.swift
//  RGBPickerSUI
//
//  Created by Paul Makey on 5.03.24.
//

import SwiftUI

struct SetSlider: View {
    @Binding var sliderValue: Double
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text(sliderValue.string())
                .frame(width: 40, alignment: .leading)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(tintColor)
        }
    }
}
