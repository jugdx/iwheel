//
//  WheelViewModel.swift
//  iWheel
//
//  Created by Julien Goudeaux on 08/07/2021.
//

import SwiftUI
import Combine

final class WheelViewModel: ObservableObject {

    @Published var angle: Double = 0
    @Published var duration: Double = 4
    @Published var wheelData: WheelData
    @Published var minimumRotations: Int
    @Published var width: CGFloat

    init(wheelData: WheelData, minimumRotations: Int, duration: Double, width: CGFloat) {
        self.wheelData = wheelData
        self.minimumRotations = minimumRotations
        self.duration = duration
        self.width = width
    }

    func rotate() {
        let minimumAngle: Double = Double(minimumRotations * 360)
        let randomAngle: Double = Double.random(in: 1...minimumAngle)
        let finalAngle = minimumAngle + randomAngle
        angle = angle + finalAngle
    }
}
