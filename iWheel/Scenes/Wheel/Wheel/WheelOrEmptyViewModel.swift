//
//  WheelOrEmptyViewModel.swift
//  iWheel
//
//  Created by Julien Goudeaux on 09/07/2021.
//

import SwiftUI
import Combine

final class WheelOrEmptyViewModel: ObservableObject {
    
    @Published var items: [String]
    @Published var minimumRotations: Int
    @Published var duration: Double
    @Published var width: CGFloat

    init(items: [String], minimumRotations: Int, duration: Double, width: CGFloat) {
        self.items = items
        self.minimumRotations = minimumRotations
        self.duration = duration
        self.width = width
    }
}
