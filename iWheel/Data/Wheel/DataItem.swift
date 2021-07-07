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

    init(name: String) {
        self.name = name
        self.color = Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
