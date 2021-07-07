//
//  WheelData.swift
//  iWheel
//
//  Created by Fromont Thomas on 07/07/2021.
//

import Foundation
import SwiftUI

class WheelData: ObservableObject {
    @Published private(set) var data: [SlideData] = []

    init(data: [String]) {
        guard !data.isEmpty else {
            return
        }

        var currentAngle: Double = 0
        var slides: [SlideData] = []
        let total: Double = Double(data.count)
        let slideAngle: Double = 360 / total

        for index in 0..<data.count {
            let data = DataItem(name: data[index])
            let startAngle = Angle.degrees(currentAngle)
            currentAngle += slideAngle
            let endAngle = Angle.degrees(currentAngle)

            let slide = SlideData(data: data, startAngle: startAngle, endAngle: endAngle)
            slides.append(slide)
        }
        self.data = slides
    }

    init(data: [SlideData]) {
        self.data = data
    }

    func data(with angle: Double) -> SlideData? {
        data.first(where: { $0.startAngle.degrees <= angle && $0.endAngle.degrees >= angle })
    }
}
