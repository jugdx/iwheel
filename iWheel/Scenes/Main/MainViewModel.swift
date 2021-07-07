//
//  MainViewModel.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    @Published var items: [String] = []
    @Published var numberOfRotations: Int = 10

    init(numberOfRotations: Int) {
        ItemsRepository.shared.$items
            .assign(to: \.items, on: self)
            .store(in: &cancellables)

        self.numberOfRotations = numberOfRotations
    }
}
