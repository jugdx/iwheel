//
//  PieChartViewModel.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI
import Combine

final class PieChartViewModel: ObservableObject {

    @Published var width: CGFloat
    @Published var wheelData: WheelData

    init(wheelData: WheelData, width: CGFloat) {
        self.wheelData = wheelData
        self.width = width
    }
}
