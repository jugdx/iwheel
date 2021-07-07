//
//  SlideData.swift
//  iWheel
//
//  Created by Fromont Thomas on 07/07/2021.
//

import Foundation
import SwiftUI

class SlideData: Identifiable, ObservableObject {
    var data: DataItem
    var startAngle: Angle
    var endAngle: Angle

    init(data: DataItem, startAngle: Angle, endAngle: Angle) {
        self.data = data
        self.startAngle = startAngle
        self.endAngle = endAngle
    }
}
