//
//  MainViewModel.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {

    @Published var items: [String] = []
    @Published var numberOfRotations: Int = 10

    init(items: [String], numberOfRotations: Int) {
        self.items = items
        self.numberOfRotations = numberOfRotations
    }
}
