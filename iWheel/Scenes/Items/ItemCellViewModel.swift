//
//  ItemCellViewModel.swift
//  iWheel
//
//  Created by Charlotte Martin on 07/07/2021.
//

import Combine

class ItemCellViewModel: ObservableObject, Identifiable {
    @Published var name: String

    init(name: String) {
        self.name = name
    }
}
