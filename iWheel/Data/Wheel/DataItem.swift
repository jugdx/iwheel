//
//  DataItem.swift
//  iWheel
//
//  Created by Fromont Thomas on 07/07/2021.
//

import Foundation
import SwiftUI

class DataItem {
    var name: String
    var color: Color
    var textColor: Color

    init(name: String) {
        self.name = name

        let red = Double.random(in: 0.5...1)
        let green = Double.random(in: 0.5...1)
        let blue = Double.random(in: 0.5...1)
        self.color = Color(
            red: red,
            green: green,
            blue: blue
        )

        let componentsL: [Double] = [red, green, blue].map { color in
            color <= 0.03928
                ? color / 12.92
                : pow(((color + 0.055) / 1.055), 2.4)
        }
        let redL = 0.2126 * componentsL[0]
        let greenL = 0.7152 * componentsL[1]
        let blueL = 0.0722 * componentsL[2]
        let L = redL + greenL + blueL
        self.textColor = L > 0.179 ? Color.black : Color.white
    }
}
