//
//  WheelViewModel.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI
import Combine

final class WheelViewModel: ObservableObject {

    @Published var angle: Double = 0

    func rotate() {
        let minimumRotations: Int = 5
        let minimumAngle: Double = Double(minimumRotations * 360)
        let randomAngle: Double = Double.random(in: 0...360)
        let finalAngle = minimumAngle + randomAngle
        angle = angle + finalAngle
    }
}
